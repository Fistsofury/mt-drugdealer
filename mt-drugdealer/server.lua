local QBCore = exports['qb-core']:GetCoreObject()

-- Venda items
RegisterNetEvent('mt-drugdealer:server:vendas', function(args) 
	local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	local args = tonumber(args)
	if args == 1 then -- copiar daqui até, para mudar no menu tem de mudar este agrs == 1 para por exemplo agrs == 2
		local og_kush_bag = Player.Functions.GetItemByName("og_kush_bag")
		if og_kush_bag ~= nil then
			local payment = 2 -- trocar aqui o preço que deseja para o próximo item
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

-- para adicionar mais itens para venda basta copiar o que está marcado acima, colar em baixo do end marcado e trocar
-- os nomes para o nome do item que deseja exemplo "og_kush_bag" troca para o nome do seu item