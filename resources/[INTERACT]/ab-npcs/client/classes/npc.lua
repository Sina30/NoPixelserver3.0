NPC = {}
props = {}

DecorRegister("NPC", 2)
DecorRegister("NPC_ID", 3)

function NPC:new(id, pedType, model, position, appearance, animation, networked, settings, flags, scenario, blip)
    local this = {}

    this.id = id
    this.type = pedType
    this.model = GetHashKey(model)
    this.position = position
    this.appearance = appearance
    this.animation = animation
    this.networked = networked
    this.settings = settings
    this.flags = flags
    this.scenario = scenario
    this.blip = blip

    this.entity = nil
    this.spawned = false
    this.disabled = false
    this.tasks = {}

    self.__index = self

    return setmetatable(this, self)
end

function NPC:spawn()
    if self.spawned then return end

    LoadEntityModel(self.model)

    local ped = CreatePed(self.type, self.model, self.position.coords, self.position.heading + 0.0, self.networked, false)

    Citizen.Wait(0)

    SetPedDefaultComponentVariation(ped)

    if DoesEntityExist(ped) then
        self.entity, self.spawned = ped, true

        SetPedFlag(self.entity, 'isNPC', true)
        DecorSetInt(self.entity, "NPC_ID", GetHashKey(self.id))

        if self.settings then
            self:setSettings()
        end

        if self.appearance then
            self:setAppearance()
        end

        if self.flags then
            self:setFlags()
        end

        if self.animation then
            self:setAnimation()
        end

        if self.scenario then
            self:setScenario()
        end
    end

    SetModelAsNoLongerNeeded(self.model)
end

function NPC:delete()
    if not self.spawned then return end

    self.spawned = false

    if props[self.entity] then
        DeleteObject(props[self.entity])
        props[self.entity] = nil
    end

    if DoesEntityExist(self.entity) then
        DeleteEntity(self.entity)
    end
end

function NPC:enable()
    self.disabled = false
end

function NPC:disable()
    self.disabled = true
end

function NPC:setFlags(flags)
    if flags then self.flags = flags end
    SetPedFlags(self.entity, self.flags)
end

function NPC:setFlag(flag, enabled)
    SetPedFlag(self.entity, flag, enabled)
end

function NPC:setSettings(settings)
    if settings then self.settings = settings end

    for _, flag in ipairs(self.settings) do
        self:setSetting(flag.mode, flag.active, self.settings)
    end
end

function NPC:setSetting(mode, active, settings)
    if mode == "invincible" then
        SetEntityInvincible(self.entity, active)
    elseif mode == "freeze" then
        FreezeEntityPosition(self.entity, active)
    elseif mode == "ignore" then
        SetBlockingOfNonTemporaryEvents(self.entity, active)
    elseif mode == "collision" then
        SetEntityCompletelyDisableCollision(self.entity, false, false)
        SetEntityCoordsNoOffset(self.entity, self.position.coords, false, false, false)
    elseif mode == "casino" and active then
        math.randomseed(GetGameTimer())
        math.random() math.random() math.random()
        local isMale = false
        for _, v in pairs(settings) do
          if v.mode == "casinoMale" then
            isMale = v.active
          end
        end
        local rnd = isMale and math.random(1, 7) or math.random(8, 13)
        setBlackjackDealerClothes(rnd, self.entity)
    end
end

function NPC:setAppearance(appearance)
    if appearance then self.appearance = appearance end

    for _, component in pairs(self.appearance) do
        self:setComponent(component.mode, table.unpack(component.params))
    end
end

function NPC:setComponent(mode, ...)
    if mode == "component" then
        SetPedComponentVariation(self.entity, ...)
    elseif mode == "prop" then
        SetPedPropIndex(self.entity, ...)
    elseif mode == "blend" then
        SetPedHeadBlendData(self.entity, ...)
    elseif mode == "overlay" then
        SetPedHeadOverlay(self.entity, ...)
    elseif mode == "overlaycolor" then
        SetPedHeadOverlayColor(self.entity, ...)
    elseif mode == "haircolor" then
        SetPedHairColor(self.entity, ...)
    elseif mode == "eyecolor" then
        SetPedEyeColor(self.entity, ...)
    end
