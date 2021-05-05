-- Made by szymczakovv#1937
ESX = nil

local holdingup = false

local hackholdingup = false

local cayooo = ""

local saved = {}

local secondsRemaining = 0

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

RegisterNetEvent('esx_cayoperico:currentlyPaints')
AddEventHandler('esx_cayoperico:currentlyPaints', function(robb, thisheist)
    hackholdingup = true
    PlaySoundFrontend(table.unpack(Config.Sound))
        ESX.Scaleform.ShowFreemodeMessage('~y~Cayo Perico', 'Wybicie obrazu z ramy potrwa około ~r~30~s~ sekund' , 5.0)
	if PlayerData.job.name == 'police' then
		TriggerEvent('esx_cayoperico:blip')
    end
    saved = thisheist
	cayooo = robb
	secondsRemaining = 300
end)



CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, sleep = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true), true

		for k,v in pairs(Config.Location)do
			local pos2 = v.obraz

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not hackholdingup then
					DrawMarker(1, v.obraz.x, v.obraz.y, v.obraz.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby wybić ramę ~b~Obrazu')
						end
						incircle = true
                        if IsControlJustReleased(1, 51) then
                            local playerPed = PlayerPedId()
                            TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_HAMMERING", 0, true)
                            TriggerServerEvent('esx_cayoperico:Paint', k)
                            Citizen.Wait(30000)
                            TriggerServerEvent('esx_cayoperico:SuccessPaint')
                            TriggerEvent('esx:showNotification', 'Wybiłes obraz z ramy.')
                            Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
						end
					elseif(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) > 1.0)then
						incircle = false
					end
				end
			end
		end
		if sleep then
			Citizen.Wait(200)
		end
	end
end)