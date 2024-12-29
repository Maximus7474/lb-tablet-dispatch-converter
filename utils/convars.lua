CONFIG = {
    ['default-time'] = GetConvarInt('lb-tablet-dispatch:default-time', 100),
    ['locale'] = GetConvar('lb-tablet-dispatch:locale', 'en'),
    ['police-jobs'] = {},
    ['ambulance-jobs'] = {},
}

local success, result, policeJobs, ambulanceJobs
success, result = pcall(function()
    return json.decode(GetConvar('lb-tablet-dispatch:police-jobs', '["police", "sheriff", "leo"]'))
end)
if success then
    policeJobs = result
else
    print('[^1ERROR^7] Invalid JSON string for ^5police-jobs^7 convar ! Using default values.')
    policeJobs = {"police", "sheriff", "leo"}
end

for _, job in pairs(policeJobs) do
    CONFIG['police-jobs'][job] = true
end

success, result = pcall(function()
    return json.decode(GetConvar('lb-tablet-dispatch:police-jobs', '["ambulance", "hospital", "sams"]'))
end)
if success then
    ambulanceJobs = result
else
    print('[^1ERROR^7] Invalid JSON string for ^5ambulance-jobs^7 convar ! Using default values.')
    ambulanceJobs = {"ambulance", "hospital", "sams"}
end

for _, job in pairs(ambulanceJobs) do
    CONFIG['ambulance-jobs'][job] = true
end