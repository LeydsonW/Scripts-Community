setDefaultTab("Utils")
addSeparator()

local lootch = false
local ui = setupUI([[
Panel
  height: 20

  BotSwitch
    id: lootch
    color: white
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 20
    text: Loot Channel
    tooltip: Canal de Loot personalizado.
  ]])

ui.lootch.onClick = function(widget)
  lootch = not lootch
  widget:setOn(lootch)
  local function add(t, text, color, last)
    table.insert(t, text)
    table.insert(t, color)
    if not last then
      table.insert(t, ", ")
      table.insert(t, "#FFFFFF")
    end
  end

  local t = {}
  local mt = {}
  local tabName = "Loot"
  local console = modules.game_console
  local tab = console.getTab(tabName) or console.addTab(tabName, true)

  onTextMessage(function(mode, text)
    if not text:find("Loot of") then return end
    local msg = text:split(":")
    add(t, os.date('%H:%M') .. ' ' .. msg[1] .. ": ", "#FFFFFF", true)
    if msg[2]:find("nothing") then
      add(t, msg[2], "red", true)
    else
      add(t, msg[2], "green", true)
    end
    console.addText(text, {
      color = '#00EB00'
     }, tabName, "")
    local panel = console.consoleTabBar:getTabPanel(tab)
    local consoleBuffer = panel:getChildById('consoleBuffer')
    local message = consoleBuffer:getLastChild()
    message:setColoredText(t)
    t = {}
  end)
end