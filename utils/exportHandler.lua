--[[ 
    Obtained from https://github.com/overextended/ox_target/blob/main/client/compat/qtarget.lua#L1C1-L5C4
]]

local function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qtarget_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

return exportHandler