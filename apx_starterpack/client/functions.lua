-- Starting Functions --

SpawnNPC = function()
    Citizen.CreateThread(function()
       
        RequestModel(GetHashKey("a_f_m_fatbla_01"))
        while not HasModelLoaded(GetHashKey("a_f_m_fatbla_01")) do
            Wait(1)
        end
        CreateNPC()   
    end)
end

CreateNPC = function()
    created_ped = CreatePed(5, GetHashKey("a_f_m_fatbla_01") , Config.Ped.x, Config.Ped.y, Config.Ped.z, Config.Ped.rotation, false, true)
    FreezeEntityPosition(created_ped, true)
    SetEntityInvincible(created_ped, true)
    SetBlockingOfNonTemporaryEvents(created_ped, true)
    TaskStartScenarioInPlace(created_ped, "CODE_HUMAN_MEDIC_TIME_OF_DEATH", 0, true)
end


