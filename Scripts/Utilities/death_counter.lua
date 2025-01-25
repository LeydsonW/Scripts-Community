local macroName = 'Death Counter';
local macroDelay = 10000;
setDefaultTab("Utils");

UI.TextEdit(storage.logoutDeaths or "5", function(widget, text)
  storage.logoutDeaths = tonumber(text);
end);
if type(storage["death"]) ~= "table" then storage["death"] = { count = 0 } end
local deathCount = storage["death"].count
addSeparator()
deathLabel = UI.Label("Death count: " .. deathCount)

if deathCount >= storage.logoutDeaths then
  CaveBot:setOff()
  warn("Death Count Logout")
  schedule(5000, function()
    modules.game_interface.tryLogout(false)
  end)
end

if deathCount >= 4 then
  deathLabel:setColor("red")
elseif deathCount >= 2 then
  deathLabel:setColor("orange")
else
  deathLabel:setColor("green")
end

UI.Button("Reset Deaths", function()
  storage["death"].count = 0
  deathLabel:setText("Death count: " .. storage["death"].count)
  deathLabel:setColor("green")
end)

local macroDeathCount = macro(macroDelay, macroName, function() end)

onTextMessage(function(mode, text)
  if macroDeathCount.isOff() then return end
  if text:lower():find("you are dead") then
    storage["death"].count = storage["death"].count + 1
    deathLabel:setText("Death count: " .. storage["death"].count)
    modules.client_entergame.CharacterList.doLogin()
  end
end)

addSeparator()