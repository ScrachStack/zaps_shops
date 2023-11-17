Citizen.CreateThread(function()
       for _, store in pairs(config.Stores) do
        local blip = AddBlipForCoord(store.position.x, store.position.y, store.position.z)
        SetBlipSprite(blip, 52) 
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.7)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 2) 
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(store.name)
        EndTextCommandSetBlipName(blip)
    end
end)
local function registerStoreMenu(storeItems)
    local menuOptions = {}
    for _, item in ipairs(storeItems) do
        table.insert(menuOptions, {
            label = item.label .. ' - $' .. item.price,
            value = item.value,
            price = item.price
        })
    end
    lib.registerMenu({
        id = 'store_menu_id',
        title = 'Store',
        position = config.menuPosition,
        options = menuOptions
    }, function(selected)
        local item = menuOptions[selected]
        TriggerServerEvent('zaps:purchaseItem', item.value, item.label, item.price)
    end)
end
RegisterCommand('store', function(source, args, rawCommand)
    local playerCoords = GetEntityCoords(cache.ped)
    for _, store in pairs(config.Stores) do
        if #(playerCoords - store.position) < 10.0 then 
            registerStoreMenu(store.items)
            lib.showMenu('store_menu_id') 
            return
        end
    end
end)
RegisterKeyMapping('store', 'Opens Store', 'keyboard', 'e') 
