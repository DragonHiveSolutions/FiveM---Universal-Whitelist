Citizen.CreateThread( function()
updatePath = "/kwinky1/FiveM---Universal-Whitelist" -- your git user/repo path
resourceName = "Universal Whitelist ("..GetCurrentResourceName()..")" -- the resource name

function checkVersion(err,responseText, headers)
	curVersion = LoadResourceFile(GetCurrentResourceName(), "version") -- make sure the "version" file actually exists in your resource root!

	if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
		print("\n###############################")
		print("\n"..resourceName.." is outdated, should be:\n"..responseText.."is:\n"..curVersion.."\nplease update it from https://github.com"..updatePath.."")
		print("\n###############################")
	elseif tonumber(curVersion) > tonumber(responseText) then
		print("You somehow skipped a few versions of "..resourceName.." or the git went offline, if it's still online i advise you to update ( or downgrade, hacker! )")
	else
		print("\n"..resourceName.." is up to date, have fun!")
	end
end

PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/version", checkVersion, "GET")
end)
