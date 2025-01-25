local macroName = 'Keep Open Main BP';
local macroDelay = 100;
setDefaultTab('Utils');

macro(macroDelay, macroName, function()
    --Made By VivoDibra#1182
    if not getContainers()[0] and getBack() then
        g_game.open(getBack())
    end
end)