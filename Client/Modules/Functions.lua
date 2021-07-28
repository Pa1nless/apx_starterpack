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

Menu = function()
    if Config.UseMenuDefault then
        ESX.UI.Menu.Open('default',GetCurrentResourceName(),"np_carryped_broke_license",
        { 
        title = "Starter Pack", 
        align = "bottom-right", 
        elements = {
            {label = "Accept Reward", value = "accept"},
            {label = "Decline", value = "decline"}
        }}, function(data, menu)
            local val = data.current.value 
            if val == "accept" then 
                SetFollowPedCamViewMode(1)
                FreezeEntityPosition(PlayerPedId(), false)
                TriggerServerEvent("apx_starterpack:server:markAsUsed")
                menu.close()
            elseif val == "decline" then
                SetFollowPedCamViewMode(1) 
                FreezeEntityPosition(PlayerPedId(), false)
                menu.close()
            end 
            
        end, function(data, menu) 
            menu.close() 
        end)
    elseif Config.UseContext then 
        local data = {}
        table.insert(data, {text = "Accept Reward", toDo = [[ TriggerEvent("esx:showNotification", "You claimed your reward") TriggerServerEvent("apx_starterpack:server:markAsUsed")  SetFollowPedCamViewMode(1) FreezeEntityPosition(PlayerPedId(), false)]]})
        table.insert(data, {text = "Decline", toDo = [[SetFollowPedCamViewMode(1) FreezeEntityPosition(PlayerPedId(), false) TriggerEvent("guille_cont:close")]]})
        TriggerEvent("guille_cont:client:open", "Starter Pack", data, false)
    end
end






