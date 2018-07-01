local sound_time = 0
local sound_play_on = 0
local sound_play_regnum = nil
local inst_list = {}
minetest.register_globalstep(function(dtime)
    if sound_play_on == 0 then
        sound_play_on = 1
        inst_list = {}
        for _,player in ipairs(minetest.get_connected_players()) do
            local player_inv = player:get_inventory()
            local inst1 = player_inv:get_stack("inst", 1):get_count()
            local inst2 = player_inv:get_stack("inst", 2):get_count()
            if inst1 == 1 then
                table.insert(inst_list, "Theme1")
            end
            if inst2 == 1 then
                table.insert(inst_list, "Theme2")
            end
            local inst = inst_list[ math.random(#inst_list)]
            local music = player_inv:get_stack("music", 1):get_count()
            if music == 1 then
                sound_play_regnum = minetest.sound_play(inst, {
	                to_player = player,
                })
            end
        end
    end
    sound_time = sound_time+dtime
    if sound_time > 120 then
        sound_time = 0
        sound_play_on = 0
    end
end)
set = {}
set.get_formspec = function(player, pos)
    if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    player_inv:set_size("music", 1)
    player_inv:set_size("inst", 10)
    local music = player_inv:get_stack("music", 1):get_count()
    local inst1 = player_inv:get_stack("inst", 1):get_count()
    local inst2 = player_inv:get_stack("inst", 2):get_count()
	formspec = "size[6,5]"
        .."background[9,10.3;1,1;gui_formbg.png;true]"
        .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
        .."bgcolor[#080808BB;true]"
        if music == 0 then
            formspec = formspec.."checkbox[0,0;music;Background Music on;false]"
        end
        if music == 1 then
            formspec = formspec.."checkbox[0,0;music;Background Music on;true]"
        end
        if inst1 == 0 and music == 1 then
            formspec = formspec.."checkbox[0.5,1;inst1;1248's Theme 1;false]"
        end
        if inst1 == 1 and music == 1 then
            formspec = formspec.."checkbox[0.5,1;inst1;1248's Theme 1;true]"
        end
        if inst2 == 0 and music == 1 then
            formspec = formspec.."checkbox[0.5,1.3;inst2;1248's Theme 2;false]"
        end
        if inst2 == 1 and music == 1 then
            formspec = formspec.."checkbox[0.5,1.3;inst2;1248's Theme 2;true]"
        end
	return formspec		
end

minetest.register_on_joinplayer(function(player)
    player:set_inventory_formspec(set.get_formspec(player, player:get_pos()))
end)
minetest.register_on_player_receive_fields(function(player, formname, fields)
    if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    if fields.inst1 then
        local inst = player_inv:get_stack("inst", 1):get_count()
        if inst == 0 then
            player_inv:set_stack("inst", 1, "default:dirt")
        else
            player_inv:set_stack("inst", 1, nil)
        end
        local inst1 = player_inv:get_stack("inst", 1):get_count()
        local inst2 = player_inv:get_stack("inst", 2):get_count()
        if inst1 == 0 and inst2 == 0 then
            player_inv:set_stack("music", 1, nil)
        end
        player:set_inventory_formspec(set.get_formspec(player, player:get_pos()))
    end
    if fields.inst2 then
        local inst = player_inv:get_stack("inst", 2):get_count()
        if inst == 0 then
            player_inv:set_stack("inst", 2, "default:dirt")
        else
            player_inv:set_stack("inst", 2, nil)
        end
        local inst1 = player_inv:get_stack("inst", 1):get_count()
        local inst2 = player_inv:get_stack("inst", 2):get_count()
        if inst1 == 0 and inst2 == 0 then
            player_inv:set_stack("music", 1, nil)
        end
        player:set_inventory_formspec(set.get_formspec(player, player:get_pos()))
    end
    if fields.music then
        local music = player_inv:get_stack("music", 1):get_count()
        if music == 0 then
            player_inv:set_stack("music", 1, "default:dirt")
            player_inv:set_stack("inst", 1, "default:dirt")
            player_inv:set_stack("inst", 2, nil)
        else
            player_inv:set_stack("music", 1, nil)
            if sound_play_regnum ~= nil then
                minetest.sound_stop(sound_play_regnum)
            end
        end
        player:set_inventory_formspec(set.get_formspec(player, player:get_pos()))
    end
end)