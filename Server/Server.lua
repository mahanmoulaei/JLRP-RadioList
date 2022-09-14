local PMA = exports['pma-voice']
local Framework = nil
local Core = nil

if Config.UseRPName then
	if GetResourceState('es_extended') ~= 'missing' then
		Framework = 'ESX'
		Core = exports['es_extended']:getSharedObject()
	elseif GetResourceState('qb-core') ~= 'missing' then
		Framework = 'QB'
		Core = exports['qb-core']:GetCoreObject()
	elseif GetResourceState('JLRP-Framework') ~= 'missing' then
		Framework = 'JLRP'
		Core = exports['JLRP-Framework']:getSharedObject()
	end
end

local CustomNames = {}
local PlayersInCurrentRadioChannel = {}
local CurrentResourceName = GetCurrentResourceName()

AddEventHandler("playerDropped", function()
	local src = source
	
	local currentRadioChannel = Player(src).state.currentRadioChannel
	
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	for _, player in pairs(playersInCurrentRadioChannel) do
		--if player.Source ~= src then
			TriggerClientEvent("JLRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
		--end
	end
	playersInCurrentRadioChannel = {}
	
	if Config.LetPlayersSetTheirOwnNameInRadio and Config.ResetPlayersCustomizedNameOnExit then
		local playerIdentifier = GetIdentifier(src)
		if CustomNames[playerIdentifier] and CustomNames[playerIdentifier] ~= nil then
			CustomNames[playerIdentifier] = nil
		end
	end
end)

--This event is located on pma-voice/server/module/radio.lua
RegisterNetEvent('pma-voice:setPlayerRadio')	
AddEventHandler('pma-voice:setPlayerRadio', function(channelToJoin)
	local src = source
	local radioChannelToJoin = tonumber(channelToJoin)
	if not radioChannelToJoin then print(('radioChannelToJoin was not a number. Got: %s Expected: Number'):format(type(channelToJoin))) return end
	local currentRadioChannel = Player(src).state.currentRadioChannel or 0
	Player(src).state:set('currentRadioChannel', radioChannelToJoin, false)
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
	for _, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JLRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, radioChannelToJoin, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function Disconnect(src, currentRadioChannel) 
	local playersInCurrentRadioChannel = CreateFullRadioListOfChannel(currentRadioChannel)
	TriggerClientEvent("JLRP-RadioList:Client:SyncRadioChannelPlayers", src, src, 0, playersInCurrentRadioChannel)
	for _, player in pairs(playersInCurrentRadioChannel) do
		TriggerClientEvent("JLRP-RadioList:Client:SyncRadioChannelPlayers", player.Source, src, 0, playersInCurrentRadioChannel)
	end
	playersInCurrentRadioChannel = {}
end

function CreateFullRadioListOfChannel(RadioChannel)
	local playersInRadio = PMA:getPlayersInRadioChannel(RadioChannel)
	for player, isTalking in pairs(playersInRadio) do
		playersInRadio[player] = {}
		playersInRadio[player].Source = player		
		playersInRadio[player].Name = GetPlayerNameForRadio(player)
	end
	
	return playersInRadio
end

function GetPlayerNameForRadio(source)
	if Config.LetPlayersSetTheirOwnNameInRadio then
		local playerIdentifier = GetIdentifier(source)
		if CustomNames[playerIdentifier] and CustomNames[playerIdentifier] ~= nil then
			return CustomNames[playerIdentifier]
		end
	end
	
	if Config.UseRPName then	
		local name = nil
		if Framework == 'ESX' then
			local xPlayer = Core.GetPlayerFromId(source)		
			if xPlayer then
				name = xPlayer.getName()
			end
		elseif Framework == 'QB' then
			local xPlayer = Core.Functions.GetPlayer(source)
			if xPlayer then
				name = xPlayer.PlayerData.charinfo.firstname..' '..xPlayer.PlayerData.charinfo.lastname 
			end
		elseif Framework == 'JLRP' then
			local xPlayer = Core.GetPlayerFromId(source)		
			if xPlayer then
				name = xPlayer.getName()
			end
		end	
		if name == nil then --extra check to make sure player sends a name to client
			name = GetPlayerName(source)
		end
		return name
	else
		return GetPlayerName(source)
	end
end

if Config.LetPlayersSetTheirOwnNameInRadio then
	local commandLength = string.len(Config.RadioListChangeNameCommand)
	local argumentStartIndex = commandLength + 2
	RegisterCommand(Config.RadioListChangeNameCommand, function(source, args, rawCommand)
		local _source = source
		if _source > 0 then
			local customizedName = rawCommand:sub(argumentStartIndex)
			if customizedName ~= "" and customizedName ~= " " and customizedName ~= nil then
				CustomNames[GetIdentifier(_source)] = customizedName			
				local currentRadioChannel = Player(_source).state.radioChannel
				if currentRadioChannel > 0 then
					Connect(_source, currentRadioChannel, currentRadioChannel)
				end				
			end
		end
	end)
end

function GetIdentifier(source)
	for _, v in ipairs(GetPlayerIdentifiers(source)) do
		if string.match(v, 'license:') then
			local identifier = string.gsub(v, 'license:', '')
			return identifier
		end
	end
end