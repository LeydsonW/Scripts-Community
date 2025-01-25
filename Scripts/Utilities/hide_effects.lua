local macroName = 'Hide Sprites';
local macroDelay = 100;
setDefaultTab("Utils");
addSeparator()

sprh = macro(macroDelay, macroName, function() end)
onAddThing(function(tile, thing)
    if sprh.isOff() then return end
    if thing:isEffect() then
        thing:hide()
    end
end)
