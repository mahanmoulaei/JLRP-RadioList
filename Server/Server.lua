local PlayersInCurrentRadioChannel = {}
--TODO : Check The Bug In playerDropped Event
AddEventHandler("playerDropped", function()
	local src = source
	
	local currentRadioChannel = Player(src).state.radioChannel
	
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(playersInCurrentRadioChannel) do
		if player.Source ~= src then
			TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
		end
	end
	playersInCurrentRadioChannel = {}
end)

--This event is located on pma-voice/server/module/radio.lua
RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(channelToJoin)
	local src = source	
	local radioChannelToJoin = tonumber(channelToJoin)
	if not radioChannelToJoin then print(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(channelToJoin))) return end
	local currentRadioChannel = Player(src).state.radioChannel		
	if radioChannelToJoin == 0 then
		Disconnect(src, currentRadioChannel)
	else
		Connect(src, currentRadioChannel, radioChannelToJoin)
	end
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	if currentRadioChannel > 0 then -- check if src is already in a radioChannel
		Disconnect(src, currentRadioChannel)
	end
	Wait(1000) -- Wait for pma-voice to finilize setting the player radio channel

	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(radioChannelToJoin)
	for index, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function Disconnect(src, currentRadioChannel) 
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", src, src, 0, playersInCurrentRadioChannel)
	for index, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(RadioChannel)
	for player, isTalking in pairs(playersInRadio) do
		playersInRadio[player] = {}
		playersInRadio[player].Source = player
		
		local name
		
		if Config.UseRPName then
			local xPlayer = ESX.GetPlayerFromId(player)		
			if xPlayer then
				name = xPlayer.getName()
			else --extra check to make sure player sends a name to client
				name = GetPlayerName(player)
			end
		else
			name = GetPlayerName(player)
		end
		
		playersInRadio[player].Name = name
	end
	
	return playersInRadio
end


