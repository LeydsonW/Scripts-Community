setDefaultTab("HP")
addSeparator()

if type(storage.manatrainer) ~= "table" then
    storage.manatrainer = {on=false, title="mana%", text="Power Down", min=0, max=90}
  end
  
  for _, healingInfos in ipairs({storage.manatrainer}) do
    local healingmacro = macro(20, function()
      local mana = manapercent()
      if healingInfos.max <= mana and mana >= healingInfos.min then
        if TargetBot then 
          TargetBot.saySpell(healingInfos.text) -- sync spell with targetbot if available
        else
          say(healingInfos.text)
        end
      end
    end)
    healingmacro.setOn(healingInfos.on)
  
    UI.DualScrollPanel(healingInfos, function(widget, newParams) 
      healingInfos = newParams
      healingmacro.setOn(healingInfos.on)
    end)
  end