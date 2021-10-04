local CurrentJob = nil
local isCop = false
local isDoc = false
local isDoctor = false
local isMedic = false
local isTher = false
local isJudge = false

local accessCheckCache = {}
local accessCheckCacheTimer = {}
local businesses = {}
local businessesCacheTimer = nil

local securedAccesses = {}

function setSecuredAccesses(pAccesses, pType)
    securedAccesses[pType] = pAccesses
    accessCheckCache[pType] = {}
    accessCheckCacheTimer[pType] = {}
end

function clearAccessCache()
    for accessType, _ in pairs(accessCheckCache) do
        accessCheckCacheTimer[accessType] = {}
    end
end

RegisterNetEvent("ab-jobmanager:playerBecameJob")
AddEventHandler("ab-jobmanager:playerBecameJob", function(job, name, notify)
    if isCop and job ~= "police" then isCop = false end
    if isMedic and job ~= "ems" then isMedic = false end
    if isDoctor and job ~= "doctor" then isDoctor = false end
    if isDoc and job ~= "doc" then isDoc = false end
    if isTher and job ~= "therapist" then isTher = false end
    
    if job == "police" then isCop = true end
    if job == "ems" then isMedic = true end
    if job == "doctor" then isDoctor = true end
    if job == "therapist" then isTher = true end
    if job == "doc" then isDoc = true end
    CurrentJob = job
    clearAccessCache() 
end)

-- AddEventHandler('ab-jobs:jobChanged', function(currentJob, previousJob)
    -- CurrentJob = currentJob
    -- clearAccessCache() 
-- end)

RegisterNetEvent("isJudge")
AddEventHandler("isJudge", function()
    isJudge = true
    clearAccessCache()
end)

RegisterNetEvent("isJudgeOff")
AddEventHandler("isJudgeOff", function()
    isJudge = false
    clearAccessCache()
end)

function isPD(job)
    return isCop or isDoc or isJudge or job == "district attorney"
end
function isDR()
    return isMedic or isDoctor or isTher
end

function hasSecuredAccess(pId, pType)
    if accessCheckCacheTimer[pType][pId] ~= nil and accessCheckCacheTimer[pType][pId] + 60000 > GetGameTimer() then -- 1 minute
        return accessCheckCache[pType][pId] == true
    end

    local characterId = exports["isPed"]:isPed("cid")

    accessCheckCacheTimer[pType][pId] = GetGameTimer()

    local job = exports["ab-base"]:getModule("LocalPlayer"):getVar("job")

    local secured = securedAccesses[pType][pId]

    if not secured then return end

    if secured.forceUnlocked then
      return false
    end

    if      (secured.access.job and secured.access.job[CurrentJob] or false)
        or  (secured.access.job["PD"] ~= nil and isPD(job))
        or  (secured.access.job["DR"] ~= nil and isDR())
        or  (secured.access.job["Public"] ~= nil)
        or  (secured.access.cid ~= nil and secured.access.cid[characterId] ~= nil)
    then
        accessCheckCache[pType][pId] = true
        return true
    end

    if secured.access.item ~= nil then
        accessCheckCacheTimer[pType][pId] = 0
        for i, v in pairs(secured.access.item) do
            if exports["ab-inventory"]:hasEnoughOfItem(i, 1, false) then
                return true
            end
        end
    end

    accessCheckCache[pType][pId] = false
    return false
end
