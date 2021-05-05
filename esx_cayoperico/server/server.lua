-- Made by szymczakovv#1937
ESX = nil

local rob = false

local robbers = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	local _source = source
	local xPlayers = ESX.GetPlayers()
	local xPlayer  = ESX.GetPlayerFromId(_source)

RegisterServerEvent('esx_cayoperico:hack')
AddEventHandler('esx_cayoperico:hack', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()



	if Config.Location[robb] then

		local bank = Config.Location[robb]

		if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, '~b~Miejsce niedawno zostało okradzione, proszę czekać: ' .. (1800 - (os.time() - bank.lastrobbed)) .. ' sekund.')
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end



		if (cops >= Config.MinPoliceOnDuty) then

			if xPlayer.getInventoryItem('raspberry').count >= 1 then
				xPlayer.removeInventoryItem('raspberry', 1)
				TriggerClientEvent('esx:showNotification', source, 'Rozpoczęto hakowanie ~b~Sejfu.')
				TriggerClientEvent('esx_cayoperico:currentlyhacking', source, robb, Config.Location[robb])

				if xPlayer.job.name == 'police' then
					TriggerClientEvent('chatMessage', -1, '^0[^3Centrala^0]', {255, 0, 0}, " Naruszono alarm w ^1sejfie ^0na wyspie ^2Cayo Perico")
				end

			else
				TriggerClientEvent('esx:showNotification', source, 'Potrzebujesz urządzenia hakerskiego aby rozpocząć napad')
			end
		else
			TriggerClientEvent('esx:showNotification', source, 'Do rozpoczęcia napadu potrzeba minimalną ilosć: ~b~' ..Config.MinPoliceOnDuty.. ' ~w~Funkcjonariuszy na służbie')
		end
	end
end)

RegisterServerEvent('esx_cayoperico:yolo')
AddEventHandler('esx_cayoperico:yolo', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()



	if Config.Location[robb] then

		local bank = Config.Location[robb]

		if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, '~b~Miejsce niedawno zostało okradzione, proszę czekać: ' .. (1800 - (os.time() - bank.lastrobbed)) .. ' sekund.')
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end



		if (cops >= Config.MinPoliceOnDuty) then


				TriggerClientEvent('esx:showNotification', source, 'Rozbiłeś ~b~Szybę.')
				TriggerClientEvent('esx_cayoperico:currentlyjewel', source, robb, Config.Location[robb])

				if xPlayer.job.name == 'police' then
					TriggerClientEvent('chatMessage', -1, '^0[^3Centrala^0]', {255, 0, 0}, " Naruszono alarm w ^1gablocie ze złotem ^0na wyspie ^2Cayo Perico")
				end

		else
			TriggerClientEvent('esx:showNotification', source, 'Do rozpoczęcia napadu potrzeba minimalną ilosć: ~b~' ..Config.MinPoliceOnDuty.. ' ~w~Funkcjonariuszy na służbie')
		end
	end
end)

RegisterServerEvent('esx_cayoperico:Paint')
AddEventHandler('esx_cayoperico:Paint', function(robb)

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()



	if Config.Location[robb] then

		local bank = Config.Location[robb]

		if (os.time() - bank.lastrobbed) < 600 and bank.lastrobbed ~= 0 then

			TriggerClientEvent('esx:showNotification', source, '~b~Miejsce niedawno zostało okradzione, proszę czekać: ' .. (1800 - (os.time() - bank.lastrobbed)) .. ' sekund.')
			return
		end


		local cops = 0
		for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
			end
		end



		if (cops >= Config.MinPoliceOnDuty) then

				TriggerClientEvent('esx_cayoperico:currentlyPaints', source, robb, Config.Location[robb])
				

				if xPlayer.job.name == 'police' then
					TriggerClientEvent('chatMessage', -1, '^0[^3Centrala^0]', {255, 0, 0}, " Naruszono alarm w ^1gablocie z obrazem ^0na wyspie ^2Cayo Perico")
				end

		else
			TriggerClientEvent('esx:showNotification', source, 'Do rozpoczęcia napadu potrzeba minimalną ilosć: ~b~' ..Config.MinPoliceOnDuty.. ' ~w~Funkcjonariuszy na służbie')
		end
	end
end)


