-- TPReturn.lua

function report_tp_after_ws(spell)
    if spell.type == 'WeaponSkill' then
        windower.add_to_chat(8, 'TP Return: '..tostring(player.tp))
    end
end
