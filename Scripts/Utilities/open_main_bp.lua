local macroName = 'Open Bag';
local macroDelay = 100;

addSeparator()

macro(macroDelay, macroName, function()
    if not getContainers()[0] and getBack() then
        g_game.open(getBack())
    end
end, setDefaultTab('Utils'))