local hud_levels = {}
local hud = {}
local map_version = 2
local rrr = 0
local rrrr = 0
local timer = 0
local timer2 = 0
local pon = 0
local tptp = 0
local set = 0
local main = {}
main.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local meta = player:get_meta()
	local elements = ""
	if meta:get_string("levels") then
		local t = minetest.deserialize(meta:get_string("levels"))
		if not t then
			t = {}
		end
		for i = 1, #t do
			if tostring(t[i]) == "" then
				table.remove(t, i)
			end
		end
		meta:set_string("levels", minetest.serialize(t))
		local t = minetest.deserialize(meta:get_string("levels"))
		if t then
			for i = 1, #t do
				if t[i] ~= "" then
					elements = elements..t[i]..","
				end
			end
		end
	end
	elements = elements:sub(1, #elements - 1)
	meta:set_string("celected", "")
	formspec = "size[8,8]"
	.."textlist[0,0;4,8;levels;"..elements.."]"
	.."background9[5,5;1,1;gui_formbg.png;true;10]"
	.."button[5,0;2,1;play;Play]"
	.."button[5,1;2,1;create;Create]"
	.."button[5,2;2,1;change;Change]"
	.."button[5,3;2,1;delete;Delete]"
	.."button[5,4;2,1;import;Import]"
	return formspec		
end
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
    player:hud_set_flags({hotbar=false, healthbar=false, breathbar=false, wielditem=false, minimap=false, minimap_radar=false})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.6.x",
	})  
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  2.11.2",
	})
    hud_levels[name] = player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=-710},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Level: /",
	})
	for i=1,9 do
		hud[""..i] = player:hud_add({
			hud_elem_type = "image",
			position = {x=0, y=0.85},
			offset = {x=70, y=-10-(i*70)},
			alignment = {x=0, y=0},
			scale = {x=6, y=6},
			text = "labyrinthus_glass.png",
		})
	end
	player:set_inventory_formspec(main.get_formspec(player))
	if player:get_player_name() == "singleplayer" then
	else
		minetest.kick_player(player:get_player_name(), "you can play labyrinthus only as 'singleplayer'")
	end
end)

local node_list1 = {
	{"0","labyrinthus:sand",					"labyrinthus_sand.png"},
	{"1","labyrinthus:water",					"labyrinthus_water.png"},
	{"2","labyrinthus:rainbow",					"nyancat_rainbow.png"},
	{"3","labyrinthus:red1",					"labyrinthus_red1.png"},
	{"4","labyrinthus:green1",					"labyrinthus_green1.png"},
	{"5","labyrinthus:button1",					"labyrinthus_sand.png^labyrinthus_button.png"},
	{"6","labyrinthus:blue1",					"labyrinthus_blue1.png"},
	{"7","labyrinthus:green_col",				"labyrinthus_sand.png^labyrinthus_green_col.png"},
	{"8","labyrinthus:red_col",					"labyrinthus_sand.png^labyrinthus_red_col.png"},
	{"9","labyrinthus:blue_col",				"labyrinthus_sand.png^labyrinthus_blue_col.png"},
	{"a","labyrinthus:key2",					"labyrinthus_sand.png^labyrinthus_key.png"},
	{"b","labyrinthus:tp",						"labyrinthus_sand.png^labyrinthus_tp.png"},
	{"c","labyrinthus:ball1",					"labyrinthus_sand.png^labyrinthus_ball.png"},
	{"d","labyrinthus:boom",					"labyrinthus_sand.png^labyrinthus_boom.png"},
	{"e","labyrinthus:00",						"labyrinthus_sand.png^labyrinthus_0.png"},
	{"f","labyrinthus:eye1",					"labyrinthus_sand.png^labyrinthus_eye.png"},
	{"g","labyrinthus:box",						"labyrinthus_sand.png^labyrinthus_box.png"},
	{"h","labyrinthus:bones",					"labyrinthus_bones_front.png"},
	{"i","labyrinthus:button11",				"labyrinthus_sand.png^labyrinthus_button1.png"},
	{"j","labyrinthus:fire",					"labyrinthus_sand.png^labyrinthus_flame.png"},
	{"k","labyrinthus:arrow",					"labyrinthus_sand.png^labyrinthus_arrow.png"},
	{"l","labyrinthus:round2",					"labyrinthus_sand.png^labyrinthus_round2.png"},
	{"m","labyrinthus:round3",					"labyrinthus_sand.png^labyrinthus_round3.png"},
	{"n","labyrinthus:arrow2",					"labyrinthus_sand.png^labyrinthus_arrow2.png"},
	{"o","labyrinthus:red_sand",				"labyrinthus_sand.png^labyrinthus_red.png"},
	{"p","labyrinthus:moon",					"labyrinthus_sand.png^labyrinthus_moon.png"},
	{"q","labyrinthus:sun",						"labyrinthus_sand.png^labyrinthus_sun.png"},
	{"r","labyrinthus:water_wood",				"labyrinthus_water.png^labyrinthus_water_wood.png"},
	{"s","labyrinthus:time30",					"labyrinthus_sand.png^labyrinthus_time30.png"},
	{"t","labyrinthus:ice1",					"labyrinthus_ice.png"},
	{"u","labyrinthus:ice2",					"labyrinthus_ice2.png"},
	{"v","labyrinthus:ice3",					"labyrinthus_ice3.png"},
	{"w","labyrinthus:round4",					"labyrinthus_sand.png^labyrinthus_round4.png"},
	{"x","labyrinthus:round1",					"labyrinthus_sand.png^labyrinthus_round1.png"},
	{"y","labyrinthus:dirt",					""},
	{"z","labyrinthus:rainbow2",				"labyrinthus_rainbow2.png"},
	{"A","labyrinthus:purple",					"labyrinthus_sand.png^labyrinthus_purple.png"},
	{"B","labyrinthus:empty_gate",				"labyrinthus_sand.png^labyrinthus_empty_gate.png"},
	{"C","labyrinthus:gate_arrows",				"labyrinthus_sand.png^labyrinthus_gate_arrows.png"},
	{"D","labyrinthus:red_cross",				"labyrinthus_sand.png^labyrinthus_red_cross.png"},
	{"E","labyrinthus:green_cross",				"labyrinthus_sand.png^labyrinthus_green_cross.png"},
	{"F","labyrinthus:blue_cross",				"labyrinthus_sand.png^labyrinthus_blue_cross.png"},
	{"G","labyrinthus:purple_dirt",				""},
	{"H","labyrinthus:gate",					"labyrinthus_sand.png^labyrinthus_gate.png"},
	{"I","labyrinthus:green",					"labyrinthus_sand.png^labyrinthus_green.png"},
	{"J","labyrinthus:water_wood_with_green",	"labyrinthus_water.png^labyrinthus_water_wood_with_green.png"},
	{"K","labyrinthus:sand_for_green",			"labyrinthus_sand.png^labyrinthus_stone_for_green.png"},
	{"L","labyrinthus:cyan",					"labyrinthus_sand.png^labyrinthus_cyan.png"},
	{"M","labyrinthus:bow",						"labyrinthus_sand.png^labyrinthus_bow.png"},
	{"N","labyrinthus:arrow4_2",				"labyrinthus_sand.png^labyrinthus_arrow4_2.png"},
	{"O","labyrinthus:green_dirt",				""},
	{"P","labyrinthus:cyan_dirt",				"labyrinthus_dirt.png^labyrinthus_cyan.png"},
	{"Q","labyrinthus:tp2",						"labyrinthus_sand.png^labyrinthus_tp2.png"},
	{"R","labyrinthus:yellow2",					"labyrinthus_sand.png^labyrinthus_yellow2.png"},
	{"S","labyrinthus:yellow_dirt",				""},
	{"T","labyrinthus:wood_for_yellow",			"labyrinthus_wood.png^labyrinthus_stone_for_yellow.png"},
	{"U","labyrinthus:water_stone",				"labyrinthus_water.png^labyrinthus_water_stone.png"},
	{"V","labyrinthus:sand_for_green_dirt",		""},
	{"W","labyrinthus:red3",					"labyrinthus_sand.png^labyrinthus_red3.png"},
	{"X","labyrinthus:water_wood_with_red",		"labyrinthus_water.png^labyrinthus_water_wood_with_red.png"},
	{"Y","labyrinthus:wood",					"labyrinthus_wood.png"},
	{"Z","labyrinthus:white",					"labyrinthus_sand.png^labyrinthus_white.png"},
	{":","labyrinthus:tp3",						"labyrinthus_sand.png^labyrinthus_tp3.png"},
	{";","labyrinthus:ice_with_green",			"labyrinthus_ice3.png^labyrinthus_green.png"},
	{"<","labyrinthus:ice_with_white",			"labyrinthus_ice3.png^labyrinthus_white.png"},
	{">","labyrinthus:button_eye",				"labyrinthus_sand.png^labyrinthus_button_eye.png"},
	{"|","labyrinthus:water_eye1",				"labyrinthus_water.png^labyrinthus_water_eye.png"},
	{".","labyrinthus:water_eye1_with_yellow",	"labyrinthus_water.png^labyrinthus_yellow2.png"},
	{",","labyrinthus:water_eye1_with_cyan",	"labyrinthus_water.png^labyrinthus_cyan.png"},
	{"-","labyrinthus:arrow_path",				"labyrinthus_sand.png^labyrinthus_arrow_path.png"},
	{"_","labyrinthus:arrow_path_button",		"labyrinthus_sand.png^labyrinthus_arrow_path_button.png"},
	{"#","labyrinthus:ball3",					"labyrinthus_sand.png^labyrinthus_ball2.png"},
	{"'","labyrinthus:ice_with_yellow",			"labyrinthus_ice3.png^labyrinthus_yellow2.png"},
	{"*","labyrinthus:dirt_with_yellow_circle",	""},
	{"+","labyrinthus:dirt_with_red_circle",	""},
	{"~","labyrinthus:arrow_path_with_green",	"labyrinthus_sand.png^labyrinthus_arrow_path.png^labyrinthus_green.png"},
	{"@","labyrinthus:cross_red",				"labyrinthus_sand.png^labyrinthus_cross_red.png"},
	{"?","labyrinthus:cross_green",				"labyrinthus_sand.png^labyrinthus_cross_green.png"},
	{"\\","labyrinthus:cross_switch",			"labyrinthus_sand.png^labyrinthus_cross_switch.png"},
	{"{","labyrinthus:grey_sand",				"labyrinthus_sand.png^labyrinthus_grey3.png"},
	
	{"!","labyrinthus:button12",				""},
	{"$","labyrinthus:button2",					""},
	{"%","labyrinthus:empty_gate_purple",		""},
	{"&","labyrinthus:gate",					""},
	{"/","labyrinthus:button3",					""},
	{"(","labyrinthus:water_eye2",				""},
	{")","labyrinthus:water_eye2_with_yellow",	""},
	{"=","labyrinthus:water_eye2_with_cyan",	""},
}

local node_list2 = {
	{"0","air",											""},
	{"1","labyrinthus:junglewood",						"labyrinthus_junglewood.png"},
	{"2","labyrinthus:stone",							"labyrinthus_stone.png"},
	{"3","labyrinthus:meselamp2",						"labyrinthus_meselamp2.png"},
	{"4","labyrinthus:red2",							"labyrinthus_ball_red.png"},
	{"5","labyrinthus:green2",							"labyrinthus_ball_green.png"},
	{"6","labyrinthus:button2",							"labyrinthus_button_2.png"},
	{"7","labyrinthus:blue2",							"labyrinthus_ball_blue.png"},
	{"8","labyrinthus:key1",							"labyrinthus_stone.png^labyrinthus_key2.png"},
	{"9","labyrinthus:diamondblock",					"labyrinthus_diamond_block.png"},
	{"a","labyrinthus:pbj_pup",							"labyrinthus_pup_front.png"},
	{"b","labyrinthus:cobble",							"labyrinthus_cobble.png"},
	{"c","labyrinthus:tnt",								"labyrinthus_tnt_side.png"},
	{"d","labyrinthus:apple",								"labyrinthus_apple.png"},
	{"e","labyrinthus:4",								"labyrinthus_mese_block.png^labyrinthus_4.png"},
	{"f","labyrinthus:3",								"labyrinthus_mese_block.png^labyrinthus_3.png"},
	{"g","labyrinthus:2",								"labyrinthus_mese_block.png^labyrinthus_2.png"},
	{"h","labyrinthus:1",								"labyrinthus_mese_block.png^labyrinthus_1.png"},
	{"i","labyrinthus:eye2",							"labyrinthus_mese_block.png^labyrinthus_eye.png"},
	{"j","labyrinthus:red",								"labyrinthus_mese_block.png^labyrinthus_red.png"},
	{"k","labyrinthus:blue",							"labyrinthus_mese_block.png^labyrinthus_blue.png"},
	{"l","labyrinthus:yellow",							"labyrinthus_mese_block.png^labyrinthus_yellow.png"},
	{"m","labyrinthus:glass",							"labyrinthus_eye2.png"},
	{"n","labyrinthus:nyan1",							"labyrinthus_part1.png"},
	{"o","labyrinthus:nyan2",							"labyrinthus_part2.png"},
	{"p","labyrinthus:nyan3",							"labyrinthus_part3.png"},
	{"q","labyrinthus:nyan4",							"labyrinthus_part4.png"},
	{"r","labyrinthus:arrow3",							"labyrinthus_mese_block.png^labyrinthus_arrow2.png"},
	{"s","labyrinthus:leaves",							"labyrinthus_leaves.png"},
	{"t","labyrinthus:water_ball",						"labyrinthus_ball_water.png"},
	{"u","labyrinthus:transport_stone",					"labyrinthus_mese_block.png^labyrinthus_transport_stone.png"},
	{"v","labyrinthus:red_pyramid",						"labyrinthus_pyramid_red.png"},
	{"w","labyrinthus:green_pyramid",					"labyrinthus_pyramid_green.png"},
	{"x","labyrinthus:blue_pyramid",					"labyrinthus_pyramid_blue.png"},
	{"y","labyrinthus:bow_right",						"labyrinthus_mese_block.png^labyrinthus_bow_right.png"},
	{"z","labyrinthus:bow_left",						"labyrinthus_mese_block.png^labyrinthus_bow_left.png"},
	{"A","labyrinthus:bow_down",						"labyrinthus_mese_block.png^labyrinthus_bow_down.png"},
	{"B","labyrinthus:bow_up",							"labyrinthus_mese_block.png^labyrinthus_bow_up.png"},
	{"C","labyrinthus:button3",							"labyrinthus_button_3.png"},
	{"D","labyrinthus:yellow_block",					"labyrinthus_stone.png^labyrinthus_yellow_arrow.png"},
	{"E","labyrinthus:yellow_red",						"labyrinthus_stone.png^labyrinthus_yellow_red.png"},
	{"F","labyrinthus:stone_for_white",					"labyrinthus_stone.png^labyrinthus_stone_for_white.png"},
	{"G","labyrinthus:stone_with_no_white1",			"labyrinthus_mese_block.png^labyrinthus_stone_with_no_white.png"},
	{"H","labyrinthus:remember1_off",					"labyrinthus_mese_block.png^labyrinthus_remember1.png"},
	{"I","labyrinthus:remember2_off",					"labyrinthus_mese_block.png^labyrinthus_remember2.png"},
	{"J","labyrinthus:remember3_off",					"labyrinthus_mese_block.png^labyrinthus_remember3.png"},
	{"K","labyrinthus:remember4_off",					"labyrinthus_mese_block.png^labyrinthus_remember4.png"},
	{"L","labyrinthus:remember5_off",					"labyrinthus_mese_block.png^labyrinthus_remember5.png"},
	{"M","labyrinthus:arrow4",							"labyrinthus_mese_block.png^labyrinthus_arrow4.png"},
	{"N","labyrinthus:arrow5_yellow",					""},
	{"O","labyrinthus:arrow5_red",						""},
	{"P","labyrinthus:key3",							"labyrinthus_stone.png^labyrinthus_key3.png"},
	{"Q","labyrinthus:2red",							"labyrinthus_mese_block.png^labyrinthus_2red.png"},
	{"R","labyrinthus:2blue",							"labyrinthus_mese_block.png^labyrinthus_2blue.png"},
	{"S","labyrinthus:2yellow",							"labyrinthus_mese_block.png^labyrinthus_2yellow.png"},
	
	{"T","labyrinthus:grey1",							"labyrinthus_mese_block.png^labyrinthus_grey1.png"},
	{"U","labyrinthus:grey2",							"labyrinthus_mese_block.png^labyrinthus_grey2.png"},
	{"V","labyrinthus:grey3",							"labyrinthus_mese_block.png^labyrinthus_grey3.png"},

	{":","labyrinthus:wire_10100000",					""},
	{";","labyrinthus:wire_10000000",					""},
	{"<","labyrinthus:wire_01000000",					""},
	{">","labyrinthus:wire_00100000",					""},
	{"|","labyrinthus:wire_00010000",					""},
	{".","labyrinthus:wire_01010000",					""},
	{",","labyrinthus:wire_11000000",					""},
	{"-","labyrinthus:wire_01100000",					""},
	{"_","labyrinthus:wire_00110000",					""},
	{"#","labyrinthus:wire_10010000",					""},
	
	{"!","nyancat:nyancat",								""},
	{"$","labyrinthus:button13",						""},
	{"%","labyrinthus:transport_stone_gate_arrows",		""},
	{"&","labyrinthus:red_with_no_yellow",				""},
	{"/","labyrinthus:stone_with_white",				""},
	{"(","labyrinthus:stone_with_white2",				""},
	{")","labyrinthus:stone_with_no_white2",			""},
	{"=","labyrinthus:remember1_on",					""},
	{"[","labyrinthus:remember2_on",					""},
	{"]","labyrinthus:remember3_on",					""},
	{"{","labyrinthus:remember4_on",					""},
	{"}","labyrinthus:remember5_on",					""},
	{"?","labyrinthus:remember5_temp",					""},
}
function get_item_list(list,index,index_number,number)
	for index2, value in ipairs(list) do
        if value[index_number] == index then
            return list[index2][number]
        end
    end
end

function utf8_char(s,n)
	local k = 0
	for uchar in string.gmatch(s, "([%z\1-\127\194-\244][\128-\191]*)") do
        k = k+1
		if k == n then
			return uchar
		end
    end
end

minetest.register_globalstep(function(dtime)
	timer = timer + dtime
    timer2 = timer2 + dtime
	globalstep(timer, timer2)
	local players = minetest.get_connected_players()
	for _,player in ipairs(players) do
		if timer2 >= 1 then
			timer2 = 0
			change_timer(player)
        end
    end
	if timer >= 0.355 then
		timer = 0
		change_dots(player)
	end
end)

