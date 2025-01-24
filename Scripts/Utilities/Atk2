-- Attack tab
setDefaultTab("Attack")
addSeparator()

-- ATTACK TARGET

lblInfo= UI.Label("-- ATTACK TARGET --")
lblInfo:setColor("#c68bf7")
addSeparator()

attacktarget = macro(100, "Attack Target", nil, function()
  if g_game.isAttacking() 
then
 oldTarget = g_game.getAttackingCreature()
  end
  if (oldTarget and oldTarget:getPosition()) 
then
 if (not g_game.isAttacking() and getDistanceBetween(pos(), oldTarget:getPosition()) <= 8) then

if (oldTarget:getPosition().z == posz()) then
        g_game.attack(oldTarget)
      end
    end
  end
end)

addSeparator()

-- ATTACK TARGET


-- ATACAR SEGUINDO

lblInfo= UI.Label("-- FOLLOW ATTACK --")
lblInfo:setColor("#c68bf7")
addSeparator()

followattack = macro(250, "Follow Attack", function()
  if g_game.isOnline() and g_game.isAttacking() then
    g_game.setChaseMode(1)
  end
end)

UI.Separator()

-- ATACAR SEGUINDO


-- TURN TARGET

lblInfo= UI.Label("-- TURN TARGET --")
lblInfo:setColor("#c68bf7")
addSeparator()

Turn = {}
Turn.maxDistance = {x = 15, y = 15}
Turn.minDistance = 1

Turn.macro = macro(100, 'Turn Target', function()
    local target = g_game.getAttackingCreature()
    if not target then return end -- Se não houver alvo, sai da função.

    local targetPos = target:getPosition()
    if not targetPos then return end -- Se não conseguir a posição do alvo, sai da função.

    local playerPos = pos()
    local dx = targetPos.x - playerPos.x
    local dy = targetPos.y - playerPos.y

    -- Verifica se o alvo está dentro do alcance permitido.
    if math.abs(dx) > Turn.maxDistance.x or math.abs(dy) > Turn.maxDistance.y then return end

    -- Determina a direção mais próxima com base nas diferenças.
    if math.abs(dx) > math.abs(dy) then
        -- Se a diferença em X for maior, prioriza Leste ou Oeste.
        if dx > 0 then
            turn(1) -- Leste
        else
            turn(3) -- Oeste
        end
    else
        -- Se a diferença em Y for maior, prioriza Norte ou Sul.
        if dy > 0 then
            turn(2) -- Sul
        else
            turn(0) -- Norte
        end
    end
end)

-- TURN TARGET
