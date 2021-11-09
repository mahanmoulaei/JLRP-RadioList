local PlayerServerID = GetPlayerServerId(PlayerId())
local PlayerName = GetPlayerName(PlayerId())
local PlayersInRadio = {}

RegisterNetEvent('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers')
AddEventHandler('JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers', function(src, RadioChannelToJoin, PlayersInRadioChannel)
	PlayersInRadio = PlayersInRadioChannel
	if src == PlayerServerID then
		if RadioChannelToJoin > 0 then
			local radioChannelToJoin = tostring(RadioChannelToJoin)
			if Config.RadioChannelName[radioChannelToJoin] and Config.RadioChannelName[radioChannelToJoin] ~= nil then --Check if the current previous radioChannel had defined a name in config or not
				HideTheRadioList()
				SendNUIMessage({ radioId = src, radioName = PlayerName, channel = Config.RadioChannelName[radioChannelToJoin], self = true  }) -- Add self player to radio list
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = Config.RadioChannelName[radioChannelToJoin] }) -- Add other radio members of the radio channel
					end
					
				end
				ResetTheRadioList()
			else
				HideTheRadioList()
				SendNUIMessage({ radioId = src, radioName = PlayerName, channel = radioChannelToJoin, self = true  }) -- Add self player to radio list
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = radioChannelToJoin }) -- Add other radio members of the radio channel
					end
				end
				ResetTheRadioList()
			end
		else
			ResetTheRadioList()
			HideTheRadioList()
		end
	elseif src ~= PlayerServerID then
		if RadioChannelToJoin > 0 then
			local radioChannelToJoin = tostring(RadioChannelToJoin)
			if Config.RadioChannelName[radioChannelToJoin] and Config.RadioChannelName[radioChannelToJoin] ~= nil then --Check if the current previous radioChannel had defined a name in config or not
				SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = Config.RadioChannelName[radioChannelToJoin] }) -- Add player to radio list
				ResetTheRadioList()
			else
				SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = radioChannelToJoin }) -- Add player to radio list
			end
		else
			SendNUIMessage({ radioId = src }) -- Remove player from radio list
		end
	end
	
end)

RegisterNetEvent('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel')
AddEventHandler('JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel', function()
	ResetTheRadioList()
	HideTheRadioList()
end)

function ResetTheRadioList()
	PlayersInRadio = {} -- Remove all radio targets as client has left the radio channel
end

function HideTheRadioList()
	SendNUIMessage({ clearRadioList = true }) -- Clear radio listPlayersInRadio 
end
