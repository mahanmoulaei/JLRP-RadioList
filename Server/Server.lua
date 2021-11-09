local AllPlayers = {}
local PlayersInRadioChannelToJoin = {}

AddEventHandler('playerJoined', function()
	local src = source
	if not AllPlayers[src] then
		AllPlayers[src] = defaultTable()
	end
end)

AddEventHandler("playerDropped", function()
	local src = source
	
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(currentRadioChannel)
	
	if AllPlayers[src] then
		AllPlayers[src] = nil
	end

	TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", src, src, radioChannel, playersInRadio)
	for player, isTalking in pairs(playersInRadio) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player, src, radioChannel, playersInRadio)
	end
end)

RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(radioChannel)	
	local src = source
	local radioChannelToJoin = tonumber(radioChannel)
	if not radioChannelToJoin then error(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(radioChannelToJoin))) return end
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	if radioChannelToJoin == 0 then
		Disconnect(src, currentRadioChannel, radioChannelToJoin)
	else
		Connect(src, currentRadioChannel, radioChannelToJoin)
	end
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	--CONNECTING
	if currentRadioChannel > 0 then -- check if src is already in a radioChannel
		Disconnect(src, currentRadioChannel, radioChannelToJoin)
	end
	Wait(1000) -- wait for pma-voice to finilize setting the player radio channel 
	PlayersInRadioChannelToJoin = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(PlayersInRadioChannelToJoin) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, PlayersInRadioChannelToJoin)
	end
end

function Disconnect(src, currentRadioChannel, radioChannelToJoin) 
	--DISCONNECTING	
	PlayersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(PlayersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, PlayersInCurrentRadioChannel)
	end
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(RadioChannel)
	PlayersInRadioChannelToJoin = {}
	for player, isTalking in pairs(playersInRadio) do
		--print(('%s is in radio channel currentRadioChannel, isTalking: %s'):format(GetPlayerName(player), currentRadioChannel, isTalking))

		PlayersInRadioChannelToJoin[player] = {}
		PlayersInRadioChannelToJoin[player].Source = player
		PlayersInRadioChannelToJoin[player].Name = GetPlayerName(player)
		PlayersInRadioChannelToJoin[player].RadioChannel = RadioChannel
	end
	return PlayersInRadioChannelToJoin
end
