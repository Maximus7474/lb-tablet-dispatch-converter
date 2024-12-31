RegisterServerEvent("mdt:server:CreateCall", function(data)    
	exports["lb-tablet"]:AddDispatch({
        priority = data?.isEmergency and "high" or "medium",
        code = data?.code or '',
        title = data?.offense or T("DEFAULT.TITLE"),
        description = "",
        location = {
            label = ((data?.location ~= nil and data?.location ~= "") and data?.location or data?.offense or T("DEFAULT.LOCATION_LABEL")),
            coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = CONFIG['default-time'],
        job = "police",
        fields = data?.info or {}
    })
end)

ExportHandler("bub-mdt", "CustomAlert", function(data)
    exports["lb-tablet"]:AddDispatch({
        priority = data?.isEmergency and "high" or "medium",
        code = data?.code or '',
        title = data?.offense or T("DEFAULT.TITLE"),
        description = "",
        location = {
            label = data?.location or data?.offense or T("DEFAULT.LOCATION_LABEL"),
            coords = vector2(data?.coords.x or 0, data?.coords.y or 0)
        },
        time = CONFIG['default-time'],
        job = "police",
        fields = data?.info or {}
    })
end)