RegisterServerEvent("esx_cayoperico:sell")
AddEventHandler("esx_cayoperico:sell", function()
    local player = ESX.GetPlayerFromId(source)

    local currentItemsInInventory = player.getInventoryItem("gold")["count"]
    
    if currentItemsInInventory > 0 then
        local money = Config.Price['1']
        player.removeInventoryItem("gold", currentItemsInInventory)
        player.addMoney(money * currentItemsInInventory)
        TriggerClientEvent("esx:showNotification", source, ("Sprzedałeś ~y~Złoto~s~ za: $%s."):format(currentItemsInInventory * money))
    else
        TriggerClientEvent("esx:showNotification", source, "Nie masz żadnych przedmitów do skupu!")
	end
	local player = ESX.GetPlayerFromId(source)

    local currentItemsInInventory = player.getInventoryItem("diamond")["count"]
    
    if currentItemsInInventory > 0 then
        local money = Config.Price['2']
        player.removeInventoryItem("diamond", currentItemsInInventory)
        player.addMoney(money * currentItemsInInventory)
        TriggerClientEvent("esx:showNotification", source, ("Sprzedałeś ~b~Diamenty~s~ za: $%s."):format(currentItemsInInventory * money))
    else
        TriggerClientEvent("esx:showNotification", source, "Nie masz żadnych przedmitów do skupu!")
    end
end)

RegisterServerEvent("esx_cayoperico:sellpaint")
AddEventHandler("esx_cayoperico:sellpaint", function()
    local player = ESX.GetPlayerFromId(source)

    local currentItemsInInventory = player.getInventoryItem("obraz")["count"]
    
    if currentItemsInInventory > 0 then
        local money = Config.Price['3']
        player.removeInventoryItem("obraz", currentItemsInInventory)
        player.addMoney(money * currentItemsInInventory)
        TriggerClientEvent("esx:showNotification", source, ("Sprzedałeś ~y~Dzieło Sztuki~s~ za: $%s."):format(currentItemsInInventory * money))
    else
        TriggerClientEvent("esx:showNotification", source, "Nie masz żadnych przedmitów do skupu!")
	end
end)

RegisterNetEvent('esx_cayoperico:itemsuccess')
AddEventHandler('esx_cayoperico:itemsuccess', function()
	local player = ESX.GetPlayerFromId(source)
		--player.addInventoryItem(Config.Items['1'], Config.Amount['1'])
		player.addInventoryItem(Config.Items['2'], Config.Amount['2'])
		player.addInventoryItem(Config.Items['3'], Config.Amount['3'])
end)

RegisterNetEvent('esx_cayoperico:jewelsuccess')
AddEventHandler('esx_cayoperico:jewelsuccess', function()
	local player = ESX.GetPlayerFromId(source)
	player.addInventoryItem(Config.Items['2'], Config.Amount['4'])
	player.addInventoryItem(Config.Items['3'], Config.Amount['5'])
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		Citizen.Wait(30000)
		TriggerClientEvent('esx_cayoperico:killblip', xPlayers[i]) -- blip usuwa się po 30 sekundach od zakończenia rabunku sejfu
	end
end)

RegisterNetEvent('esx_cayoperico:SuccessPaint')
AddEventHandler('esx_cayoperico:SuccessPaint', function()
	local player = ESX.GetPlayerFromId(source)
	player.addInventoryItem(Config.Items['4'], Config.Amount['6'])
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		Citizen.Wait(30000)
		TriggerClientEvent('esx_cayoperico:killblip', xPlayers[i]) -- blip usuwa się po 30 sekundach od zakończenia rabunku sejfu
	end
end)

RegisterNetEvent('esx_cayoperico:moneysuccess')
AddEventHandler('esx_cayoperico:moneysuccess', function()
	local player = ESX.GetPlayerFromId(source)
	player.addMoney(Config.GiveMoneyAmmount)
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		Citizen.Wait(30000)
		TriggerClientEvent('esx_cayoperico:killblip', xPlayers[i]) -- blip usuwa się po 30 sekundach od zakończenia rabunku sejfu
	end
end)
