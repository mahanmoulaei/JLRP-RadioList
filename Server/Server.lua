local PlayersInCurrentRadioChannel = {}
local firstTimeEventGetsCalled = true

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

--This event is located on pma-voice/server/module/radio.lua
RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(channelToJoin)
	if firstTimeEventGetsCalled == false then	--For Sync With PMA-Voice
		local src = source	
		local radioChannelToJoin = tonumber(channelToJoin)
		if not radioChannelToJoin then print(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(channelToJoin))) return end
		local currentRadioChannel = Player(src).state.radioChannel
		--print("\n\nCurrent Radio Channel: "..currentRadioChannel.." - To Join Radio Channel: "..radioChannelToJoin)		
		if radioChannelToJoin == 0 then
			Disconnect(src, currentRadioChannel)
		else
			Connect(src, currentRadioChannel, radioChannelToJoin)
		end
	end
end)

function Connect(src, currentRadioChannel, radioChannelToJoin)
	if currentRadioChannel > 0 then -- check if src is already in a radioChannel
		Disconnect(src, currentRadioChannel)
	end
	Wait(1000) -- Wait for pma-voice to finilize setting the player radio channel
	--CONNECTING	
	--print("Connecting [{"..GetPlayerName(src).."} To "..radioChannelToJoin.."]")
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(radioChannelToJoin)
	for index, player in pairs(playersInCurrentRadioChannel) do
		--print("Sending "..src.."("..player.Name..") to "..player.Source)
		TriggerClientEvent("JolbakLifeRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function Disconnect(src, currentRadioChannel) 
	--DISCONNECTING	
	--print("Diconnecting [{"..GetPlayerName(src).."} From "..currentRadioChannel.."]")
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
		playersInRadio[player].Name = GetPlayerName(player)
		--print("Inside CreateFullRadioListOfChannel -> RadioChannel: "..RadioChannel)
		--print("Inside CreateFullRadioListOfChannel -> Source: "..player)
		--print("Inside CreateFullRadioListOfChannel -> Name: "..GetPlayerName(player))
		--print("--------------------------------------------------------------------------------")
	end
	
	return playersInRadio
end


