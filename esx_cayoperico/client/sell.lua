-- Made by szymczakovv#1937
ESX = nil

CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


CreateThread(function()
	while true do
		Citizen.Wait(1)
		local coords, sleep = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1)), true
		for i=1, #Config.SellZone, 1 do
			if(GetDistanceBetweenCoords(coords, Config.SellZone[i].x, Config.SellZone[i].y, Config.SellZone[i].z, true) < 100) then
				sleep = false
				DrawMarker(1, Config.SellZone[i].x, Config.SellZone[i].y, Config.SellZone[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
		for i=1, #Config.MuzeumSell, 1 do
			if(GetDistanceBetweenCoords(coords, Config.MuzeumSell[i].x, Config.MuzeumSell[i].y, Config.MuzeumSell[i].z, true) < 100) then
				sleep = false
				DrawMarker(1, Config.MuzeumSell[i].x, Config.MuzeumSell[i].y, Config.MuzeumSell[i].z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Config.ZoneSize.x, Config.ZoneSize.y, Config.ZoneSize.z, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, false, false, false, false)
			end
		end
		if sleep then
			Citizen.Wait(200)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(10)
		local coords, sleep      = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1)), true
		isInCayoHeist  = false
		local currentZone = nil
		for i=1, #Config.SellZone, 1 do
			if(GetDistanceBetweenCoords(coords, Config.SellZone[i].x, Config.SellZone[i].y, Config.SellZone[i].z, true) < Config.ZoneSize.x) then
				sleep = false
				isInCayoHeist  = true
				ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby sprzedać ~b~Łup')
			end
		end
		if isInCayoHeist and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInCayoHeist and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_cayoperico:hasExitedMarker')
		end
		-- XDDDDDDDDDDDDDDDDDDDDD
		local coords      = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1))
		isInCayoHeist2  = false
		local currentZone = nil
		for i=1, #Config.MuzeumSell, 1 do
			if(GetDistanceBetweenCoords(coords, Config.MuzeumSell[i].x, Config.MuzeumSell[i].y, Config.MuzeumSell[i].z, true) < Config.ZoneSize.x) then
				sleep = false
				isInCayoHeist2  = true
				ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby sprzedać ~b~Dzieło Sztuki')
			end
		end
		if isInCayoHeist2 and not hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = true
		end
		if not isInCayoHeist2 and hasAlreadyEnteredMarker then
			hasAlreadyEnteredMarker = false
			TriggerEvent('esx_cayoperico:hasExitedMarker')
		end
		if sleep then
			Citizen.Wait(200)
		end
	end
end)

CreateThread(function()
	while true do
		Citizen.Wait(1)
        if IsControlJustReleased(0, 38) and isInCayoHeist and not menuIsShowed then
            TriggerServerEvent("esx_cayoperico:sell")
		elseif IsControlJustReleased(0, 38) and isInCayoHeist2 and not menuIsShowed then
            TriggerServerEvent("esx_cayoperico:sellpaint")
		end
	end
end)

CreateThread(function()

	RequestModel(-1567723049)

	while not HasModelLoaded(-1567723049) do

		Wait(1)

    end
    
		ped =  CreatePed(4, -1567723049, 591.36, -3282.45, 5.07, 0.34, false, true)

		SetBlockingOfNonTemporaryEvents(ped, true)

		SetPedDiesWhenInjured(ped, false)

		SetPedCanPlayAmbientAnims(ped, true)

		SetPedCanRagdollFromPlayerImpact(ped, false)

		SetEntityInvincible(ped, true)

		FreezeEntityPosition(ped, true)

end)
