-- Starting Functions --

SpawnNPC = function()
    Citizen.CreateThread(function()
       
        RequestModel(GetHashKey(Config.Ped))
        while not HasModelLoaded(GetHashKey(Config.Ped)) do
            Wait(1)
        end
        CreateNPC()   
    end)
end

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey(Config.Ped) , Config.Coords.x, Config.Coords.y, Config.Coords.z, Config.Coords.rotation, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, Config.PedAnim, 0, true)
end

FloatTxT = function(msg, coords)
    AddTextEntry('esxFloatingHelpNotification', msg)
	SetFloatingHelpTextWorldPosition(1, coords)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp('esxFloatingHelpNotification')
	EndTextCommandDisplayHelp(2, false, false, -1)
end


