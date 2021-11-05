local AllPlayers = {}
local RadioList = {}

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

RegisterNetEvent('pma-voice:setPlayerRadio', function(radioChannel)	
	local src = source
	local radioChannel = tonumber(radioChannel)
	if not radioChannel then error(('radioChannel was not a number. Got: %s Expected: Number'):format(type(radioChannel))) return end
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	if radioChannel == 0 then
		Disconnect(src, currentRadioChannel, radioChannel)
	else
		Connect(src, currentRadioChannel, radioChannel)
	end
	
	
	
	
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	--CONNECTING
	--[[if currentRadioChannel > 0 and radioChannelToJoin ~= currentRadioChannel then
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:DisconnectPlayerCurrentChannel", src)
	end]]
	Wait(1000)
	RadioList = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(RadioList) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, RadioList)
	end
	RadioList = {}
end

function Disconnect(src, currentRadioChannel, radioChannelToJoin) 
	--DISCONNECTING	
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(currentRadioChannel)
	TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", src, src, radioChannelToJoin, playersInRadio)
	Wait(1000)
	for player, isTalking in pairs(playersInRadio) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player, src, radioChannelToJoin, playersInRadio)
	end
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(RadioChannel)
	RadioList = {}
	for player, isTalking in pairs(playersInRadio) do
		--print(('%s is in radio channel currentRadioChannel, isTalking: %s'):format(GetPlayerName(player), currentRadioChannel, isTalking))

		RadioList[player] = {}
		RadioList[player].Source = player
		RadioList[player].Name = GetPlayerName(player)
		RadioList[player].RadioChannel = RadioChannel
	end
	return RadioList
end