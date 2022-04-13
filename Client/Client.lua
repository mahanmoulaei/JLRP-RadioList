local PlayerServerID = GetPlayerServerId(PlayerId())
local PlayersInRadio = {}
local firstTimeEventGetsTriggered = true
local RadioChannelsName = {--[[Will Be Automatically Filled With Channels' Name => e.g. every frequency between 0 and 1 will be named to Admin Radio]]}

RegisterNetEvent('JLRP-RadioList:Client:SyncRadioChannelPlayers')
AddEventHandler('JLRP-RadioList:Client:SyncRadioChannelPlayers', function(src, RadioChannelToJoin, PlayersInRadioChannel)
	if firstTimeEventGetsTriggered then
		for i, v in pairs(Config.RadioChannelsWithName) do
			local frequency = tonumber(i)
			local minFrequency, maxFrequency = frequency, frequency + 1
			for index = minFrequency, maxFrequency + 0.0, 0.01 do
				RadioChannelsName[tostring(index)] = tostring(v)
			end
			if frequency ~= 0 then
				RadioChannelsName[tostring(frequency)] = tostring(v) --Fix for channels such as "1" that is not double/float like "1.0" or "1.01" !!
			end
		end	
		firstTimeEventGetsTriggered = false
	end
	PlayersInRadio = PlayersInRadioChannel
	if src == PlayerServerID then
		if RadioChannelToJoin > 0 then
			local radioChannelToJoin = tostring(RadioChannelToJoin)
			if RadioChannelsName[radioChannelToJoin] and RadioChannelsName[radioChannelToJoin] ~= nil then -- Check if the current radioChannel had defined a name in config or not
				HideTheRadioList() -- Hide and close the radio list in case the player was already in a different radioChannel
				for index, player in pairs(PlayersInRadio) do
					if player.Source ~= src then
						SendNUIMessage({ radioId = player.Source, radioName = player.Name, channel = RadioChannelsName[radioChannelToJoin] }) -- Add other radio members of the radio channel
					else
						SendNUIMessage({ radioId = src, radioName = player.Name, channel = RadioChannelsName[radioChannelToJoin], self = true  }) -- Add self player to radio list
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
			if RadioChannelsName[radioChannelToJoin] and RadioChannelsName[radioChannelToJoin] ~= nil then -- Check if the current radioChannel had defined a name in config or not
				SendNUIMessage({ radioId = src, radioName = PlayersInRadio[src].Name, channel = RadioChannelsName[radioChannelToJoin] }) -- Add player to radio list
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

RegisterNetEvent('JLRP-RadioList:Client:DisconnectPlayerCurrentChannel')
AddEventHandler('JLRP-RadioList:Client:DisconnectPlayerCurrentChannel', function()
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

if Config.LetPlayersChangeVisibilityOfRadioList then
	local visibility = true
	RegisterCommand(Config.RadioListVisibilityCommand,function()
		visibility = not visibility
		SendNUIMessage({ changeVisibility = true, visible = visibility })
	end)
	TriggerEvent("chat:addSuggestion", "/"..Config.RadioListVisibilityCommand, "Show/Hide Radio List")
end

if Config.LetPlayersSetTheirOwnNameInRadio then
	TriggerEvent("chat:addSuggestion", "/"..Config.RadioListChangeNameCommand, "Customize your name to be shown in radio list", { { name = 'customized name', help = "Enter your desired name to be shown in radio list" } })
end
