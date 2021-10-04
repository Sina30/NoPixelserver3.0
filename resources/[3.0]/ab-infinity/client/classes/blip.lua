EntityBlip = {}

function EntityBlip:new(pType, pNetId, pSettings)
    local this = {}

    this.id = pNetId
    this.mode = nil
    this.type = pType
    this.active = false
    this.handle = nil
    this.entity = GetLocalEntity(pType, pType)
    this.settings = pSettings

    self.__index = self

    return setmetatable(this, self)
end

function EntityBlip:setSettings()
    if not self.settings then return end

    if self.settings.color then
        SetBlipColour(self.handle, self.settings.color)
    end

    if self.settings.route then
        SetBlipRoute(self.handle, self.settings.route)
    end

    if self.settings.short then
        SetBlipAsShortRange(self.handle, self.settings.short)
    end

    if self.settings.scale then
        SetBlipScale(self.handle, self.settings.scale)
    end

    if self.settings.heading then
        ShowHeadingIndicatorOnBlip(self.handle, self.settings.heading)
    end

    if self.settings.category then
        SetBlipCategory(self.handle, self.settings.category)
    end

    if self.settings.text then
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(self.settings.text)
        EndTextCommandSetBlipName(self.handle)
    end
end

function EntityBlip:onModeChange(mode)
    if mode == self.mode or not self.active then return end

    RemoveBlip(self.handle)

    if mode == 'coords' then
        local coords = GetNetworkedCoords(self.type, self.id)

        if coords then
            self.handle = AddBlipForCoord(coords.x, coords.y, coords.z)
            self.mode = 'coords'
        end
    elseif mode == 'entity' then
        local entity = GetLocalEntity(self.type, self.id)

        if entity then
            self.handle = AddBlipForEntity(entity)
            self.mode = 'entity'
        end
    end

    self:setSettings()
end

function EntityBlip:onUpdateCoords(updatedCoords)
    if self.mode ~= 'coords' or not self.active then return end
    local coords = updatedCoords or GetNetworkedCoords(self.type, self.id)
    SetBlipCoords(self.handle, coords.x, coords.y, coords.z)
end

function EntityBlip:entityExistLocally()
    return DoesEntityExist(GetLocalEntity(self.type, self.id))
end

function EntityBlip:enable(manual)
    if self.active then return end
    self.active = true

    local entity = GetLocalEntity(self.type, self.id)
    local mode = DoesEntityExist(entity) and 'entity' or 'coords'

    if manual then
        self:onModeChange(mode)
    else
        Citizen.CreateThread(function ()
            local idle = self.type == 'player' and 500 or 1000

            while self.active do
                entity = GetLocalEntity(self.type, self.id)
                mode = DoesEntityExist(entity) and 'entity' or 'coords'

                if mode ~= self.mode then
                    self:onModeChange(mode)
                elseif mode == 'coords' then
                    self:onUpdateCoords()
                end

                Citizen.Wait(idle)
            end
        end)
    end
end

function EntityBlip:disable()
    if not self.active then return end
    self.active = false
    RemoveBlip(self.handle)
end