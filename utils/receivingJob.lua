function ReceivingJob(jobs)
    local receivingJob
    if type(jobs) == "table" then
        for _, job in pairs(jobs) do
            if CONFIG['police-jobs'][job] then
                receivingJob = 'police'
                break
            elseif CONFIG['ambulance-jobs'][job] then
                receivingJob = 'ambulance'
                break
            end
        end
    elseif type(jobs) == "string" then
        if CONFIG['police-jobs'][jobs] then
            receivingJob = 'police'
        elseif CONFIG['ambulance-jobs'][jobs] then
            receivingJob = 'ambulance'
        end
    end

    if not receivingJob then
        print('[^2WARNING^7] Invalid jobs or non parametered using the convars, refer to the setup documentation.')
        return false
    end

    return receivingJob
end