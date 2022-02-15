

local DISCORD_NAME = "[MY SERVER NAME]"                                -- Insert your discord server name, example: [MY SERVER]
local DISCORD_IMAGE = " "                                              -- Insert your discord logo image, example: https://i.imgur.com/xxxxxx.png


-----------------------------------------------------------------------------------------
local SERVER_STARTED_CHANNEL_WEBHOOK = " "                             -- Insert the channel webhook that you want in order to send a message on server startup.

-- By typing \n inside the text, it creates a new string (text) line.


PerformHttpRequest(SERVER_STARTED_CHANNEL_WEBHOOK, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, content = 
"> **The server is now online!** \n@everyone.", avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

-----------------------------------------------------------------------------------------

-- ## Call this event in order to send logs or anything you pleased in the webhook you want. 
-- ## This is an example - TriggerEvent / TriggerServerEvent('discord_management:sendToDiscord', source (or not), webhook, title, text)

RegisterNetEvent("discord_management:sendToDiscord")
AddEventHandler("discord_management:sendToDiscord", function(webhook, title, text)
	sendToDiscord(webhook, title, text)
end)


-- METHOD FOR SENDING MESSAGES ON CHANNELS
function sendToDiscord(webhook, name, message, color)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = "© Your Server Name - Support Team",
		  },
	  }
  }
  PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = DISCORD_NAME, embeds = connect, avatar_url = DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })
  end
