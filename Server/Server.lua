local PlayersInCurrentRadioChannel = {}

AddEventHandler("playerDropped", function()
	local src = source
	
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	PlayersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(PlayersInCurrentRadioChannel) do
		if player.Source ~= src then
			TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, PlayersInCurrentRadioChannel)
		end
	end
end)

RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(radioChannel)	
	local src = source
	local radioChannelToJoin = tonumber(radioChannel)
	if not radioChannelToJoin then print(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(radioChannelToJoin))) return end
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	if radioChannelToJoin == 0 then
		Disconnect(src, currentRadioChannel)
	else
		Connect(src, currentRadioChannel, radioChannelToJoin)
	end
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	--CONNECTING
	if currentRadioChannel > 0 then -- check if src is already in a radioChannel
		Disconnect(src, currentRadioChannel)
	end
	Wait(1000) -- Wait for pma-voice to finilize setting the player radio channel 
	PlayersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(PlayersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, PlayersInCurrentRadioChannel)
	end
end

function Disconnect(src, currentRadioChannel) 
	--DISCONNECTING	
	PlayersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(PlayersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, PlayersInCurrentRadioChannel)
	end
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = exports['pma-voice']:getPlayersInCurrentRadioChannel(RadioChannel)
	PlayersInCurrentRadioChannel = {}
	for player, isTalking in pairs(playersInRadio) do
		PlayersInCurrentRadioChannel[player] = {}
		PlayersInCurrentRadioChannel[player].Source = player
		PlayersInCurrentRadioChannel[player].Name = GetPlayerName(player)
		--PlayersInCurrentRadioChannel[player].RadioChannel = RadioChannel
	end
	return PlayersInCurrentRadioChannel
end
