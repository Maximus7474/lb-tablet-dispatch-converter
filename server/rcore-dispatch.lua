RegisterNetEvent('rcore_dispatch:server:sendAlert', function(data)
    local callTitles = {
        default      = "DEFAULT.TITLE",
        shop_robbery = "RCORE.SHOP_ROBBERY",
        car_robbery  = "RCORE.CAR_ROBBERY",
    }
    local type = callTitles[data?.type or "default"] or callTitles.default

    exports["lb-tablet"]:AddDispatch({
        priority = data.default_priority,
        code = data?.code or '',
        title = T(type),
        description = data.text or '',
        location = {
            label = data?.blip.text or T('DEFAULT.LOCATION_LABEL'),
            coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = CONFIG['default-time'],
        job = "police"
    })
end)