function globalstep(timer, timer2)
	minetest.set_node({x=10, y=8, z=-77}, {name="labyrinthus:desert"})
	update()
	local players = minetest.get_connected_players()
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        player_inv:set_size("con", 7)
        local up = player_inv:get_stack("con", 1):get_count()
        local down = player_inv:get_stack("con", 3):get_count()
        local right = player_inv:get_stack("con", 2):get_count()
        local left = player_inv:get_stack("con", 4):get_count()
        local jump = player_inv:get_stack("con", 5):get_count()
        local sneak = player_inv:get_stack("con", 6):get_count()
		local aux1 = player_inv:get_stack("con", 7):get_count()
        local keys = player:get_player_control()
        local k = 0
        if keys["up"] == true and up == 0 then
            move_data(player)
            player_inv:set_stack("con", 1 , "labyrinthus:dirt")
			Up2(pos, node, player, false)
            k = 1
        elseif keys["up"] == false and up == 1 then
            player_inv:set_stack("con", 1 , "") 
        end
        if keys["down"] == true and down == 0 then
            move_data(player)
            player_inv:set_stack("con", 3 , "labyrinthus:dirt")
            Down2(pos, node, player, false)
            k = 1
        elseif keys["down"] == false and down == 1 then
            player_inv:set_stack("con", 3 , "") 
        end
        if keys["right"] == true and right == 0 then
            move_data(player)
            player_inv:set_stack("con", 2 , "labyrinthus:dirt")
            Right2(pos, node, player, false)
            k = 1
        elseif keys["right"] == false and right == 1 then
            player_inv:set_stack("con", 2 , "") 
        end
        if keys["left"] == true and left == 0 then
            move_data(player)
            player_inv:set_stack("con", 4 , "labyrinthus:dirt")
            Left2(pos, node, player, false)
            k = 1
        elseif keys["left"] == false and left == 1 then
            player_inv:set_stack("con", 4 , "") 
        end
        if keys["jump"] == true and jump == 0 then
            move_data(player)
            player_inv:set_stack("con", 5 , "labyrinthus:dirt")
            Shot(pos, node, player, pointed_thing)
            k = 1
        elseif keys["jump"] == false and jump == 1 then
            player_inv:set_stack("con", 5 , "") 
        end
        if keys["sneak"] == true and sneak == 0 then
            player_inv:set_stack("con", 6 , "labyrinthus:dirt")
            local player_inv = player:get_inventory()
            player_inv:set_size("ll", 1)
            player_inv:set_size("l", 5)
            local ll = player_inv:get_stack("ll", 1):get_count()
            local l = player_inv:get_stack("l", ll):get_count()
			local meta = player:get_meta()
			if ll == 0 and meta:get_string("celected") ~= "" then
			elseif ll ~= 0 then
				New(player,ll.."_"..l,"n",1)
			elseif meta:get_string("toplay") ~= "" then
				New(player,""..meta:get_string("toplay"),"o",1)
			end
            if ll == 0 then
			
            else
                
            end
        elseif keys["sneak"] == false and sneak == 1 then
            player_inv:set_stack("con", 6 , "") 
        end
		if keys["aux1"] == true and aux1 == 0 then
            player_inv:set_stack("con", 7 , "labyrinthus:dirt")
            New(player,"","",2)
        elseif keys["aux1"] == false and aux1 == 1 then
            player_inv:set_stack("con", 7 , "") 
        end
        if k == 1 then
            local fire = player_inv:get_stack("f", 1):get_count()
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
			if y ~= 0 then
				for i=1,2 do
					for j=10,29 do
						for l=9,20 do
							if minetest.get_node({x=j, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:nyancat2" then
								minetest.set_node({x=j, y=l, z=-77}, {name="air"})
							end
						end
					end
					if fire > 0 then
						minetest.set_node({x=10+x, y=y+8, z=-77}, {name="labyrinthus:nyancat2"})
					else
						minetest.set_node({x=10+x, y=y+8, z=-77}, {name="nyancat:nyancat"})
					end
				end
			end
        end
	end
end
function change_timer(player)
	for j=10,29 do
		for l=9,20 do
			for m=0,30 do
				local player_inv = player:get_inventory()
				local time = player_inv:get_stack("time", 1):get_count()
				local x = player_inv:get_stack("x", 1):get_count()
				local y = player_inv:get_stack("y", 1):get_count()
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:time"..m and (time == 2 or pon == 2) and y ~= 0 then
					if m ~= 0 then
						minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:time"..(m-1)})
						minetest.chat_send_all((m-1).."sec left")
					else
						local player_inv = player:get_inventory()
						player_inv:set_stack("x", 1, nil)
						player_inv:set_stack("y", 1, nil)
						minetest.chat_send_all("you run out of time")
						for j=10,29 do
							for l=9,20 do
								if minetest.get_node({x=j, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:nyancat2" then
									minetest.set_node({x=j, y=l, z=-77}, {name="air"})
								end
							end
						end
					end 
				end
			end
		end
	end
end

function change_dots()
	local dd = 0
    local dd2 = 0
	for j=10,29 do
		for l=9,20 do
			if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:round2" and dd == 0 then
				local d = 0
				for k=1,2 do
					if d == 0 then
						if rrr == 0 then
							if (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 1
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 4
							else 
								rrr = 3
							end
						end
						if rrr == 1 then
							if (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j-1, y=l, z=-76}, {name="labyrinthus:round2"})
								d = 1
								dd = 1
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 4
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 4
							else
								rrr = 3
							end
						end
						if rrr == 2 and d == 0 then
							if (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j, y=l+1, z=-76}, {name="labyrinthus:round2"})
								d = 1
								dd = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 3
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 3
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 1
							else
								rrr = 4
							end
						end
						if rrr == 3 and d == 0 then
							if (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j+1, y=l, z=-76}, {name="labyrinthus:round2"})
								d = 1
								dd = 1
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 4
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 4
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 2
							else
								rrr = 1
							end
						end
						if rrr == 4 and d == 0 then
							if (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j, y=l-1, z=-76}, {name="labyrinthus:round2"})
								d = 1
								dd = 1
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 3
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrr = 3
							else
								rrr = 2
							end
						end
					end
				end
				if d == 0 then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
				end
			end
			if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:round4" and dd2 == 0 then
				local d = 0
				for k=1,2 do
					if d == 0 then
						if rrrr == 0 then
							if (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 2
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 3
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 4
							else 
								rrrr = 1
							end
						end
						if rrrr == 1 then
							if (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j-1, y=l, z=-76}, {name="labyrinthus:round4"})
								d = 1
								dd2 = 1
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 4
							elseif (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 2
							elseif (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 4
							else
								rrrr = 3
							end
						end
						if rrrr == 2 and d == 0 then
							if (minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l+1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j, y=l+1, z=-76}, {name="labyrinthus:round4"})
								d = 1
								dd2 = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 3
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round3") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 1
							elseif (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 3
							elseif (minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j-1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								rrrr = 1
							else
								rrrr = 4
							end
						end
						if rrrr == 3 and d == 0 then
							local name11 = minetest.get_node({x=j, y=l+1, z=-76}).name
							local name12 = minetest.get_node({x=j, y=l+1, z=-77}).name
							local name21 = minetest.get_node({x=j, y=l-1, z=-76}).name
							local name22 = minetest.get_node({x=j, y=l-1, z=-77}).name
							if (minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j+1, y=l, z=-77}).name == "air" or (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j+1, y=l, z=-76}, {name="labyrinthus:round4"})
								d = 1
								dd2 = 1
							elseif (name11 == "labyrinthus:round3" and name21 == "labyrinthus:round3") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 2
							elseif (name11 == "labyrinthus:round1" and name21 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 2
							elseif (name11 == "labyrinthus:round1" and name21 == "labyrinthus:round3") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 4
							elseif (name11 == "labyrinthus:round3" and name21 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 2
							elseif (name11 == "labyrinthus:round3" or name11 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") then
								rrrr = 2
							elseif (name21 == "labyrinthus:round3" or name21 == "labyrinthus:round1") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 4
							else
								rrrr = 1
							end
						end
						if rrrr == 4 and d == 0 then
							local name11 = minetest.get_node({x=j+1, y=l, z=-76}).name
							local name12 = minetest.get_node({x=j+1, y=l, z=-77}).name
							local name21 = minetest.get_node({x=j-1, y=l, z=-76}).name
							local name22 = minetest.get_node({x=j-1, y=l, z=-77}).name
							if (minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:round1") and (minetest.get_node({x=j, y=l-1, z=-77}).name == "air" or (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2")) then
								minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
								minetest.set_node({x=j, y=l-1, z=-76}, {name="labyrinthus:round4"})
								d = 1
								dd2 = 1
							elseif (name11 == "labyrinthus:round3" and name21 == "labyrinthus:round3") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 3
							elseif (name11 == "labyrinthus:round1" and name21 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 3
							elseif (name11 == "labyrinthus:round1" and name21 == "labyrinthus:round3") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 1
							elseif (name11 == "labyrinthus:round3" and name21 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 3
							elseif (name11 == "labyrinthus:round3" or name11 == "labyrinthus:round1") and (name12 == "air" or name12 == "nyancat:nyancat" or name12 == "labyrinthus:nyancat2") then
								rrrr = 3
							elseif (name21 == "labyrinthus:round3" or name21 == "labyrinthus:round1") and (name22 == "air" or name22 == "nyancat:nyancat" or name22 == "labyrinthus:nyancat2") then
								rrrr = 1
							else
								rrrr = 2
							end
						end
					end
				end
				if d == 0 then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:round1"})
				end
			end
		end
	end
end

local create = {}
create.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[5,3]"
        .."label[0,0.5;own_level_]"
		.."label[4.6,0.5;.txt]"
		.."field[1.3,0.85;3.8,0.5;input2;;]"
		.."button[1.5,1;2,1;create2;Set Name]"
	return formspec		
end
function letter(i)
	return string.char(i+96)
end
local create2 = {}
create2.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[20.5,12]"
	for i=0,20 do
		for j=0,12 do
			if i == 0 and j ~= 0 then
				formspec = formspec.."image_button["..(0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;;raa"..letter(j)..";"..j.."]"
			elseif j == 0 and i ~= 0 then
				formspec = formspec.."image_button["..(0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;;rab"..letter(i)..";"..i.."]"
			elseif j ~= 0 and i ~= 0 then
				local meta = player:get_meta()
				local ind = meta:get_string("na"..letter(i)..letter(j))
				local img = get_item_list(node_list1,ind,1,3)
				formspec = formspec.."image_button["..(0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;"..img..";na"..letter(i)..letter(j)..";]"
			end
		end
	end
	for i=0,20 do
		for j=0,12 do
			if i == 0 and j ~= 0 then
				formspec = formspec.."image_button["..(10+0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;;rba"..letter(j)..";"..j.."]"
			elseif j == 0 and i ~= 0 then
				formspec = formspec.."image_button["..(10+0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;;rbb"..letter(i)..";"..i.."]"
			elseif j ~= 0 and i ~= 0 then
				local meta = player:get_meta()
				local ind = meta:get_string("nb"..letter(i)..letter(j))
				local img = ""
				if ind == "nn" then
					img = "nyancat_front.png"
				else
					img = get_item_list(node_list2,ind,1,3)
				end
				formspec = formspec.."image_button["..(10+0.5+i*0.45)..","..(0.5+j*0.5)..";0.6,0.6;"..img..";nb"..letter(i)..letter(j)..";]"
			end
		end
	end
	local meta = player:get_meta()
	local message = meta:get_string("error_message")
	formspec = formspec
	.."label[8.3,8.5;"..message.."]"
	.."background["..(0.572+(meta:get_string("new_node1x")+3)*0.45)..","..(0.53+(meta:get_string("new_node1y")+13)*0.5)..";0.47,0.557;labyrinthus_edge.png]"
	.."background["..(10.572+(meta:get_string("new_node2x")+3)*0.45)..","..(0.53+(meta:get_string("new_node2y")+13)*0.5)..";0.47,0.557;labyrinthus_edge.png]"
	.."image_button["..(0.5+4*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png;saaa;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+14*0.5)..";0.6,0.6;nyancat_rainbow.png;saab;]"
	.."image_button["..(0.5+6*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_rainbow2.png;saac;]"
	.."image_button["..(0.5+7*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_box.png;saad;]"
	.."image_button["..(0.5+8*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_red1.png;saae;]"
	.."image_button["..(0.5+9*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_green1.png;saaf;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_blue1.png;saag;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_red_col.png;saah;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_green_col.png;saai;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_blue_col.png;saaj;]"
	.."image_button["..(0.5+14*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_red_cross.png;saak;]"
	.."image_button["..(0.5+15*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_green_cross.png;saal;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_blue_cross.png;saam;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_button.png;saba;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_key.png;sabb;]"
	.."image_button["..(0.5+6*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_tp.png;sabc;]"
	.."image_button["..(0.5+7*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_tp2.png;sabd;]"
	.."image_button["..(0.5+8*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_tp3.png;sabe;]"
	.."image_button["..(0.5+9*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_ball2.png;sabf;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_ball.png;sabg;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_boom.png;sabh;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_0.png;sabi;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_eye.png;sabj;]"
	.."image_button["..(0.5+14*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_bones_front.png;sabk;]"
	.."image_button["..(0.5+15*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_button1.png;sabl;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_flame.png;sabm;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_red.png;saca;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_grey3.png;sacb;]"
	.."image_button["..(0.5+6*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_round1.png;sacc;]"
	.."image_button["..(0.5+7*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_round3.png;sacd;]"
	.."image_button["..(0.5+8*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_round2.png;sace;]"
	.."image_button["..(0.5+9*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_round4.png;sacf;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_moon.png;sacg;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_sun.png;sach;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_time30.png;saci;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_water.png;sacj;]"
	.."image_button["..(0.5+14*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_ice3.png;sack;]"
	.."image_button["..(0.5+15*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_ice2.png;sacl;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_ice.png;sacm;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_button_eye.png;sada;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_water_eye.png;sadb;]"
	.."image_button["..(0.5+6*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_water_wood.png;sadc;]"
	--.."image_button["..(0.5+7*0.45)..","..(0.5+17*0.5)..";0.6,0.6;;sadd;]"
	.."image_button["..(0.5+8*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_purple.png;sade;]"
	--.."image_button["..(0.5+9*0.45)..","..(0.5+17*0.5)..";0.6,0.6;;sadf;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_gate_arrows.png;sadg;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_empty_gate.png;sadh;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_gate.png;sadi;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_green.png;sadj;]"
	--.."image_button["..(0.5+14*0.45)..","..(0.5+17*0.5)..";0.6,0.6;;sadk;]"
	.."image_button["..(0.5+15*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_water_wood_with_green.png;sadl;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_ice3.png^labyrinthus_green.png;sadm;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow_path.png^labyrinthus_green.png;saea;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_stone_for_green.png;saeb;]"
	--.."image_button["..(0.5+6*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;saec;]"
	.."image_button["..(0.5+7*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_yellow2.png;saed;]"
	--.."image_button["..(0.5+8*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;saee;]"
	.."image_button["..(0.5+9*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_ice3.png^labyrinthus_yellow2.png;saef;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_yellow2.png;saeg;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_wood.png;saeh;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_wood.png^labyrinthus_stone_for_yellow.png;saei;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_water_stone.png;saej;]"
	.."image_button["..(0.5+14*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_red3.png;saek;]"
	.."image_button["..(0.5+15*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_water_wood_with_red.png;sael;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_white.png;saem;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_ice3.png^labyrinthus_white.png;safa;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_cyan.png;safb;]"
	--.."image_button["..(0.5+6*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_dirt.png^labyrinthus_cyan.png;safc;]"
	.."image_button["..(0.5+7*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_water.png^labyrinthus_cyan.png;safd;]"
	.."image_button["..(0.5+8*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_bow.png;safe;]"
	.."image_button["..(0.5+9*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow_path.png;saff;]"
	.."image_button["..(0.5+10*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow_path_button.png;safg;]"
	.."image_button["..(0.5+11*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow4_2.png;safh;]"
	.."image_button["..(0.5+12*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow.png;safi;]"
	.."image_button["..(0.5+13*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_arrow2.png;safj;]"
	--.."image_button["..(0.5+14*0.45)..","..(0.5+19*0.5)..";0.6,0.6;;safk;]"
	--.."image_button["..(0.5+15*0.45)..","..(0.5+19*0.5)..";0.6,0.6;;safl;]"
	.."image_button["..(0.5+16*0.45)..","..(0.5+19*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_cross_switch.png;safm;]"
	formspec = formspec
	.."image_button["..(0.5+4*0.45)..","..(0.5+20*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_cross_red.png;saga;]"
	.."image_button["..(0.5+5*0.45)..","..(0.5+20*0.5)..";0.6,0.6;labyrinthus_sand.png^labyrinthus_cross_green.png;sagb;]"
	

	formspec = formspec
	.."image_button["..(10.5+4*0.45)..","..(0.5+14*0.5)..";0.6,0.6;;sbaa;]"
	.."image_button["..(10.5+5*0.45)..","..(0.5+14*0.5)..";0.6,0.6;nyancat_front.png;sbab;]"
	.."image_button["..(10.5+6*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_stone.png;sbac;]"
	.."image_button["..(10.5+7*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_apple.png;sbad;]"
	.."image_button["..(10.5+8*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_junglewood.png;sbae;]"
	.."image_button["..(10.5+9*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_ball_red.png;sbaf;]"
	.."image_button["..(10.5+10*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_ball_green.png;sbag;]"
	.."image_button["..(10.5+11*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_ball_blue.png;sbah;]"
	.."image_button["..(10.5+12*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_pyramid_red.png;sbai;]"
	.."image_button["..(10.5+13*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_pyramid_green.png;sbaj;]"
	.."image_button["..(10.5+14*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_pyramid_blue.png;sbak;]"
	.."image_button["..(10.5+15*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_button_2.png;sbal;]"
	.."image_button["..(10.5+16*0.45)..","..(0.5+14*0.5)..";0.6,0.6;labyrinthus_button_3.png;sbam;]"
	formspec = formspec
	.."image_button["..(10.5+4*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_stone.png^labyrinthus_key2.png;sbba;]"
	.."image_button["..(10.5+5*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_stone.png^labyrinthus_key3.png;sbbb;]"
	.."image_button["..(10.5+6*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_meselamp2.png;sbbc;]"
	.."image_button["..(10.5+7*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_diamond_block.png;sbbd;]"
	.."image_button["..(10.5+8*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_pup_front.png;sbbe;]"
	.."image_button["..(10.5+9*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_cobble.png;sbbf;]"
	.."image_button["..(10.5+10*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_tnt_side.png;sbbg;]"
	.."image_button["..(10.5+11*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_4.png;sbbh;]"
	.."image_button["..(10.5+12*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_3.png;sbbi;]"
	.."image_button["..(10.5+13*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_2.png;sbbj;]"
	.."image_button["..(10.5+14*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_1.png;sbbk;]"
	.."image_button["..(10.5+15*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_eye.png;sbbl;]"
	.."image_button["..(10.5+16*0.45)..","..(0.5+15*0.5)..";0.6,0.6;labyrinthus_eye2.png;sbbm;]"
	formspec = formspec
	.."image_button["..(10.5+4*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_red.png;sbca;]"
	.."image_button["..(10.5+5*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_blue.png;sbcb;]"
	.."image_button["..(10.5+6*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_yellow.png;sbcc;]"
	.."image_button["..(10.5+7*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_grey3.png;sbcd;]"
	.."image_button["..(10.5+8*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_grey2.png;sbce;]"
	.."image_button["..(10.5+9*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_grey1.png;sbcf;]"
	.."image_button["..(10.5+10*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_2red.png;sbcg;]"
	.."image_button["..(10.5+11*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_2blue.png;sbch;]"
	.."image_button["..(10.5+12*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_2yellow.png;sbci;]"
	.."image_button["..(10.5+13*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_part1.png;sbcj;]"
	.."image_button["..(10.5+14*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_part2.png;sbck;]"
	.."image_button["..(10.5+15*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_part3.png;sbcl;]"
	.."image_button["..(10.5+16*0.45)..","..(0.5+16*0.5)..";0.6,0.6;labyrinthus_part4.png;sbcm;]"
	
	formspec = formspec
	.."image_button["..(10.5+4*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_remember1.png;sbda;]"
	.."image_button["..(10.5+5*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_remember2.png;sbdb;]"
	.."image_button["..(10.5+6*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_remember3.png;sbdc;]"
	.."image_button["..(10.5+7*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_remember4.png;sbdd;]"
	.."image_button["..(10.5+8*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_remember5.png;sbde;]"
	.."image_button["..(10.5+9*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_ball_water.png;sbdf;]"
	.."image_button["..(10.5+10*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_transport_stone.png;sbdg;]"
	.."image_button["..(10.5+11*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_stone.png^labyrinthus_yellow_arrow.png;sbdh;]"
	.."image_button["..(10.5+12*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_stone.png^labyrinthus_yellow_red.png;sbdi;]"
	.."image_button["..(10.5+13*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_stone.png^labyrinthus_stone_for_white.png;sbdj;]"
	.."image_button["..(10.5+14*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_stone_with_no_white.png;sbdk;]"
	.."image_button["..(10.5+15*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_leaves.png;sbdl;]"
	.."image_button["..(10.5+16*0.45)..","..(0.5+17*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_bow_right.png;sbdm;]"
	
	formspec = formspec
	.."image_button["..(10.5+4*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_bow_left.png;sbea;]"
	.."image_button["..(10.5+5*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_bow_down.png;sbeb;]"
	.."image_button["..(10.5+6*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_bow_up.png;sbec;]"
	.."image_button["..(10.5+7*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_arrow4.png;sbed;]"
	.."image_button["..(10.5+8*0.45)..","..(0.5+18*0.5)..";0.6,0.6;labyrinthus_mese_block.png^labyrinthus_arrow2.png;sbee;]"
	--.."image_button["..(10.5+9*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbef;]"
	--.."image_button["..(10.5+10*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbeg;]"
	--.."image_button["..(10.5+11*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbeh;]"
	--.."image_button["..(10.5+12*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbei;]"
	--.."image_button["..(10.5+13*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbej;]"
	--.."image_button["..(10.5+14*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbek;]"
	--.."image_button["..(10.5+15*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbel;]"
	--.."image_button["..(10.5+16*0.45)..","..(0.5+18*0.5)..";0.6,0.6;;sbem;]"

	formspec = formspec.."button[8,11;2,1;save;Save]"
	formspec = formspec.."button[10,11;2,1;back;Back]"
	return formspec		
end

local import = {}
import.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	formspec = "size[5,3]"
        .."label[0,0.5;own_level_]"
		.."label[4.6,0.5;.txt]"
		.."field[1.3,0.85;3.8,0.5;input1;;]"
		.."button[1.5,1;2,1;import2;Import]"
	return formspec		
end

local delete = {}
delete.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local meta = player:get_meta()
	formspec = "size[5,3]"
        .."label[0,0.5;Do you want to delete the level '"..meta:get_string("celected").."' from the inventory list?]"
		.."button[0.5,1;2,1;delete2;Yes]"
		.."button[2.5,1;2,1;main;No]"
	return formspec		
end

local back = {}
back.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local meta = player:get_meta()
	formspec = "size[5,3]"
        .."label[0,0.5;Do you want to go back? You will lose you builded level.]"
		.."button[0.5,1;2,1;main;Yes]"
		.."button[2.5,1;2,1;create2;No]"
	return formspec		
end

local info = {}
info.get_formspec = function(player, txt)
	if player == nil then
        return
    end
	formspec = "size[5,3]"
        .."label[0,0.5;"..txt.."]"
		.."button[1.5,1;2,1;main;Ok]"
	return formspec		
end


function fsize (file)
    local current = file:seek()      -- get current position
    local size = file:seek("end")    -- get file size
    file:seek("set", current)        -- restore position
    return size
end
function move_data(player)
    local file = io.open(minetest.get_worldpath().."/move1.txt", "w")
    local t = ""
    local tt = ""
    local k = 21	
    for l=1,12 do
        k = k-1
        for j=10,29 do
			local e = true
            if minetest.get_node({x=j, y=k, z=-76}).name == "nyancat:nyancat_rainbow" then
                t = t.."2"
				e = false
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:time30" then
                tt = "30"
				e = false
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:rainbow3" then
                t = t.."z"
				e = false
            end
            for i=0,29 do
                if minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:time"..i then
                    t = t.."s"
                    tt = ""..i
					e = false
                end
            end
			if e then
				t = t..get_item_list(node_list1,minetest.get_node({x=j, y=k, z=-76}).name,2,1)
			end
        end
        t = t.."\n"
    end
    t = t.."\n"
    local k = 21
    for l=1,12 do
        k = k-1
        for j=10,29 do
            if minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyancat2" then
                t = t.."!"
			else
				t = t..get_item_list(node_list2,minetest.get_node({x=j, y=k, z=-77}).name,2,1)
            end
        end
        t = t.."\n"
    end
    t = t.."\n"
    if minetest.get_node({x=20, y=22, z=-82}).name == "labyrinthus:stone" then
        t = t.."true\n"
    else
        t = t.."false\n"
    end
    local player_inv = player:get_inventory()
	local w = player_inv:get_stack("w", 1):get_count()
	local re = player_inv:get_stack("re", 1):get_count()
	local ye = player_inv:get_stack("ye", 1):get_count()
	local c = player_inv:get_stack("c", 1):get_count()
	local p = player_inv:get_stack("p", 1):get_count()
	local g = player_inv:get_stack("g", 1):get_count()
    local k = player_inv:get_stack("k", 1):get_count()
    local r = player_inv:get_stack("r", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
	local ss = player_inv:get_stack("ss", 1):get_count()
    local b = player_inv:get_stack("b", 1):get_count()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
    local f = player_inv:get_stack("f", 1):get_count()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
	t = t..w.."\n"
	t = t..re.."\n"
	t = t..ye.."\n"
	t = t..c.."\n"
	t = t..p.."\n"
	t = t..g.."\n"
    t = t..k.."\n"
    t = t..r.."\n"
    t = t..s.."\n"
	t = t..ss.."\n"
    t = t..b.."\n"
    t = t..a.."\n"
    t = t..a2.."\n"
    t = t..time.."\n"
    t = t..tt.."\n"
    t = t..f.."\n"
    t = t..x.."\n"
    t = t..y.."\n"
    t = t..z.."\n"
    t = t..pon.."\n"
    t = t..rrr.."\n"
    t = t..rrrr.."\n"
    file:write(t)
	file:close()
end

function update()
    local players = minetest.get_connected_players()
    local ll = 0
	local green = 0
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        Load(player)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local key = player_inv:get_stack("k", 1):get_count()
        local balls = player_inv:get_stack("s", 1):get_count()
		local balls2 = player_inv:get_stack("ss", 1):get_count()
		local purple = player_inv:get_stack("p", 1):get_count()
		local cyan = player_inv:get_stack("c", 1):get_count()
		local yellow = player_inv:get_stack("ye", 1):get_count()
		local red = player_inv:get_stack("re", 1):get_count()
		local white = player_inv:get_stack("w", 1):get_count()
		green = player_inv:get_stack("g", 1):get_count()
        ll = player_inv:get_stack("ll", 1):get_count()
        local l = player_inv:get_stack("l", ll):get_count()
		local huds = 0
		
		if key ~= 0 then
			player:hud_change(hud["1"], 'text', "labyrinthus_key_"..key..".png")
			huds = huds+1
		end
		if balls ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_ball_1.png")
			huds = huds+1
		end
		if balls2 ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_ball2_1.png")
			huds = huds+1
		end
		if white ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_white_"..white..".png")
			huds = huds+1
		end
		if purple ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_purple_"..purple..".png")
			huds = huds+1
		end
		if green ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_green_"..green..".png")
			huds = huds+1
		end
		if cyan ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_cyan_"..cyan..".png")
			huds = huds+1
		end
		if yellow ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_yellow_"..yellow..".png")
			huds = huds+1
		end
		if red ~= 0 then
			player:hud_change(hud[""..(huds+1)], 'text', "labyrinthus_red_"..red..".png")
			huds = huds+1
		end
		for i=(huds+1),9 do
			player:hud_change(hud[""..i], 'text', "labyrinthus_glass.png")
		end
		local meta = player:get_meta()
        if ll == 0 and meta:get_string("celected") ~= "" then
		elseif ll ~= 0 then
			player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: "..ll.."."..l)
        elseif meta:get_string("toplay") ~= "" then
            player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: Own("..meta:get_string("toplay")..")")
		else
			player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: /")
        end
    end
    local d = 0
    local d1 = 0
    local d2 = 0
    local d3 = 0
    local d4 = 0
    local dd = 0
	local dd2 = 0
	local dd3 = 0
    local ddd = 0
	local ddd2 = 0
	local ddd3 = 0
	if green > 0 then
		d = 1
	end
    for i=10,29 do
        for k=9,20 do
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:eye1" then
                if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:glass" then
                    minetest.set_node({x=i, y=k, z=-77}, {name="labyrinthus:eye2"})
                end
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                dd = dd+1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button1" then
                if minetest.get_node({x=i, y=k, z=-77}).name ~= "air" and minetest.get_node({x=i, y=k, z=-77}).name ~= "nyancat:nyancat" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyancat2" and minetest.get_node({x=i, y=k, z=-77}).name:match('%f[%a]labyrinthus:wire%f[%A]') == nil and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball4" then
					ddd = 1
				end
				if minetest.get_node({x=i, y=k, z=-77}).name ~= "air" and minetest.get_node({x=i, y=k, z=-77}).name:match('%f[%a]labyrinthus:wire%f[%A]') == nil and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball4" then
					ddd2 = 1
				end
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button_eye" then
				if minetest.get_node({x=i, y=k, z=-77}).name ~= "air" and minetest.get_node({x=i, y=k, z=-77}).name:match('%f[%a]labyrinthus:wire%f[%A]') == nil and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:ball4" then
					ddd3 = 1
				end
			end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:arrow_path_button" then
				dd2 = dd2+1
				if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow4" then
					dd3 = dd3+1
				end
			end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:apple" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2"  or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:meselamp2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:pbj_pup" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2red" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2blue" then
				d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:green" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:green_dirt" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:water_wood_with_green" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:ice_with_green" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:arrow_path_with_green" then
				d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:ball1" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember1_off" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember2_off" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember3_off" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember4_off" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember5_off" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:remember5_temp" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:00" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:0" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:eye1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:eye2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan3" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan4" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow3" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:box" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:junglewood" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan3" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan4" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow3" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name ~= "labyrinthus:red_sand" and minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" then
                d = 1
			end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:grey_sand" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:grey3" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button11" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:round3" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:round2" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:round4" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow3" and minetest.get_node({x=i-1, y=k, z=-77}).name ~= "labyrinthus:arrow3" and minetest.get_node({x=i+1, y=k, z=-77}).name ~= "labyrinthus:arrow3" and minetest.get_node({x=i, y=k-1, z=-77}).name ~= "labyrinthus:arrow3" and minetest.get_node({x=i, y=k+1, z=-77}).name ~= "labyrinthus:arrow3" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:red_cross" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:red_pyramid" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:green_cross" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:green_pyramid" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:blue_cross" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:blue_pyramid" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:dirt_with_yellow_circle" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow5_yellow" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:dirt_with_red_circle" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow5_red" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" then
                d1 = d1+1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" then
                d2 = d2+1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" then
                d3 = d3+1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" then
                d4 = d4+1
            end
        end
    end
    for i=10,29 do
        for k=9,20 do
            if d1 > 0 and d2 > 0 and d3 > 0 and d4 > 0 then
				local d5 = 0
				if d1 <= d2 and d1 <= d3 and d1 <= d4 then
					d5 = 1
				elseif d2 <= d1 and d2 <= d3 and d2 <= d4 then
					d5 = 2
				elseif d3 <= d1 and d3 <= d2 and d3 <= d4 then
					d5 = 3
				else
					d5 = 4
				end
                if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan"..d5 then
                    if d5 == 4 then
						if minetest.get_node({x=i-1, y=k-1, z=-77}).name == "labyrinthus:nyan1" and minetest.get_node({x=i-1, y=k, z=-77}).name == "labyrinthus:nyan2" and minetest.get_node({x=i, y=k-1, z=-77}).name == "labyrinthus:nyan3" then
						else
							d = 1
						end
					elseif d5 == 3 then
						if minetest.get_node({x=i-1, y=k, z=-77}).name == "labyrinthus:nyan1" and minetest.get_node({x=i-1, y=k+1, z=-77}).name == "labyrinthus:nyan2" and minetest.get_node({x=i, y=k+1, z=-77}).name == "labyrinthus:nyan4" then
						else
							d = 1
						end
					elseif d5 == 2 then
						if minetest.get_node({x=i, y=k-1, z=-77}).name == "labyrinthus:nyan1" and minetest.get_node({x=i+1, y=k-1, z=-77}).name == "labyrinthus:nyan3" and minetest.get_node({x=i+1, y=k, z=-77}).name == "labyrinthus:nyan4" then
						else
							d = 1
						end
					else
						if minetest.get_node({x=i, y=k+1, z=-77}).name == "labyrinthus:nyan2" and minetest.get_node({x=i+1, y=k, z=-77}).name == "labyrinthus:nyan3" and minetest.get_node({x=i+1, y=k+1, z=-77}).name == "labyrinthus:nyan4" then
						else
							d = 1
						end
					end
                end
            end
        end
    end
	if dd2 == dd3 and dd2 > 0 then
		for j=10,29 do
			for l=9,20 do
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:arrow4_2" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:sand"})
				end
			end
		end
	end
    if ddd == 1 then
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:button2" then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:button2"})
                    ddd = 1
                end
            end
        end
    else
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:button2" and minetest.get_node({x=j, y=l, z=-77}).name == "air" and ddd == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:button2"})
                    minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:sand"})
                end
            end
        end
    end
	if ddd2 == 1 then
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:button3" then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:button3"})
                    ddd = 1
                end
            end
        end
    else
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:button3" and minetest.get_node({x=j, y=l, z=-77}).name == "air" and ddd2 == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:button3"})
                    minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:sand"})
                end
            end
        end
    end
	if ddd3 == 1 then
		for j=10,29 do
			for l=9,20 do
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye1" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye2"})
				end
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye1_with_yellow" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye2_with_yellow"})
				end
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye1_with_cyan" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye2_with_cyan"})
				end
			end
		end
	else
		for j=10,29 do
			for l=9,20 do
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye2" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye1"})
				end
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye2_with_yellow" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye1_with_yellow"})
				end
				if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:water_eye2_with_cyan" then
					minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:water_eye1_with_cyan"})
				end
			end
		end
	end
	local cross_red = false
	local cross_green = false
	for i=10,29 do
		for k=9,20 do
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:cross_green" then
				cross_green = true
			elseif minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:cross_red" then
				cross_red = true
			end
		end
	end
	if cross_red and cross_green then
		d = 1
	end
    if dd == 2 then
        for i=10,29 do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                    minetest.set_node({x=i, y=k, z=-77}, {name="labyrinthus:button13"})
                    minetest.set_node({x=i, y=k, z=-76}, {name="labyrinthus:sand"})
                end
            end
        end
    end
    if d == 0 then
        for i=10,29 do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:rainbow" then
                    minetest.set_node({x=i, y=k, z=-76}, {name="nyancat:nyancat_rainbow"})
				elseif minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:rainbow3" then
					minetest.set_node({x=i, y=k, z=-76}, {name="labyrinthus:rainbow2"})
                end
            end
        end     
    end
    if d == 1 then
        for i=10,29 do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "nyancat:nyancat_rainbow" then
                    minetest.set_node({x=i, y=k, z=-76}, {name="labyrinthus:rainbow"})
				elseif minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:rainbow2" then
					minetest.set_node({x=i, y=k, z=-76}, {name="labyrinthus:rainbow3"})
                end
            end
        end     
    end
	for _,player in ipairs(players) do
		local player_inv = player:get_inventory()
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
		if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "nyancat:nyancat_rainbow" or minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:rainbow2" then
            minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
            player_inv:set_stack("x", 1, nil)
            player_inv:set_stack("y", 1, nil)
            player_inv:set_stack("z", 1, nil)
            player_inv:set_stack("time", 1, nil)
            pon = 0
			local level = ""
			if ll ~= 0 then
				lv = io.open(minetest.get_worldpath().."/level"..ll..".txt", "r")
				level = lv:read("*l")
				lv:close()
			end
            minetest.chat_send_all("level completed")
            for i = 9, 30 do
                for j = 0,14 do
                    minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
                end
            end
            local pos = {x=19, y=10.5, z=-88}
	        local size = 30
	        size = math.max(math.floor(size - 8), 0) 
	        local minp = vector.subtract(pos, size)
	        local maxp = vector.add(pos, size)
	        local vm = minetest.get_voxel_manip(minp, maxp)
	        vm:update_liquids()
	        vm:write_to_map()
	        vm:update_map()
	        local emin, emax = vm:get_emerged_area()
			if ll ~= 0 then
				if tonumber(level) == tonumber(l) then
					le = io.open(minetest.get_worldpath().."/level"..ll..".txt", "w")
					le:write(level+1)
					le:close()
				end
			end
        end
	end
