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

RegisterNetEvent('esx_cayoperico:currentlyhacking')
AddEventHandler('esx_cayoperico:currentlyhacking', function(robb, thisheist)
	hackholdingup = true
	TriggerEvent("mhacking:show")
	TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
	if PlayerData.job.name == 'police' then
		TriggerEvent('esx_cayoperico:blip')
	end
	TriggerEvent("mhacking:start",7,150, successing)
	saved = thisheist
	cayooo = robb
	secondsRemaining = 300
end)

function successing(success, timeremaining)
	if success then
		local playerPed = PlayerPedId()
		TriggerEvent('mhacking:hide')
		Wait(300)
			FreezeEntityPosition(playerPed, true)
			PlaySoundFrontend(table.unpack(Config.Sound))
			Citizen.InvokeNative(0xAAA34F8A7CB32098, PlayerPedId())
		ESX.Scaleform.ShowFreemodeMessage('~y~Cayo Perico', 'Uruchomiły się dodatkowe zabezpieczenia, które należy zdezaktywować aby otrzymać pełen łup.~n~Za ~r~15~s~ sekund uruchomi się protokół bezpieczeństwa.', 15.0)
		Citizen.Wait(5000)
		exports["mhacking"]:CayoPerico(4.5)
	else
		hackholdingup = false
		ESX.ShowNotification('Hakowanie nie udane!')
		TriggerEvent('mhacking:hide')
		secondsRemaining = 0
		incircle = false
	end
end

RegisterNetEvent('esx_cayoperico:killblip')
AddEventHandler('esx_cayoperico:killblip', function()
	RemoveBlip(blipek)
end)

RegisterNetEvent('esx_cayoperico:blip')
AddEventHandler('esx_cayoperico:blip', function()
      blipek = AddBlipForCoord(5010.68, -5757.22,15.48)
      SetBlipSprite(blipek, 161)
      SetBlipDisplay(blipek, 4)
	  SetBlipScale(blipek , 2.0)
      SetBlipColour(blipek, 3)
      SetBlipAsShortRange(blipek, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("# Napad na ~g~Cayo Perico")
      EndTextCommandSetBlipName(blipek)
end)

CreateThread(function()
	while true do
		Citizen.Wait(0)
		if holdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		end
		elseif hackholdingup then
			Citizen.Wait(1000)
			if(secondsRemaining > 0)then
				secondsRemaining = secondsRemaining - 1
			end
		else
			Citizen.Wait(300)
		end
	end
end)

CreateThread(function()
	for k,v in pairs(Config.Location) do
		local ve = v.safe

		local blip = AddBlipForCoord(ve.x, ve.y, ve.z)
		SetBlipSprite(blip, 586)
		SetBlipScale(blip, 1.0)
		SetBlipColour(blip, 75)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('Napad na Cayo Perico')
		EndTextCommandSetBlipName(blip)
	end
end)





incircle = false

CreateThread(function()
	while true do
		Citizen.Wait(0)
		local pos, sleep = GetEntityCoords(Citizen.InvokeNative(0x43A66C31C68491C0, -1), true), true

		for k,v in pairs(Config.Location)do
			local pos2 = v.safe

			if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 15.0)then
				sleep = false
				if not hackholdingup then
					DrawMarker(1, v.safe.x, v.safe.y, v.safe.z - 1, 0, 0, 0, 0, 0, 0, 1.0001, 1.0001, 1.5001, 1555, 0, 0,255, 0, 0, 0,0)

					if(Vdist(pos.x, pos.y, pos.z, pos2.x, pos2.y, pos2.z) < 1.0)then
						if (incircle == false) then
							ESX.ShowHelpNotification('Naciśnij ~INPUT_CONTEXT~ aby rozpocząć hakowanie ~b~Sejfu')
						end
						incircle = true
						if IsControlJustReleased(1, 51) then
							local playerPed = PlayerPedId()
							TaskStartScenarioInPlace(playerPed, "PROP_HUMAN_PARKING_METER", 0, true)
							Citizen.Wait(2000)
							TriggerServerEvent('esx_cayoperico:hack', k)
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
