setDefaultTab("HP")
addSeparator()

lblInfo= UI.Label("-- BUFF --")
lblInfo:setColor("#c68bf7")
addSeparator()

buffz = macro(1000, "BUFF", function()
    local buff = storage.buff
    local buff2 = storage.buff2
      say(buff)
      schedule(1300, function() say(buff2) end)
    end)
  
  addTextEdit("BUFF", storage.buff or "buff magia", function(widget, text)
      storage.buff = text
  end)
  
  addTextEdit("BUFF 2", storage.buff2 or "buff magia 2", function(widget, text) 
    storage.buff2 = text
  end) 

addIcon("Buff", {item=14381, text="Buff", hotkey="F11"},buffz)