end
function file_check(file_name)
	local file_found=io.open(file_name, "r")
	if file_found==nil then
		file_found=false
	else
		file_found=true
	end
	return file_found
end
minetest.register_on_joinplayer(function(player)
	local override_table = player:get_physics_override()
	override_table.new_move = false
	override_table.sneak_glitch = true
	player:set_physics_override(override_table)
	minetest.setting_set("time_speed", "0")
	minetest.setting_set("dedicated_server_step", "0.05")
	minetest.setting_set("node_highlighting", "none")
	minetest.set_timeofday(0.5)
	player:setpos({x=19.5, y=10.5, z=-88})
	player:set_physics_override({
        speed = 0,
        jump = 0,
        gravity = 1.0,
        sneak = true,
        sneak_glitch = true
    })
	local player_inv = player:get_inventory()
	local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
	if file_check(minetest.get_worldpath().."/Map_Version.txt") == true then
	else
		minetest.place_schematic({ x = 9, y = 7, z = -89 }, minetest.get_modpath("labyrinthus").."/schematics/sector1.mts","0")
		minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
        pon = 0
        local pos = {x=19, y=10.5, z=-88}
	    local size = 30
	    size = math.max(math.floor(size - 8), 0) 
	    local minp = vector.subtract(pos, size)
	    local maxp = vector.add(pos, size)
	    local vm = minetest.get_voxel_manip(minp, maxp)
	    vm:update_liquids()
	    vm:write_to_map()
	    vm:update_map()
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write(1)
		file:close()
	end
	file = io.open(minetest.get_worldpath().."/Map_Version.txt", "r")
	local map_ver = file:read("*l")
    file:close()
	if tonumber(map_ver) < map_version then
		minetest.place_schematic({ x = 9, y = 7, z = -89 }, minetest.get_modpath("labyrinthus").."/schematics/sector1.mts","0")
		minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
        pon = 0
        local pos = {x=19, y=10.5, z=-88}
	    local size = 30
	    size = math.max(math.floor(size - 8), 0) 
	    local minp = vector.subtract(pos, size)
	    local maxp = vector.add(pos, size)
	    local vm = minetest.get_voxel_manip(minp, maxp)
	    vm:update_liquids()
	    vm:write_to_map()
	    vm:update_map()
		file = io.open(minetest.get_worldpath().."/Map_Version.txt", "w")
		file:write(map_version)
		file:close()
	end
	if file_check(minetest.get_worldpath().."/level1.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level1.txt", "w")
		file:write("1")
		file:close()
	end
    if file_check(minetest.get_worldpath().."/level2.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level2.txt", "w")
		file:write("1")
		file:close()
	end
    if file_check(minetest.get_worldpath().."/level3.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level3.txt", "w")
		file:write("1")
		file:close()
	end
    if file_check(minetest.get_worldpath().."/level4.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level4.txt", "w")
		file:write("1")
		file:close()
	end
	if file_check(minetest.get_worldpath().."/level5.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/level5.txt", "w")
		file:write("1")
		file:close()
	end
	if file_check(minetest.get_worldpath().."/move1.txt") == true then
	else
		file = io.open(minetest.get_worldpath().."/move1.txt", "w")
		file:close()
	end
end)
minetest.register_node("labyrinthus:apple", {
	drawtype = "plantlike",
	tiles = {"labyrinthus_apple.png"},
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	is_ground_content = false,
})
minetest.register_alias("mapgen_stone", "labyrinthus:stone")
minetest.register_alias("mapgen_water_source", "labyrinthus:water")
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x = 1, y = 1, z = 2.5},
	range = 15,
	tool_capabilities = {
		full_punch_interval = 0.9,
		max_drop_level = 0,
	}
})
minetest.register_node("labyrinthus:wall",{
	tiles = {"labyrinthus_wall.png"},
})
minetest.register_node("labyrinthus:sand",{
	tiles = {"labyrinthus_sand.png"},
})
minetest.register_node("labyrinthus:wood",{
	tiles = {"labyrinthus_wood.png"},
})

minetest.register_node("labyrinthus:stone",{
	tiles = {"labyrinthus_stone.png"},
})

minetest.register_node("labyrinthus:cobble",{
	tiles = {"labyrinthus_cobble.png"},
})
minetest.register_node("labyrinthus:junglewood",{
	tiles = {"labyrinthus_junglewood.png"},
})

minetest.register_node("labyrinthus:diamondblock",{
	tiles = {"labyrinthus_diamond_block.png"},
})

minetest.register_node("labyrinthus:tnt",{
	tiles = {"labyrinthus_tnt_side.png"},
})

minetest.register_node("labyrinthus:bones",{
	tiles = {"labyrinthus_bones_front.png"},
})

minetest.register_node("labyrinthus:yellow_block", {
	drawtype = "nodebox",
	tiles = {"labyrinthus_stone.png^labyrinthus_yellow_arrow.png","labyrinthus_stone.png","labyrinthus_stone.png","labyrinthus_stone.png","labyrinthus_stone.png","labyrinthus_stone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
})
minetest.register_node("labyrinthus:pbj_pup", {
	tiles = {"labyrinthus_pup_sides.png","labyrinthus_pup_sides.png","labyrinthus_pup_sides.png","labyrinthus_pup_sides.png","labyrinthus_pup_sides.png","labyrinthus_pup_front.png"},
})
minetest.register_node("labyrinthus:meselamp", {
	tiles = {"labyrinthus_meselamp.png"},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	light_source = 15,
})
minetest.register_node("labyrinthus:glass",{
	tiles = {"labyrinthus_glass.png"},
	drawtype = "glasslike_framed_optional",
    alpha = 0,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
})
minetest.register_node("labyrinthus:nyancat2",{
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png","nyancat_side.png", "nyancat_back.png", "labyrinthus_nyancat2_front.png"},
    paramtype = "light",
	light_source = 4,
})
minetest.register_node("labyrinthus:water",{
	tiles = {"labyrinthus_water.png"},
})
minetest.register_node("labyrinthus:water_stone",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_stone.png"},
})
minetest.register_node("labyrinthus:ice1",{
	tiles = {"labyrinthus_ice.png"},
})
minetest.register_node("labyrinthus:ice2",{
	tiles = {"labyrinthus_ice2.png"},
})
minetest.register_node("labyrinthus:ice3",{
	tiles = {"labyrinthus_ice3.png"},
})
minetest.register_node("labyrinthus:water_wood",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_wood.png"},
})
minetest.register_node("labyrinthus:rainbow",{
	tiles = {"labyrinthus_rainbow.png"},
})
minetest.register_node("labyrinthus:rainbow2",{
	tiles = {"labyrinthus_rainbow2.png"},
})
minetest.register_node("labyrinthus:rainbow3",{
	tiles = {"labyrinthus_rainbow3.png"},
})
minetest.register_node("labyrinthus:button1",{
	tiles = {"labyrinthus_sand.png^labyrinthus_button.png"},
})
minetest.register_node("labyrinthus:button2",{
	tiles = {"labyrinthus_button_2.png"},
})
minetest.register_node("labyrinthus:button3",{
	tiles = {"labyrinthus_button_3.png"},
})
minetest.register_node("labyrinthus:red1",{
	tiles = {"labyrinthus_red1.png"},
})
minetest.register_node("labyrinthus:red2", {
	tiles = {"labyrinthus_red2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:blue1",{
	tiles = {"labyrinthus_blue1.png"},
})
minetest.register_node("labyrinthus:blue2", {
	tiles = {"labyrinthus_blue2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:green1",{
	tiles = {"labyrinthus_green1.png"},
})
minetest.register_node("labyrinthus:green2", {
	tiles = {"labyrinthus_green2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:water_ball", {
	tiles = {"labyrinthus_water.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:red_pyramid", {
	tiles = {"labyrinthus_red2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:red_cross",{
	tiles = {"labyrinthus_sand.png^labyrinthus_red_cross.png"},
})
minetest.register_node("labyrinthus:green_pyramid", {
	tiles = {"labyrinthus_green2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})
minetest.register_node("labyrinthus:green_cross",{
	tiles = {"labyrinthus_sand.png^labyrinthus_green_cross.png"},
})
minetest.register_node("labyrinthus:blue_pyramid", {
	tiles = {"labyrinthus_blue2.png"},
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	paramtype = "light",
	paramtype2 = "facedir",
})

minetest.register_node("labyrinthus:meselamp2", {
	tiles = {"labyrinthus_meselamp2.png"},
})
minetest.register_node("labyrinthus:blue_cross",{
	tiles = {"labyrinthus_sand.png^labyrinthus_blue_cross.png"},
})


minetest.register_node("labyrinthus:cross_red",{
	tiles = {"labyrinthus_sand.png^labyrinthus_cross_red.png"},
})
minetest.register_node("labyrinthus:cross_green",{
	tiles = {"labyrinthus_sand.png^labyrinthus_cross_green.png"},
})
minetest.register_node("labyrinthus:cross_switch",{
	tiles = {"labyrinthus_sand.png^labyrinthus_cross_switch.png"},
})


minetest.register_node("labyrinthus:blue_col",{
	tiles = {"labyrinthus_sand.png^labyrinthus_blue_col.png"},
})
minetest.register_node("labyrinthus:red_col",{
	tiles = {"labyrinthus_sand.png^labyrinthus_red_col.png"},
})
minetest.register_node("labyrinthus:green_col",{
	tiles = {"labyrinthus_sand.png^labyrinthus_green_col.png"},
})
minetest.register_node("labyrinthus:key1",{
	tiles = {"labyrinthus_stone.png^labyrinthus_key2.png"},
})
minetest.register_node("labyrinthus:key2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_key.png"},
})
minetest.register_node("labyrinthus:key3",{
	tiles = {"labyrinthus_stone.png^labyrinthus_key3.png"},
})
minetest.register_node("labyrinthus:tp",{
	tiles = {"labyrinthus_sand.png^labyrinthus_tp.png"},
})
minetest.register_node("labyrinthus:tp2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_tp2.png"},
})
minetest.register_node("labyrinthus:tp3",{
	tiles = {"labyrinthus_sand.png^labyrinthus_tp3.png"},
})
minetest.register_node("labyrinthus:purple",{
	tiles = {"labyrinthus_sand.png^labyrinthus_purple.png"},
})
minetest.register_node("labyrinthus:white",{
	tiles = {"labyrinthus_sand.png^labyrinthus_white.png"},
})
minetest.register_node("labyrinthus:ice_with_white",{
	tiles = {"labyrinthus_ice3.png^labyrinthus_white.png"},
})
minetest.register_node("labyrinthus:stone_for_white",{
	tiles = {"labyrinthus_stone.png^labyrinthus_stone_for_white.png"},
})
minetest.register_node("labyrinthus:stone_with_no_white1",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_stone_with_no_white.png"},
})
minetest.register_node("labyrinthus:stone_with_no_white2",{
	tiles = {"labyrinthus_stone.png^labyrinthus_stone_with_no_white.png"},
})
minetest.register_node("labyrinthus:stone_with_white",{
	tiles = {"labyrinthus_stone.png^labyrinthus_stone_with_white.png"},
})
minetest.register_node("labyrinthus:stone_with_white2",{
	tiles = {"labyrinthus_stone.png^labyrinthus_stone_with_white2.png"},
})
minetest.register_node("labyrinthus:cyan",{
	tiles = {"labyrinthus_sand.png^labyrinthus_cyan.png"},
})
minetest.register_node("labyrinthus:yellow2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_yellow2.png"},
})
minetest.register_node("labyrinthus:ice_with_yellow",{
	tiles = {"labyrinthus_ice3.png^labyrinthus_yellow2.png"},
})
minetest.register_node("labyrinthus:dirt_with_yellow_circle",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_yellow_circle.png"},
})
minetest.register_node("labyrinthus:dirt_with_red_circle",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_red_circle.png"},
})
minetest.register_node("labyrinthus:yellow_red",{
	tiles = {"labyrinthus_stone.png^labyrinthus_yellow_red.png"},
})
minetest.register_node("labyrinthus:red_with_no_yellow",{
	tiles = {"labyrinthus_stone.png^labyrinthus_red_with_no_yellow.png"},
})
minetest.register_node("labyrinthus:red3",{
	tiles = {"labyrinthus_sand.png^labyrinthus_red3.png"},
})
minetest.register_node("labyrinthus:water_wood_with_red",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_wood_with_red.png"},
})
minetest.register_node("labyrinthus:cyan_dirt",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_cyan.png"},
})
minetest.register_node("labyrinthus:yellow_dirt",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_yellow2.png"},
})
minetest.register_node("labyrinthus:water_eye1_with_yellow",{
	tiles = {"labyrinthus_water.png^labyrinthus_yellow2.png"},
})
minetest.register_node("labyrinthus:water_eye2_with_yellow",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_eye.png^labyrinthus_yellow2.png"},
})
minetest.register_node("labyrinthus:water_eye1_with_cyan",{
	tiles = {"labyrinthus_water.png^labyrinthus_cyan.png"},
})
minetest.register_node("labyrinthus:water_eye2_with_cyan",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_eye.png^labyrinthus_cyan.png"},
})
minetest.register_node("labyrinthus:bow",{
	tiles = {"labyrinthus_sand.png^labyrinthus_bow.png"},
})
minetest.register_node("labyrinthus:bow_right",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_bow_right.png"},
})
minetest.register_node("labyrinthus:bow_left",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_bow_left.png"},
})
minetest.register_node("labyrinthus:bow_down",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_bow_down.png"},
})
minetest.register_node("labyrinthus:bow_up",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_bow_up.png"},
})
minetest.register_node("labyrinthus:green",{
	tiles = {"labyrinthus_sand.png^labyrinthus_green.png"},
})
minetest.register_node("labyrinthus:green_dirt",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_green.png"},
})
minetest.register_node("labyrinthus:water_wood_with_green",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_wood_with_green.png"},
})
minetest.register_node("labyrinthus:ice_with_green",{
	tiles = {"labyrinthus_ice3.png^labyrinthus_green.png"},
})
minetest.register_node("labyrinthus:sand_for_green",{
	tiles = {"labyrinthus_sand.png^labyrinthus_stone_for_green.png"},
})
minetest.register_node("labyrinthus:sand_for_green_dirt",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_stone_for_green.png"},
})
minetest.register_node("labyrinthus:wood_for_yellow",{
	tiles = {"labyrinthus_wood.png^labyrinthus_stone_for_yellow.png"},
})
minetest.register_node("labyrinthus:purple_dirt",{
	tiles = {"labyrinthus_dirt.png^labyrinthus_purple.png"},
})
minetest.register_node("labyrinthus:empty_gate",{
	tiles = {"labyrinthus_sand.png^labyrinthus_empty_gate.png"},
})
minetest.register_node("labyrinthus:empty_gate_purple",{
	tiles = {"labyrinthus_sand.png^labyrinthus_gate_with_purple.png"},
})
minetest.register_node("labyrinthus:gate",{
	tiles = {"labyrinthus_sand.png^labyrinthus_gate.png"},
})
minetest.register_node("labyrinthus:transport_stone",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_transport_stone.png"},
})
minetest.register_node("labyrinthus:gate_arrows",{
	tiles = {"labyrinthus_sand.png^labyrinthus_gate_arrows.png"},
})
minetest.register_node("labyrinthus:transport_stone_gate_arrows",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_gate_arrows.png"},
})
minetest.register_node("labyrinthus:ball1",{
	tiles = {"labyrinthus_sand.png^labyrinthus_ball.png"},
})
minetest.register_node("labyrinthus:ball3",{
	tiles = {"labyrinthus_sand.png^labyrinthus_ball2.png"},
})
minetest.register_node("labyrinthus:boom",{
	tiles = {"labyrinthus_sand.png^labyrinthus_boom.png"},
})
minetest.register_node("labyrinthus:ball2",{
	tiles = {"labyrinthus_ball.png"},
	drawtype = "glasslike_framed_optional",
    alpha = 0,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
})
minetest.register_node("labyrinthus:ball4",{
	tiles = {"labyrinthus_ball2.png"},
	drawtype = "glasslike_framed_optional",
    alpha = 0,
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
})
minetest.register_node("labyrinthus:1",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_1.png"},
})
minetest.register_node("labyrinthus:2",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_2.png"},
})
minetest.register_node("labyrinthus:3",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_3.png"},
})
minetest.register_node("labyrinthus:4",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_4.png"},
})
minetest.register_node("labyrinthus:red",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_red.png"},
})
minetest.register_node("labyrinthus:blue",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_blue.png"},
})
minetest.register_node("labyrinthus:yellow",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_yellow.png"},
})
minetest.register_node("labyrinthus:grey1",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_grey1.png"},
})
minetest.register_node("labyrinthus:grey2",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_grey2.png"},
})
minetest.register_node("labyrinthus:grey3",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_grey3.png"},
})
minetest.register_node("labyrinthus:2red",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_2red.png"},
})
minetest.register_node("labyrinthus:2blue",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_2blue.png"},
})
minetest.register_node("labyrinthus:2yellow",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_2yellow.png"},
})
minetest.register_node("labyrinthus:red_sand",{
	tiles = {"labyrinthus_sand.png^labyrinthus_red.png"},
})
minetest.register_node("labyrinthus:grey_sand",{
	tiles = {"labyrinthus_sand.png^labyrinthus_grey3.png"},
})
minetest.register_node("labyrinthus:0",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_0.png"},
})
minetest.register_node("labyrinthus:00",{
	tiles = {"labyrinthus_sand.png^labyrinthus_0.png"},
})
minetest.register_node("labyrinthus:eye2",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_eye.png"},
})
minetest.register_node("labyrinthus:eye1",{
	tiles = {"labyrinthus_sand.png^labyrinthus_eye.png"},
})
minetest.register_node("labyrinthus:button_eye",{
	tiles = {"labyrinthus_sand.png^labyrinthus_button_eye.png"},
})
minetest.register_node("labyrinthus:box",{
	tiles = {"labyrinthus_sand.png^labyrinthus_box.png"},
})
minetest.register_node("labyrinthus:desert",{
	tiles = {"labyrinthus_desert_sand.png"},
})
minetest.register_node("labyrinthus:dirt",{
	tiles = {"labyrinthus_dirt.png"},
})
minetest.register_node("labyrinthus:leaves", {
	tiles = {"labyrinthus_leaves.png"},
	drawtype = "allfaces_optional",
	paramtype = "light",
	is_ground_content = false,
})
minetest.register_node("labyrinthus:button11",{
	tiles = {"labyrinthus_sand.png^labyrinthus_button1.png"},
})
minetest.register_node("labyrinthus:button12",{
	tiles = {"labyrinthus_sand.png^labyrinthus_button2.png"},
})
minetest.register_node("labyrinthus:button13",{
	tiles = {"labyrinthus_stone.png^labyrinthus_button2.png"},
})
minetest.register_node("labyrinthus:fire",{
	tiles = {"labyrinthus_sand.png^labyrinthus_flame.png"},
})
minetest.register_node("labyrinthus:arrow",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow.png"},
})
minetest.register_node("labyrinthus:arrow2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow2.png"},
})
minetest.register_node("labyrinthus:round1",{
	tiles = {"labyrinthus_sand.png^labyrinthus_round1.png"},
})
minetest.register_node("labyrinthus:round2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_round2.png"},
})
minetest.register_node("labyrinthus:round3",{
	tiles = {"labyrinthus_sand.png^labyrinthus_round3.png"},
})
minetest.register_node("labyrinthus:round4",{
	tiles = {"labyrinthus_sand.png^labyrinthus_round4.png"},
})
minetest.register_node("labyrinthus:nyan1",{
	tiles = {"labyrinthus_part1.png"},
})
minetest.register_node("labyrinthus:nyan2",{
	tiles = {"labyrinthus_part2.png"},
})
minetest.register_node("labyrinthus:nyan3",{
	tiles = {"labyrinthus_part3.png"},
})
minetest.register_node("labyrinthus:nyan4",{
	tiles = {"labyrinthus_part4.png"},
})
minetest.register_node("labyrinthus:arrow3",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_arrow2.png"},
})
minetest.register_node("labyrinthus:arrow4",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_arrow4.png"},
})
minetest.register_node("labyrinthus:arrow4_2",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow4_2.png"},
})
minetest.register_node("labyrinthus:arrow5_yellow",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_arrow5_yellow.png"},
})
minetest.register_node("labyrinthus:arrow5_red",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_arrow5_red.png"},
})
minetest.register_node("labyrinthus:sun",{
	tiles = {"labyrinthus_sand.png^labyrinthus_sun.png"},
})
minetest.register_node("labyrinthus:moon",{
	tiles = {"labyrinthus_sand.png^labyrinthus_moon.png"},
})

