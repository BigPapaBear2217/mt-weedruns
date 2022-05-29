# mt-weedruns
Weed Runs script for QBCore

# Preview 
https://youtu.be/aSrfh76qOEc

# Instalation:

Add to qb-core/shared/items.lua

```
	--mt-weedruns
	["weed_box"]     = {["name"] = "weed_box", 				    ["label"] = "Weed Box", 					["weight"] = 1000, 		["type"] = "item", 			["image"] = "weed_box.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},
	["weed_recive"]     = {["name"] = "weed_recive", 				    ["label"] = "Weed Recive", 					["weight"] = 0, 		["type"] = "item", 			["image"] = "weed_recive.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = ""},

```

Add to qb-target/init.lua:

At Config.Peds

```
    { --mt-weedruns
        model = 's_m_y_dealer_01',
        coords = vector4(865.9, -3203.48, 4.98, 181.49),
        gender = 'male',
        freeze = true,
        invincible = false,
        blockevents = false,
    },
```

At Config.TargetModels

```
    ["weedrunsped"] = {
        models = {
            "s_m_y_dealer_01",
        },
        options = {
            {
                type = "client",
                event = "mt-weedruns:client:PedirEntrega",
                icon = "fas fa-cannabis", 
                label = "Request Delivery",
            },
            {
                type = "client",
                event = "mt-weedruns:client:ReceberPagamento",
                icon = "fas fa-dolar-sign", 
                label = "Recive Payment",
                item = "weed_recive",
            }
        },
        distance = 2.5,
    },
```

# Dependicies

- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-phone - https://github.com/qbcore-framework/qb-phone
- dpemotes - https://github.com/qbcore-framework/dpemotes
