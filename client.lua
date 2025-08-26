local currentZone = nil

local keybind = lib.addKeybind({
    name = 'togglemicrophone',
    description = 'Activate/Deactivate Microphone (Zone)',
    defaultKey = 'E',
    onPressed = function(self)
        if not currentZone then return end
        if LocalPlayer.state.microphone_talking then
            exports['pma-voice']:clearProximityOverride()
            LocalPlayer.state.microphone_talking = false
            lib.notify({ description = 'Microphone De-Activated', type = 'error' })
        else
            exports['pma-voice']:overrideProximityRange(currentZone.range or 10.0, true)
            lib.notify({ description = 'Microphone Activated', type = 'success' })
            LocalPlayer.state.microphone_talking = true
        end
    end
})

local function createObject(mic)
    if mic.object == nil then
        local object = CreateObject(mic.prop, mic.coords.x, mic.coords.y, mic.coords.z - 1.0, false, false, false)
        if mic.rotation ~= nil then
            SetEntityHeading(object, mic.rotation)
        end
        FreezeEntityPosition(object, true)
        mic.object = object
    end
end

local function removeObject(mic)
    if mic.object then
        DeleteEntity(mic.object)
        mic.object = nil
    end
end

CreateThread(function()
    for name, data in pairs(Config.Microphones) do
        lib.zones.box({
            name = 'microphone_' .. name,
            coords = vec3(data.coords.x, data.coords.y, data.coords.z),
            size = data.size or vec3(2.0, 2.0, 3.0),
            rotation = data?.rotation or data.coords?.w or 0.0,
            debug = Config.Debug,
            onEnter = function(self)
                currentZone = self
                lib.showTextUI('Use '..keybind.currentKey..' for microphone')
                keybind:disable(false)
            end,
            onExit = function(self)
                if LocalPlayer.state.microphone_talking then
                    exports['pma-voice']:clearProximityOverride()
                    lib.notify({ description = 'Microphone De-Activated', type = 'error' })
                    LocalPlayer.state.microphone_talking = false
                end
                currentZone = nil
                lib.hideTextUI()
                keybind:disable(true)
            end
        })
    end
end)

CreateThread(function()
    local props = 0
    for _, mic in ipairs(Config.Microphones) do
        if mic.prop then props += 1 end
    end
    while props > 0 do
        Wait(4)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for _, mic in ipairs(Config.Microphones) do
            if mic.prop then
                local distance = #(pos - mic.coords)
                if distance <= mic.range then
                    createObject(mic)
                else
                    removeObject(mic)
                end
            end
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if (GetCurrentResourceName() ~= resource) then return end

    exports['pma-voice']:clearProximityOverride()

    for _, mic in pairs(Config.Microphones) do
        removeObject(mic)
    end
end)