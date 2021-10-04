function GetMapObjectId(pModelHash, pCoords)
  return pModelHash | ((math.floor(pCoords.x) * math.floor(pCoords.y)) << 8)
end