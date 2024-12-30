--[[ 
    Obtained from https://github.com/overextended/ox_target/blob/main/client/compat/qtarget.lua#L1C1-L5C4
]]

function ExportHandler(resource, exportName, func)
    AddEventHandler(('__cfx_export_%s_%s'):format(resource, exportName), function(setCB)
        setCB(func)
    end)
end