local QBCore = exports['qb-core']:GetCoreObject()

-- Eventos

RegisterNetEvent('mt-weedruns:client:DarCaixa', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weed_box'
    local quantity = '1'

    Player.Functions.AddItem(item, quantity)
end)

RegisterNetEvent('mt-weedruns:client:EntregarCaixa', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weed_box'
    local item2 = 'weed_recive'
    local quantity = '1'

    Player.Functions.RemoveItem(item, quantity)
    Player.Functions.AddItem(item2, quantity)
end)

RegisterNetEvent('mt-weedruns:server:ReceberPagamento', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local item = 'weed_recive'
    local quantity = 1
    local payment = Config.Payment

    Player.Functions.RemoveItem(item, quantity)
    Player.Functions.AddMoney('bank', payment)
end)