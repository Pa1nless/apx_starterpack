ESX = nil 

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 

ESX.RegisterServerCallback('apx_starterpack:server:checkIfUsed', function(source,cb) 
    local _src <const> = source
    checkIfUsed(_src, function(result)
        if result then
            cb(true)
        else
            cb(false)
        end
    end)
end)

RegisterNetEvent("apx_starterpack:server:markAsUsed", function()
    local _src <const> = source
    local _ply = ESX.GetPlayerFromId(_src)
    _ply.addInventoryItem('box', 1)
    _ply.showNotification(Config.ReceiveMsg)
    updateUser(_src, function(result)
        if result then
        end
    end)
end)

ESX.RegisterUsableItem('box', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    for k,v in pairs(Config.items) do
      xPlayer.addInventoryItem(v, 1)
	  xPlayer.removeInventoryItem("box", 1)
    end
    xPlayer.showNotification(Config.BoxMsg)
end)