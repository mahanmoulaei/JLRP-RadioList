local PlayerServerID = GetPlayerServerId(PlayerId())
local PlayersInRadio = {}

RegisterNetEvent('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers')
AddEventHandler('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers', function(src, RadioChannelToJoin, PlayersInRadioChannel)
	PlayersInRadio = PlayersInRadioChannel
	if src == PlayerServerID then
		if RadioChannelToJoin > 0 then
			local radioChannelToJoin = tostring(RadioChannelToJoin)
			if Config.RadioChannelName[radioChannelToJoin] and Config.RadioChannelName[radioChannelToJoin] ~= nil then -- Check if the current radioChannel had defined a name in config or not
				HideTheRadioList() -- Hide and close the radio list in case the player was already in a different radioChannel
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = Config.RadioChannelName[radioChannelToJoin] }) -- Add other radio members of the radio channel
					else
						SendNUIMessage({ radioId = src, radioName = player.Name, channel = Config.RadioChannelName[radioChannelToJoin], self = true  }) -- Add self player to radio list
					end
					
				end
				ResetTheRadioList() -- Delete the PlayersInRadio contents so it opens up memory
			else
				HideTheRadioList() -- Hide and close the radio list in case the player was already in a different radioChannel
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = radioChannelToJoin }) -- Add other radio members of the radio channel
					else
						SendNUIMessage({ radioId = src, radioName = player.Name, channel = radioChannelToJoin, self = true  }) -- Add self player to radio list
					end
				end
				ResetTheRadioList() -- Delete the PlayersInRadio contents so it opens up memory
			end
		else
			ResetTheRadioList() -- Delete the PlayersInRadio contents so it opens up memory
			HideTheRadioList() 	-- Hide and close the radio list
		end
	elseif src ~= PlayerServerID then
		if RadioChannelToJoin > 0 then
			local radioChannelToJoin = tostring(RadioChannelToJoin)
			if Config.RadioChannelName[radioChannelToJoin] and Config.RadioChannelName[radioChannelToJoin] ~= nil then -- Check if the current radioChannel had defined a name in config or not
				SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = Config.RadioChannelName[radioChannelToJoin] }) -- Add player to radio list
				ResetTheRadioList() -- Delete the PlayersInRadio contents so it opens up memory
			else
				SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = radioChannelToJoin }) -- Add player to radio list
			end
		else
			SendNUIMessage({ radioId = src }) -- Remove player from radio list
		end
	end
	
end)

--Set talkingState on radio for another radio member = true
RegisterNetEvent('pma-voice:setTalkingOnRadio')
AddEventHandler('pma-voice:setTalkingOnRadio', function(src, talkingState)
	--print("Talking [{"..src.."} "..talkingState.."]")
	SendNUIMessage({ radioId = src, radioTalking = talkingState }) -- Set player talking in radio list
end)

--Set talkingState on radio for self = true
RegisterNetEvent('pma-voice:radioActive')
AddEventHandler('pma-voice:radioActive', function(talkingState)
	--print("Talking [{"..PlayerServerID.."} "..tostring(talkingState).."]")
	SendNUIMessage({ radioId = PlayerServerID, radioTalking = talkingState }) -- Set player talking in radio list
end)

RegisterNetEvent('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel')
AddEventHandler('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel', function()
	ResetTheRadioList() -- Delete the PlayersInRadio contents so it opens up memory
	HideTheRadioList()
end)

-- Deletes the PlayersInRadio contents so it opens up memory
function ResetTheRadioList()
	PlayersInRadio = {}
end

-- Hides and closes the radio list
function HideTheRadioList()
	SendNUIMessage({ clearRadioList = true }) -- Clear radio listPlayersInRadio 
end
