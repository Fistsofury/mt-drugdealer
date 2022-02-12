local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('mt-drugdealer:client:vendas')
AddEventHandler('mt-drugdealer:client:vendas', function()
    exports['qb-menu']:openMenu({
		{
            header = "Dealer",
            isMenuHeader = true
        },
        { -- copiar daqui
            header = "Vender Sacos de Weed",
            txt = "Preço atual: 2 cada",
            params = {
				isServer = true,
                event = "mt-drugdealer:server:vendas",
				args = 1 -- amendments to arg goes here
            }
        },		-- paste below here	
        {
            header = "< Fechar",
            txt = "",
            params = {
                event = "qb-menu:closeMenu"
            }
        },
    })
end)

-- To add another item you will need to add additional into the server.lua for each item that gets added then change the arg above

-- spawn ped vendas
local dealerPed = {
	{-2166.03, 5197.17, 15.88,"Sr Manel",101.85,0x7E4F763F,"g_m_m_chigoon_01"}, --Ped location
  
  }
  Citizen.CreateThread(function()
	  for _,v in pairs(dealerPed) do
		  RequestModel(GetHashKey(v[7]))
		  while not HasModelLoaded(GetHashKey(v[7])) do
			  Wait(1)
		  end
		  CokeProcPed =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
		  SetEntityHeading(CokeProcPed, v[5])
		  FreezeEntityPosition(CokeProcPed, true)
		  SetEntityInvincible(CokeProcPed, true)
		  SetBlockingOfNonTemporaryEvents(CokeProcPed, true)
		  TaskStartScenarioInPlace(CokeProcPed, "WORLD_HUMAN_AA_SMOKE", 0, true) 
	  end
  end)

-- Target Venda
Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("dealer", vector3(-2166.03, 5197.17, 15.88), 1, 1, {
        name = "dealer",
        heading = 0,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "mt-drugdealer:client:vendas",
                icon = "fas fa-seedling",
                label = 'Falar com o Dealer'
            },
        },
        distance = 2.5
    })
end)
