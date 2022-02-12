local QBCore = exports['qb-core']:GetCoreObject()

-- Venda items
RegisterNetEvent('mt-drugdealer:server:vendas', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then -- Whatever is here you will need to change in the clinet.lua aeg args==2
		local og_kush_bag = Player.Functions.GetItemByName("og_kush_bag")
		if og_kush_bag ~= nil then
			local payment = 2 -- Prices changes
			Player.Functions.RemoveItem("og_kush_bag", 1, k)
			Player.Functions.AddMoney('bank', payment , "og_kush_bag-sell")
			TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["og_kush_bag"], "remove", 1)
			TriggerClientEvent('QBCore:Notify', src, "1 "..source.." vendido por $"..payment, "success")
			TriggerClientEvent("mt-drugdealer:client:venda", source)
		else
		    TriggerClientEvent('QBCore:Notify', src, "Não tens nada para vender", "error")
        end -- este end
    end
end)

-- To add more items just copy and paste the above code, change the item and change the args value
-- "og_kush_bag" is the example item of what you will be trading in.
