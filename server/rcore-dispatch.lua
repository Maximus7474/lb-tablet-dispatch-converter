AddEventHandler('rcore_dispatch:server:sendAlert', function (data)
    exports["lb-tablet"]:AddDispatch({
        priority = data.default_priority,
        code = data?.code or '',
        title = 'Dispatch Notification',
        description = data.text or '',
        location = {
          label = data?.blip.text or "Call Origin",
          coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = data?.blip_time and math.floor(data.blip_time / 1000) or CONFIG['default-time'],
        job = "police"
    })
end)