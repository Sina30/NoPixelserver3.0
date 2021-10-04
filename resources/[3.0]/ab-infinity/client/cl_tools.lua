function PromiseTimeout(time)
    local timeout = promise:new()

    Citizen.SetTimeout(time or 1000, function ()
        timeout:resolve(false)
    end)

    return timeout
end

function VectorToArray(pVector3)
    return {pVector3[1], pVector3[2], pVector3[3]}
end

function GetCoordsArray(pCoords)
    local coords = {}

    if type(pCoords) == 'table' then
        for id, vectors in pairs(pCoords) do
            if vectors then
                coords[#coords] = {key = id, value = VectorToArray(vectors)}
            end
        end
    end

    return coords
end