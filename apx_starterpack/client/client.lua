ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end 
    ESX.PlayerData = ESX.GetPlayerData()
    SpawnNPC()
end)

Citizen.CreateThread(function()
    while true do 
        local _apx = 250
        local _ped = PlayerPedId()
        local _pedpos = GetEntityCoords(_ped)
        if GetDistanceBetweenCoords(_pedpos, Config.Coords.x, Config.Coords.y, Config.Coords.z, true) < 3 then
            _apx = 0
            FloatTxT(Config.Text, vector3(Config.Coords.x, Config.Coords.y, Config.Coords.z + 1.8))
        end
        Citizen.Wait(_apx)
    end
end)
