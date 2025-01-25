setDefaultTab("Utils")
addSeparator()

macro(200, "Ver vida", nil, function()
    onCreatureHealthPercentChange(function(creature, hpPercent) 
      creature:setText(hpPercent .. '%') 
    end)
  end)