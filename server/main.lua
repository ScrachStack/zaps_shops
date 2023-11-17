RegisterServerEvent('zaps:purchaseItem')
AddEventHandler('zaps:purchaseItem', function(itemValue, itemLabel, itemPrice)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney()
    if money >= itemPrice then
        xPlayer.removeMoney(itemPrice)
        xPlayer.addInventoryItem(itemValue, 1) 
        TriggerClientEvent('esx:showNotification', source, 'You purchased ' .. itemLabel)
    else
        TriggerClientEvent('esx:showNotification', source, 'Not enough money')
    end
end)
