AddEventHandler('qs-dispatch:server:CreateDispatchCall', function (data)

    local priority = "medium"
    if data.flashes then
        priority = "high"
    end

    exports["lb-tablet"]:AddDispatch({
        priority = priority,
        code = data?.callCode.code or '',
        title = data?.callCode.snippet or 'Dispatch Notification',
        description = data.message or '',
        location = {
          label = data?.callCode.snippet or "Call Origin",
          coords = vector2(data?.callLocation.x or 0, data?.callLocation.y or 0)
        },
        time = data?.blip.time and math.floor(data.blip.time / 1000) or 100,
        job = "police"
    })
end)