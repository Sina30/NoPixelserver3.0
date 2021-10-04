Blip = {}

function Blip:new(pCoords, pSettings)
    local this = {}

    this.handle = nil
    this.coords = pCoords
    this.settings = pSettings

    self.__index = self

    return setmetatable(this, self)
end

function Blip:setSettings()
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

    if self.settings.sprite then
        SetBlipSprite(self.handle, self.settings.sprite)
    end

    if self.settings.text then
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(self.settings.text)
        EndTextCommandSetBlipName(self.handle)
    end
end

function Blip:add()
    self.handle = AddBlipForCoord(self.coords)
    self:setSettings()
end

function Blip:delete()
    if DoesBlipExist(self.handle) then
        RemoveBlip(self.handle)
    end
end