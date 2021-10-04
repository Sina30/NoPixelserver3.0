Flags = {}

Flags["VehicleFlags"] = {
    isPlayerVehicle = 2,
    isStolenVehicle = 4,
    isScrapVehicle = 8,
    isHotwiredVehicle = 16,
    isTowingVehicle = 32,
}

local curPedFlag = 1
local function prevPedFlag()
  curPedFlag = curPedFlag * 2
  return curPedFlag / 2
end
Flags["PedFlags"] = {
    isDead = prevPedFlag(),
    isCuffed = prevPedFlag(),
    isRobbing = prevPedFlag(),
    isEscorting = prevPedFlag(),
    isEscorted = prevPedFlag(),
    isBlindfolded = prevPedFlag(),
    isInTrunk = prevPedFlag(),
    isInBeatMode = prevPedFlag(),
    isInsideVanillaUnicorn = prevPedFlag(),
    isNPC = prevPedFlag(),
    isJobEmployer = prevPedFlag(),
    isSittingOnChair = prevPedFlag(),
    isPoledancing = prevPedFlag(),
    isPawnBuyer = prevPedFlag(),
    isRecycleExchange = prevPedFlag(),
    isCommonJobProvider = prevPedFlag(),
    isVehicleSpawner = prevPedFlag(),
    isBoatRenter = prevPedFlag(),
    isMethDude = prevPedFlag(),
    isBankAccountManager = prevPedFlag(),
    isShopKeeper = prevPedFlag(),
    isWeaponShopKeeper = prevPedFlag(),
    isToolShopKeeper = prevPedFlag(),
    isSportShopKeeper = prevPedFlag(),
    isCasinoChipSeller = prevPedFlag(),
    isGarbageInst = prevPedFlag(),
    isChickienInst = prevPedFlag(),
    isChickienSeller = prevPedFlag(),
}


Flags["ObjectFlags"] = {}