for i=0,30 do
    minetest.register_node("labyrinthus:time"..i,{
	    tiles = {"labyrinthus_sand.png^labyrinthus_time"..i..".png"},
    })
end

minetest.register_node("labyrinthus:remember1_off",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_remember.png"},
})
minetest.register_node("labyrinthus:remember2_off",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_remember.png"},
})
minetest.register_node("labyrinthus:remember3_off",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_remember.png"},
})
minetest.register_node("labyrinthus:remember4_off",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_remember.png"},
})
minetest.register_node("labyrinthus:remember5_off",{
	tiles = {"labyrinthus_mese_block.png^labyrinthus_remember.png"},
})
minetest.register_node("labyrinthus:remember1_on",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember1.png"},
})
minetest.register_node("labyrinthus:remember2_on",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember2.png"},
})
minetest.register_node("labyrinthus:remember3_on",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember3.png"},
})
minetest.register_node("labyrinthus:remember4_on",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember4.png"},
})
minetest.register_node("labyrinthus:remember5_on",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember5.png"},
})
minetest.register_node("labyrinthus:remember5_temp",{
	tiles = {"labyrinthus_stone.png^labyrinthus_remember5.png"},
})
minetest.register_node("labyrinthus:water_eye1",{
	tiles = {"labyrinthus_water.png"},
})
minetest.register_node("labyrinthus:water_eye2",{
	tiles = {"labyrinthus_water.png^labyrinthus_water_eye.png"},
})
minetest.register_node("labyrinthus:arrow_path",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow_path.png"},
})
minetest.register_node("labyrinthus:arrow_path_with_green",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow_path.png^labyrinthus_green.png"},
})
minetest.register_node("labyrinthus:arrow_path_button",{
	tiles = {"labyrinthus_sand.png^labyrinthus_arrow_path_button.png"},
})
local nbox_nid =
{
	[0] = {1/16, -.5, -1/16, 8/16, -.5+1/16, 1/16}, -- x positive
	[1] = {-1/16, -.5, 1/16, 1/16, -.5+1/16, 8/16}, -- z positive
	[2] = {-8/16, -.5, -1/16, -1/16, -.5+1/16, 1/16}, -- x negative
	[3] = {-1/16, -.5, -8/16, 1/16, -.5+1/16, -1/16}, -- z negative

	[4] = {.5-1/16, -.5+1/16, -1/16, .5, .4999+1/16, 1/16}, -- x positive up
	[5] = {-1/16, -.5+1/16, .5-1/16, 1/16, .4999+1/16, .5}, -- z positive up
	[6] = {-.5, -.5+1/16, -1/16, -.5+1/16, .4999+1/16, 1/16}, -- x negative up
	[7] = {-1/16, -.5+1/16, -.5, 1/16, .4999+1/16, -.5+1/16}  -- z negative up
}
local box_center = {-1/16, -.5, -1/16, 1/16, -.5+1/16, 1/16}
local box_bump1 =  { -2/16, -8/16,  -2/16, 2/16, -13/32, 2/16 }
local nid_inc = function() end
nid_inc = function (nid)
	local i = 0
	while nid[i-1] ~= 1 do
		nid[i] = (nid[i] ~= 1) and 1 or 0
		i = i + 1
	end

	-- BUT: Skip impossible nodeids:
	if ((nid[0] == 0 and nid[4] == 1) or (nid[1] == 0 and nid[5] == 1) 
	or (nid[2] == 0 and nid[6] == 1) or (nid[3] == 0 and nid[7] == 1)) then
		return nid_inc(nid)
	end

	return i <= 8
end
register_wires = function()
	local nid = {}
	while true do
		-- Create group specifiction and nodeid string (see note above for details)
		local nodeid = 	  (nid[0] or "0")..(nid[1] or "0")..(nid[2] or "0")..(nid[3] or "0")
				..(nid[4] or "0")..(nid[5] or "0")..(nid[6] or "0")..(nid[7] or "0")

		-- Calculate nodebox
		local nodebox = {type = "fixed", fixed={box_center}}
		for i=0,7 do
			if nid[i] == 1 then
				table.insert(nodebox.fixed, nbox_nid[i])
			end
		end

		-- Add bump to nodebox if curved
		if (nid[0] == 1 and nid[1] == 1) or (nid[1] == 1 and nid[2] == 1)
		or (nid[2] == 1 and nid[3] == 1) or (nid[3] == 1 and nid[0] == 1) then
			table.insert(nodebox.fixed, box_bump1)
		end

		-- If nothing to connect to, still make a nodebox of a straight wire
		if nodeid == "00000000" then
			nodebox.fixed = {-8/16, -.5, -1/16, 8/16, -.5+1/16, 1/16}
		end

		local rules = {}
		if (nid[0] == 1) then table.insert(rules, vector.new( 1,  0,  0)) end
		if (nid[1] == 1) then table.insert(rules, vector.new( 0,  0,  1)) end
		if (nid[2] == 1) then table.insert(rules, vector.new(-1,  0,  0)) end
		if (nid[3] == 1) then table.insert(rules, vector.new( 0,  0, -1)) end

		if (nid[0] == 1) then table.insert(rules, vector.new( 1, -1,  0)) end
		if (nid[1] == 1) then table.insert(rules, vector.new( 0, -1,  1)) end
		if (nid[2] == 1) then table.insert(rules, vector.new(-1, -1,  0)) end
		if (nid[3] == 1) then table.insert(rules, vector.new( 0, -1, -1)) end

		if (nid[4] == 1) then table.insert(rules, vector.new( 1,  1,  0)) end
		if (nid[5] == 1) then table.insert(rules, vector.new( 0,  1,  1)) end
		if (nid[6] == 1) then table.insert(rules, vector.new(-1,  1,  0)) end
		if (nid[7] == 1) then table.insert(rules, vector.new( 0,  1, -1)) end


		local groups_on = {dig_immediate = 3, mesecon_conductor_craftable = 1,
			not_in_creative_inventory = 1}
		local groups_off = {dig_immediate = 3, mesecon_conductor_craftable = 1}
		if nodeid ~= "00000000" then
			groups_off["not_in_creative_inventory"] = 1
		end

		minetest.register_node("labyrinthus:wire_"..nodeid, {
			description = "Mesecon",
			drawtype = "nodebox",
			paramtype = "light",
			paramtype2 = "facedir",
			sunlight_propagates = true,
			selection_box = selectionbox,
			node_box = nodebox,
			walkable = false,
			tiles = {"labyrinthus_wire.png"}
		})
		if (nid_inc(nid) == false) then return end
	end
end
register_wires()

function one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,node,set_node,donetp2,mode)
	local player_inv = player:get_inventory()
	if mode == 1 then
		if set_node then
			minetest.set_node(e1m2, {name=node})
		end
		minetest.set_node(e2m1, {name="air"})
		player_inv:set_stack(ko, 1, "labyrinthus:dirt "..koad)
		Other(player, pbjnr)
		minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif mode == 2 then
		minetest.set_node(e2m2, {name="air"})
		minetest.set_node(e2m1, {name="air"})
		if donetp2 == 0 then
			player_inv:set_stack(ko, 1, "labyrinthus:dirt "..koad)
			Other(player, pbjnr)
			minetest.set_node(e2m2, {name="nyancat:nyancat"})
		end
	end
