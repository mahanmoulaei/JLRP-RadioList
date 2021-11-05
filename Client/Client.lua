local PlayerServerID = GetPlayerServerId(PlayerId())
local PlayerName = GetPlayerName(PlayerId())
local PlayersInRadio = {}

RegisterNetEvent('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers')
AddEventHandler('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers', function(src, radioChannel, RadioList)
	PlayersInRadio = RadioList
	if src == PlayerServerID then
		if radioChannel > 0 then
			local radioChannel = tostring(radioChannel)
			--print(Config.RadioChannelName[radioChannel])
			if Config.RadioChannelName[radioChannel] and Config.RadioChannelName[radioChannel] ~= nil then
				SendNUIMessage({ clearRadioList = true }) -- Clear radio listPlayersInRadio 
				SendNUIMessage({ radioId = src, radioName = PlayerName, channel = Config.RadioChannelName[radioChannel], self = true  }) -- Add player to radio list
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = Config.RadioChannelName[radioChannel] }) -- Add radio targets of existing players in channel
					end
				end
			else
				SendNUIMessage({ clearRadioList = true }) -- Clear radio listPlayersInRadio 
				SendNUIMessage({ radioId = src, radioName = PlayerName, channel = radioChannel, self = true  }) -- Add player to radio list
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = radioChannel }) -- Add radio targets of existing players in channel
					end
				end
			end
		else
			PlayersInRadio = {} -- Remove all radio targets as client has left the radio channel
			SendNUIMessage({ clearRadioList = true }) -- Clear radio list
		end
	elseif src ~= PlayerServerID then
		if radioChannel > 0 then
			SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = Config.RadioChannelName[radioChannel] }) -- Add player to radio list
		else
			SendNUIMessage({ radioId = src }) -- Remove player from radio list
		end
	end
	
end)

RegisterNetEvent('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel')
AddEventHandler('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel', function()
	print("text")
	PlayersInRadio = {} -- Remove all radio targets as client has left the radio channel
	SendNUIMessage({ clearRadioList = true }) -- Clear radio listPlayersInRadio 	
end)
