local PlayersInCurrentRadioChannel = {}

AddEventHandler("playerDropped", function()
	local src = source
	
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(playersInCurrentRadioChannel) do
		if player.Source ~= src then
			TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
		end
	end
	playersInCurrentRadioChannel = {}
end)

RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(radioChannelToJoin)
	
	local src = source
	local radioChannelToJoin = tonumber(radioChannelToJoin)
	if not radioChannelToJoin then print(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(radioChannelToJoin))) return end
	local PlayerState = Player(src).state
	local currentRadioChannel = PlayerState.radioChannel
	
	if radioChannelToJoin == 0 then
		--print(radioChannelToJoin)
		Disconnect(src, currentRadioChannel)
	else
		Connect(src, currentRadioChannel, radioChannelToJoin)
	end
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	--print("Connect [{"..src.."} "..currentRadioChannel.." "..radioChannelToJoin.."]")
	--CONNECTING
	if currentRadioChannel > 0 then -- check if src is already in a radioChannel
		Disconnect(src, currentRadioChannel)
	end
	Wait(1000) -- Wait for pma-voice to finilize setting the player radio channel 
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for index, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function Disconnect(src, currentRadioChannel) 
	--DISCONNECTING	
	--print("Diconnect [{"..src.."} "..currentRadioChannel.."]")
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", src, src, 0, playersInCurrentRadioChannel)
	for index, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = exports['pma-voice']:getPlayersInRadioChannel(RadioChannel)
	--playersInCurrentRadioChannel = {}
	for player, isTalking in pairs(playersInRadio) do
		playersInRadio[player] = {}
		playersInRadio[player].Source = player
		playersInRadio[player].Name = GetPlayerName(player)
		--playersInCurrentRadioChannel[player].RadioChannel = RadioChannel
	end
	return playersInRadio
end

