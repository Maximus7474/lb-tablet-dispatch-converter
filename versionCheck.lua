--[[ 
    Credit to Overextended for the use of their versionCheck function in ox_lib
    https://github.com/overextended/ox_lib/blob/aebef6d7de00b49a878b28a1d7c3e534cd669416/resource/version/server.lua
]]

function VersionCheck()
	local resource = GetInvokingResource() or GetCurrentResourceName()

	local currentVersion = GetResourceMetadata(resource, 'version', 0)
	local repository = GetResourceMetadata(resource, 'repository', 0)

	if currentVersion then
		currentVersion = currentVersion:match('%d+%.%d+%.%d+')
	end

	if not currentVersion then return print(("^1Unable to determine resource version for '%s' ^0"):format(resource)) end
	if not repository then return print(("^1Unable to determine the remote repository for '%s' ^0"):format(resource)) end

    repository = repository:gsub("https://github.com", "https://api.github.com/repos")

	SetTimeout(1000, function()
		PerformHttpRequest(('%s/releases/latest'):format(repository), function(status, response)
			if status ~= 200 then return end

            response = json.decode(response)
			if response?.prerelease then return end

			local latestVersion = response.tag_name:match('%d+%.%d+%.%d+')
			if not latestVersion or latestVersion == currentVersion then return end

            local cv = { string.strsplit('.', currentVersion) }
            local lv = { string.strsplit('.', latestVersion) }

            for i = 1, #cv do
                local current, minimum = tonumber(cv[i]), tonumber(lv[i])

                if current ~= minimum then
                    if current < minimum then
                        return print(('^3Please update %s to the new version: %s\r\n%s^0'):format(resource, latestVersion, response.html_url))
                    else break end
                end
            end
		end, 'GET')
	end)
end

VersionCheck()