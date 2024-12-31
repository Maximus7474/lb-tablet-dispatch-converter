RegisterNetEvent('ps-dispatch:server:notify', function (data)

    local priority = "low"
    if data.priority == 2 then
        priority = "medium"
    elseif data.priority <= 1 then
        priority = "high"
    end

    exports["lb-tablet"]:AddDispatch({
        priority = priority,
        code = data?.code or '',
        title = data?.codename or T("DEFAULT.TITLE"),
        description = data.message or '',
        location = {
          label = data?.codename or T("DEFAULT.LOCATION_LABEL"),
          coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = CONFIG['default-time'],
        job = ReceivingJob(data.jobs)
    })
end)