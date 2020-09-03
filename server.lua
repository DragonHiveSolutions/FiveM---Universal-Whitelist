mode = "whitelist"
if method == "SQL" then
  MySQL.ready(function ()
  AddEventHandler('playerConnecting', function(name, setReason)
    local identifiers = GetPlayerIdentifiers(source)
    local steamId = identifiers[1]
    if logging == 1 then
      for i in ipairs(identifiers) do
        print('Player: ' .. name .. ', Identifier #' .. i .. ': ' .. identifiers[i])
      end
    end
    if logging == 1 or logging == 2 then
      print('Checking ' .. mode .. ' entry for ' .. identifiers[1])
    end
    if string.find(identifiers[1], "steam") then
    local check = inArray(identifiers[1])

    if mode ~= 'whitelist' then
      check = not check
      if logging == 1 or logging == 2 then
        print(identifiers[1] .. ' found in ' .. mode .. ' entry, accepting...')
      end
    end
  
    if not check then
      setReason(message)
      CancelEvent()
      if logging == 1 or logging == 2 then
        print(identifiers[1] .. ' not found in ' .. mode .. ' entry, cancelling...')
      end
    end
    else 
      setReason('You must have steam open!')
      CancelEvent()
      if logging == 1 or logging == 2 then
        print('Steam not activated for ' .. name)
      end
    end
    setReason('Steam not activated')
    CancelEvent()
  end)
  array = MySQL.Sync.fetchAll('SELECT * FROM user_whitelist')

  -- Returns TRUE if value is in array, FALSE otherwise
  function inArray(value)
    for _,i in pairs(array) do
      for k,v in pairs(i) do
	  if v == "" then
	  else
        if k == "identifier" then
          id = getSteamId(v)
          if id == value then
	
            return true
          end
	      end
        end
      end
    end
  end
  end)

elseif method == "Standard" then

  AddEventHandler('playerConnecting', function(name, setReason)
    local steamId = GetPlayerIdentifiers(source)[1]
    if logging == 1 then
      for i in ipairs(GetPlayerIdentifiers(source)) do
        print('Player: ' .. name .. ', Identifier #' .. i .. ': ' .. GetPlayerIdentifiers(source)[i])
      end
    end
    if logging == 1 or logging == 2 then
      print('Checking ' .. mode .. ' entry for ' .. steamId)
    end
    if string.find(GetPlayerIdentifiers(source)[1], "steam") then
      local check = inArray(steamId, auths)
  
      if mode ~= 'whitelist' then
        check = not check
      end
  
      if not check then
        setReason(message)
        CancelEvent()
        if logging == 1 or logging == 2 then
        print(steamId .. " not found in database. Kicking...")
        end
      end
    else 
      setReason('You must have steam open!')
      CancelEvent()
      if logging == 1 or logging == 2 then
        print('Steam not activated for ' .. name)
      end
    end
  end)
  
  -- Returns TRUE if value is in array, FALSE otherwise
  function inArray(value, array)
    for _,v in pairs(array) do
      v = getSteamId(v)
      if v == value then
        return true
      end
    end
    return false
  end

end


-- Returns TRUE if steamId start with "steam:", FALSE otherwise
function isNativeSteamId(steamId)
  if string.sub(steamId, 0, 6) == "steam:" then
    return true
  end
  return false
end

function getSteamId(steamId)
  if not isNativeSteamId(steamId) then -- FiveM SteamID conversion
    steamId = "steam:" .. string.format("%x", tonumber(steamId))
  else
    steamId = string.lower(steamId) -- Lowercase conversion
  end
  return steamId
end