end
function move(player,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
	local wire_x = player_inv:get_stack("x", 1):get_count()
    local wire_y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local key = player_inv:get_stack("k", 1):get_count()
    local ll = player_inv:get_stack("ll", 1):get_count()
    local bones = player_inv:get_stack("b", 1):get_count()
	local wire = player_inv:get_stack("wire", 1):get_count()
    local level2 = player_inv:get_stack("l", ll):get_count()
    local fire = player_inv:get_stack("f", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
	local tp3 = false
	local donetp2 = 0
	local no_wire = false
	if minetest.get_node(e1m3).name == "labyrinthus:tp3" and minetest.get_node(e2m3).name == "air" then
		tp3 = true
	end
	if minetest.get_node(e1m1).name == "labyrinthus:button11" then
        minetest.set_node(e1m1, {name="labyrinthus:button12"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice3" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:water"})
    end
	if minetest.get_node(e1m1).name == "labyrinthus:ice_with_green" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:water"})
    end
	if minetest.get_node(e1m1).name == "labyrinthus:ice_with_white" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:water"})
    end
	if minetest.get_node(e1m1).name == "labyrinthus:ice_with_yellow" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:water"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice2" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:ice3"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice1" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:ice2"})
    end
	if minetest.get_node(e1m1).name == "labyrinthus:wood" then
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
		minetest.set_node(e2m1, {name="air"})
		if dir1 == "up" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 9
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+10, y=y+ad, z=-76}).name == "labyrinthus:water"  and minetest.get_node({x=x+10, y=y+ad, z=-77}).name == "air" then
					ad = ad+1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+10, y=y+ad-1, z=-76}, {name="labyrinthus:wood"})
			player_inv:set_stack("y", 1, "labyrinthus:dirt "..(y+ad-9))
		elseif dir1 == "down" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 7
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+10, y=y+ad, z=-76}).name == "labyrinthus:water" and minetest.get_node({x=x+10, y=y+ad, z=-77}).name == "air" then
					ad = ad-1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+10, y=y+ad+1, z=-76}, {name="labyrinthus:wood"})
			player_inv:set_stack("y", 1, "labyrinthus:dirt "..(y+ad-7))
		elseif dir1 == "right" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 11
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+ad, y=y+8, z=-76}).name == "labyrinthus:water" and minetest.get_node({x=x+ad, y=y+8, z=-77}).name == "air" then
					ad = ad+1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+ad-1, y=y+8, z=-76}, {name="labyrinthus:wood"})
			player_inv:set_stack("x", 1, "labyrinthus:dirt "..(x+ad-11))
		elseif dir1 == "left" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 9
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+ad, y=y+8, z=-76}).name == "labyrinthus:water" and minetest.get_node({x=x+ad, y=y+8, z=-77}).name == "air" then
					ad = ad-1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+ad+1, y=y+8, z=-76}, {name="labyrinthus:wood"})
			player_inv:set_stack("x", 1, "labyrinthus:dirt "..(x+ad-9))
		end
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
	end
	local wire = player_inv:get_stack("wire", 1):get_count()
	local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
	local anotherstep = 0
    if minetest.get_node(e1m2).name == "labyrinthus:water" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:arrow4_2" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_stone" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:sand_for_green" then
		if dir1 == "up" then
			player_inv:set_stack("g", 1, nil)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:sand_for_green_dirt" then
		if dir1 == "up" and Dirt_Move2(e1m1,overdirt) then
			player_inv:set_stack("g", 1, nil)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:wood_for_yellow" then
		if dir1 == "right" then
			player_inv:set_stack("ye", 1, nil)
			local is_yellow = 0
			for j=10,29 do
				for l=9,20 do
					if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:yellow2" or minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:yellow_dirt" or minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:yellow_red" then
						is_yellow = 1
					end
				end
			end
			if is_yellow == 0 then
				minetest.set_node(e1m2, {name="labyrinthus:wood"})
			end
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:bow" then
		local bow_shot = 0
		local cyan = player_inv:get_stack("c", 1):get_count()
		if cyan > 0 then
			if dir1 == "up" then
				local bow_r = "up"
				local bow_x = x+10
				local bow_y = y+10
				while Is_Node(bow_x,bow_y,"bow") and bow_shot < 20 do
					if minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:stone_with_no_white1" then
						minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:stone_with_white2"})
					end
					if minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_right" then
						bow_r = "right"
						bow_shot = bow_shot+1
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_left" then
						bow_r = "left"
						bow_shot = bow_shot+1
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_up" then
						bow_r = "up"
						bow_shot = bow_shot+1
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_down" then
						bow_r = "down"
						bow_shot = bow_shot+1
					end
					if bow_r == "up" then
						bow_y = bow_y+1
					elseif bow_r == "right" then
						bow_x = bow_x+1
					elseif bow_r == "left" then
						bow_x = bow_x-1
					elseif bow_r == "down" then
						bow_y = bow_y-1	
					end
				end
				if minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:leaves" then
					if bow_r == "up" then
						bow_y = bow_y+1
					elseif bow_r == "right" then
						bow_x = bow_x+1
					elseif bow_r == "left" then
						bow_x = bow_x-1
					elseif bow_r == "down" then
						bow_y = bow_y-1	
					end
					if Is_Node(bow_x,bow_y,nil) then
						minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
					end
				end
				player_inv:set_stack("c", 1, "labyrinthus:dirt "..(cyan-1))
			end
			if bow_shot == 20 then
				minetest.chat_send_all("Oh no! Nyan Cat shot in a circle with the bow.")
			end
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:rainbow2" and dir1 ~= "up" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:rainbow3" and dir1 ~= "up" then
    elseif minetest.get_node(e1m2).name == "labyrinthus:key2" then
        player_inv:set_stack("k", 1, "labyrinthus:dirt "..(key+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:purple" then
		local purple = player_inv:get_stack("p", 1):get_count()
        player_inv:set_stack("p", 1, "labyrinthus:dirt "..(purple+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:cyan" then
		local cyan = player_inv:get_stack("c", 1):get_count()
        player_inv:set_stack("c", 1, "labyrinthus:dirt "..(cyan+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:yellow2" then
		local yellow = player_inv:get_stack("ye", 1):get_count()
        player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_eye1_with_yellow" then
		local yellow = player_inv:get_stack("ye", 1):get_count()
        player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_eye1",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_eye2_with_yellow" then
		local yellow = player_inv:get_stack("ye", 1):get_count()
        player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_eye2",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_eye1_with_cyan" then
		local cyan = player_inv:get_stack("c", 1):get_count()
        player_inv:set_stack("c", 1, "labyrinthus:dirt "..(cyan+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_eye1",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_eye2_with_yellow" then
		local cyan = player_inv:get_stack("c", 1):get_count()
        player_inv:set_stack("c", 1, "labyrinthus:dirt "..(cyan+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_eye2",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:red3" then
		local red = player_inv:get_stack("re", 1):get_count()
        player_inv:set_stack("re", 1, "labyrinthus:dirt "..(red+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:white" then
		local white = player_inv:get_stack("w", 1):get_count()
        player_inv:set_stack("w", 1, "labyrinthus:dirt "..(white+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:green" then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "labyrinthus:dirt "..(green+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:arrow_path_with_green" then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "labyrinthus:dirt "..(green+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:arrow_path",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_wood_with_green" then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "labyrinthus:dirt "..(green+1))
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_wood",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_wood_with_red" then
		local red = player_inv:get_stack("re", 1):get_count()
        player_inv:set_stack("re", 1, "labyrinthus:dirt "..(red+1))
		one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:water_wood",true,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:purple_dirt" then
		if Dirt_Move2(e1m1,overdirt) then
			local purple = player_inv:get_stack("p", 1):get_count()
			player_inv:set_stack("p", 1, "labyrinthus:dirt "..(purple+1))
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:dirt",true,donetp2,1)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:green_dirt" then
		if Dirt_Move2(e1m1,overdirt) then
			local green = player_inv:get_stack("g", 1):get_count()
			player_inv:set_stack("g", 1, "labyrinthus:dirt "..(green+1))
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:dirt",true,donetp2,1)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:cyan_dirt" then
		if Dirt_Move2(e1m1,overdirt) then
			local cyan = player_inv:get_stack("c", 1):get_count()
			player_inv:set_stack("c", 1, "labyrinthus:dirt "..(cyan+1))
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:dirt",true,donetp2,1)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:yellow_dirt" then
		if Dirt_Move2(e1m1,overdirt) then
			local yellow = player_inv:get_stack("ye", 1):get_count()
			player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:dirt",true,donetp2,1)
		end
    elseif minetest.get_node(e1m2).name == "labyrinthus:bones" then
        player_inv:set_stack("b", 1, "labyrinthus:dirt")
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:cross_switch" then
        local wire = player_inv:get_stack("wire", 1):get_count()
		if wire == 0 then
			player_inv:set_stack("wire", 1, "labyrinthus:dirt")
			no_wire = true
		else
			minetest.set_node(e1m2, {name="labyrinthus:sand"})
			player_inv:set_stack("wire", 1, "")
			for j=10,29 do
				for l=9,20 do
					if minetest.get_node({x=j, y=l, z=-77}).name:match('%f[%a]labyrinthus:wire%f[%A]') ~= nil or minetest.get_node({x=j, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:nyancat2" then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:cross_green" then
							minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:cross_red"})
						elseif minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:cross_red" then
							minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:cross_green"})
						end
					end
				end
			end
		end
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
    elseif minetest.get_node(e1m2).name == "labyrinthus:ball1" then
		local s = player_inv:get_stack("s", 1):get_count()
        if s == 0 then
            minetest.set_node(e1m2, {name="labyrinthus:sand"})
            player_inv:set_stack("s", 1, "labyrinthus:dirt")
        end
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
	elseif minetest.get_node(e1m2).name == "labyrinthus:ball3" then
		local ss = player_inv:get_stack("ss", 1):get_count()
        if ss == 0 then
            player_inv:set_stack("ss", 1, "labyrinthus:dirt")
        end
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"labyrinthus:sand",true,donetp2,1)
    elseif minetest.get_node(e2m2).name == "labyrinthus:stone" or minetest.get_node(e2m2).name == "labyrinthus:leaves" or minetest.get_node(e2m2).name == "labyrinthus:button2" or minetest.get_node(e2m2).name == "labyrinthus:button3" or minetest.get_node(e2m2).name == "labyrinthus:cobble" or minetest.get_node(e2m2).name == "labyrinthus:0" or minetest.get_node(e2m2).name == "labyrinthus:button13" or minetest.get_node(e2m2).name == "labyrinthus:yellow_block" or minetest.get_node(e2m2).name == "labyrinthus:red_with_no_yellow" or minetest.get_node(e2m2).name == "labyrinthus:stone_with_white" or minetest.get_node(e2m2).name == "labyrinthus:stone_with_no_white2" then
    elseif minetest.get_node(e2m2).name == "labyrinthus:remember1_on" or minetest.get_node(e2m2).name == "labyrinthus:remember2_on" or minetest.get_node(e2m2).name == "labyrinthus:remember3_on" or minetest.get_node(e2m2).name == "labyrinthus:remember4_on" or minetest.get_node(e2m2).name == "labyrinthus:remember5_on" or minetest.get_node(e2m2).name == "labyrinthus:remember5_temp" then
	elseif minetest.get_node(e2m2).name:match('%f[%a]labyrinthus:wire%f[%A]') ~= nil then
	elseif minetest.get_node(e2m2).name == "labyrinthus:junglewood" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,"wood") then
        	if minetest.get_node(e1m3).name == "labyrinthus:water" then
                minetest.set_node(e1m3, {name="labyrinthus:water_wood"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:junglewood"})
            end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
		end
	elseif minetest.get_node(e2m2).name == "labyrinthus:water_ball" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,"wood") then
			if minetest.get_node(e1m3).name == "labyrinthus:water" then
            else
                minetest.set_node(e2m3, {name="labyrinthus:water_ball"})
            end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:remember1_off" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:remember1_on"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:remember2_off" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:remember2_on"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
			minetest.after(1, function(e2m3) 
				local re = 0
				for j=10,29 do
					for l=9,20 do
						if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
							re = 1
						end
					end
				end
				if re == 0 then
					for j=10,29 do
						for l=9,20 do
							if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember2_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember3_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember3_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember4_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember4_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember5_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember5_off"})
							end
						end
					end
				end
			end, e2m3)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:remember3_off" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:remember3_on"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
			minetest.after(1, function(e2m3) 
				local re = 0
				for j=10,29 do
					for l=9,20 do
						if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
							re = re+1
						elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
							re = re+1
						end
					end
				end
				if re ~= 2 then
					for j=10,29 do
						for l=9,20 do
							if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember1_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember3_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember3_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember4_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember4_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember5_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember5_off"})
							end
						end
					end
				end
			end, e2m3)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:remember4_off" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:remember4_on"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
			minetest.after(1, function(e2m3) 
				local re = 0
				for j=10,29 do
					for l=9,20 do
						if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
							re = re+1
						elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
							re = re+1
						elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember3_on" then
							re = re+1
						end
					end
				end
				if re ~= 3 then
					for j=10,29 do
						for l=9,20 do
							if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember1_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember2_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember4_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember4_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember5_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember5_off"})
							end
						end
					end
				end
			end, e2m3)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:remember5_off" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			local re = 0
			for j=10,29 do
				for l=9,20 do
					if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
						re = re+1
					elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
						re = re+1
					elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember3_on" then
						re = re+1
					elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember4_on" then
						re = re+1
					end
				end
			end
			if re == 4 then
				minetest.set_node(e2m3, {name="labyrinthus:remember5_on"})
			else
				minetest.set_node(e2m3, {name="labyrinthus:remember5_temp"})
				minetest.after(1, function(e2m3) 
					for j=10,29 do
						for l=9,20 do
							if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember1_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember1_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember2_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember2_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember3_on" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember3_off"})
							elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:remember5_temp" then
								minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:remember5_off"})
							end
						end
					end
				end, e2m3)
			end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e1m2).name == "labyrinthus:gate" then
		one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
		anotherstep = 1
	elseif minetest.get_node(e2m2).name == "labyrinthus:stone_for_white" then
		local white = player_inv:get_stack("w", 1):get_count()
		if white > 0 and not Dirt_Move2(e1m1,overdirt) then
            player_inv:set_stack("w", 1, "labyrinthus:dirt "..(white-1))
			minetest.set_node(e2m2, {name="labyrinthus:stone_with_white"})
			local sw = 0
			for j=10,29 do
                for l=9,20 do
                    if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:stone_for_white" then
						sw = 1
					end
				end
			end
			if sw == 0 then
				for j=10,29 do
					for l=9,20 do
						if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:stone_with_white" then
							minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						end
					end
				end
			end
		end
    elseif minetest.get_node(e2m2).name == "labyrinthus:diamondblock" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:diamondblock"})
            if minetest.get_node({x=e2m3.x+1, y=e2m3.y, z=-77}).name == "labyrinthus:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x+1, y=e2m3.y, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x-1, y=e2m3.y, z=-77}).name == "labyrinthus:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x-1, y=e2m3.y, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x, y=e2m3.y+1, z=-77}).name == "labyrinthus:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x, y=e2m3.y+1, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x, y=e2m3.y-1, z=-77}).name == "labyrinthus:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x, y=e2m3.y-1, z=-77}, {name="air"})
            end  
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:meselamp2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:meselamp2"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:red_pyramid" then
        if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then 
			local red_pyramid = {}
			for j=10,29 do
				for l=9,20 do
					if dir1 == "right" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:red_pyramid" and Is_Node(j+1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(red_pyramid, {x=j+1, y=l, z=-77})
					elseif dir1 == "left" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:red_pyramid" and Is_Node(j-1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(red_pyramid, {x=j-1, y=l, z=-77})
					elseif dir1 == "up" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:red_pyramid" and Is_Node(j,l+1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(red_pyramid, {x=j, y=l+1, z=-77})
					elseif dir1 == "down" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:red_pyramid" and Is_Node(j,l-1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(red_pyramid, {x=j, y=l-1, z=-77})
					end
				end
			end
			for k, v in pairs(red_pyramid) do
				minetest.set_node(v, {name="labyrinthus:red_pyramid"})
			end
			minetest.set_node(e2m3, {name="labyrinthus:red_pyramid"})
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:green_pyramid" then
        if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then 
			local green_pyramid = {}
			for j=10,29 do
				for l=9,20 do
					if dir1 == "right" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:green_pyramid" and Is_Node(j+1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(green_pyramid, {x=j+1, y=l, z=-77})
					elseif dir1 == "left" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:green_pyramid" and Is_Node(j-1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(green_pyramid, {x=j-1, y=l, z=-77})
					elseif dir1 == "up" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:green_pyramid" and Is_Node(j,l+1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(green_pyramid, {x=j, y=l+1, z=-77})
					elseif dir1 == "down" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:green_pyramid" and Is_Node(j,l-1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(green_pyramid, {x=j, y=l-1, z=-77})
					end
				end
			end
			for k, v in pairs(green_pyramid) do
				minetest.set_node(v, {name="labyrinthus:green_pyramid"})
			end
			minetest.set_node(e2m3, {name="labyrinthus:green_pyramid"})
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:blue_pyramid" then
        if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			local blue_pyramid = {}
			for j=10,29 do
				for l=9,20 do
					if dir1 == "right" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:blue_pyramid" and Is_Node(j+1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(blue_pyramid, {x=j+1, y=l, z=-77})
					elseif dir1 == "left" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:blue_pyramid" and Is_Node(j-1,l,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(blue_pyramid, {x=j-1, y=l, z=-77})
					elseif dir1 == "up" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:blue_pyramid" and Is_Node(j,l+1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(blue_pyramid, {x=j, y=l+1, z=-77})
					elseif dir1 == "down" and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:blue_pyramid" and Is_Node(j,l-1,nil) then
						minetest.set_node({x=j, y=l, z=-77}, {name="air"})
						table.insert(blue_pyramid, {x=j, y=l-1, z=-77})
					end
				end
			end
			for k, v in pairs(blue_pyramid) do
				minetest.set_node(v, {name="labyrinthus:blue_pyramid"})
			end
			minetest.set_node(e2m3, {name="labyrinthus:blue_pyramid"})
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:transport_stone" then
        if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			if minetest.get_node(e1m3).name == "labyrinthus:gate_arrows" then
                minetest.set_node(e2m3, {name="labyrinthus:transport_stone_gate_arrows"})
			else
				minetest.set_node(e2m3, {name="labyrinthus:transport_stone"})
			end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:transport_stone_gate_arrows" then
        if Is_Node(nodex,nodey,nil) then
			if minetest.get_node(e1m3).name == "labyrinthus:empty_gate_purple" then
                minetest.set_node(e1m3, {name="labyrinthus:gate"})
			else
				minetest.set_node(e2m3, {name="labyrinthus:transport_stone_gate_arrows"})
			end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:arrow4" then
		minetest.set_node(e2m2, {name="air"})
		local d = 0
		local mode = 0
		local dir_x = 0
		local dir_y = 0
		
		if dir1 == "up" then
			dir_y = 1
		elseif dir1 == "down" then
			dir_y = -1
		elseif dir1 == "right" then
			dir_x = 1
		elseif dir1 == "left" then
			dir_x = -1
		end
		local bow_x = x+10+2*dir_x
		local bow_y = y+8+2*dir_y
		if minetest.get_node({x=x+10+dir_x, y=y+8+dir_y, z=-76}).name == "labyrinthus:arrow_path" or minetest.get_node({x=x+10+dir_x, y=y+8+dir_y, z=-76}).name == "labyrinthus:arrow_path_button" then
			mode = 1
		end
		while ((Is_Node(bow_x,bow_y,"arrow4") and  mode == 0) or (Is_Node(bow_x,bow_y,"arrow5") and mode == 1 )) and d == 0 do
			if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow_path" or minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow_path_button" then
				mode = 1
			else
				mode = 0
			end
			if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow4_2" then
				d = 1
				minetest.set_node({x=bow_x, y=bow_y, z=-76}, {name="labyrinthus:sand"})
			end
			bow_y = bow_y+dir_y
			bow_x = bow_x+dir_x
		end
		bow_y = bow_y-dir_y
		bow_x = bow_x-dir_x
		if d == 0 then
			minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
		end
		if Is_Node(e2m2.x,e2m2.y,nil) then
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
				Other(player, pbjnr)
				player_inv:set_stack(ko, 1, "labyrinthus:dirt "..koad)
			end
		end
	elseif minetest.get_node(e2m2).name == "labyrinthus:arrow5_yellow" then
		local d = 0
		local dir_x = 0
		local dir_y = 0
		if dir1 == "up" then
			dir_y = 1
		elseif dir1 == "down" then
			dir_y = -1
		elseif dir1 == "right" then
			dir_x = 1
		elseif dir1 == "left" then
			dir_x = -1
		end
		local bow_x = x+10+2*dir_x
		local bow_y = y+8+2*dir_y
		
		local mode = ""
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_red_circle" then
			if minetest.get_node(e1m2).name == "labyrinthus:dirt" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_red_circle" then
				mode = "dirt"
			end
		end
		if minetest.get_node(e1m1).name ~= "labyrinthus:dirt" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_red_circle" then
			if minetest.get_node(e1m2).name ~= "labyrinthus:dirt" and minetest.get_node(e1m2).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node(e1m2).name ~= "labyrinthus:dirt_with_red_circle" then
				mode = "not_dirt"
			end
		end
		while d == 0 do
			if (Dirt_Move2({x=bow_x, y=bow_y, z=-76}, false) and minetest.get_node({x=bow_x, y=bow_y, z=-76}).name ~= "labyrinthus:dirt_with_red_circle" and minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "air" and mode == "dirt") or (Is_Node(bow_x,bow_y,nil) and mode == "not_dirt") then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow5_yellow"})
			else
				d = 1
			end
			bow_y = bow_y+dir_y
			bow_x = bow_x+dir_x
		end
	elseif minetest.get_node(e2m2).name == "labyrinthus:arrow5_red" then
		local d = 0
		local dir_x = 0
		local dir_y = 0
		if dir1 == "up" then
			dir_y = 1
		elseif dir1 == "down" then
			dir_y = -1
		elseif dir1 == "right" then
			dir_x = 1
		elseif dir1 == "left" then
			dir_x = -1
		end
		local bow_x = x+10+2*dir_x
		local bow_y = y+8+2*dir_y
		
		local mode = ""
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_red_circle" then
			if minetest.get_node(e1m2).name == "labyrinthus:dirt" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_red_circle" then
				mode = "dirt"
			end
		end
		if minetest.get_node(e1m1).name ~= "labyrinthus:dirt" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_red_circle" then
			if minetest.get_node(e1m2).name ~= "labyrinthus:dirt" and minetest.get_node(e1m2).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node(e1m2).name ~= "labyrinthus:dirt_with_red_circle" then
				mode = "not_dirt"
			end
		end
		while d == 0 do
			if (Dirt_Move2({x=bow_x, y=bow_y, z=-76}, false) and minetest.get_node({x=bow_x, y=bow_y, z=-76}).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "air" and mode == "dirt") or (Is_Node(bow_x,bow_y,nil) and mode == "not_dirt") then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow5_red"})
			else
				d = 1
			end
			bow_y = bow_y+dir_y
			bow_x = bow_x+dir_x
		end
    elseif minetest.get_node(e2m2).name == "labyrinthus:arrow3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:arrow3"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
            update()
            if minetest.get_node(e1m1).name == "labyrinthus:boom" then
                minetest.set_node(e1m1, {name="labyrinthus:sand"})
                local x = player_inv:get_stack("x", 1):get_count()
                local y = player_inv:get_stack("y", 1):get_count()
                for j=10,29 do
                    for l=9,20 do
                        if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:tnt" then
                            minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                            if minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:cobble" then
                                minetest.set_node({x=j-1, y=l, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:cobble" then
                                minetest.set_node({x=j+1, y=l, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:cobble" then
                                minetest.set_node({x=j, y=l-1, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:cobble" then
                                minetest.set_node({x=j, y=l+1, z=-77}, {name="air"})
                            end
                        end
                    end
                end
            end
            local bones = player_inv:get_stack("b", 1):get_count()
            if minetest.get_node(e1m1).name == "labyrinthus:sand" then
                if bones == 1 then
                    minetest.set_node(e1m1, {name="labyrinthus:bones"})
                end
            end
            local a = player_inv:get_stack("a", 1):get_count()
            if a == 0 then
                if dir1 == "right" then
                    Right2(pos, node, player, pointed_thing)
                elseif dir1 == "up" then
                    Up2(pos, node, player, pointed_thing)
                elseif dir1 == "down" then
                    Down2(pos, node, player, pointed_thing)
                elseif dir1 == "left" then
                    Left2(pos, node, player, pointed_thing)
                end
            else
                if dir2 == "right" then
                    Right2(pos, node, player, pointed_thing)
                elseif dir2 == "up" then
                    Up2(pos, node, player, pointed_thing)
                elseif dir2 == "down" then
                    Down2(pos, node, player, pointed_thing)
                elseif dir2 == "left" then
                    Left2(pos, node, player, pointed_thing)
                end
            end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_right" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:bow_right"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_left" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:bow_left"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_down" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:bow_down"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_up" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:bow_up"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:stone_with_no_white1" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:stone_with_no_white1"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:stone_with_white2" then
		minetest.set_node(e2m2, {name="labyrinthus:stone_with_no_white2"})
		local white = player_inv:get_stack("w", 1):get_count()
		player_inv:set_stack("w", 1, "labyrinthus:dirt "..(white+1))
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan1" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan1"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan2"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan3"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan4" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan4"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:eye2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:glass"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:glass" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:glass"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:tnt" then
		if Dirt_Move(e1m1,e1m2,nodex,nodey,nil) then
			minetest.set_node(e2m3, {name="labyrinthus:tnt"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e1m2).name == "labyrinthus:dirt" then
		if Dirt_Move2(e1m1,overdirt) or (minetest.get_node(e1m1).name == "labyrinthus:rainbow3" and minetest.get_node({x=e1m1.x, y=e1m1.y-1, z=e1m1.z}).name == "labyrinthus:dirt") then
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:dirt_with_yellow_circle" then
		if Dirt_Move2(e1m1,overdirt) or (minetest.get_node(e1m1).name == "labyrinthus:rainbow3" and minetest.get_node({x=e1m1.x, y=e1m1.y-1, z=e1m1.z}).name == "labyrinthus:dirt") then
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:dirt_with_red_circle" then
		if Dirt_Move2(e1m1,overdirt) or (minetest.get_node(e1m1).name == "labyrinthus:rainbow3" and minetest.get_node({x=e1m1.x, y=e1m1.y-1, z=e1m1.z}).name == "labyrinthus:dirt") then
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
		end
    elseif minetest.get_node(e2m2).name == "labyrinthus:4" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:3"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:2"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:1"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:1" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:0"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:red" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:blue"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:blue" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:yellow"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:yellow" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:red"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:grey1" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:grey3"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:grey2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:grey1"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:grey3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:grey2"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:2red" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:2blue"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:2blue" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:2yellow"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:2yellow" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:2red"})
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:red2" then
        if Is_Node(nodex,nodey,"red") then
            if minetest.get_node(e1m3).name == "labyrinthus:red1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
            end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:green2" then
        if Is_Node(nodex,nodey,"green") then
            if minetest.get_node(e1m3).name == "labyrinthus:green1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
            end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:blue2" then
        if Is_Node(nodex,nodey,"blue") then
            if minetest.get_node(e1m3).name == "labyrinthus:blue1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="labyrinthus:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
            end
            one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:key1" then
        if key > 0 then
            player_inv:set_stack("k", 1, "labyrinthus:dirt "..(key-1))
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:key3" then
        if key > 0 then
            player_inv:set_stack("k", 1, "labyrinthus:dirt "..(key-1))
			minetest.set_node(e2m2, {name="air"})
        end
		local a2 = player_inv:get_stack("a2", 1):get_count()
		if a2 == 1 then
			one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,2)
		end
	elseif minetest.get_node(e2m2).name == "labyrinthus:yellow_red" then
		if dir1 == "up" then
			local red = player_inv:get_stack("re", 1):get_count()
			if red > 0 then
				player_inv:set_stack("re", 1, "labyrinthus:dirt "..(red-1))
				minetest.set_node(e2m2, {name="labyrinthus:red_with_no_yellow"})
				local yellow = player_inv:get_stack("ye", 1):get_count()
				player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
			end
		end
    elseif donetp2 == 0 then
        one_step(e1m2,e2m1,e2m2,ko,koad,player,pbjnr,"",false,donetp2,1)
    end
	local tp_wire = false
	local f = 0
	if minetest.get_node(e1m3).name == "labyrinthus:tp3" and tp3 then
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        for i=(x+10),28 do
            for k=9,20 do
                if i == (x+10) and (k-(y+8)) < 1 then
                else
                    if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp3" and (minetest.get_node({x=i, y=k, z=-77}).name == "air" or minetest.get_node({x=i, y=k, z=-77}).name == "nyancat:nyancat") and f == 0 then
						if e1m3.x ~= i or e1m3.y ~= k then
                            minetest.set_node({x=i, y=k, z=-77}, {name=minetest.get_node(e2m3).name})
							f = 1
                        end
                    end
                end
            end
        end
        for i=11,(x+10) do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp3" and (minetest.get_node({x=i, y=k, z=-77}).name == "air" or minetest.get_node({x=i, y=k, z=-77}).name == "nyancat:nyancat") and f == 0 then
					if e1m3.x ~= i or e1m3.y ~= k then
                        minetest.set_node({x=i, y=k, z=-77}, {name=minetest.get_node(e2m3).name})
                        f = 1
                    end
                end
            end
        end
		if f == 1 then
			minetest.set_node(e2m3, {name="air"})
		end
	end
	if (minetest.get_node(e1m2).name == "labyrinthus:tp" or minetest.get_node(e1m2).name == "labyrinthus:tp2" or minetest.get_node(e1m2).name == "labyrinthus:tp3") and (minetest.get_node(e2m2).name == "nyancat:nyancat" or f == 1) then
		if minetest.get_node(e1m1).name == "labyrinthus:tp3" or minetest.get_node(e1m1).name == "labyrinthus:tp2" or minetest.get_node(e1m1).name == "labyrinthus:tp" then
			if minetest.get_node(e2m1).name == "air" and wire == 1 and no_wire == false then
				if dir1 == "up" then
					if minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_11000000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01100000", param2 = 8})
					end
				elseif dir1 == "down" then
					if minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00110000", param2 = 8})
					end
				elseif dir1 == "right" then
					if minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10100000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_11000000", param2 = 8})
					end
				elseif dir1 == "left" then
					if minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10100000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00110000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01100000", param2 = 8})
					end
				end
			end
		else
			if minetest.get_node(e2m2).name == "nyancat:nyancat" and wire == 1 and no_wire == false then
				if dir1 == "down" then
					minetest.set_node(e2m2, {name="labyrinthus:wire_01000000", param2 = 8})
				elseif dir1 == "up" then
					minetest.set_node(e2m2, {name="labyrinthus:wire_00010000", param2 = 8})
				elseif dir1 == "left" then
					minetest.set_node(e2m2, {name="labyrinthus:wire_10000000", param2 = 8})
				elseif dir1 == "right" then
					minetest.set_node(e2m2, {name="labyrinthus:wire_00100000", param2 = 8})
				end
			end
			minetest.set_node(e2m1, {name="air"})
		end
        player_inv:set_stack(ko, 1, "labyrinthus:dirt "..koad)
        Other(player, pbjnr)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local f = 0
        for i=(x+10),29 do
            for k=9,20 do
                if i == (x+10) and (k-(y+8)) < 1 then
                else
                    if (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp" or (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp2" and minetest.get_node({x=i, y=k, z=-77}).name == "air") or (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp3" and minetest.get_node({x=i, y=k, z=-77}).name == "air")) and f == 0 then
                        local xx = i-10
                        local yy = k-8
                        if x ~= xx or y ~= yy then
                            x = xx
                            y = yy
                            f = 1
							donetp2 = 1
                        end
                    end
                end
            end
        end
        for i=10,(x+10) do
            for k=9,20 do
                if (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp" or (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp2" and minetest.get_node({x=i, y=k, z=-77}).name == "air") or (minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp3" and minetest.get_node({x=i, y=k, z=-77}).name == "air")) and f == 0 then
                    local xx = i-10
                    local yy = k-8
                    if x ~= xx or y ~= yy then
                        x = xx
                        y = yy
                        f = 1
						donetp2 = 1
                    end
                end
            end
        end
		if donetp2 == 1 and f == 1 then
			if wire == 1 and no_wire == false then
				if dir1 == "up" then
					if minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
					else
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
					end
				elseif dir1 == "down" then
					if minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
					else
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
					end
				elseif dir1 == "right" then
					if minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
					else
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
					end
				elseif dir1 == "left" then
					if minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
					elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
					else
						minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
					end
				end
			end
		end
        player_inv:set_stack("x", 1, "labyrinthus:dirt "..x)
        player_inv:set_stack("y", 1, "labyrinthus:dirt "..y)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
        tptp = tptp+1
	end
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local bones = player_inv:get_stack("b", 1):get_count()
	if minetest.get_node(e1m2).name == "labyrinthus:empty_gate" and (minetest.get_node(e2m2).name == "nyancat:nyancat" or minetest.get_node(e2m2).name == "labyrinthus:nyancat2") then
		local purple = player_inv:get_stack("p", 1):get_count()
		if purple > 0 then
            player_inv:set_stack("p", 1, "labyrinthus:dirt "..(purple-1))
			minetest.set_node(e1m2, {name="labyrinthus:empty_gate_purple"})
		end
	end
	if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:ice_with_green" and trfire == true then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "labyrinthus:dirt "..(green+1))
    end
	if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:ice_with_white" and trfire == true then
		local green = player_inv:get_stack("w", 1):get_count()
        player_inv:set_stack("w", 1, "labyrinthus:dirt "..(green+1))
    end
	if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:ice_with_yellow" and trfire == true then
		local yellow = player_inv:get_stack("ye", 1):get_count()
        player_inv:set_stack("ye", 1, "labyrinthus:dirt "..(yellow+1))
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:sand" then
        if bones == 1 then
            minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:bones"})
        end
    end
	local wire = player_inv:get_stack("wire", 1):get_count()
	
	if minetest.get_node({x=wire_x+10, y=wire_y+8, z=-77}).name == "air" and wire == 1 and no_wire == false then
		if minetest.get_node({x=wire_x+10, y=wire_y+8, z=-76}).name == "labyrinthus:cross_switch" or ((minetest.get_node({x=wire_x+10, y=wire_y+8, z=-76}).name == "labyrinthus:tp3" or minetest.get_node({x=wire_x+10, y=wire_y+8, z=-76}).name == "labyrinthus:tp2" or minetest.get_node({x=wire_x+10, y=wire_y+8, z=-76}).name == "labyrinthus:tp") and donetp2 == 1) then
			if minetest.get_node({x=wire_x+10, y=wire_y+8, z=-76}).name == "labyrinthus:cross_switch" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-76}, {name="labyrinthus:sand"})
			end
			if dir1 == "up" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
			elseif dir1 == "down" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
			elseif dir1 == "right" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
			elseif dir1 == "left" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
			end
		elseif dir1 == "up" then
		    if minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01010000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_11000000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01100000", param2 = 8})
			else
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
			end
		elseif dir1 == "down" then
		    if minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01010000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10010000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00110000", param2 = 8})
			else
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
			end
		elseif dir1 == "right" then
		    if minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x-1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10010000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10100000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10010000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_11000000", param2 = 8})
			else
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
			end
		elseif dir1 == "left" then
		    if minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_10100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00100000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_00110000" or minetest.get_node({x=e2m1.x+1, y=e2m1.y, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_10100000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_11000000" or minetest.get_node({x=e2m1.x, y=e2m1.y-1, z=e2m1.z}).name == "labyrinthus:wire_01100000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00110000", param2 = 8})
			elseif minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_01010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_10010000" or minetest.get_node({x=e2m1.x, y=e2m1.y+1, z=e2m1.z}).name == "labyrinthus:wire_00110000" then
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_01100000", param2 = 8})
			else
				minetest.set_node({x=wire_x+10, y=wire_y+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
			end
		end
	end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:button11" then
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:button12"})
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:moon" then
        for i = 9, 30 do
            for j = 0,14 do
                minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:stone"})
            end
        end
        local pos = {x=19, y=10.5, z=-88}
	    local size = 30
	    size = math.max(math.floor(size - 8), 0) 
	    local minp = vector.subtract(pos, size)
	    local maxp = vector.add(pos, size)
	    local vm = minetest.get_voxel_manip(minp, maxp)
	    vm:update_liquids()
	    vm:write_to_map()
	    vm:update_map()
	    local emin, emax = vm:get_emerged_area()
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:sun" then
        for i = 9, 30 do
            for j = 0,14 do
                minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
            end
        end
        local pos = {x=19, y=10.5, z=-88}
	    local size = 30
	    size = math.max(math.floor(size - 8), 0) 
	    local minp = vector.subtract(pos, size)
	    local maxp = vector.add(pos, size)
	    local vm = minetest.get_voxel_manip(minp, maxp)
	    vm:update_liquids()
	    vm:write_to_map()
	    vm:update_map()
	    local emin, emax = vm:get_emerged_area()
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:time30" then
        player_inv:set_stack("time", 1, "labyrinthus:dirt")
    end
    local time = player_inv:get_stack("time", 1):get_count()
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name ~= "labyrinthus:time30" and time == 1 then
        player_inv:set_stack("time", 1, "labyrinthus:dirt 2")
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:fire" and trfire == true then
        player_inv:set_stack("f", 1, "labyrinthus:dirt "..(fire+1))
        player_inv:set_stack("a2", 1, nil)
        local fire = player_inv:get_stack("f", 1):get_count()
        if fire > 1 then
            player_inv:set_stack("x", 1, nil)
            player_inv:set_stack("y", 1, nil)
            player_inv:set_stack("z", 1, nil)
            minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
            minetest.chat_send_all("Oh no! Nyan Cat was killed!")
        else
            minetest.chat_send_all("That hurt!")
        end
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:arrow" then
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:sand"})
        end
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:bones"})
            end
        end
        player_inv:set_stack("a", 1, "labyrinthus:dirt")
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:arrow2" then
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:sand"})
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:bones"})
            end
        end
        player_inv:set_stack("a2", 1, "labyrinthus:dirt")
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            if dir1 == "right" then
                Right2(pos, node, player, pointed_thing)
            elseif dir1 == "up" then
                Up2(pos, node, player, pointed_thing)
            elseif dir1 == "down" then
                Down2(pos, node, player, pointed_thing)
            elseif dir1 == "left" then
                Left2(pos, node, player, pointed_thing)
            end
        else
            if dir2 == "right" then
                Right2(pos, node, player, pointed_thing)
            elseif dir2 == "up" then
                Up2(pos, node, player, pointed_thing)
            elseif dir2 == "down" then
                Down2(pos, node, player, pointed_thing)
            elseif dir2 == "left" then
                Left2(pos, node, player, pointed_thing)
            end
        end
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:boom" then
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:sand"})
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:bones"})
            end
        end
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:tnt" then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    if minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:cobble" then
                        minetest.set_node({x=j-1, y=l, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:cobble" then
                        minetest.set_node({x=j+1, y=l, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:cobble" then
                        minetest.set_node({x=j, y=l-1, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:cobble" then
                        minetest.set_node({x=j, y=l+1, z=-77}, {name="air"})
                    end
                end
            end
        end
    end
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local dd = 0
    for i=10,29 do
        for k=9,20 do
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                dd = dd+1
            end
        end
    end
    if dd == 2 then
        for i=10,29 do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                    minetest.set_node({x=i, y=k, z=-77}, {name="labyrinthus:button13"})
                    minetest.set_node({x=i, y=k, z=-76}, {name="labyrinthus:sand"})
                end
            end
        end
    end
    for j=10,29 do
        for l=9,20 do
            for m=0,30 do
                if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:time"..m and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" then
                    pon = 1
                end
                if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:time"..m and minetest.get_node({x=j, y=l, z=-77}).name ~= "labyrinthus:pbj_pup" and pon == 1 then
                    pon = 2
                end
            end
        end
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "nyancat:nyancat_rainbow" or minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:rainbow2" then
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
        pon = 0
		local level = ""
		if ll ~= 0 then
			lv = io.open(minetest.get_worldpath().."/level"..ll..".txt", "r")
			level = lv:read("*l")
			lv:close()
		end
        minetest.chat_send_all("level completed")
        for i = 9, 30 do
            for j = 0,14 do
                minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
            end
        end
        local pos = {x=19, y=10.5, z=-88}
	    local size = 30
	    size = math.max(math.floor(size - 8), 0) 
	    local minp = vector.subtract(pos, size)
	    local maxp = vector.add(pos, size)
	    local vm = minetest.get_voxel_manip(minp, maxp)
	    vm:update_liquids()
	    vm:write_to_map()
	    vm:update_map()
	    local emin, emax = vm:get_emerged_area()
		if ll ~= 0 then
			if tonumber(level) == tonumber(level2) then
				le = io.open(minetest.get_worldpath().."/level"..ll..".txt", "w")
				le:write(level+1)
				le:close()
			end
		end
    end
	if anotherstep == 1 and minetest.get_node(e2m3).name == "air" then
		if dir1 == "right" then
			Right2(pos, node, player, true)
		elseif dir1 == "left" then
			Left2(pos, node, player, true)
		elseif dir1 == "up" then
			Up2(pos, node, player, true)
		elseif dir1 == "down" then
			Down2(pos, node, player, true)
		end
	end
end
function Right(pos, node, player, overdirt, trfire, dir)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local e1m1 = {x=x+10, y=y+8, z=-76}
    local e1m2 = {x=x+11, y=y+8, z=-76}
    local e1m3 = {x=x+12, y=y+8, z=-76}
    local e2m1 = {x=x+10, y=y+8, z=-77}
    local e2m2 = {x=x+11, y=y+8, z=-77}
    local e2m3 = {x=x+12, y=y+8, z=-77}
    local ko = "x"
    local koad = (x+1)
    local nodex = x+12
    local nodey = y+8
    local dir1 = "right"
    local dir2 = "left"
    local pbjnr = 1
    if x < 19 and x > -1 and y > 0 then
        move(player,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Up(pos, node, player, overdirt, trfire)
	local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local e1m1 = {x=x+10, y=y+8, z=-76}
    local e1m2 = {x=x+10, y=y+9, z=-76}
    local e1m3 = {x=x+10, y=y+10, z=-76}
    local e2m1 = {x=x+10, y=y+8, z=-77}
    local e2m2 = {x=x+10, y=y+9, z=-77}
    local e2m3 = {x=x+10, y=y+10, z=-77}
    local ko = "y"
    local koad = (y+1)
    local nodex = x+10
    local nodey = y+10
    local dir1 = "up"
    local dir2 = "down"
    local pbjnr = 4
    if y < 12  and y > 0 then
        move(player,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Down(pos, node, player, overdirt, trfire)
	local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local e1m1 = {x=x+10, y=y+8, z=-76}
    local e1m2 = {x=x+10, y=y+7, z=-76}
    local e1m3 = {x=x+10, y=y+6, z=-76}
    local e2m1 = {x=x+10, y=y+8, z=-77}
    local e2m2 = {x=x+10, y=y+7, z=-77}
    local e2m3 = {x=x+10, y=y+6, z=-77}
    local ko = "y"
    local koad = (y-1)
    local nodex = x+10
    local nodey = y+6
    local dir1 = "down"
    local dir2 = "up"
    local pbjnr = 2
    if y > 1 and y < 13 then
        move(player,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Left(pos, node, player, overdirt, trfire)
	local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local e1m1 = {x=x+10, y=y+8, z=-76}
    local e1m2 = {x=x+9, y=y+8, z=-76}
    local e1m3 = {x=x+8, y=y+8, z=-76}
    local e2m1 = {x=x+10, y=y+8, z=-77}
    local e2m2 = {x=x+9, y=y+8, z=-77}
    local e2m3 = {x=x+8, y=y+8, z=-77}
    local ko = "x"
    local koad = (x-1)
    local nodex = x+8
    local nodey = y+8
    local dir1 = "left"
    local dir2 = "right"
    local pbjnr = 3
    if x > 0 and x < 20 and y > 0 then
        move(player,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end

function Right2(pos, node, player, overdirt)
    Load(player)
    local player_inv = player:get_inventory()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local ff = 0
    tptp = 0
    player_inv:set_stack("r", 1, "labyrinthus:dirt")
    while ff == 0 and a2 == 1 and tptp < 10 do
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local k = player_inv:get_stack("k", 1):get_count()
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
			Right(pos, node, player, overdirt, true)
        else
            Left(pos, node, player, overdirt, true)
        end
		local x2 = player_inv:get_stack("x", 1):get_count()
        local y2 = player_inv:get_stack("y", 1):get_count()
		if x == x2 and y == y2 then
			ff = 1
		end
    end
    local a = player_inv:get_stack("a", 1):get_count()
    if a == 0 then
        if a2 == 1 then
            Right(pos, node, player, overdirt, false)
        else
            Right(pos, node, player, overdirt, true)
        end
    else
        if a2 == 1 then
            Left(pos, node, player, overdirt, false)
        else
            Left(pos, node, player, overdirt, true)
        end
    end
    if tptp < 10 then
    else
        minetest.chat_send_all("Oh no! Nyan Cat was teleported 10 times in a row and died of motion sickness!")
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
    end
end

function Up2(pos, node, player, overdirt)
    Load(player)
    local player_inv = player:get_inventory()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local ff = 0
    tptp = 0
    player_inv:set_stack("r", 1, "labyrinthus:dirt 4")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local k = player_inv:get_stack("k", 1):get_count()
        if a == 0 then
            Up(pos, node, player, overdirt, true)
        else
            Down(pos, node, player, overdirt, true)
        end
		local x2 = player_inv:get_stack("x", 1):get_count()
        local y2 = player_inv:get_stack("y", 1):get_count()
		if x == x2 and y == y2 then
			ff = 1
		end
    end
    local a = player_inv:get_stack("a", 1):get_count()
    if a == 0 then
        if a2 == 1 then
            Up(pos, node, player, overdirt, false)
        else
            Up(pos, node, player, overdirt, true)
        end
    else
        if a2 == 1 then
            Down(pos, node, player, overdirt, false)
        else
            Down(pos, node, player, overdirt, true)
        end
    end
    if tptp < 10 then
    else
        minetest.chat_send_all("Oh no! Nyan Cat was teleported 10 times in a row and died of motion sickness!")
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
    end
end

function Down2(pos, node, player, overdirt)
    Load(player)
    local player_inv = player:get_inventory()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local ff = 0
    tptp = 0
    player_inv:set_stack("r", 1, "labyrinthus:dirt 2")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local k = player_inv:get_stack("k", 1):get_count()
        if a == 0 then
            Down(pos, node, player, overdirt, true)
        else
            Up(pos, node, player, overdirt, true)
        end
		local x2 = player_inv:get_stack("x", 1):get_count()
        local y2 = player_inv:get_stack("y", 1):get_count()
		if x == x2 and y == y2 then
			ff = 1
		end
    end
    local a = player_inv:get_stack("a", 1):get_count()
    if a == 0 then
        if a2 == 1 then
            Down(pos, node, player, overdirt, false)
        else
            Down(pos, node, player, overdirt, true)
        end
    else
        if a2 == 1 then
            Up(pos, node, player, overdirt, false)
        else
            Up(pos, node, player, overdirt, true)
        end
    end
    if tptp < 10 then
    else
        minetest.chat_send_all("Oh no! Nyan Cat was teleported 10 times in a row and died of motion sickness!")
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
    end
end

function Left2(pos, node, player, overdirt)
    Load(player)
    local player_inv = player:get_inventory()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local ff = 0
    tptp = 0
    player_inv:set_stack("r", 1, "labyrinthus:dirt 3")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local k = player_inv:get_stack("k", 1):get_count()
        if a == 0 then
            Left(pos, node, player, overdirt, true)
        else
            Right(pos, node, player, overdirt, true)
        end
		local x2 = player_inv:get_stack("x", 1):get_count()
        local y2 = player_inv:get_stack("y", 1):get_count()
		if x == x2 and y == y2 then
			ff = 1
		end
    end
    local a = player_inv:get_stack("a", 1):get_count()
    if a == 0 then
        if a2 == 1 then
            Left(pos, node, player, overdirt, false)
        else
            Left(pos, node, player, overdirt, true)
        end
    else
        if a2 == 1 then
            Right(pos, node, player, overdirt, false)
        else
            Right(pos, node, player, overdirt, true)
        end
    end
    if tptp < 10 then
    else
        minetest.chat_send_all("Oh no! Nyan Cat was teleported 10 times in a row and died of motion sickness!")
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
        player_inv:set_stack("x", 1, nil)
        player_inv:set_stack("y", 1, nil)
        player_inv:set_stack("z", 1, nil)
        player_inv:set_stack("time", 1, nil)
    end
end
function Shot(pos, node, player, pointed_thing)
    local player_inv = player:get_inventory()
    Load(player)
    local r = player_inv:get_stack("r", 1):get_count()
	
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
	local ss = player_inv:get_stack("ss", 1):get_count()
	local a = player_inv:get_stack("a", 1):get_count()
	if a == 1 then
		if r == 1 then
			r = 3
		elseif r == 2 then
			r = 4
		elseif r == 3 then
			r = 1
		elseif r == 4 then
			r = 2
		end
	end
    local d = 0
    if s > 0 or ss > 0 then
        if r == 1 then
            while x < 18 and d == 0 do
                if minetest.get_node({x=x+11, y=y+8, z=-77}).name == "labyrinthus:apple" then
                    if minetest.get_node({x=x+11, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        x = x+1
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+11, y=y+8, z=-77}).name == "air" or minetest.get_node({x=x+11, y=y+8, z=-77}).name == "labyrinthus:meselamp2" then
                    if minetest.get_node({x=x+11, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
						if s > 0 then
							minetest.set_node({x=x+11, y=y+8, z=-78+z}, {name="labyrinthus:ball2"})
						else
							minetest.set_node({x=x+11, y=y+8, z=-78+z}, {name="labyrinthus:ball4"})
						end
                        x = x+1
                    else
                        d = 1
                    end
                else
                    d = 1
                end
            end
        elseif r == 2 then
            while y > 1 and d == 0 do
                if minetest.get_node({x=x+10, y=y+7, z=-77}).name == "labyrinthus:apple" then
                    if minetest.get_node({x=x+10, y=y+7, z=-76}).name ~= "labyrinthus:key2" then
                        y = y-1
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+10, y=y+7, z=-77}).name == "air" or minetest.get_node({x=x+10, y=y+7, z=-77}).name == "labyrinthus:meselamp2" then
                    if minetest.get_node({x=x+10, y=y+7, z=-76}).name ~= "labyrinthus:key2" then
						if s > 0 then
							minetest.set_node({x=x+10, y=y+7, z=-78+z}, {name="labyrinthus:ball2"})
						else
							minetest.set_node({x=x+10, y=y+7, z=-78+z}, {name="labyrinthus:ball4"})
						end
                        y = y-1
                    else
                        d = 1
                    end
                else
                    d = 1
                end
            end
        elseif r == 3 then
            while x > 1 and d == 0 do
                if minetest.get_node({x=x+9, y=y+8, z=-77}).name == "labyrinthus:apple" then
                    if minetest.get_node({x=x+9, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        x = x-1
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+9, y=y+8, z=-77}).name == "air" or minetest.get_node({x=x+9, y=y+8, z=-77}).name == "labyrinthus:meselamp2" then
                    if minetest.get_node({x=x+9, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
						if s > 0 then
							minetest.set_node({x=x+9, y=y+8, z=-78+z}, {name="labyrinthus:ball2"})
						else
							minetest.set_node({x=x+9, y=y+8, z=-78+z}, {name="labyrinthus:ball4"})
						end
                        x = x-1
                    else
                        d = 1
                    end
                else
                    d = 1
                end
            end
        elseif r == 4 then
            while y < 10 and d == 0 do
                if minetest.get_node({x=x+10, y=y+9, z=-77}).name == "labyrinthus:apple" then
                    if minetest.get_node({x=x+10, y=y+9, z=-76}).name ~= "labyrinthus:key2" then
                        y = y+1
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+10, y=y+9, z=-77}).name == "air" or minetest.get_node({x=x+10, y=y+9, z=-77}).name == "labyrinthus:meselamp2" then
                    if minetest.get_node({x=x+10, y=y+9, z=-76}).name ~= "labyrinthus:key2" then
						if s > 0 then
							minetest.set_node({x=x+10, y=y+9, z=-78+z}, {name="labyrinthus:ball2"})
						else
							minetest.set_node({x=x+10, y=y+9, z=-78+z}, {name="labyrinthus:ball4"})
						end
                        y = y+1
                    else
                        d = 1
                    end
                else
                    d = 1
                end
            end
        end
        minetest.after(0.1, function(pos, str) 
            for i=10,29 do
                for k=9,20 do
                    if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:ball2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:ball4" then
                        minetest.set_node({x=i, y=k, z=-77}, {name="air"})
                    end
                end
            end
        end, pos, str)
		if s > 0 then
			player_inv:set_stack("s", 1, "")
		else
			player_inv:set_stack("ss", 1, "")
		end
		
    end
end
function Other(player,ri)
    local dd = 0
    if ri == 1 then
        local d = 0
        for j=10,29 do
            for l=9,20 do
                for i=0,30 do
                    if minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:time"..i and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and d == 0 then
                        dd = 1
                    end
                end
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j-1, y=l, z=-77}).name == "air" and minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j-1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j-1, y=l, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j-1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j-1, y=l, z=-77}).name == "air" and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j-1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2") and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j-1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                end
            end
        end
    elseif ri == 3 then
        local d = 0
        for j=10,29 do
            for l=9,20 do
                for i=0,30 do
                    if minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:time"..i and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and d == 0 then
                        dd = 1
                    end
                end
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j+1, y=l, z=-77}).name == "air" and minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j+1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j+1, y=l, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j+1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j+1, y=l, z=-77}).name == "air" and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j+1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2") and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j+1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                end
            end
        end
    elseif ri == 2 then
        local d = 0
        for j=10,29 do
            for l=9,20 do
                for i=0,30 do
                    if minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:time"..i and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and d == 0 then
                        dd = 1
                    end
                end
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l+1, z=-77}).name == "air" and minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l+1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j, y=l+1, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l+1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l+1, z=-77}).name == "air" and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l+1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2") and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l+1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                end
            end
        end
    elseif ri == 4 then
        local d = 0
        for j=10,29 do
            for l=9,20 do
                for i=0,30 do
                    if minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:time"..i and minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and d == 0 then
                        dd = 1
                    end
                end
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l-1, z=-77}).name == "air" and minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l-1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j, y=l-1, z=-76}).name == "labyrinthus:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l-1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l-1, z=-77}).name == "air" and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l-1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2") and dd == 1 and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l-1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                end
            end
        end
    end
end
function Is_Node(x,y,block)
	local d = 0
    if block == "bow" then
		if minetest.get_node({x=x, y=y, z=-77}).name ~= "air" and 
		minetest.get_node({x=x, y=y, z=-77}).name ~= "labyrinthus:bow_right" and 
		minetest.get_node({x=x, y=y, z=-77}).name ~= "labyrinthus:bow_left" and 
		minetest.get_node({x=x, y=y, z=-77}).name ~= "labyrinthus:bow_down" and 
		minetest.get_node({x=x, y=y, z=-77}).name ~= "labyrinthus:bow_up" and 
		minetest.get_node({x=x, y=y, z=-77}).name ~= "labyrinthus:stone_with_no_white1" then
			d = 1
		end
	else
		if minetest.get_node({x=x, y=y, z=-77}).name ~= "air" then
			d = 1
		end
	end    
	if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:white" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:bones" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow_path_with_green" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple_dirt" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan_dirt" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow_dirt" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green_dirt" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_wood_with_green" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_wood_with_red" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_stone" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ice_with_green" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ice_with_white" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ice_with_yellow" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_eye1_with_yellow" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_eye2_with_yellow" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_eye1_with_cyan" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water_eye2_with_cyan" and 
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball3" and
		minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cross_switch" then
		if block ~= "bow" then
			if block ~= "wood" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:water" then
				d = 1
			end
			if block ~= "red" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:red1" then
				d = 1
			end
			if block ~= "green" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:green1" then
				d = 1
			end
			if block ~= "blue" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:blue1" then
				d = 1
			end
			if block ~= "dirt" and (minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:dirt" or minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:dirt_with_red_circle") then
				d = 1
			end
			if block ~= "arrow4" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:arrow4_2" then
				d = 1
			end
			if block == "arrow5" and minetest.get_node({x=x, y=y, z=-76}).name == "labyrinthus:sand" then
				d = 1
			end
		end
		if d == 0 then
			return true
		end
	end
end
function Dirt_Move(e1m1,e1m2,nodex,nodey,block)
	if ((minetest.get_node(e1m1).name == "labyrinthus:dirt" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_red_circle") and (minetest.get_node(e1m2).name == "labyrinthus:dirt" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m2).name == "labyrinthus:dirt_with_red_circle") and Is_Node(nodex,nodey,"dirt")) or (Is_Node(nodex,nodey,block) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_yellow_circle" and minetest.get_node(e1m1).name ~= "labyrinthus:dirt_with_red_circle") then
		return true
	end
end
function Dirt_Move2(e1m1,overdirt)
	if (minetest.get_node(e1m1).name == "labyrinthus:dirt" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_yellow_circle" or minetest.get_node(e1m1).name == "labyrinthus:dirt_with_red_circle") or overdirt then
		return true
	end
end
function Load(player)
    local player_inv = player:get_inventory()
    player_inv:set_size("x", 1)
    player_inv:set_size("y", 1)
    player_inv:set_size("z", 1)
    player_inv:set_size("k", 1)
	player_inv:set_size("p", 1)
	player_inv:set_size("g", 1)
	player_inv:set_size("c", 1)
	player_inv:set_size("ye", 1)
	player_inv:set_size("re", 1)
	player_inv:set_size("w", 1)
    player_inv:set_size("r", 1)
    player_inv:set_size("s", 1)
	player_inv:set_size("ss", 1)
    player_inv:set_size("l", 5)
    player_inv:set_size("b", 1)
	player_inv:set_size("wire", 1)
    player_inv:set_size("a", 1)
    player_inv:set_size("a2", 1)
    player_inv:set_size("ll", 1)
    player_inv:set_size("page1", 1)
    player_inv:set_size("page2", 1)
    player_inv:set_size("page3", 1)
	player_inv:set_size("page5", 1)
    player_inv:set_size("time", 1)
    player_inv:set_size("f", 1)
end

function New(player,page,art,num)
    local player_inv = player:get_inventory()
    Load(player)
	local file = io.open(minetest.get_worldpath().."/move1.txt", "r")
    local c = fsize(file)
    file:close()
	local ar1 = {}
    local ar2 = {}
	local rrr1 = ""
	local rrr2 = ""
	local rrr3 = ""
	local rrr4 = ""
	local rrr5 = ""
	local rrr6 = ""
	local rrr7 = ""
	local rrr8 = ""
	local rrr9 = ""
	local rrr10 = ""
	local rrr11 = ""
	local rrr12 = ""
	local rrr13 = ""
	local rrr14 = ""
	local rrr15 = ""
	local rrr16 = ""
	local rrr17 = ""
	local rrr18 = ""
	local rrr19 = ""
	local rrr20 = ""
	local rrr21 = ""
	local rrr22 = ""
	local rrr23 = ""
	if c > 5 and num == 2 then
        local lv = io.open(minetest.get_worldpath().."/move1.txt", "r")
        for i=1,12 do
	        ar1[i] = lv:read("*l")
        end
        local zw = lv:read("*l")
        for i=1,12 do
	        ar2[i] = lv:read("*l")
        end
        local zw2 = lv:read("*l")
        rrr1 = lv:read("*l")
        rrr2 = lv:read("*l")
        rrr3 = lv:read("*l")
        rrr4 = lv:read("*l")
        rrr5 = lv:read("*l")
        rrr6 = lv:read("*l")
        rrr7 = lv:read("*l")
        rrr8 = lv:read("*l")
        rrr9 = lv:read("*l")
        rrr10 = lv:read("*l")
        rrr11 = lv:read("*l")
        rrr12 = lv:read("*l")
        rrr13 = lv:read("*l")
        rrr14 = lv:read("*l")
        rrr15 = lv:read("*l")
        rrr16 = lv:read("*l")
		rrr17 = lv:read("*l")
		rrr18 = lv:read("*l")
		rrr19 = lv:read("*l")
		rrr20 = lv:read("*l")
		rrr21 = lv:read("*l")
		rrr22 = lv:read("*l")
		rrr23 = lv:read("*l")
	end
	if num == 1 then
		local lv = io.open(minetest.get_worldpath().."/level1.txt", "r")
		local level = lv:read("*l")
		lv:close()
		if art == "n" then
			lv = io.open(minetest.get_modpath("labyrinthus").."/lv"..page..".txt", "r")
		elseif art == "o" then
			lv = io.open(minetest.get_worldpath().."/own_level_"..page..".txt", "r")
		end
		if string.sub(page, 1, 1) == "5" or art == "o" then
			for i=1,12 do
				ar1[i] = lv:read("*l")
			end
		else
			ar1[1] = "00000000000000000000"
			ar1[2] = "00000000000000000000"
			for i=3,12 do
				ar1[i] = "0"..lv:read("*l").."0"
			end
		end
		local zw = lv:read("*l")
		if string.sub(page, 1, 1) == "5" or art == "o" then
			for i=1,12 do
				ar2[i] = lv:read("*l")
			end
		else
			ar2[1] = "22222222222222222222"
			ar2[2] = "22222222222222222222"
			for i=3,12 do
				ar2[i] = "2"..lv:read("*l").."2"
			end
		end
		local zw2 = lv:read("*l")
		rrr1 = lv:read("*l")
		rrr2 = lv:read("*l")
		rrr3 = lv:read("*l")
	end
	if num == 1 or (c > 5 and num == 2) then
		for i=10,29 do
			for j=-78,-76 do
				for k=9,20 do
					minetest.set_node({x=i, y=k, z=j}, {name="air"})
				end
			end
		end
		for j = 1, 12 do
			for i = 1, string.len(ar1[j]) do
				
				if string.sub(ar1[j], i, i) == "s" then
					if num == 1 then
						minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:time30"})
					else
						minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:time"..rrr16})
					end
				else
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name=get_item_list(node_list1,string.sub(ar1[j], i, i),1,2)})
				end
			end
		end
		for j = 1, 12 do
			for i = 1, string.len(ar2[j]) do
				if string.sub(ar2[j], i, i) == "D" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow_block", param2 = 8})
				elseif string.sub(ar2[j], i, i) == ":" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_10100000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == ";" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_10000000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "<" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_01000000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == ">" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_00100000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "|" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_00010000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "." then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_01010000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "," then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_11000000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "-" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_01100000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "_" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_00110000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "#" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:wire_10010000", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "\\" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name=get_item_list(node_list2,string.sub(ar2[j], i, i),1,2), param2 = 8})
				else
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name=get_item_list(node_list2,string.sub(ar2[j], i, i),1,2)})
				end
			end
		end
		if num == 1 then
			player_inv:set_stack("x", 1, "labyrinthus:dirt "..rrr1)
			player_inv:set_stack("y", 1, "labyrinthus:dirt "..rrr2)
			player_inv:set_stack("z", 1, "labyrinthus:dirt "..rrr3)
			player_inv:set_stack("k", 1, nil)
			player_inv:set_stack("r", 1, nil)
			player_inv:set_stack("s", 1, nil)
			player_inv:set_stack("ss", 1, nil)
			player_inv:set_stack("p", 1, nil)
			player_inv:set_stack("g", 1, nil)
			player_inv:set_stack("c", 1, nil)
			player_inv:set_stack("ye", 1, nil)
			player_inv:set_stack("re", 1, nil)
			player_inv:set_stack("w", 1, nil)
			player_inv:set_stack("b", 1, nil)
			player_inv:set_stack("f", 1, nil)
			player_inv:set_stack("a", 1, nil)
			player_inv:set_stack("a2", 1, nil)
			player_inv:set_stack("time", 1, nil)
			player_inv:set_stack("wire", 1, nil)
			file = io.open(minetest.get_worldpath().."/move1.txt", "w")
			file:write("")
			file:close()
			pon = 0
			for i = 9, 30 do
				for j = 0,14 do
					minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
				end
			end
			local pos = {x=19, y=10.5, z=-88}
			local size = 30
			size = math.max(math.floor(size - 8), 0) 
			local minp = vector.subtract(pos, size)
			local maxp = vector.add(pos, size)
			local vm = minetest.get_voxel_manip(minp, maxp)
			vm:update_liquids()
			vm:write_to_map()
			vm:update_map()
			local emin, emax = vm:get_emerged_area()
			local x = player_inv:get_stack("x", 1):get_count()
			local y = player_inv:get_stack("y", 1):get_count()
			rrr = 0
			minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
		else
			player_inv:set_stack("w", 1, "labyrinthus:dirt "..rrr2)
			player_inv:set_stack("re", 1, "labyrinthus:dirt "..rrr3)
			player_inv:set_stack("ye", 1, "labyrinthus:dirt "..rrr4)
			player_inv:set_stack("c", 1, "labyrinthus:dirt "..rrr5)
			player_inv:set_stack("p", 1, "labyrinthus:dirt "..rrr6)
			player_inv:set_stack("g", 1, "labyrinthus:dirt "..rrr7)
			player_inv:set_stack("k", 1, "labyrinthus:dirt "..rrr8)
			player_inv:set_stack("r", 1, "labyrinthus:dirt "..rrr9)
			player_inv:set_stack("s", 1, "labyrinthus:dirt "..rrr10)
			player_inv:set_stack("ss", 1, "labyrinthus:dirt "..rrr11)
			player_inv:set_stack("b", 1, "labyrinthus:dirt "..rrr12)
			player_inv:set_stack("a", 1, "labyrinthus:dirt "..rrr13)
			player_inv:set_stack("a2", 1, "labyrinthus:dirt "..rrr14)
			player_inv:set_stack("time", 1, "labyrinthus:dirt "..rrr15)
			player_inv:set_stack("f", 1, "labyrinthus:dirt "..rrr17)
			player_inv:set_stack("x", 1, "labyrinthus:dirt "..rrr18)
			player_inv:set_stack("y", 1, "labyrinthus:dirt "..rrr19)
			player_inv:set_stack("z", 1, "labyrinthus:dirt "..rrr20)
			local x = player_inv:get_stack("x", 1):get_count()
			local y = player_inv:get_stack("y", 1):get_count()
			minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
			pon = tonumber(rrr21)
			rrr = tonumber(rrr22)
			rrrr = tonumber(rrr23)
			if rrr1 == "false" then
				for i = 9, 30 do
					for j = 0,14 do
						minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
					end
				end
			elseif rrr1 == "true" then
				for i = 9, 30 do
					for j = 0,14 do
						minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:stone"})
					end
				end
			end
			local pos = {x=19, y=10.5, z=-88}
			local size = 30
			size = math.max(math.floor(size - 8), 0) 
			local minp = vector.subtract(pos, size)
			local maxp = vector.add(pos, size)
			local vm = minetest.get_voxel_manip(minp, maxp)
			vm:update_liquids()
			vm:write_to_map()
			vm:update_map()
			local emin, emax = vm:get_emerged_area()
			for j=10,29 do
				for l=9,20 do
					if minetest.get_node({x=j, y=l, z=-77}).name == "nyancat:nyancat" then
						local fire = player_inv:get_stack("f", 1):get_count()
						if fire > 0 then
							minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:nyancat2"})
						end
					end
				end
			end
		end
		update()
	end
end
function lvbut(from,num,level2)
    local formspec = ""
    .."image_button[4.5,-0.3;0.8,0.8;;esc;X]"
    .."background[5,6.5;1,1;gui_formbg.png;true]"
    .."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"
    .."bgcolor[#080808BB;true]"
    if tonumber(level2) > from and num > 0 then
        formspec = formspec.."button[0,1;1,1;a;"..(from+1).."]"
    end
    if tonumber(level2) > (from+1) and num > 1 then
        formspec = formspec.."button[1,1;1,1;b;"..(from+2).."]"
    end
    if tonumber(level2) > (from+2) and num > 2 then
        formspec = formspec.."button[2,1;1,1;c;"..(from+3).."]"
    end
    if tonumber(level2) > (from+3) and num > 3 then
        formspec = formspec.."button[3,1;1,1;d;"..(from+4).."]"
    end
    if tonumber(level2) > (from+4) and num > 4 then
        formspec = formspec.."button[4,1;1,1;e;"..(from+5).."]"
    end
    if tonumber(level2) > (from+5) and num > 5 then
        formspec = formspec.."button[0,2;1,1;f;"..(from+6).."]"
    end
    if tonumber(level2) > (from+6) and num > 6 then
        formspec = formspec.."button[1,2;1,1;g;"..(from+7).."]"
    end
    if tonumber(level2) > (from+7) and num > 7 then
        formspec = formspec.."button[2,2;1,1;h;"..(from+8).."]"
    end
    if tonumber(level2) > (from+8) and num > 8 then
        formspec = formspec.."button[3,2;1,1;i;"..(from+9).."]"
    end
    if tonumber(level2) > (from+9) and num > 9 then
        formspec = formspec.."button[4,2;1,1;j;"..(from+10).."]"
    end
    if tonumber(level2) > (from+10) and num > 10 then
        formspec = formspec.."button[0,3;1,1;k;"..(from+11).."]"
    end
    if tonumber(level2) > (from+11) and num > 11 then
        formspec = formspec.."button[1,3;1,1;l;"..(from+12).."]"
    end
    if tonumber(level2) > (from+12) and num > 12 then
        formspec = formspec.."button[2,3;1,1;m;"..(from+13).."]"
    end
    if tonumber(level2) > (from+13) and num > 13 then
        formspec = formspec.."button[3,3;1,1;n;"..(from+14).."]"
    end
    if tonumber(level2) > (from+14) and num > 14 then
        formspec = formspec.."button[4,3;1,1;o;"..(from+15).."]"
    end
    if tonumber(level2) > (from+15) and num > 15 then
        formspec = formspec.."button[0,4;1,1;p;"..(from+16).."]"
    end
    if tonumber(level2) > (from+16) and num > 16 then
        formspec = formspec.."button[1,4;1,1;q;"..(from+17).."]"
    end
    if tonumber(level2) > (from+17) and num > 17 then
        formspec = formspec.."button[2,4;1,1;r;"..(from+18).."]"
    end
    if tonumber(level2) > (from+18) and num > 18 then
        formspec = formspec.."button[3,4;1,1;s;"..(from+19).."]"
    end
    if tonumber(level2) > (from+19) and num > 19 then
        formspec = formspec.."button[4,4;1,1;t;"..(from+20).."]"
    end
    if tonumber(level2) > (from+20) and num > 20 then
        formspec = formspec.."button[0,5;1,1;u;"..(from+21).."]"
    end
    if tonumber(level2) > (from+21) and num > 21 then
        formspec = formspec.."button[1,5;1,1;v;"..(from+22).."]"
    end
    if tonumber(level2) > (from+22) and num > 22 then
        formspec = formspec.."button[2,5;1,1;w;"..(from+23).."]"
    end
    if tonumber(level2) > (from+23) and num > 23 then
        formspec = formspec.."button[3,5;1,1;x;"..(from+24).."]"
    end
    if tonumber(level2) > (from+24) and num > 24 then
        formspec = formspec.."button[4,5;1,1;y;"..(from+25).."]"
    end
    return formspec
end
function level_formspec(player,file,max_level,level_count,previous_levels,previous_page,previous_page_name,next_page,next_name,pos)
	local player_inv = player:get_inventory()
	lv = io.open(minetest.get_worldpath().."/"..file..".txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/"..max_level.."]"
		if previous_page then
			formspec = formspec.."button[1.5,6;1,1;"..previous_page_name..";<]"
		end
		formspec = formspec..lvbut(previous_levels,level_count,level2)
		if tonumber(level2) > (previous_levels+level_count) then
			if next_page then
				formspec = formspec.."button[2.5,6;1,1;"..next_name..";>]"
			else
				formspec = formspec.."label[0,"..pos..";"..next_name.."]"
			end
		end
	return formspec
end
minetest.register_node("labyrinthus:new",{
	tiles  = {"labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_new_w1.png"},
	description = "New",
    paramtype = "light",
	light_source = 1,
    alpha = 0,
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        minetest.show_formspec(player:get_player_name(), "tu" , level_formspec(player,"level1",18,18,0,false,"",false,"play world 2, 3 and 4","4.7"))
    end,
})
minetest.register_node("labyrinthus:restart",{
	tiles  = {"labyrinthus_desert_sand.png^labyrinthus_move_reset.png"},
	description = "Reset move",
    paramtype = "light",
	light_source = 1,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        New(player,"","",2)
    end,
})
minetest.register_node("labyrinthus:new_w1",{
	tiles  = {"labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_new_w2.png"},
	description = "New",
    paramtype = "light",
	light_source = 1,
    alpha = 0,
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        local player_inv = player:get_inventory()
        local page = player_inv:get_stack("page1", 1):get_count()+1
        if page == 1 then
			minetest.show_formspec(player:get_player_name(), "w11" , level_formspec(player,"level2",250,25,0,false,"",true,"wab",""))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w12" , level_formspec(player,"level2",250,25,25,true,"waa",true,"wac",""))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w13" , level_formspec(player,"level2",250,25,50,true,"wab",true,"wad",""))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w14" , level_formspec(player,"level2",250,25,75,true,"wac",true,"wae",""))
        elseif page == 5 then
            minetest.show_formspec(player:get_player_name(), "w15" , level_formspec(player,"level2",250,25,100,true,"wad",true,"waf",""))
        elseif page == 6 then
            minetest.show_formspec(player:get_player_name(), "w16" , level_formspec(player,"level2",250,25,125,true,"wae",true,"wag",""))
        elseif page == 7 then
            minetest.show_formspec(player:get_player_name(), "w17" , level_formspec(player,"level2",250,25,150,true,"waf",true,"wah",""))
        elseif page == 8 then
            minetest.show_formspec(player:get_player_name(), "w18" , level_formspec(player,"level2",250,25,175,true,"wag",true,"wai",""))
        elseif page == 9 then
            minetest.show_formspec(player:get_player_name(), "w19" , level_formspec(player,"level2",250,25,200,true,"wah",true,"waj",""))
        elseif page == 10 then
            minetest.show_formspec(player:get_player_name(), "w110" , level_formspec(player,"level2",250,25,225,true,"wai",false,"play world 1, 3 and 4","5.7"))
        end
    end,
})
minetest.register_node("labyrinthus:new_w2",{
	tiles  = {"labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_new_w3.png"},
	description = "New",
    paramtype = "light",
	light_source = 1,
    alpha = 0,
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        local player_inv = player:get_inventory()
        local page = player_inv:get_stack("page2", 1):get_count()+1
        if page == 1 then
			minetest.show_formspec(player:get_player_name(), "w21" , level_formspec(player,"level3",174,25,0,false,"",true,"wbb",""))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w22" , level_formspec(player,"level3",174,25,25,true,"wba",true,"wbc",""))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w23" , level_formspec(player,"level3",174,25,50,true,"wbb",true,"wbd",""))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w24" , level_formspec(player,"level3",174,25,75,true,"wbc",true,"wbe",""))
        elseif page == 5 then
            minetest.show_formspec(player:get_player_name(), "w25" , level_formspec(player,"level3",174,25,100,true,"wbd",true,"wbf",""))
        elseif page == 6 then
            minetest.show_formspec(player:get_player_name(), "w26" , level_formspec(player,"level3",174,25,125,true,"wbe",true,"wbg",""))
        elseif page == 7 then
            minetest.show_formspec(player:get_player_name(), "w27" , level_formspec(player,"level3",174,24,150,true,"wbf",false,"play world 1, 2 and 4","5.7"))
        end
    end,
})
minetest.register_node("labyrinthus:new_w3",{
	tiles  = {"labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_new_w4.png"},
	description = "New",
    paramtype = "light",
	light_source = 1,
    alpha = 0,
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        local player_inv = player:get_inventory()
        local page = player_inv:get_stack("page3", 1):get_count()+1
        if page == 1 then
            minetest.show_formspec(player:get_player_name(), "w31" , level_formspec(player,"level4",86,25,0,false,"",true,"wcb",""))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w32" , level_formspec(player,"level4",86,25,25,true,"wca",true,"wcc",""))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w33" , level_formspec(player,"level4",86,25,50,true,"wcb",true,"wcd",""))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w34" , level_formspec(player,"level4",86,11,75,true,"wcc",false,"play world 1, 2 and 3","3.7"))
        end
    end,
})
minetest.register_node("labyrinthus:new_w5",{
	tiles  = {"labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_glass.png","labyrinthus_new_w5.png"},
	description = "New",
    paramtype = "light",
	light_source = 1,
    alpha = 0,
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        local player_inv = player:get_inventory()
        local page = player_inv:get_stack("page5", 1):get_count()+1
        if page == 1 then
            minetest.show_formspec(player:get_player_name(), "w51" , level_formspec(player,"level5",135,25,0,false,"",true,"wdb",""))
		elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w52" , level_formspec(player,"level5",135,25,25,true,"wda",true,"wdc",""))
		elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w53" , level_formspec(player,"level5",135,25,50,true,"wdb",true,"wdd",""))
		elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w54" , level_formspec(player,"level5",135,25,75,true,"wdc",true,"wde",""))
		elseif page == 5 then
            minetest.show_formspec(player:get_player_name(), "w55" , level_formspec(player,"level5",135,25,100,true,"wdd",true,"wdf",""))
		elseif page == 6 then
            minetest.show_formspec(player:get_player_name(), "w56" , level_formspec(player,"level5",135,10,125,true,"wde",false,"more comming soon","2.7"))
        end
    end,
})

function check_ground(letter)
	local list = {"2","z","3","4","6","a","b","#","c","h","j","p","q","1","H","I","J","K","Z","<",";","U","N","k","n","A","l","w","R",".","'","W","X","T"}
	for _,v in pairs(list) do
		if v == letter then
			return false
		end
	end
	return true
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
	local meta = player:get_meta()
    Load(player)
	if formname == "tu" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"1_"..v,"n",1)
                player_inv:set_stack("l",  1, "labyrinthus:dirt "..v)
                player_inv:set_stack("ll", 1, "labyrinthus:dirt 1")
            end
        end
        minetest.show_formspec(player:get_player_name(), "", "")
	end
    if fields.waa then
        player_inv:set_stack("page1",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w11" , level_formspec(player,"level2",250,25,0,false,"",true,"wab",""))
    elseif fields.wab then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt")
        minetest.show_formspec(player:get_player_name(), "w12" , level_formspec(player,"level2",250,25,25,true,"waa",true,"wac",""))
    elseif fields.wac then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w13" , level_formspec(player,"level2",250,25,50,true,"wab",true,"wad",""))
    elseif fields.wad then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w14" , level_formspec(player,"level2",250,25,75,true,"wac",true,"wae",""))
    elseif fields.wae then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 4")
        minetest.show_formspec(player:get_player_name(), "w15" , level_formspec(player,"level2",250,25,100,true,"wad",true,"waf",""))
    elseif fields.waf then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 5")
        minetest.show_formspec(player:get_player_name(), "w16" , level_formspec(player,"level2",250,25,125,true,"wae",true,"wag",""))
    elseif fields.wag then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 6")
        minetest.show_formspec(player:get_player_name(), "w17" , level_formspec(player,"level2",250,25,150,true,"waf",true,"wah",""))
    elseif fields.wah then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 7")
        minetest.show_formspec(player:get_player_name(), "w18" , level_formspec(player,"level2",250,25,175,true,"wag",true,"wai",""))
    elseif fields.wai then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 8")
        minetest.show_formspec(player:get_player_name(), "w19" , level_formspec(player,"level2",250,25,200,true,"wah",true,"waj",""))
    elseif fields.waj then
        player_inv:set_stack("page1",  1, "labyrinthus:dirt 9")
        minetest.show_formspec(player:get_player_name(), "w110" , level_formspec(player,"level2",250,25,225,true,"wai",false,"play world 1, 3 and 4","5.7"))
	elseif fields.wba then
        player_inv:set_stack("page2",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w21" , level_formspec(player,"level3",174,25,0,false,"",true,"wbb",""))
    elseif fields.wbb then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt")
        minetest.show_formspec(player:get_player_name(), "w22" , level_formspec(player,"level3",174,25,25,true,"wba",true,"wbc",""))
    elseif fields.wbc then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w23" , level_formspec(player,"level3",174,25,50,true,"wbb",true,"wbd",""))
    elseif fields.wbd then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w24" , level_formspec(player,"level3",174,25,75,true,"wbc",true,"wbe",""))
    elseif fields.wbe then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt 4")
        minetest.show_formspec(player:get_player_name(), "w25" , level_formspec(player,"level3",174,25,100,true,"wbd",true,"wbf",""))
    elseif fields.wbf then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt 5")
        minetest.show_formspec(player:get_player_name(), "w26" , level_formspec(player,"level3",174,25,125,true,"wbe",true,"wbg",""))
    elseif fields.wbg then
        player_inv:set_stack("page2",  1, "labyrinthus:dirt 6")
        minetest.show_formspec(player:get_player_name(), "w27" , level_formspec(player,"level3",174,24,150,true,"wbf",false,"play world 1, 2 and 4","5.7"))
	elseif fields.wca then
        player_inv:set_stack("page3",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w31" , level_formspec(player,"level4",86,25,0,false,"",true,"wcb",""))
    elseif fields.wcb then
        player_inv:set_stack("page3",  1, "labyrinthus:dirt")
        minetest.show_formspec(player:get_player_name(), "w32" , level_formspec(player,"level4",86,25,25,true,"wca",true,"wcc",""))
    elseif fields.wcc then
        player_inv:set_stack("page3",  1, "labyrinthus:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w33" , level_formspec(player,"level4",86,25,50,true,"wcb",true,"wcd",""))
    elseif fields.wcd then
        player_inv:set_stack("page3",  1, "labyrinthus:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w34" , level_formspec(player,"level4",86,11,75,true,"wcc",false,"play world 1, 2 and 3","3.7"))
	elseif fields.wda then
        player_inv:set_stack("page5",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w51" , level_formspec(player,"level5",135,25,0,false,"",true,"wdb",""))
	elseif fields.wdb then
        player_inv:set_stack("page5",  1, "labyrinthus:dirt")
        minetest.show_formspec(player:get_player_name(), "w52" , level_formspec(player,"level5",135,25,25,true,"wda",true,"wdc",""))
	elseif fields.wdc then
        player_inv:set_stack("page5",  1, "labyrinthus:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w53" , level_formspec(player,"level5",135,25,50,true,"wdb",true,"wdd",""))
	elseif fields.wdd then
        player_inv:set_stack("page5",  1, "labyrinthus:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w54" , level_formspec(player,"level5",135,25,75,true,"wdc",true,"wde",""))
	elseif fields.wde then
        player_inv:set_stack("page5",  1, "labyrinthus:dirt 4")
        minetest.show_formspec(player:get_player_name(), "w55" , level_formspec(player,"level5",135,25,100,true,"wdd",true,"wdf",""))
	elseif fields.wdf then
        player_inv:set_stack("page5",  1, "labyrinthus:dirt 5")
        minetest.show_formspec(player:get_player_name(), "w56" , level_formspec(player,"level5",135,10,125,true,"wde",false,"more comming soon","2.7"))
	elseif fields.import then
		minetest.show_formspec(player:get_player_name(), "import" , import.get_formspec(player))
	elseif fields.save then
		local meta = player:get_meta()
		local s = ""
		local k1 = 0
		local k2 = 0
		for j=1,12 do
			for i=1,20 do
				if meta:get_string("na"..letter(i)..letter(j)) == "2" or meta:get_string("na"..letter(i)..letter(j)) == "z" then
					k1 = 1
				end
				if meta:get_string("nb"..letter(i)..letter(j)) == "nn" then
					k2 = 1
				end
			end
		end
		if k1 == 1 and k2 == 1 then
			for j=1,12 do
				for i=1,20 do
					local s1 = meta:get_string("na"..letter(i)..letter(j))
					s = s..s1
				end
				s=s.."\n"
			end
			s=s.."\n"
			local nyx = -1
			local nyy = -1
			for j=1,12 do
				for i=1,20 do
					local s2 = meta:get_string("nb"..letter(i)..letter(j))
					if s2 ~= "nn" then
						s = s..s2
					else
						s = s.."0"
						nyx = i-1
						nyy = 13-j
					end
				end
				s=s.."\n"
			end
			s=s.."\n"..nyx.."\n"..nyy.."\n1"
			file = io.open(minetest.get_worldpath().."/own_level_"..meta:get_string("new_name")..".txt", "w")
			file:write(s)
			file:close()
			local t = minetest.deserialize(meta:get_string("levels"))
			if not t then
				t = {}
			end
			local kk = 0
			for i = 1, #t do
				if tostring(t[i]) == meta:get_string("new_name") then
					kk = 1
				end
			end
			if kk == 0 then
				table.insert(t, ""..tostring(meta:get_string("new_name")))
			end
			meta:set_string("levels", minetest.serialize(t))
			player:set_inventory_formspec(main.get_formspec(player))
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"Level was created successfully!"))
		else
			meta:set_string("error_message", "You have to place at least a rainbow \nand a nyancat!")
			minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
			player:set_inventory_formspec(create2.get_formspec(player))
		end
	elseif fields.change then
		local meta = player:get_meta()
		if meta:get_string("celected") ~= "" then
			meta:set_string("new_name", meta:get_string("celected"))
			file = io.open(minetest.get_worldpath().."/own_level_"..meta:get_string("celected")..".txt", "r")
			local s = ""
			for j=1,12 do
				s = file:read("*l")
				for i = 1, string.len(s) do
					meta:set_string("na"..letter(i)..letter(j),string.sub(s, i, i))
				end
			end
			file:read("*l")
			for j=1,12 do
				s = file:read("*l")
				for i = 1, string.len(s) do
					meta:set_string("nb"..letter(i)..letter(j),string.sub(s, i, i))
				end
			end
			file:read("*l")
			local sx = file:read("*l")
			local sy = file:read("*l")
			meta:set_string("nb"..letter(tonumber(sx)+1)..letter(13-tonumber(sy)),"nn")
			meta:set_string("new_node1x", "1")
			meta:set_string("new_node1y", "1")
			meta:set_string("new_node2x", "1")
			meta:set_string("new_node2y", "1")
			meta:set_string("error_message", "")
			minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
			player:set_inventory_formspec(create2.get_formspec(player))
		else
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"You have to select a level!"))
		end
	elseif fields.create then
		local meta = player:get_meta()
		meta:set_string("new_name", "")
		for i=1,20 do
			for j=1,12 do
				meta:set_string("na"..letter(i)..letter(j), "0")
				meta:set_string("nb"..letter(i)..letter(j), "0")
			end
		end
		minetest.show_formspec(player:get_player_name(), "create" , create.get_formspec(player))
	elseif fields.create2 then
		local meta = player:get_meta()
		local k = 0
		if meta:get_string("levels") then
			local t = minetest.deserialize(meta:get_string("levels"))
			if t then
				for i = 1, #t do
					if tostring(t[i]) == fields.input2 then
						k = 1
					end
				end
			end
		end
		if tostring(fields.input2) == "" then
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"You can't create a level with no name!"))
		elseif k == 1 then 
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"This level already exists!"))
		elseif fields.input2 ~= nil then
			meta:set_string("new_name", fields.input2)
			meta:set_string("new_node1x", "1")
			meta:set_string("new_node1y", "1")
			meta:set_string("new_node2x", "1")
			meta:set_string("new_node2y", "1")
			meta:set_string("error_message", "")
			minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
			player:set_inventory_formspec(create2.get_formspec(player))
		else
			meta:set_string("error_message", "")
			minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
			player:set_inventory_formspec(create2.get_formspec(player))
		end
	elseif fields.delete then
		local meta = player:get_meta()
		if meta:get_string("celected") ~= "" then
			minetest.show_formspec(player:get_player_name(), "delete" , delete.get_formspec(player))
		else
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"You have to select a level!"))
		end
	elseif fields.play then
		local meta = player:get_meta()
		if meta:get_string("celected") ~= "" then
			player_inv:set_stack("l",  1, nil)
            player_inv:set_stack("ll", 1, nil)
			meta:set_string("toplay", meta:get_string("celected"))
			meta:set_string("celected", "")
			New(player,meta:get_string("toplay"),"o",1)
			minetest.show_formspec(player:get_player_name(), "", "")
		else
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"You have to select a level!"))
		end
	elseif fields.delete2 then
		local meta = player:get_meta()
		local t = minetest.deserialize(meta:get_string("levels"))
		if not t then
			t = {}
		end
		for i = 1, #t do
			if tostring(t[i]) == meta:get_string("celected") then
				table.remove(t, i)
			end
		end
		meta:set_string("levels", minetest.serialize(t))
		minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"The Level was successfully deleted from the inventory list!"))
	elseif fields.back then
		player:set_inventory_formspec(main.get_formspec(player))
		minetest.show_formspec(player:get_player_name(), "back" , back.get_formspec(player))
	elseif fields.main then
		player:set_inventory_formspec(main.get_formspec(player))
		minetest.show_formspec(player:get_player_name(), "main" , main.get_formspec(player))
	elseif fields.import2 then
		local meta = player:get_meta()
		local k = 0
		if meta:get_string("levels") then
			local t = minetest.deserialize(meta:get_string("levels"))
			if t then
				for i = 1, #t do
					if tostring(t[i]) == fields.input1 then
						k = 1
					end
				end
			end
		end
		if tostring(fields.input1) == "" then
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"You can't import a level with no name!"))
		elseif k == 1 then
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"This level already exists!"))
		elseif file_check(minetest.get_worldpath().."/own_level_"..fields.input1..".txt") then
			local t = minetest.deserialize(meta:get_string("levels"))
			if not t then
				t = {}
			end
			table.insert(t, ""..tostring(fields.input1))
			meta:set_string("levels", minetest.serialize(t))
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"Level was imported successfully!"))
		else
			minetest.show_formspec(player:get_player_name(), "info" , info.get_formspec(player,"This level does not exist!"))
		end
    elseif fields.esc then
        minetest.show_formspec(player:get_player_name(), "", "")
	elseif fields.quit then
		local meta = player:get_meta()
		meta:set_string("celected", "")
	end
	local event = minetest.explode_textlist_event(fields.levels)
	if(event.type == "CHG") then
		local meta = player:get_meta()
		if meta:get_string("levels") then
			local t = minetest.deserialize(meta:get_string("levels"))
			if t and t[event.index] ~= nil then
				meta:set_string("celected", ""..t[event.index])
			end
		end
	end
	if formname == "create2" or formname == "" then
		for i=1,20 do
			for j=1,12 do
				local meta = player:get_meta()
				if fields["na"..letter(i)..letter(j)] then
					local n1x = tonumber(meta:get_string("new_node1x"))
					local n1y = tonumber(meta:get_string("new_node1y"))
					local node_letter = ""
					local new_letter = true
					if n1x == 1 and n1y == 1 then
						node_letter = "0"
					elseif n1x == 2 and n1y == 1 then	
						node_letter = "2"
					elseif n1x == 3 and n1y == 1 then
						node_letter = "z"
					elseif n1x == 4 and n1y == 1 then	
						node_letter = "g"
					elseif n1x == 5 and n1y == 1 then	
						node_letter = "3"
					elseif n1x == 6 and n1y == 1 then
						node_letter = "4"
					elseif n1x == 7 and n1y == 1 then	
						node_letter = "6"
					elseif n1x == 8 and n1y == 1 then	
						node_letter = "8"
					elseif n1x == 9 and n1y == 1 then
						node_letter = "7"
					elseif n1x == 10 and n1y == 1 then	
						node_letter = "9"
					elseif n1x == 11 and n1y == 1 then	
						node_letter = "D"
					elseif n1x == 12 and n1y == 1 then	
						node_letter = "E"
					elseif n1x == 13 and n1y == 1 then	
						node_letter = "F"
					elseif n1x == 1 and n1y == 2 then
						node_letter = "5"
					elseif n1x == 2 and n1y == 2 then
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "a" then
									k = k+1
								end
							end
						end
						if k < 40 then
							node_letter = "a"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 40 keys!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 3 and n1y == 2 then
						node_letter = "b"					
					elseif n1x == 4 and n1y == 2 then	
						node_letter = "Q"
					elseif n1x == 5 and n1y == 2 then	
						node_letter = ":"
					elseif n1x == 6 and n1y == 2 then
						node_letter = "#"
					elseif n1x == 7 and n1y == 2 then	
						node_letter = "c"
					elseif n1x == 8 and n1y == 2 then	
						node_letter = "d"
					elseif n1x == 9 and n1y == 2 then
						node_letter = "e"
					elseif n1x == 10 and n1y == 2 then	
						node_letter = "f"
					elseif n1x == 11 and n1y == 2 then	
						node_letter = "h"
					elseif n1x == 12 and n1y == 2 then	
						node_letter = "i"
					elseif n1x == 13 and n1y == 2 then	
						node_letter = "j"
					elseif n1x == 1 and n1y == 3 then
						node_letter = "o"
					elseif n1x == 2 and n1y == 3 then
						node_letter = "{"
					elseif n1x == 3 and n1y == 3 then	
						node_letter = "x"
					elseif n1x == 4 and n1y == 3 then
						node_letter = "m"					
					elseif n1x == 5 and n1y == 3 then	
						node_letter = "l"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("na"..letter(i)..letter(j)) == "l" then
									meta:set_string("na"..letter(i)..letter(j),"0")
								end
							end
						end	
					elseif n1x == 6 and n1y == 3 then	
						node_letter = "w"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("na"..letter(i)..letter(j)) == "w" then
									meta:set_string("na"..letter(i)..letter(j),"0")
								end
							end
						end	
					elseif n1x == 7 and n1y == 3 then
						node_letter = "p"
					elseif n1x == 8 and n1y == 3 then	
						node_letter = "q"
					elseif n1x == 9 and n1y == 3 then	
						node_letter = "s"
					elseif n1x == 10 and n1y == 3 then
						node_letter = "1"
					elseif n1x == 11 and n1y == 3 then	
						node_letter = "v"
					elseif n1x == 12 and n1y == 3 then	
						node_letter = "u"
					elseif n1x == 13 and n1y == 3 then	
						node_letter = "t"
					elseif n1x == 1 and n1y == 4 then	
						node_letter = ">"
					elseif n1x == 2 and n1y == 4 then
						node_letter = "|"
					elseif n1x == 3 and n1y == 4 then	
						node_letter = "r"
					elseif n1x == 4 and n1y == 4 then
						node_letter = ""					
					elseif n1x == 5 and n1y == 4 then
						node_letter = "A"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("na"..letter(i)..letter(j)) == "A" then
									meta:set_string("na"..letter(i)..letter(j),"0")
								end
							end
						end	
					elseif n1x == 6 and n1y == 4 then	
						node_letter = ""
					elseif n1x == 7 and n1y == 4 then	
						node_letter = "C"
					elseif n1x == 8 and n1y == 4 then	
						node_letter = "B"
					elseif n1x == 9 and n1y == 4 then
						node_letter = "H"
					elseif n1x == 10 and n1y == 4 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "I" or meta:get_string("na"..letter(i)..letter(j)) == "J" or meta:get_string("na"..letter(i)..letter(j)) == ";" then
									k = k+1
								end
							end
						end
						if k < 40 then
							node_letter = "I"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 40 green orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 11 and n1y == 4 then	
						node_letter = ""
					elseif n1x == 12 and n1y == 4 then
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "I" or meta:get_string("na"..letter(i)..letter(j)) == "J" or meta:get_string("na"..letter(i)..letter(j)) == ";" then
									k = k+1
								end
							end
						end
						if k < 40 then
							node_letter = "J"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 40 green orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 13 and n1y == 4 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "I" or meta:get_string("na"..letter(i)..letter(j)) == "J" or meta:get_string("na"..letter(i)..letter(j)) == ";" then
									k = k+1
								end
							end
						end
						if k < 40 then
							node_letter = ";"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 40 green orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 1 and n1y == 5 then	
						node_letter = "~"
					elseif n1x == 2 and n1y == 5 then
						node_letter = "K"
					elseif n1x == 3 and n1y == 5 then	
						node_letter = ""
					elseif n1x == 4 and n1y == 5 then
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "R" or meta:get_string("na"..letter(i)..letter(j)) == "." or meta:get_string("na"..letter(i)..letter(j)) == "'" then
									k = k+1
								end
							end
						end
						if k < 60 then
							node_letter = "R"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 60 yellow orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end						
					elseif n1x == 5 and n1y == 5 then	
						node_letter = ""
					elseif n1x == 6 and n1y == 5 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "R" or meta:get_string("na"..letter(i)..letter(j)) == "." or meta:get_string("na"..letter(i)..letter(j)) == "'" then
									k = k+1
								end
							end
						end
						if k < 60 then
							node_letter = "'"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 60 yellow orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 7 and n1y == 5 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "R" or meta:get_string("na"..letter(i)..letter(j)) == "." or meta:get_string("na"..letter(i)..letter(j)) == "'" then
									k = k+1
								end
							end
						end
						if k < 60 then
							node_letter = "."
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 60 yellow orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 8 and n1y == 5 then	
						node_letter = "Y"
					elseif n1x == 9 and n1y == 5 then
						node_letter = "T"
						if j == 12 or check_ground(meta:get_string("na"..letter(i)..letter(j+1))) == false or meta:get_string("nb"..letter(i)..letter(j)) ~= "0" then
							new_letter = false
							meta:set_string("error_message", "You can not place that there!")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							meta:set_string("nb"..letter(i)..letter(j+1), "D")
						end
					elseif n1x == 10 and n1y == 5 then
						node_letter = "U"
					elseif n1x == 11 and n1y == 5 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "W" or meta:get_string("na"..letter(i)..letter(j)) == "X" then
									k = k+1
								end
							end
						end
						if k < 10 then
							node_letter = "W"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 red orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 12 and n1y == 5 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "W" or meta:get_string("na"..letter(i)..letter(j)) == "X" then
									k = k+1
								end
							end
						end
						if k < 10 then
							node_letter = "X"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 red orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 13 and n1y == 5 then
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "Z" or meta:get_string("na"..letter(i)..letter(j)) == "<" then
									k = k+1
								end
							end
						end
						if k < 10 then
							node_letter = "Z"
							meta:set_string("error_message", "")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 white orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 1 and n1y == 6 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "Z" or meta:get_string("na"..letter(i)..letter(j)) == "<" then
									k = k+1
								end
							end
						end
						if k < 10 then
							node_letter = "<"
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 white orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 2 and n1y == 6 then
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "L" or meta:get_string("na"..letter(i)..letter(j)) == "P" or meta:get_string("na"..letter(i)..letter(j)) == "," then
									k = k+1
								end
							end
						end				
						if k < 10 then
							node_letter = "L"
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 cyan orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 3 and n1y == 6 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "L" or meta:get_string("na"..letter(i)..letter(j)) == "P" or meta:get_string("na"..letter(i)..letter(j)) == "," then
									k = k+1
								end
							end
						end				
						if k < 10 then
							node_letter = "P"
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 cyan orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 4 and n1y == 6 then	
						local k = 0
						for j=1,12 do
							for i=1,20 do
								if meta:get_string("na"..letter(i)..letter(j)) == "L" or meta:get_string("na"..letter(i)..letter(j)) == "P" or meta:get_string("na"..letter(i)..letter(j)) == "," then
									k = k+1
								end
							end
						end
						if k < 10 then
							node_letter = ","
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							new_letter = false
							meta:set_string("error_message", "You can only place 10 cyan orbs!")
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
							player:set_inventory_formspec(create2.get_formspec(player))
						end
					elseif n1x == 5 and n1y == 6 then	
						node_letter = "M"
					elseif n1x == 6 and n1y == 6 then	
						node_letter = "-"
					elseif n1x == 7 and n1y == 6 then	
						node_letter = "_"
					elseif n1x == 8 and n1y == 6 then	
						node_letter = "N"
					elseif n1x == 9 and n1y == 6 then	
						node_letter = "k"
					elseif n1x == 10 and n1y == 6 then	
						node_letter = "n"
					elseif n1x == 13 and n1y == 6 then	
						node_letter = "\\"
					elseif n1x == 1 and n1y == 7 then	
						node_letter = "@"
					elseif n1x == 2 and n1y == 7 then	
						node_letter = "?"
					end
					if check_ground(node_letter) == false and meta:get_string("nb"..letter(i)..letter(j)) ~= "0" then
						new_letter = false
						meta:set_string("error_message", "You can not put that under this block")
						player:set_inventory_formspec(create2.get_formspec(player))
						minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
					end
					if new_letter then
						meta:set_string("na"..letter(i)..letter(j), node_letter)
						if meta:get_string("nb"..letter(i)..letter(j+1)) == "D" and node_letter ~= "T" then
							meta:set_string("nb"..letter(i)..letter(j+1), "0")
						end
						meta:set_string("error_message", "")
						player:set_inventory_formspec(create2.get_formspec(player))
						minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
					end
				end
				if fields["nb"..letter(i)..letter(j)] then
					local n2x = tonumber(meta:get_string("new_node2x"))
					local n2y = tonumber(meta:get_string("new_node2y"))
					local node_letter = ""
					local new_letter = true
					if n2x == 1 and n2y == 1 then
						node_letter = "0"
					elseif n2x == 2 and n2y == 1 then	
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "nn" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
						node_letter = "nn"
					elseif n2x == 3 and n2y == 1 then
						node_letter = "2"
					elseif n2x == 4 and n2y == 1 then	
						node_letter = "d"
					elseif n2x == 5 and n2y == 1 then	
						node_letter = "1"
					elseif n2x == 6 and n2y == 1 then
						node_letter = "4"
					elseif n2x == 7 and n2y == 1 then	
						node_letter = "5"
					elseif n2x == 8 and n2y == 1 then	
						node_letter = "7"
					elseif n2x == 9 and n2y == 1 then
						node_letter = "v"
					elseif n2x == 10 and n2y == 1 then	
						node_letter = "w"
					elseif n2x == 11 and n2y == 1 then	
						node_letter = "x"
					elseif n2x == 12 and n2y == 1 then	
						node_letter = "6"
					elseif n2x == 13 and n2y == 1 then	
						node_letter = "C"
					elseif n2x == 1 and n2y == 2 then
						node_letter = "8"
					elseif n2x == 2 and n2y == 2 then
						node_letter = "P"	
					elseif n2x == 3 and n2y == 2 then
						node_letter = "3"					
					elseif n2x == 4 and n2y == 2 then	
						node_letter = "9"
					elseif n2x == 5 and n2y == 2 then	
						node_letter = "a"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "a" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 6 and n2y == 2 then
						node_letter = "b"
					elseif n2x == 7 and n2y == 2 then	
						node_letter = "c"
					elseif n2x == 8 and n2y == 2 then	
						node_letter = "e"
					elseif n2x == 9 and n2y == 2 then
						node_letter = "f"
					elseif n2x == 10 and n2y == 2 then	
						node_letter = "g"
					elseif n2x == 11 and n2y == 2 then	
						node_letter = "h"
					elseif n2x == 12 and n2y == 2 then	
						node_letter = "i"
					elseif n2x == 13 and n2y == 2 then	
						node_letter = "m"
					elseif n2x == 1 and n2y == 3 then
						node_letter = "j"
					elseif n2x == 2 and n2y == 3 then	
						node_letter = "k"
					elseif n2x == 3 and n2y == 3 then
						node_letter = "l"
					elseif n2x == 4 and n2y == 3 then	
						node_letter = "V"
					elseif n2x == 5 and n2y == 3 then	
						node_letter = "U"
					elseif n2x == 6 and n2y == 3 then	
						node_letter = "T"
					elseif n2x == 7 and n2y == 3 then	
						node_letter = "Q"
					elseif n2x == 8 and n2y == 3 then	
						node_letter = "R"
					elseif n2x == 9 and n2y == 3 then
						node_letter = "S"
					elseif n2x == 10 and n2y == 3 then	
						node_letter = "n"
					elseif n2x == 11 and n2y == 3 then	
						node_letter = "o"
					elseif n2x == 12 and n2y == 3 then
						node_letter = "p"
					elseif n2x == 13 and n2y == 3 then	
						node_letter = "q"
					elseif n2x == 1 and n2y == 4 then	
						node_letter = "H"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "H" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 2 and n2y == 4 then	
						node_letter = "I"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "I" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 3 and n2y == 4 then	
						node_letter = "J"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "J" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 4 and n2y == 4 then
						node_letter = "K"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "K" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 5 and n2y == 4 then	
						node_letter = "L"
						for i=1,20 do
							for j=1,12 do
								if meta:get_string("nb"..letter(i)..letter(j)) == "L" then
									meta:set_string("nb"..letter(i)..letter(j),"0")
								end
							end
						end
					elseif n2x == 6 and n2y == 4 then
						node_letter = "t"					
					elseif n2x == 7 and n2y == 4 then	
						node_letter = "u"
					elseif n2x == 8 and n2y == 4 then	
						node_letter = "D"
						if j == 1 or meta:get_string("nb"..letter(i)..letter(j-1)) ~= "0" or check_ground(meta:get_string("na"..letter(i)..letter(j))) == false then
							new_letter = false
							meta:set_string("error_message", "You can not place that there!")
							player:set_inventory_formspec(create2.get_formspec(player))
							minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
						else
							meta:set_string("na"..letter(i)..letter(j-1), "T")
						end
					elseif n2x == 9 and n2y == 4 then
						node_letter = "E"
					elseif n2x == 10 and n2y == 4 then	
						node_letter = "F"
					elseif n2x == 11 and n2y == 4 then	
						node_letter = "G"
					elseif n2x == 12 and n2y == 4 then
						node_letter = "s"
					elseif n2x == 13 and n2y == 4 then	
						node_letter = "y"
					elseif n2x == 1 and n2y == 5 then	
						node_letter = "z"
					elseif n2x == 2 and n2y == 5 then	
						node_letter = "A"
					elseif n2x == 3 and n2y == 5 then	
						node_letter = "B"
					elseif n2x == 4 and n2y == 5 then	
						node_letter = "M"
					elseif n2x == 5 and n2y == 5 then	
						node_letter = "r"
					end
					if new_letter and check_ground(meta:get_string("na"..letter(i)..letter(j))) then
						meta:set_string("nb"..letter(i)..letter(j), node_letter)
						if meta:get_string("na"..letter(i)..letter(j-1)) == "T" and node_letter ~= "D" then
							meta:set_string("na"..letter(i)..letter(j-1), "0")
						end
						meta:set_string("error_message", "")
						player:set_inventory_formspec(create2.get_formspec(player))
						minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
					elseif not check_ground(meta:get_string("na"..letter(i)..letter(j))) then
						meta:set_string("error_message", "You can not put that on this ground!")
						player:set_inventory_formspec(create2.get_formspec(player))
						minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
					end
				end
			end
		end
		for i=1,7 do
			for j=1,13 do
				local meta = player:get_meta()
				if fields["sa"..letter(i)..letter(j)] then
					meta:set_string("new_node1x", ""..j)
					meta:set_string("new_node1y", ""..i)
					meta:set_string("error_message", "")
					player:set_inventory_formspec(create2.get_formspec(player))
					minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
				end
				if fields["sb"..letter(i)..letter(j)] then
					meta:set_string("new_node2x", ""..j)
					meta:set_string("new_node2y", ""..i)
					meta:set_string("error_message", "")
					player:set_inventory_formspec(create2.get_formspec(player))
					minetest.show_formspec(player:get_player_name(), "create2" , create2.get_formspec(player))
				end
			end
		end
	end
    if formname == "w11" or formname == "w12" or formname == "w13" or formname == "w14" or formname == "w15" or formname == "w16" or formname == "w17" or formname == "w18" or formname == "w19" or formname == "w110" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"2_"..v,"n",1)
                player_inv:set_stack("l",  2, "labyrinthus:dirt "..v)
                player_inv:set_stack("ll", 1, "labyrinthus:dirt 2")
				minetest.show_formspec(player:get_player_name(), "", "")
            end
        end
	end
    if formname == "w21" or formname == "w22" or formname == "w23" or formname == "w24" or formname == "w25" or formname == "w26" or formname == "w27" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"3_"..v,"n",1)
                player_inv:set_stack("l",  3, "labyrinthus:dirt "..v)
                player_inv:set_stack("ll", 1, "labyrinthus:dirt 3")
				minetest.show_formspec(player:get_player_name(), "", "")
            end
        end
		
	end
    if formname == "w31" or formname == "w32" or formname == "w33" or formname == "w34" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"4_"..v,"n",1)
                player_inv:set_stack("l",  4, "labyrinthus:dirt "..v)
                player_inv:set_stack("ll", 1, "labyrinthus:dirt 4")
				minetest.show_formspec(player:get_player_name(), "", "")
            end
        end
		
	end
	if formname == "w51" or formname == "w52" or formname == "w53" or formname == "w54" or formname == "w55" or formname == "w56" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"5_"..v,"n",1)
                player_inv:set_stack("l",  5, "labyrinthus:dirt "..v)
                player_inv:set_stack("ll", 1, "labyrinthus:dirt 5")
				minetest.show_formspec(player:get_player_name(), "", "")
            end
        end
	end
end)