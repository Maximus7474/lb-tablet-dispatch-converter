AddEventHandler('rcore_dispatch:server:sendAlert', function (data)
    local callTitles = {
        default = "Dispatch Notification",
        shop_robbery  = "Shop Robbery",
        car_robbery = "Car Robbery",
        --[[ etc... ]]
    }
    local type = callTitles[data?.type or "default"] or callTitles.default
  
    exports["lb-tablet"]:AddDispatch({
        priority = data.default_priority,
        code = data?.code or '',
        title = type or 'Dispatch Notification',
        description = data.text or '',
        location = {
          label = data?.blip.text or "Call Origin",
          coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = data?.blip_time and math.floor(data.blip_time / 1000) or CONFIG['default-time'],
        job = "police"
    })
end)