end

function NPC:addTask(id, task)
    if self.tasks[id] then self:removeTask(id) end

    self.tasks[id] = {id = id, active = false, task = task}
end

function NPC:removeTask(id)
    if not self.tasks[id] then return end

    self.tasks[id]["active"] = false
    self.tasks[id] = nil
end

function NPC:startTask(id)
    if not self.tasks[id] or self.tasks[id]["active"] then return end

    self.tasks[id]["active"] = true
    self.tasks[id]:task(self.tasks[id])
end

function NPC:stopTask(id)
    if not self.tasks[id] or not self.tasks[id]["active"] then return end

    self.tasks[id]["active"] = false
end

function NPC:setScenario()
    TaskStartScenarioInPlace(self.entity, self.scenario, 0, true)
end

function LoadAnimationDic(dict)
  if not HasAnimDictLoaded(dict) then
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
          Citizen.Wait(0)
      end
  end
end
function NPC:setAnimation()
  if self.animation == "phone" then
      LoadAnimationDic("cellphone@")
      TaskPlayAnim(self.entity, "cellphone@", "cellphone_text_read_base", 2.0, 3.0, -1, 49, 0, 0, 0, 0)
      attachModelPhone = GetHashKey("prop_player_phone_01")
      boneNumber = boneNumberSent
      local bone = GetPedBoneIndex(self.entity, 57005)
      RequestModel(attachModelPhone)
      while not HasModelLoaded(attachModelPhone) do
          Citizen.Wait(0)
      end
      attachedPropPhone = CreateObject(attachModelPhone, 1.0, 1.0, 1.0, 0, 0, 0)
      AttachEntityToEntity(attachedPropPhone, self.entity, bone, 0.14, 0.01, -0.02, 110.0, 120.0, -15.0, 1, 0, 0, 0, 2, 1)
      props[self.entity] = attachedPropPhone
  end
end

function LoadEntityModel(model)
    if not HasModelLoaded(model) then
        RequestModel(model)

        while not HasModelLoaded do
            Citizen.Wait(0)
        end
    end
end

--
function setBlackjackDealerClothes(randomNumber, dealerPed)
  if randomNumber == 0 then 
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 1 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 2, 2, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 4, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 2 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 2, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 3 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 1, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 4 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 4, 2, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 5 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 4, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 6 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 4, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 4, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 1, 0, 0)
  elseif randomNumber == 7 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 1, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
  elseif randomNumber == 8 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 1, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 1, 1, 0)
      SetPedComponentVariation(dealerPed, 3, 1, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
  elseif randomNumber == 9 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 2, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
  elseif randomNumber == 10 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 2, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 2, 1, 0)
      SetPedComponentVariation(dealerPed, 3, 3, 3, 0)
      SetPedComponentVariation(dealerPed, 4, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
  elseif randomNumber == 11 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 3, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 0, 1, 0)
      SetPedComponentVariation(dealerPed, 4, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
          SetPedPropIndex(dealerPed, 1, 0, 0, false)
  elseif randomNumber == 12 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 3, 1, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 3, 1, 0)
      SetPedComponentVariation(dealerPed, 3, 1, 1, 0)
      SetPedComponentVariation(dealerPed, 4, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
  elseif randomNumber == 13 then
      SetPedDefaultComponentVariation(dealerPed)
      SetPedComponentVariation(dealerPed, 0, 4, 0, 0)
      SetPedComponentVariation(dealerPed, 1, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 2, 4, 0, 0)
      SetPedComponentVariation(dealerPed, 3, 2, 1, 0)
      SetPedComponentVariation(dealerPed, 4, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 6, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 7, 1, 0, 0)
      SetPedComponentVariation(dealerPed, 8, 2, 0, 0)
      SetPedComponentVariation(dealerPed, 10, 0, 0, 0)
      SetPedComponentVariation(dealerPed, 11, 0, 0, 0)
      SetPedPropIndex(dealerPed, 1, 0, 0, false)
  end
end
