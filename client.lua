local QBCore = exports['qb-core']:GetCoreObject()

-- Eventos

RegisterNetEvent('mt-weedruns:client:PedirEntrega', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
    QBCore.Functions.Progressbar('falar_dealer', 'TALKING TO THE DEALER...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    QBCore.Functions.Notify('The dealer will send you an email soon, stay tunned!', 'primary', 7500)

    Wait(Config.WeedEmailWaitTime)

    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Dealer',
        subject = 'Some drugs...',
        message = 'Hi, i talk to you recently and i saw that you are interested on do some deliverys... so if you like to help me go to location on your gps and take the boxes at the yath.',
        })

    Wait(100)

    SetNewWaypoint(Config.BoxesLocation)
    ExportBoxesTarget()
    end)
end)

RegisterNetEvent('mt-weedruns:client:DarCaixa', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if not HasItem then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
            QBCore.Functions.Progressbar('name_here', 'SEARCHING BOXES...', 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function()
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerEvent('mt-weedruns:client:DarLocalização')
            end)
            else
                QBCore.Functions.Notify('Já tens uma encomenda contigo...', 'error', 7500)
            end
        end, 'weed_box')
end)

RegisterNetEvent('mt-weedruns:client:DarLocalização', function()
    TriggerServerEvent('mt-weedruns:client:DarCaixa')
    Wait(Config.WeedEmailWaitTime)

    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Dealer',
        subject = 'Some drugs...',
        message = 'Ok, i recive som informations that you have what i want, now give it to the customer on location at your map! Good Luck!',
        })

    GiveDeliveryLocations()
end)

RegisterNetEvent('mt-weedruns:client:EntregarCaixa', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"knock"})
    QBCore.Functions.Progressbar('bater_porta', 'KNOCKING DOOR...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

    Wait(100)

    TriggerEvent('animations:client:EmoteCommandStart', {"mechanic4"})
    QBCore.Functions.Progressbar('bater_porta', 'LEAVING PACKAGE...', 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})

    TriggerServerEvent('mt-weedruns:client:EntregarCaixa')

    Wait(Config.WeedEmailWaitTime)

    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = 'Dealer',
        subject = 'Some drugs...',
        message = 'Ok, i recive som informations that you have done what i ask for, THANKS! Now, past here and i will give your payment! :)',
        })

        end)
    end)
end)

RegisterNetEvent('mt-weedruns:client:ReceberPagamento', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"handshake"})
    QBCore.Functions.Progressbar('pagamento', 'RECIVING PAYMENT...', 5000, false, true, { 
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function() 
        TriggerServerEvent('mt-weedruns:server:ReceberPagamento')
    end)
end)

-- Funções

function ExportBoxesTarget()
    exports['qb-target']:AddBoxZone("weed_caixas", Config.BoxesLocation, 2, 2, {
        name="weed_caixas",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:DarCaixa",
            icon = "fas fa-box",
            label = "Search boxes",
            },
        },
        distance = 2.5
    })
end

function GiveDeliveryLocations()
    local prob = math.random(1, 10)

    if prob == 1 then
        ExportDeliveryTarget1()
        SetNewWaypoint(Config.DeliveryLocation1)
    elseif prob == 2 then
        ExportDeliveryTarget2()
        SetNewWaypoint(Config.DeliveryLocation2)
    elseif prob == 3 then
        ExportDeliveryTarget3()
        SetNewWaypoint(Config.DeliveryLocation3)
    elseif prob == 4 then
        ExportDeliveryTarget4()
        SetNewWaypoint(Config.DeliveryLocation4)
    elseif prob == 5 then
        ExportDeliveryTarget5()
        SetNewWaypoint(Config.DeliveryLocation5)
    elseif prob == 6 then
        ExportDeliveryTarget6()
        SetNewWaypoint(Config.DeliveryLocation6)
    elseif prob == 7 then
        ExportDeliveryTarget7()
        SetNewWaypoint(Config.DeliveryLocation7)
    elseif prob == 8 then
        ExportDeliveryTarget8()
        SetNewWaypoint(Config.DeliveryLocation8)
    elseif prob == 9 then
        ExportDeliveryTarget9()
        SetNewWaypoint(Config.DeliveryLocation9)
    elseif prob == 10 then
        ExportDeliveryTarget10()
        SetNewWaypoint(Config.DeliveryLocation10)
    end
end

function ExportDeliveryTarget1()
    exports['qb-target']:AddBoxZone("weed_entrega1", Config.DeliveryLocation1, 1, 1, {
        name="weed_entrega1",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget2()
    exports['qb-target']:AddBoxZone("weed_entrega2", Config.DeliveryLocation2, 1, 1, {
        name="weed_entrega2",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget3()
    exports['qb-target']:AddBoxZone("weed_entrega3", Config.DeliveryLocation3, 1, 1, {
        name="weed_entrega3",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget4()
    exports['qb-target']:AddBoxZone("weed_entrega4", Config.DeliveryLocation4, 1, 1, {
        name="weed_entrega4",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget5()
    exports['qb-target']:AddBoxZone("weed_entrega5", Config.DeliveryLocation5, 1, 1, {
        name="weed_entrega5",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget6()
    exports['qb-target']:AddBoxZone("weed_entrega6", Config.DeliveryLocation6, 1, 1, {
        name="weed_entrega6",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget7()
    exports['qb-target']:AddBoxZone("weed_entrega7", Config.DeliveryLocation7, 1, 1, {
        name="weed_entrega7",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget8()
    exports['qb-target']:AddBoxZone("weed_entrega8", Config.DeliveryLocation8, 1, 1, {
        name="weed_entrega8",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget9()
    exports['qb-target']:AddBoxZone("weed_entrega9", Config.DeliveryLocation9, 1, 1, {
        name="weed_entrega9",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end

function ExportDeliveryTarget10()
    exports['qb-target']:AddBoxZone("weed_entrega10", Config.DeliveryLocation10, 1, 1, {
        name="weed_entrega10",
        heading=0,
        debugpoly = false,
    }, {
        options = {
            {
            event = "mt-weedruns:client:EntregarCaixa",
            icon = "fas fa-box",
            label = "Knock Door",
            },
        },
        distance = 2.5
    })
end