setDefaultTab("HP")
addSeparator()

if type(storage.healing3) ~= "table" then
    storage.healing3 = {on=false, title="HP%", text="fuga", min=0, max=80}
  end
  if type(storage.healing4) ~= "table" then
    storage.healing4 = {on=false, title="HP%", text="fuga", min=0, max=70}
  end
  
  for _, healingInfo in ipairs({storage.healing3, storage.healing4}) do
    local healingmacro = macro(20, function()
      local hp = player:getHealthPercent()
      if healingInfo.max >= hp and hp >= healingInfo.min then
        if TargetBot then 
          TargetBot.saySpell(healingInfo.text) -- sync spell with targetbot if available
        else
          say(healingInfo.text)
        end
      end
    end)
    healingmacro.setOn(healingInfo.on)
    UI.DualScrollPanel(healingInfo, function(widget, newParams) 
      healingInfo = newParams
      healingmacro.setOn(healingInfo.on)
    end)
  end 