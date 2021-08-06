local CreateThread = CreateThread
local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords

ESX = nil

CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Wait(250)
    end 
    SpawnNPC()
end)

CreateThread(function()
    local _ped = PlayerPedId()
    while true do 
        local _apx = 850
        local _pedpos = GetEntityCoords(_ped)
        if #(_pedpos - Config.Coords) < Config.Distance then
            _apx = 0
            showFloatingHelpNotification(Config.Text, Config.Coords)
            if IsControlJustPressed(1, Config.Key) then
                ESX.TriggerServerCallback('apx_starterpack:server:checkIfUsed', function(hasChecked)
                    if hasChecked then
                        ESX.ShowNotification('~r~You have already received your pack')
                    else
                        Menu() 
                        SetFollowPedCamViewMode(4)
                        FreezeEntityPosition(_ped, true)   
                    end
                end)
            end
        end
        .Wait(_apx)
    end
end)

function showFloatingHelpNotification(message, coords)
    AddTextEntry('float', message)
    SetFloatingHelpTextWorldPosition(1, coords)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp('float')
    EndTextCommandDisplayHelp(2, false, false, -1)
end
