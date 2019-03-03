-- Universal Whitelist - By Kye Jones (123LladdCae)
-- This config file was created to help you configure the code in server.lua and client.lua a lot easier. Please do NOT edit those files.

auths = {
    'steam:11000010dcbcc9b', -- Change this and add more lines to add steamID's if your method is set to Standard.
}

--[[ Basic Settings ]]--

method = "Standard" -- This allows you to toggle between SQL mode and Standard mode. Change to "Standard" to disable SQL Whitelisting.


message = "You are not whitelisted. Please apply at www.changeme.com." -- This is the message that is shown if the authentication was unsuccesful.


--[[

Logging (1-3)

1 - This outputs all data to console, usually looking something like...

Player: J.Doe, Identifier #1: steam:steamhexhere
Player: J.Doe, Identifier #2: license:licensehere
Player: J.Doe, Identifier #3: xbl:datahere (No clue what xbl actually is)
Player: J.Doe, Identifier #4: live:datahere (No clue what live actually is)
Player: J.Doe, Identifier #5: discord:discordclientidhere
Player: J.Doe, Identifier #6: ip:iphere
Checking whitelist entry for steam:steamhexhere

2 - This will output only a small amount of data. For example...

Player: J.Doe, Identifier #1: steam:steamhexhere
Checking whitelist entry for steam:steamhexhere

3 - This will output nothing into the server console.

]]--

logging = 3