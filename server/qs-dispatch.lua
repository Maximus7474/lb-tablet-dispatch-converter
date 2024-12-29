RegisterNetEvent('qs-dispatch:server:CreateDispatchCall', function (data)

    local priority = "medium"
    if data.flashes then
        priority = "high"
    end

    exports["lb-tablet"]:AddDispatch({
        priority = priority,
        code = data?.callCode.code or '',
        title = data?.callCode.snippet or T("DEFAULT.TITLE"),
        description = data.message or '',
        location = {
          label = data?.callCode.snippet or T("DEFAULT.LOCATION_LABEL"),
          coords = vector2(data?.callLocation.x or 0, data?.callLocation.y or 0)
        },
        time = data?.blip.time and math.floor(data.blip.time / 1000) or CONFIG['default-time'],
        job = ReceivingJob(data.jobs)
    })
end)