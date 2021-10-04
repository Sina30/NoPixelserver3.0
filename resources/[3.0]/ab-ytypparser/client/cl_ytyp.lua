local currentHeldObjects = {}

function request(name,savetoclient)
    local fileName = 'client/ytyp/'..name..'.ytyp.xml'


    if currentHeldObjects[name] ~= nil then
        return currentHeldObjects[name]
    else
        local buildingObject = readYTYPFile(fileName)
        if buildingObject == nil then
            return false
        else
            if savetoclient then currentHeldObjects[name] = buildingObject end
            return buildingObject
        end
    end

end


function split(source, sep)
    local result, i = {}, 1
    while true do
        local a, b = source:find(sep)
        if not a then break end
        local candidat = source:sub(1, a - 1)
        if candidat ~= "" then 
            result[i] = candidat
        end i=i+1
        source = source:sub(b + 1)
    end
    if source ~= "" then 
        result[i] = source
    end
    return result
end


function readYTYPFile(name)
    local fileLines = LoadResourceFile("ab-ytypparser", name)
    local fileObjects = {}
    local currentFileObj = 1

    for line in string.gmatch(fileLines,"[^\r\n]*") do
        
        if string.find(line, "archetypeName") or string.find(line, "<archetypeName>")  then 
            local result = split(line, "e>")
            local resunt2 = split(result[2], "</") 
            fileObjects[#fileObjects+1]={}
            fileObjects[currentFileObj].name = string.lower(resunt2[1])
            --print(fileObjects[currentFileObj].name)

        elseif string.find(line, "position") then
            local result = split(line, '="')
            local x = split(result[2], '"')
            local y = split(result[3], '"')
            local z = split(result[4], '"')

            fileObjects[currentFileObj].x = tonumber(x[1])
            fileObjects[currentFileObj].y = tonumber(y[1])
            fileObjects[currentFileObj].z = tonumber(z[1])
            --print(line.." | "..fileObjects[currentFileObj].z)

        elseif string.find(line, "rotation") then
            local result = split(line, '="')
            local x = split(result[2], '"')
            local y = split(result[3], '"')
            local z = split(result[4], '"')
            local w = split(result[5], '"')

            fileObjects[currentFileObj].rx = tonumber(x[1])
            fileObjects[currentFileObj].ry = tonumber(y[1])
            fileObjects[currentFileObj].rz = tonumber(z[1])
            fileObjects[currentFileObj].rw = tonumber(w[1])
            currentFileObj = currentFileObj + 1
        end
    end 

    return fileObjects
end

