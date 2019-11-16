local hud_keys = {}
local hud_balls = {}
local hud_levels = {}
local hud_purple = {}
local hud_green = {}
local hud_cyan = {}
local hud_yellow = {}
local hud_red = {}
local hud_key = {}
local doupdate = 0
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
    player:hud_set_flags({hotbar=false, healthbar=false, breathbar=false, wielditem=false, minimap=false, minimap_radar=false})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.1.0",
	})  
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  2.4.0",
	})
    hud_levels[name] = player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=-570},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Level: /",
	})
	hud_red[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-500},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
	hud_yellow[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-430},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
	hud_cyan[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-360},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
	hud_green[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-290},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
	hud_purple[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-220},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
    hud_balls[name] = player:hud_add({
		hud_elem_type = "image",
		position = {x=0, y=0.85},
		offset = {x=70, y=-150},
		alignment = {x=0, y=0},
        scale = {x=6, y=6},
		text = "labyrinthus_glass.png",
	})
    hud_key[name] = player:hud_add({
        hud_elem_type = "image",
        position = {x=0, y=0.85},
        offset = {x=70, y=-80},
        scale = {x=6, y=6},
        text = "labyrinthus_glass.png",
        alignment = {x=0,y=0},
    })
end)
local rrr = 0
local rrrr = 0
local timer = 0
local timer2 = 0
local pon = 0
local tptp = 0
local set = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
    timer2 = timer2 + dtime
    local players = minetest.get_connected_players()
    for j=8,20 do
        for k=-80,-77 do
            if minetest.get_node({x=10, y=j, z=k}).name == "default:mossycobble" or minetest.get_node({x=10, y=j, z=k}).name == "wool:black" then
                minetest.set_node({x=10, y=j, z=k}, {name="labyrinthus:wall"})
            end
            if minetest.get_node({x=29, y=j, z=k}).name == "default:mossycobble" or minetest.get_node({x=29, y=j, z=k}).name == "wool:black" then
                minetest.set_node({x=29, y=j, z=k}, {name="labyrinthus:wall"})
            end
        end
    end
    for j=10,29 do
        for k=-80,-77 do
            if minetest.get_node({x=j, y=19, z=k}).name == "wool:black" then
                minetest.set_node({x=j, y=19, z=k}, {name="labyrinthus:wall"})
            end
        end
    end
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        local fire = player_inv:get_stack("f", 1):get_count()
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        player_inv:set_size("k", 1)
        player_inv:set_size("s", 1)
        player_inv:set_size("ll", 1)
        player_inv:set_size("l", 5)
        player_inv:set_size("x", 1)
        player_inv:set_size("y", 1)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local key = player_inv:get_stack("k", 1):get_count()
        local balls = player_inv:get_stack("s", 1):get_count()
		local cyan = player_inv:get_stack("c", 1):get_count()
		local yellow = player_inv:get_stack("ye", 1):get_count()
		local red = player_inv:get_stack("re", 1):get_count()
		local purple = player_inv:get_stack("p", 1):get_count()
		local green = player_inv:get_stack("g", 1):get_count()
        local ll = player_inv:get_stack("ll", 1):get_count()
        local l = player_inv:get_stack("l", ll):get_count()
        if key == 0 then
            player:hud_change(hud_key[player:get_player_name()], 'text', "labyrinthus_key_0.png")
        else
            player:hud_change(hud_key[player:get_player_name()], 'text', "labyrinthus_key_"..key..".png")
        end
        if balls == 0 then
            player:hud_change(hud_balls[player:get_player_name()], 'text', "labyrinthus_ball_0.png")
        else
            player:hud_change(hud_balls[player:get_player_name()], 'text', "labyrinthus_ball_1.png")
        end
		if cyan == 0 then
            player:hud_change(hud_cyan[player:get_player_name()], 'text', "labyrinthus_cyan_0.png")
        else
            player:hud_change(hud_cyan[player:get_player_name()], 'text', "labyrinthus_cyan_"..cyan..".png")
        end
		if yellow == 0 then
            player:hud_change(hud_yellow[player:get_player_name()], 'text', "labyrinthus_yellow_0.png")
        else
            player:hud_change(hud_yellow[player:get_player_name()], 'text', "labyrinthus_yellow_"..yellow..".png")
        end
		if red == 0 then
            player:hud_change(hud_red[player:get_player_name()], 'text', "labyrinthus_red_0.png")
        else
            player:hud_change(hud_red[player:get_player_name()], 'text', "labyrinthus_red_"..red..".png")
        end
		if purple == 0 then
            player:hud_change(hud_purple[player:get_player_name()], 'text', "labyrinthus_purple_0.png")
        else
            player:hud_change(hud_purple[player:get_player_name()], 'text', "labyrinthus_purple_1.png")
        end
		if green == 0 then
            player:hud_change(hud_green[player:get_player_name()], 'text', "labyrinthus_green_0.png")
        else
            player:hud_change(hud_green[player:get_player_name()], 'text', "labyrinthus_green_"..green..".png")
        end
        if ll == 0 then
        else
            player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: "..ll.."."..l)
        end
		player_inv:set_size("load", 1)
		if minetest.get_node({x=19, y=10, z=-88}).name == "labyrinthus:glass" and set == 0 and player_inv:get_stack("load", 1):get_count() < 1 then
			minetest.chat_send_all("The world is loading... This can take a few seconds")
			set = 1
			for j=75,89 do
				for l=9,30 do
					for m=0,30 do
						minetest.set_node({x=l, y=m, z=(-1)*j}, {name="air"})
					end
				end
			end
		end
		if minetest.get_node({x=19, y=10, z=-88}).name == "labyrinthus:glass" and set == 1 and player_inv:get_stack("load", 1):get_count() < 1 then
			set = 2
			player:setpos({x=19, y=10.5, z=-88})
			for i = 9, 30 do
				for j = 0,14 do
					minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
				end
			end
			for i = 9, 30 do
				for j = 0,14 do
					for m = 23,150 do
						minetest.set_node({x=i, y=m, z=-89+j}, {name="air"})
					end
				end
			end
			minetest.chat_send_all("The world should be loaded, if not start a new world!")
			player:setpos({x=19, y=10.5, z=-88})
			player_inv:set_stack("load", 1, "default:dirt")
		end
    end
    if timer2 >= 1 then
		for j=12,27 do
			for l=8,19 do
				minetest.set_node({x=j, y=l, z=-81}, {name="labyrinthus:glass"})
			end
		end
		for j=17,22 do
			for l=9,13 do
				minetest.set_node({x=j, y=l, z=-89}, {name="default:mossycobble"})
			end
		end
		for i = 9, 30 do
            for j = 0,14 do
                minetest.set_node({x=i, y=7, z=-89+j}, {name="labyrinthus:desert"})
            end
        end
		for i = 9, 30 do
            for j = 0,5 do
                minetest.set_node({x=i, y=8, z=-80+j}, {name="labyrinthus:desert"})
            end
        end
		minetest.set_node({x=11, y=8, z=-81}, {name="labyrinthus:desert"})
		minetest.set_node({x=11, y=8, z=-82}, {name="labyrinthus:desert"})
		minetest.set_node({x=12, y=8, z=-82}, {name="labyrinthus:desert"})
		minetest.set_node({x=12, y=8, z=-83}, {name="labyrinthus:desert"})
		minetest.set_node({x=13, y=8, z=-83}, {name="labyrinthus:desert"})
		minetest.set_node({x=13, y=8, z=-84}, {name="labyrinthus:desert"})
		minetest.set_node({x=14, y=8, z=-84}, {name="labyrinthus:desert"})
		minetest.set_node({x=14, y=8, z=-85}, {name="labyrinthus:desert"})
		minetest.set_node({x=15, y=8, z=-85}, {name="labyrinthus:desert"})
		minetest.set_node({x=15, y=8, z=-86}, {name="labyrinthus:desert"})
		minetest.set_node({x=16, y=8, z=-86}, {name="labyrinthus:desert"})
		minetest.set_node({x=16, y=8, z=-87}, {name="labyrinthus:desert"})
		minetest.set_node({x=16, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=17, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=18, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=19, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=20, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=21, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=22, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=23, y=8, z=-88}, {name="labyrinthus:desert"})
		minetest.set_node({x=23, y=8, z=-87}, {name="labyrinthus:desert"})
		minetest.set_node({x=23, y=8, z=-86}, {name="labyrinthus:desert"})
		minetest.set_node({x=24, y=8, z=-86}, {name="labyrinthus:desert"})
		minetest.set_node({x=24, y=8, z=-85}, {name="labyrinthus:desert"})
		minetest.set_node({x=25, y=8, z=-85}, {name="labyrinthus:desert"})
		minetest.set_node({x=25, y=8, z=-84}, {name="labyrinthus:desert"})
		minetest.set_node({x=26, y=8, z=-84}, {name="labyrinthus:desert"})
		minetest.set_node({x=26, y=8, z=-83}, {name="labyrinthus:desert"})
		minetest.set_node({x=27, y=8, z=-83}, {name="labyrinthus:desert"})
		minetest.set_node({x=27, y=8, z=-82}, {name="labyrinthus:desert"})
		minetest.set_node({x=28, y=8, z=-82}, {name="labyrinthus:desert"})
		minetest.set_node({x=28, y=8, z=-81}, {name="labyrinthus:desert"})
		minetest.set_node({x=19, y=10, z=-88}, {name="labyrinthus:glass"})
		minetest.set_node({x=19, y=10, z=-86}, {name="air"})
		minetest.set_node({x=18, y=10, z=-81}, {name="labyrinthus:new"})
		minetest.set_node({x=19, y=10, z=-81}, {name="labyrinthus:new_w1"})
		minetest.set_node({x=20, y=10, z=-81}, {name="labyrinthus:new_w2"})
		minetest.set_node({x=18, y=9, z=-81}, {name="labyrinthus:new_w3"})
		minetest.set_node({x=19, y=9, z=-81}, {name="labyrinthus:new_w5"})
		minetest.set_node({x=19, y=7, z=-83}, {name="labyrinthus:restart"})
		for j=9,21 do
			minetest.set_node({x=12, y=j, z=-84}, {name="labyrinthus:wall"})
			minetest.set_node({x=13, y=j, z=-85}, {name="labyrinthus:wall"})
			minetest.set_node({x=14, y=j, z=-86}, {name="labyrinthus:wall"})
			minetest.set_node({x=15, y=j, z=-87}, {name="labyrinthus:wall"})
			minetest.set_node({x=15, y=j, z=-88}, {name="labyrinthus:wall"})
			minetest.set_node({x=16, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=17, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=18, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=19, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=20, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=21, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=22, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=23, y=j, z=-89}, {name="labyrinthus:wall"})
			minetest.set_node({x=24, y=j, z=-88}, {name="labyrinthus:wall"})
			minetest.set_node({x=24, y=j, z=-87}, {name="labyrinthus:wall"})
			minetest.set_node({x=25, y=j, z=-86}, {name="labyrinthus:wall"})
			minetest.set_node({x=26, y=j, z=-85}, {name="labyrinthus:wall"})
			minetest.set_node({x=27, y=j, z=-84}, {name="labyrinthus:wall"})
			minetest.set_node({x=12, y=j, z=-83}, {name="air"})
			minetest.set_node({x=11, y=j, z=-83}, {name="labyrinthus:wall"})
			minetest.set_node({x=11, y=j, z=-82}, {name="air"})
			minetest.set_node({x=10, y=j, z=-82}, {name="labyrinthus:wall"})
			minetest.set_node({x=11, y=j, z=-81}, {name="air"})
			minetest.set_node({x=10, y=j, z=-81}, {name="labyrinthus:wall"})
			minetest.set_node({x=10, y=j, z=-80}, {name="air"})
			minetest.set_node({x=9, y=j, z=-80}, {name="labyrinthus:wall"})
			minetest.set_node({x=10, y=j, z=-79}, {name="air"})
			minetest.set_node({x=9, y=j, z=-79}, {name="labyrinthus:wall"})
			if minetest.get_node({x=10, y=j, z=-78}).name == "labyrinthus:wall" then
				minetest.set_node({x=10, y=j, z=-78}, {name="air"})
			end
			minetest.set_node({x=9, y=j, z=-78}, {name="labyrinthus:wall"})
			if minetest.get_node({x=10, y=j, z=-77}).name == "labyrinthus:wall" then
				minetest.set_node({x=10, y=j, z=-77}, {name="air"})
			end
			minetest.set_node({x=9, y=j, z=-77}, {name="labyrinthus:wall"})
			if minetest.get_node({x=10, y=j, z=-76}).name == "wool:black" then
				minetest.set_node({x=10, y=j, z=-76}, {name="air"})
			end
			minetest.set_node({x=9, y=j, z=-76}, {name="wool:black"})
			for i=9,30 do
				minetest.set_node({x=i, y=j, z=-75}, {name="wool:grey"})
			end
			minetest.set_node({x=27, y=j, z=-83}, {name="air"})
			minetest.set_node({x=28, y=j, z=-83}, {name="labyrinthus:wall"})
			minetest.set_node({x=28, y=j, z=-82}, {name="air"})
			minetest.set_node({x=29, y=j, z=-82}, {name="labyrinthus:wall"})
			minetest.set_node({x=28, y=j, z=-81}, {name="air"})
			minetest.set_node({x=29, y=j, z=-81}, {name="labyrinthus:wall"})
			minetest.set_node({x=29, y=j, z=-80}, {name="air"})
			minetest.set_node({x=30, y=j, z=-80}, {name="labyrinthus:wall"})
			minetest.set_node({x=29, y=j, z=-79}, {name="air"})
			minetest.set_node({x=30, y=j, z=-79}, {name="labyrinthus:wall"})
			if minetest.get_node({x=29, y=j, z=-78}).name == "labyrinthus:wall" then
				minetest.set_node({x=29, y=j, z=-78}, {name="air"})
			end
			minetest.set_node({x=30, y=j, z=-78}, {name="labyrinthus:wall"})
			if minetest.get_node({x=29, y=j, z=-77}).name == "labyrinthus:wall" then
				minetest.set_node({x=29, y=j, z=-77}, {name="air"})
			end
			minetest.set_node({x=30, y=j, z=-77}, {name="labyrinthus:wall"})
			if minetest.get_node({x=29, y=j, z=-76}).name == "wool:black" then
				minetest.set_node({x=29, y=j, z=-76}, {name="air"})
			end
			minetest.set_node({x=30, y=j, z=-76}, {name="wool:black"})
		end
		for i=11,28 do
			if minetest.get_node({x=i, y=19, z=-78}).name == "labyrinthus:wall" then
				minetest.set_node({x=i, y=19, z=-78}, {name="air"})
			end
			if minetest.get_node({x=i, y=19, z=-77}).name == "labyrinthus:wall" then
				minetest.set_node({x=i, y=19, z=-77}, {name="air"})
			end
			if minetest.get_node({x=i, y=19, z=-76}).name == "wool:black" then
				minetest.set_node({x=i, y=19, z=-76}, {name="air"})
			end
		end
		for i=10,29 do
			minetest.set_node({x=i, y=21, z=-78}, {name="labyrinthus:wall"})
			minetest.set_node({x=i, y=21, z=-77}, {name="labyrinthus:wall"})
			minetest.set_node({x=i, y=21, z=-76}, {name="wool:black"})
		end
        timer2 = 0
        for j=10,29 do
            for l=9,20 do
                for m=0,30 do
                    local players = minetest.get_connected_players()
                    for _,player in ipairs(players) do
                        local player_inv = player:get_inventory()
                        local fire = player_inv:get_stack("f", 1):get_count() 
                        local time = player_inv:get_stack("time", 1):get_count()             
                        if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:time"..m and (time == 2 or pon == 2) then
                            if m ~= 0 then
                                minetest.set_node({x=j, y=l, z=-76}, {name="labyrinthus:time"..(m-1)})
                                minetest.chat_send_all((m-1).."sec left")
                            else
                                local player_inv = player:get_inventory()
                                player_inv:set_stack("x", 1, nil)
                                player_inv:set_stack("y", 1, nil)
                                for j=10,29 do
                                    for l=9,20 do
                                        if minetest.get_node({x=j, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:nyancat2" then
                                            minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                                            minetest.chat_send_all("you run out of time")
                                        end
                                    end
                                end
                            end 
                        end
                    end
                end
            end
        end
    end
    local dd = 0
    local dd2 = 0
	if timer >= 0.355 then
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
                        update()
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
                        update()
                    end
                end
            end
        end
		timer = 0
        if doupdate == 0 then
            doupdate = 1
            update()
        end
	end
end)
minetest.register_on_joinplayer(function(player)
    player:set_inventory_formspec("")
	if player:get_player_name() == "singleplayer" then
    else
        minetest.kick_player(player:get_player_name(), "you can play labyrinthus only as 'singleplayer'")
    end
end)
minetest.register_globalstep(function(dtime)
    local players = minetest.get_connected_players()
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        player_inv:set_size("con", 6)
        local up = player_inv:get_stack("con", 1):get_count()
        local down = player_inv:get_stack("con", 3):get_count()
        local right = player_inv:get_stack("con", 2):get_count()
        local left = player_inv:get_stack("con", 4):get_count()
        local jump = player_inv:get_stack("con", 5):get_count()
        local sneak = player_inv:get_stack("con", 6):get_count()
        local keys = player:get_player_control()
        local k = 0
        if keys["up"] == true and up == 0 then
            move_data(player)
            player_inv:set_stack("con", 1 , "default:dirt")
            Up2(pos, node, player, false)
            k = 1
        elseif keys["up"] == false and up == 1 then
            player_inv:set_stack("con", 1 , "") 
        end
        if keys["down"] == true and down == 0 then
            move_data(player)
            player_inv:set_stack("con", 3 , "default:dirt")
            Down2(pos, node, player, false)
            k = 1
        elseif keys["down"] == false and down == 1 then
            player_inv:set_stack("con", 3 , "") 
        end
        if keys["right"] == true and right == 0 then
            move_data(player)
            player_inv:set_stack("con", 2 , "default:dirt")
            Right2(pos, node, player, false)
            k = 1
        elseif keys["right"] == false and right == 1 then
            player_inv:set_stack("con", 2 , "") 
        end
        if keys["left"] == true and left == 0 then
            move_data(player)
            player_inv:set_stack("con", 4 , "default:dirt")
            Left2(pos, node, player, false)
            k = 1
        elseif keys["left"] == false and left == 1 then
            player_inv:set_stack("con", 4 , "") 
        end
        if keys["jump"] == true and jump == 0 then
            move_data(player)
            player_inv:set_stack("con", 5 , "default:dirt")
            Shot(pos, node, player, pointed_thing)
            k = 1
        elseif keys["jump"] == false and jump == 1 then
            player_inv:set_stack("con", 5 , "") 
        end
        if keys["sneak"] == true and sneak == 0 then
            player_inv:set_stack("con", 6 , "default:dirt")
            local player_inv = player:get_inventory()
            player_inv:set_size("ll", 1)
            player_inv:set_size("l", 5)
            local ll = player_inv:get_stack("ll", 1):get_count()
            local l = player_inv:get_stack("l", ll):get_count()
            if ll == 0 then
            else
                New(player,ll.."_"..l)
            end
        elseif keys["sneak"] == false and sneak == 1 then
            player_inv:set_stack("con", 6 , "") 
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
				update()
			end
        end
        local dd = 0
        local ddd = 0
		local ddd2 = 0
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
                    if minetest.get_node({x=i, y=k, z=-77}).name == "default:junglewood" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2" or minetest.get_node({x=i, y=k, z=-77}).name == "default:meselamp" or minetest.get_node({x=i, y=k, z=-77}).name == "default:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "tnt:tnt" 
                    or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:glass" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:eye2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" 
                    or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow3" 
					or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone_gate_arrows" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green_pyramid" 
					or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_down" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_up" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_right" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_left" then
						ddd = 1
                    end 
                end
				if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button1" then
                    if minetest.get_node({x=i, y=k, z=-77}).name == "default:junglewood" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2" or minetest.get_node({x=i, y=k, z=-77}).name == "default:meselamp" or minetest.get_node({x=i, y=k, z=-77}).name == "default:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "tnt:tnt" 
                    or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:glass" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:eye2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" 
                    or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow3" 
					or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone_gate_arrows" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green_pyramid" 
					or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_down" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_up" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_right" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_left"
					or minetest.get_node({x=i, y=k, z=-77}).name == "nyancat:nyancat" then
                        ddd2 = 1
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
                        minetest.set_node({x=j, y=l, z=-76}, {name="default:sand"})
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
                        ddd2 = 1
                    end
                end
            end
        else
            for j=10,29 do
                for l=9,20 do
                    if minetest.get_node({x=j, y=l, z=-76}).name == "labyrinthus:button3" and minetest.get_node({x=j, y=l, z=-77}).name == "air" and ddd2 == 0 then
                        minetest.set_node({x=j, y=l, z=-77}, {name="labyrinthus:button3"})
                        minetest.set_node({x=j, y=l, z=-76}, {name="default:sand"})
                    end
                end
            end
        end
        if dd == 2 then
            for i=10,29 do
                for k=9,20 do
                    if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                        minetest.set_node({x=i, y=k, z=-77}, {name="labyrinthus:button13"})
                        minetest.set_node({x=i, y=k, z=-76}, {name="default:sand"})
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
    end
end)
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
        for j=9,29 do
            if minetest.get_node({x=j, y=k, z=-76}).name == "default:sand" then
                t = t.."0"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:water" then
                t = t.."1"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:rainbow" or minetest.get_node({x=j, y=k, z=-76}).name == "nyancat:nyancat_rainbow" then
                t = t.."2"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:red1" then
                t = t.."3"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:green1" then
                t = t.."4"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:button1" then
                t = t.."5"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:blue1" then
                t = t.."6"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:green_col" then
                t = t.."7"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:red_col" then
                t = t.."8"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:blue_col" then
                t = t.."9"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:key2" then
                t = t.."a"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:tp" then
                t = t.."b"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:ball1" then
                t = t.."c"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:boom" then
                t = t.."d"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:00" then
                t = t.."e"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:eye1" then
                t = t.."f"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:box" then
                t = t.."g"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "bones:bones" then
                t = t.."h"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:button11" then
                t = t.."i"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:fire" then
                t = t.."j"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:arrow" then
                t = t.."k"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:round2" then
                t = t.."l"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:round3" then
                t = t.."m"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:arrow2" then
                t = t.."n"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:red_sand" then
                t = t.."o"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:moon" then
                t = t.."p"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:sun" then
                t = t.."q"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:water_wood" then
                t = t.."r"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:time30" then
                t = t.."s"
                tt = "30"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:ice1" then
                t = t.."t"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:ice2" then
                t = t.."u"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:ice3" then
                t = t.."v"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:round4" then
                t = t.."w"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:round1" then
                t = t.."x"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:dirt" then
                t = t.."y"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:rainbow2" or minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:rainbow3" then
                t = t.."z"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:purple" then
                t = t.."A"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:empty_gate" then
                t = t.."B"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:gate_arrows" then
                t = t.."C"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:red_cross" then
                t = t.."D"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:green_cross" then
                t = t.."E"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:blue_cross" then
                t = t.."F"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:purple_dirt" then
                t = t.."G"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:gate" then
                t = t.."H"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:green" then
                t = t.."I"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:water_wood_with_green" then
                t = t.."J"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:sand_for_green" then
                t = t.."K"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:cyan" then
                t = t.."L"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:bow" then
                t = t.."M"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:arrow4_2" then
                t = t.."N"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:green_dirt" then
                t = t.."O"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:cyan_dirt" then
                t = t.."P"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:tp2" then
                t = t.."Q"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:yellow2" then
                t = t.."R"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:yellow_dirt" then
                t = t.."S"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:wood_for_yellow" then
                t = t.."T"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:water_stone" then
                t = t.."U"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:sand_for_green_dirt" then
                t = t.."V"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:red3" then
                t = t.."W"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:button12" then
                t = t.."!"
            elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:button2" then
                t = t.."§"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:empty_gate_purple" then
                t = t.."$"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:gate" then
                t = t.."%"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:button3" then
                t = t.."&"
			elseif minetest.get_node({x=j, y=k, z=-76}).name == "default:wood" then
                t = t.."/"
            end
            for i=0,29 do
                if minetest.get_node({x=j, y=k, z=-76}).name == "labyrinthus:time"..i then
                    t = t.."s"
                    tt = ""..i
                end
            end
        end
        t = t.."\n"
    end
    t = t.."\n"
    local k = 21
    for l=1,12 do
        k = k-1
        for j=9,29 do
            if minetest.get_node({x=j, y=k, z=-77}).name == "air" then
                t = t.."0"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:junglewood" then
                t = t.."1"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:stone" then
                t = t.."2"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:meselamp" then
                t = t.."3"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:red2" then
                t = t.."4"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:green2" then
                t = t.."5"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:button2" then
                t = t.."6"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:blue2" then
                t = t.."7"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:key1" then
                t = t.."8"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:diamondblock" then
                t = t.."9"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:pbj_pup" then
                t = t.."a"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:cobble" then
                t = t.."b"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "tnt:tnt" then
                t = t.."c"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "default:apple" then
                t = t.."d"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:4" then
                t = t.."e"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:3" then
                t = t.."f"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:2" then
                t = t.."g"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:1" then
                t = t.."h"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:eye2" then
                t = t.."i"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:red" then
                t = t.."j"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:blue" then
                t = t.."k"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:yellow" then
                t = t.."l"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:glass" then
                t = t.."m"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyan1" then
                t = t.."n"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyan2" then
                t = t.."o"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyan3" then
                t = t.."p"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyan4" then
                t = t.."q"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:arrow3" then
                t = t.."r"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:leaves" then
				t = t.."s"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:water_ball" then
                t = t.."t"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:transport_stone" then
                t = t.."u"	
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:red_pyramid" then
                t = t.."v"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:green_pyramid" then
                t = t.."w"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:blue_pyramid" then
                t = t.."x"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:bow_right" then
                t = t.."y"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:bow_left" then
                t = t.."z"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:bow_down" then
                t = t.."A"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:bow_up" then
                t = t.."B"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:button3" then
                t = t.."C"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:yellow_block" then
                t = t.."D"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:yellow_red" then
                t = t.."E"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:nyancat2" then
                t = t.."!"
            elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:button13" then
                t = t.."§"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:transport_stone_gate_arrows" then
                t = t.."$"
			elseif minetest.get_node({x=j, y=k, z=-77}).name == "labyrinthus:red_with_no_yellow" then
                t = t.."%"
            end
        end
        t = t.."\n"
    end
    t = t.."\n"
    if minetest.get_node({x=20, y=22, z=-82}).name == "default:stone" then
        t = t.."true\n"
    else
        t = t.."false\n"
    end
    local player_inv = player:get_inventory()
	local re = player_inv:get_stack("re", 1):get_count()
	local ye = player_inv:get_stack("ye", 1):get_count()
	local c = player_inv:get_stack("c", 1):get_count()
	local p = player_inv:get_stack("p", 1):get_count()
	local g = player_inv:get_stack("g", 1):get_count()
    local k = player_inv:get_stack("k", 1):get_count()
    local r = player_inv:get_stack("r", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
    local b = player_inv:get_stack("b", 1):get_count()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
    local f = player_inv:get_stack("f", 1):get_count()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
	t = t..re.."\n"
	t = t..ye.."\n"
	t = t..c.."\n"
	t = t..p.."\n"
	t = t..g.."\n"
    t = t..k.."\n"
    t = t..r.."\n"
    t = t..s.."\n"
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
local green = 0
function update()
    local players = minetest.get_connected_players()
    local ll = 0
    for _,player in ipairs(players) do
        local player_inv = player:get_inventory()
        player_inv:set_size("k", 1)
        player_inv:set_size("s", 1)
        player_inv:set_size("ll", 1)
        player_inv:set_size("l", 5)
        player_inv:set_size("x", 1)
        player_inv:set_size("y", 1)
		player_inv:set_size("p", 1)
		player_inv:set_size("g", 1)
		player_inv:set_size("c", 1)
		player_inv:set_size("ye", 1)
		player_inv:set_size("re", 1)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local key = player_inv:get_stack("k", 1):get_count()
        local balls = player_inv:get_stack("s", 1):get_count()
		local purple = player_inv:get_stack("p", 1):get_count()
		local cyan = player_inv:get_stack("c", 1):get_count()
		local yellow = player_inv:get_stack("ye", 1):get_count()
		local red = player_inv:get_stack("re", 1):get_count()
		green = player_inv:get_stack("g", 1):get_count()
        ll = player_inv:get_stack("ll", 1):get_count()
        local l = player_inv:get_stack("l", ll):get_count()
        if key == 0 then
            player:hud_change(hud_key[player:get_player_name()], 'text', "labyrinthus_key_0.png")
        else
            player:hud_change(hud_key[player:get_player_name()], 'text', "labyrinthus_key_"..key..".png")
        end
        if balls == 0 then
            player:hud_change(hud_balls[player:get_player_name()], 'text', "labyrinthus_ball_0.png")
        else
            player:hud_change(hud_balls[player:get_player_name()], 'text', "labyrinthus_ball_1.png")
        end
		if purple == 0 then
            player:hud_change(hud_purple[player:get_player_name()], 'text', "labyrinthus_purple_0.png")
        else
            player:hud_change(hud_purple[player:get_player_name()], 'text', "labyrinthus_purple_1.png")
        end
		if cyan == 0 then
            player:hud_change(hud_cyan[player:get_player_name()], 'text', "labyrinthus_cyan_0.png")
        else
            player:hud_change(hud_cyan[player:get_player_name()], 'text', "labyrinthus_cyan_"..cyan..".png")
        end
		if yellow == 0 then
            player:hud_change(hud_yellow[player:get_player_name()], 'text', "labyrinthus_yellow_0.png")
        else
            player:hud_change(hud_yellow[player:get_player_name()], 'text', "labyrinthus_yellow_"..yellow..".png")
        end
		if red == 0 then
            player:hud_change(hud_red[player:get_player_name()], 'text', "labyrinthus_red_0.png")
        else
            player:hud_change(hud_red[player:get_player_name()], 'text', "labyrinthus_red_"..red..".png")
        end
		if green == 0 then
            player:hud_change(hud_green[player:get_player_name()], 'text', "labyrinthus_green_0.png")
        else
            player:hud_change(hud_green[player:get_player_name()], 'text', "labyrinthus_green_"..green..".png")
        end
        if ll == 0 then
        else
            player:hud_change(hud_levels[player:get_player_name()], 'text', "Level: "..ll.."."..l)
        end
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "nyancat:nyancat_rainbow" or minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:rainbow2" then
            minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
            player_inv:set_stack("x", 1, nil)
            player_inv:set_stack("y", 1, nil)
            player_inv:set_stack("z", 1, nil)
            player_inv:set_stack("time", 1, nil)
            pon = 0
            lv = io.open(minetest.get_worldpath().."/level"..ll..".txt", "r")
	        local level = lv:read("*l")
            lv:close()
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
            if tonumber(level) == tonumber(l) then
                le = io.open(minetest.get_worldpath().."/level"..ll..".txt", "w")
		        le:write(level+1)
		        le:close()
            end
        end
        ll = player_inv:get_stack("ll", 1):get_count()
    end
    local d = 0
    local d1 = 0
    local d2 = 0
    local d3 = 0
    local d4 = 0
    local dd = 0
    local ddd = 0
	local ddd2 = 0
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
                if minetest.get_node({x=i, y=k, z=-77}).name == "default:junglewood" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2" or minetest.get_node({x=i, y=k, z=-77}).name == "default:meselamp" or minetest.get_node({x=i, y=k, z=-77}).name == "default:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "tnt:tnt" 
                or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:glass" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:eye2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" 
                or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow3" 
				or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone_gate_arrows" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green_pyramid" 
				or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_down" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_up" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_right" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_left" then   
					ddd = 1
                end 
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button1" then
                if minetest.get_node({x=i, y=k, z=-77}).name == "default:junglewood" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2" or minetest.get_node({x=i, y=k, z=-77}).name == "default:meselamp" or minetest.get_node({x=i, y=k, z=-77}).name == "default:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "tnt:tnt" 
                or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:glass" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:eye2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" 
                or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow3" 
				or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:arrow4" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone_gate_arrows" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:transport_stone" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue_pyramid" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green_pyramid" 
				or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_down" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_up" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_right" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:bow_left"
				or minetest.get_node({x=i, y=k, z=-77}).name == "nyancat:nyancat" then    
					ddd2 = 1
                end 
            end
        end
    end
    for i=10,29 do
        for k=9,20 do
            if minetest.get_node({x=i, y=k, z=-77}).name == "default:apple" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:water_ball" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:green2" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue2"  or minetest.get_node({x=i, y=k, z=-77}).name == "default:meselamp" or minetest.get_node({x=i, y=k, z=-77}).name == "default:diamondblock" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:pbj_pup" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:blue" or minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:yellow" then
                d = 1
            end
			if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:green" or minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:green_dirt" then
				d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:ball1" and ((ll+0) ~= 3) then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:00" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:0" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:eye1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:eye2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan3" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan4" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow3" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:box" and minetest.get_node({x=i, y=k, z=-77}).name ~= "default:junglewood" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan1" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan2" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan3" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:nyan4" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:arrow3" then
                d = 1
            end
            if minetest.get_node({x=i, y=k, z=-76}).name ~= "labyrinthus:red_sand" and minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:red" and ((ll+0) ~= 3) then
                d = 1
            elseif minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:red_sand" and minetest.get_node({x=i, y=k, z=-77}).name ~= "labyrinthus:red" and ((ll+0) == 3) then
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
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan1" then
                d1 = 1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan2" then
                d2 = 1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan3" then
                d3 = 1
            end
            if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" then
                d4 = 1
            end
        end
    end
    for i=10,29 do
        for k=9,20 do
            if d1 == 1 and d2 == 1 and d3 == 1 and d4 == 1 then
                if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:nyan4" then
                    if minetest.get_node({x=i-1, y=k-1, z=-77}).name == "labyrinthus:nyan1" and minetest.get_node({x=i-1, y=k, z=-77}).name == "labyrinthus:nyan2" and minetest.get_node({x=i, y=k-1, z=-77}).name == "labyrinthus:nyan3" then
                    else
                        d = 1
                    end
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
                    minetest.set_node({x=j, y=l, z=-76}, {name="default:sand"})
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
                    minetest.set_node({x=j, y=l, z=-76}, {name="default:sand"})
                end
            end
        end
    end
    if dd == 2 then
        for i=10,29 do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:button12" and minetest.get_node({x=i, y=k, z=-77}).name == "air" then
                    minetest.set_node({x=i, y=k, z=-77}, {name="labyrinthus:button13"})
                    minetest.set_node({x=i, y=k, z=-76}, {name="default:sand"})
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
	player:setpos({x=19, y=10.5, z=-88})
    player:set_physics_override({
        speed = 0,
        jump = 0,
        gravity = 1.0,
        sneak = true,
        sneak_glitch = true
    })
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
    for i=9,30 do
        for j=8,20 do
            for k=-90,-76 do
                if minetest.get_node({x=i, y=j, z=(k)}).name == "default:mossycobble" then
                    minetest.set_node({x=i, y=j, z=(k)}, {name="labyrinthus:wall"})
                end
            end
        end
    end
	
end)

minetest.register_node("labyrinthus:yellow_block", {
	description = "Yellow Block",
	drawtype = "nodebox",
	tiles = {"default_stone.png^labyrinthus_yellow_arrow.png","default_stone.png","default_stone.png","default_stone.png","default_stone.png","default_stone.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = true,
	node_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0, 0.5},
	},
})
	

minetest.register_node("labyrinthus:pbj_pup", {
	description = "PB&J Pup",
	tiles = {
		"labyrinthus_pup_sides.png",
		"labyrinthus_pup_sides.png",
		"labyrinthus_pup_sides.png",
		"labyrinthus_pup_sides.png",
		"labyrinthus_pup_sides.png",
		"labyrinthus_pup_front.png"
	},
	groups = {cracky = 2},
})
minetest.register_node("labyrinthus:wall",{
	description = "Wall",
	tiles = {"labyrinthus_wall.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})

minetest.register_node("labyrinthus:meselamp", {
	description = "Mese Lamp",
	drawtype = "glasslike",
	tiles = {"labyrinthus_meselamp.png"},
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	light_source = 15,
})

minetest.register_node("labyrinthus:glass",{
	description = "Glass",
	drawtype = "glasslike_framed_optional",
    alpha = 0,
	tiles = {"labyrinthus_glass.png"},
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:nyancat2",{
	description = "Nyancat 2",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "labyrinthus_nyancat2_front.png"},
    paramtype = "light",
	light_source = 4,
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:water",{
	description = "Water",
	tiles = {"default_water.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:water_stone",{
	description = "Water",
	tiles = {"default_water.png^labyrinthus_water_stone.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:ice1",{
	description = "Ice 1",
	tiles = {"default_ice.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:ice2",{
	description = "Ice 2",
	tiles = {"labyrinthus_ice2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:ice3",{
	description = "Ice 3",
	tiles = {"labyrinthus_ice3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:water_wood",{
	description = "Water with wood",
	tiles = {"default_water.png^labyrinthus_water_wood.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:rainbow",{
	description = "Rainbow",
	tiles = {"labyrinthus_rainbow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:rainbow2",{
	description = "Rainbow",
	tiles = {"labyrinthus_rainbow2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:rainbow3",{
	description = "Rainbow",
	tiles = {"labyrinthus_rainbow3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button1",{
	description = "Button 1",
	tiles = {"default_sand.png^labyrinthus_button.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button2",{
	description = "Button 2",
	tiles = {"labyrinthus_button_2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button3",{
	description = "Button 3",
	tiles = {"labyrinthus_button_3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red1",{
	description = "Red 1",
	tiles = {"labyrinthus_red1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red2", {
	description = "Red 2",
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	tiles = {"labyrinthus_red2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:blue1",{
	description = "Blue 1",
	tiles = {"labyrinthus_blue1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:blue2", {
	description = "Blue 2",
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	tiles = {"labyrinthus_blue2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:green1",{
	description = "Green 1",
	tiles = {"labyrinthus_green1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:green2", {
	description = "Green 2",
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	tiles = {"labyrinthus_green2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:water_ball", {
	description = "Water Ball",
	drawtype = "mesh",
	mesh = "labyrinthus_ball.obj",
	tiles = {"default_water.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:red_pyramid", {
	description = "Red Pyramid",
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	tiles = {"labyrinthus_red2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:red_cross",{
	description = "Red cross",
	tiles = {"default_sand.png^labyrinthus_red_cross.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:green_pyramid", {
	description = "Green Pyramid",
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	tiles = {"labyrinthus_green2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:green_cross",{
	description = "Green cross",
	tiles = {"default_sand.png^labyrinthus_green_cross.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:blue_pyramid", {
	description = "Blue Pyramid",
	drawtype = "mesh",
	mesh = "labyrinthus_pyramid.obj",
	tiles = {"labyrinthus_blue2.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=3, oddly_breakable_by_hand=2},
})
minetest.register_node("labyrinthus:blue_cross",{
	description = "Blue cross",
	tiles = {"default_sand.png^labyrinthus_blue_cross.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:blue_col",{
	description = "Blue col",
	tiles = {"default_sand.png^dye_blue.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red_col",{
	description = "Red col",
	tiles = {"default_sand.png^dye_red.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:green_col",{
	description = "Green col",
	tiles = {"default_sand.png^dye_dark_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:key1",{
	description = "Key 1",
	tiles = {"default_stone.png^labyrinthus_key2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:key2",{
	description = "Key 2",
	tiles = {"default_sand.png^labyrinthus_key.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:tp",{
	description = "Tp",
	tiles = {"default_sand.png^labyrinthus_tp.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:tp2",{
	description = "Tp 2",
	tiles = {"default_sand.png^labyrinthus_tp2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:purple",{
	description = "Purple",
	tiles = {"default_sand.png^labyrinthus_purple.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:cyan",{
	description = "Cyan",
	tiles = {"default_sand.png^labyrinthus_cyan.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:yellow2",{
	description = "Yellow",
	tiles = {"default_sand.png^labyrinthus_yellow2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:yellow_red",{
	description = "Red with Yellow",
	tiles = {"default_stone.png^labyrinthus_yellow_red.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red_with_no_yellow",{
	description = "Red with no Yellow",
	tiles = {"default_stone.png^labyrinthus_red_with_no_yellow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red3",{
	description = "Red 3",
	tiles = {"default_sand.png^labyrinthus_red3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:cyan_dirt",{
	description = "Cyan",
	tiles = {"labyrinthus_dirt.png^labyrinthus_cyan.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:yellow_dirt",{
	description = "Yellow",
	tiles = {"labyrinthus_dirt.png^labyrinthus_yellow2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:bow",{
	description = "Bow",
	tiles = {"default_sand.png^labyrinthus_bow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:bow_right",{
	description = "Bow Right",
	tiles = {"default_mese_block.png^labyrinthus_bow_right.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:bow_left",{
	description = "Bow Left",
	tiles = {"default_mese_block.png^labyrinthus_bow_left.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:bow_down",{
	description = "Bow Down",
	tiles = {"default_mese_block.png^labyrinthus_bow_down.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:bow_up",{
	description = "Bow Up",
	tiles = {"default_mese_block.png^labyrinthus_bow_up.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:green",{
	description = "Green",
	tiles = {"default_sand.png^labyrinthus_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:green_dirt",{
	description = "Green",
	tiles = {"labyrinthus_dirt.png^labyrinthus_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:water_wood_with_green",{
	description = "Water with wood and green",
	tiles = {"default_water.png^labyrinthus_water_wood_with_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:sand_for_green",{
	description = "Sand for Green",
	tiles = {"default_sand.png^labyrinthus_stone_for_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:sand_for_green_dirt",{
	description = "Sand for Green on Dirt",
	tiles = {"labyrinthus_dirt.png^labyrinthus_stone_for_green.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:wood_for_yellow",{
	description = "Wood for Yellow",
	tiles = {"default_wood.png^labyrinthus_stone_for_yellow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:purple_dirt",{
	description = "Purple",
	tiles = {"labyrinthus_dirt.png^labyrinthus_purple.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:empty_gate",{
	description = "Empty Gate",
	tiles = {"default_sand.png^labyrinthus_empty_gate.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:empty_gate_purple",{
	description = "Empty Gate with Purple",
	tiles = {"default_sand.png^labyrinthus_gate_with_purple.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:gate",{
	description = "Gate",
	tiles = {"default_sand.png^labyrinthus_gate.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:transport_stone",{
	description = "Transport Stone",
	tiles = {"default_mese_block.png^labyrinthus_transport_stone.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:gate_arrows",{
	description = "Gate Arrows",
	tiles = {"default_sand.png^labyrinthus_gate_arrows.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:transport_stone_gate_arrows",{
	description = "Transport Stone",
	tiles = {"default_mese_block.png^labyrinthus_gate_arrows.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:ball1",{
	description = "Ball 1",
	tiles = {"default_sand.png^labyrinthus_ball.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:boom",{
	description = "Boom",
	tiles = {"default_sand.png^labyrinthus_boom.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:ball2",{
	description = "Ball 2",
	drawtype = "glasslike_framed_optional",
    alpha = 0,
	tiles = {"labyrinthus_ball.png"},
	paramtype = "light",
	sunlight_propagates = true,
	use_texture_alpha = true,
	is_ground_content = true,
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:1",{
	description = "1",
	tiles = {"default_mese_block.png^labyrinthus_1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:2",{
	description = "2",
	tiles = {"default_mese_block.png^labyrinthus_2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:3",{
	description = "3",
	tiles = {"default_mese_block.png^labyrinthus_3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:4",{
	description = "4",
	tiles = {"default_mese_block.png^labyrinthus_4.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red",{
	description = "Red",
	tiles = {"default_mese_block.png^labyrinthus_red.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:blue",{
	description = "Blue",
	tiles = {"default_mese_block.png^labyrinthus_blue.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:yellow",{
	description = "Yellow",
	tiles = {"default_mese_block.png^labyrinthus_yellow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:red_sand",{
	description = "Red Sand",
	tiles = {"default_sand.png^labyrinthus_red.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:0",{
	description = "0",
	tiles = {"default_mese_block.png^labyrinthus_0.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:00",{
	description = "00",
	tiles = {"default_sand.png^labyrinthus_0.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:eye2",{
	description = "Eye 2",
	tiles = {"default_mese_block.png^labyrinthus_eye.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:eye1",{
	description = "Eye 1",
	tiles = {"default_sand.png^labyrinthus_eye.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:box",{
	description = "Box",
	tiles = {"default_sand.png^labyrinthus_box.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:desert",{
	description = "Desert",
	tiles = {"default_desert_sand.png"},
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:dirt",{
	description = "Dirt",
	tiles = {"labyrinthus_dirt.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:leaves", {
	description = "Leaves",
	drawtype = "allfaces_optional",
	tiles = {"labyrinthus_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button11",{
	description = "Block-Button 1",
	tiles = {"default_sand.png^labyrinthus_button1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button12",{
	description = "Block-Button 2",
	tiles = {"default_sand.png^labyrinthus_button2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:button13",{
	description = "Block-Button 3",
	tiles = {"default_stone.png^labyrinthus_button2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:fire",{
	description = "Fire",
	tiles = {"default_sand.png^fire_basic_flame.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:arrow",{
	description = "Arrow",
	tiles = {"default_sand.png^labyrinthus_arrow.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:arrow2",{
	description = "Arrow 2",
	tiles = {"default_sand.png^labyrinthus_arrow2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:round1",{
	description = "Round 1",
	tiles = {"default_sand.png^labyrinthus_round1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:round2",{
	description = "Round 2",
	tiles = {"default_sand.png^labyrinthus_round2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:round3",{
	description = "Round 3",
	tiles = {"default_sand.png^labyrinthus_round3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:round4",{
	description = "Round 4",
	tiles = {"default_sand.png^labyrinthus_round4.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:nyan1",{
	description = "Part 1",
	tiles = {"labyrinthus_part1.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:nyan2",{
	description = "Part 2",
	tiles = {"labyrinthus_part2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:nyan3",{
	description = "Part 3",
	tiles = {"labyrinthus_part3.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:nyan4",{
	description = "Part 4",
	tiles = {"labyrinthus_part4.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:arrow3",{
	description = "Arrow 3",
	tiles = {"default_mese_block.png^labyrinthus_arrow2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:arrow4",{
	description = "Arrow 4",
	tiles = {"default_mese_block.png^labyrinthus_arrow4.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:arrow4_2",{
	description = "Arrow 4 (2)",
	tiles = {"default_sand.png^labyrinthus_arrow4_2.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:sun",{
	description = "Sun",
	tiles = {"default_sand.png^labyrinthus_sun.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
minetest.register_node("labyrinthus:moon",{
	description = "Moon",
	tiles = {"default_sand.png^labyrinthus_moon.png"},
    groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
})
for i=0,30 do
    minetest.register_node("labyrinthus:time"..i,{
	    description = "Time "..i,
	    tiles = {"default_sand.png^labyrinthus_time"..i..".png"},
        groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    })
end
function move(player,player_inv,x,y,z,key,s,ll,bones,level2,fire,time,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    if minetest.get_node(e1m1).name == "labyrinthus:button11" then
        minetest.set_node(e1m1, {name="labyrinthus:button12"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice3" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:water"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice2" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:ice3"})
    end
    if minetest.get_node(e1m1).name == "labyrinthus:ice1" and trfire == true then
        minetest.set_node(e1m1, {name="labyrinthus:ice2"})
    end
	if minetest.get_node(e1m1).name == "default:wood" then
		
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
		minetest.set_node(e2m1, {name="air"})
		if dir1 == "up" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 9
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+10, y=y+ad, z=-76}).name == "labyrinthus:water" then
					ad = ad+1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+10, y=y+ad-1, z=-76}, {name="default:wood"})
			player_inv:set_stack("y", 1, "default:dirt "..(y+ad-9))
		elseif dir1 == "down" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 7
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+10, y=y+ad, z=-76}).name == "labyrinthus:water" then
					ad = ad-1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+10, y=y+ad+1, z=-76}, {name="default:wood"})
			player_inv:set_stack("y", 1, "default:dirt "..(y+ad-7))
		elseif dir1 == "right" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 11
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+ad, y=y+8, z=-76}).name == "labyrinthus:water" then
					ad = ad+1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+ad-1, y=y+8, z=-76}, {name="default:wood"})
			player_inv:set_stack("x", 1, "default:dirt "..(x+ad-11))
		elseif dir1 == "left" then
			minetest.set_node(e1m1, {name="labyrinthus:water"})
			local ad = 9
			local ex = 0
			while ex == 0 do
				if minetest.get_node({x=x+ad, y=y+8, z=-76}).name == "labyrinthus:water" then
					ad = ad-1
				else
					ex = 1
				end
			end
			minetest.set_node({x=x+ad+1, y=y+8, z=-76}, {name="default:wood"})
			player_inv:set_stack("x", 1, "default:dirt "..(x+ad-9))
		end
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
	end
	local donetp2 = 0
	if minetest.get_node(e1m2).name == "labyrinthus:tp2" then
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local f = 0
        for i=(x+10),28 do
            for k=9,20 do
                if i == (x+10) and (k-(y+8)) < 1 then
                else
                    if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp2" and f == 0 then
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
        for i=11,(x+10) do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp2" and f == 0 then
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
        player_inv:set_stack("x", 1, "default:dirt "..x)
        player_inv:set_stack("y", 1, "default:dirt "..y)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
        tptp = tptp+1
	end
	local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
	local anotherstep = 0
    if minetest.get_node(e1m2).name == "labyrinthus:water" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:arrow4_2" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_stone" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:sand_for_green" or minetest.get_node(e1m2).name == "labyrinthus:sand_for_green_dirt" then
		if dir1 == "up" then
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
				minetest.set_node(e1m2, {name="default:wood"})
			end
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:bow" then
		local cyan = player_inv:get_stack("c", 1):get_count()
		if cyan > 0 then
			if dir1 == "up" then
				local bow_r = "up"
				local bow_x = x+10
				local bow_y = y+10
				while Is_Node(bow_x,bow_y,"bow") do
					if minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_right" then
						bow_r = "right"
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_left" then
						bow_r = "left"
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_up" then
						bow_r = "up"
					elseif minetest.get_node({x=bow_x, y=bow_y, z=-77}).name == "labyrinthus:bow_down" then
						bow_r = "down"
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
				player_inv:set_stack("c", 1, "default:dirt "..(cyan-1))
			end
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:rainbow2" and dir1 ~= "up" then
	elseif minetest.get_node(e1m2).name == "labyrinthus:rainbow3" and dir1 ~= "up" then
    elseif minetest.get_node(e1m2).name == "labyrinthus:key2" then
        player_inv:set_stack("k", 1, "default:dirt "..(key+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:purple" then
		local purple = player_inv:get_stack("p", 1):get_count()
        player_inv:set_stack("p", 1, "default:dirt "..(purple+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:cyan" then
		local cyan = player_inv:get_stack("c", 1):get_count()
        player_inv:set_stack("c", 1, "default:dirt "..(cyan+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:yellow2" then
		local yellow = player_inv:get_stack("ye", 1):get_count()
        player_inv:set_stack("ye", 1, "default:dirt "..(yellow+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:red3" then
		local red = player_inv:get_stack("re", 1):get_count()
        player_inv:set_stack("re", 1, "default:dirt "..(red+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:green" then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "default:dirt "..(green+1))
        minetest.set_node(e1m2, {name="default:sand"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:water_wood_with_green" then
		local green = player_inv:get_stack("g", 1):get_count()
        player_inv:set_stack("g", 1, "default:dirt "..(green+1))
        minetest.set_node(e1m2, {name="labyrinthus:water_wood"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:purple_dirt" then
		local purple = player_inv:get_stack("p", 1):get_count()
        player_inv:set_stack("p", 1, "default:dirt "..(purple+1))
        minetest.set_node(e1m2, {name="labyrinthus:dirt"})
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
	elseif minetest.get_node(e1m2).name == "labyrinthus:green_dirt" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or overdirt then
			local green = player_inv:get_stack("g", 1):get_count()
			player_inv:set_stack("g", 1, "default:dirt "..(green+1))
			minetest.set_node(e1m2, {name="labyrinthus:dirt"})
			minetest.set_node(e2m1, {name="air"})
			player_inv:set_stack(ko, 1, "default:dirt "..koad)
			Other(player, pbjnr)
			minetest.set_node(e2m2, {name="nyancat:nyancat"})
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:cyan_dirt" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or overdirt then
			local cyan = player_inv:get_stack("c", 1):get_count()
			player_inv:set_stack("c", 1, "default:dirt "..(cyan+1))
			minetest.set_node(e1m2, {name="labyrinthus:dirt"})
			minetest.set_node(e2m1, {name="air"})
			player_inv:set_stack(ko, 1, "default:dirt "..koad)
			Other(player, pbjnr)
			minetest.set_node(e2m2, {name="nyancat:nyancat"})
		end
	elseif minetest.get_node(e1m2).name == "labyrinthus:yellow_dirt" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or overdirt then
			local yellow = player_inv:get_stack("ye", 1):get_count()
			player_inv:set_stack("ye", 1, "default:dirt "..(yellow+1))
			minetest.set_node(e1m2, {name="labyrinthus:dirt"})
			minetest.set_node(e2m1, {name="air"})
			player_inv:set_stack(ko, 1, "default:dirt "..koad)
			Other(player, pbjnr)
			minetest.set_node(e2m2, {name="nyancat:nyancat"})
		end
    elseif minetest.get_node(e1m2).name == "bones:bones" then
        player_inv:set_stack("b", 1, "default:dirt")
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
    elseif minetest.get_node(e1m2).name == "labyrinthus:ball1" then
        if s == 0 then
            minetest.set_node(e1m2, {name="default:sand"})
            player_inv:set_stack("s", 1, "default:dirt")
        end
        minetest.set_node(e2m2, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m1, {name="nyancat:nyancat"})
    elseif minetest.get_node(e1m2).name == "labyrinthus:tp" then
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local z = player_inv:get_stack("z", 1):get_count()
        local f = 0
        for i=(x+10),28 do
            for k=9,20 do
                if i == (x+10) and (k-(y+8)) < 1 then
                else
                    if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp" and f == 0 then
                        local xx = i-10
                        local yy = k-8
                        if x ~= xx or y ~= yy then
                            x = xx
                            y = yy
                            f = 1
                        end
                    end
                end
            end
        end
        for i=11,(x+10) do
            for k=9,20 do
                if minetest.get_node({x=i, y=k, z=-76}).name == "labyrinthus:tp" and f == 0 then
                    local xx = i-10
                    local yy = k-8
                    if x ~= xx or y ~= yy then
                        x = xx
                        y = yy
                        f = 1
                    end
                end
            end
        end
        player_inv:set_stack("x", 1, "default:dirt "..(x))
        player_inv:set_stack("y", 1, "default:dirt "..(y))
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
        tptp = tptp+1
    elseif minetest.get_node(e2m2).name == "default:stone" or minetest.get_node(e2m2).name == "labyrinthus:leaves" or minetest.get_node(e2m2).name == "labyrinthus:button2" or minetest.get_node(e2m2).name == "labyrinthus:button3" or minetest.get_node(e2m2).name == "default:cobble" or minetest.get_node(e2m2).name == "labyrinthus:0" or minetest.get_node(e2m2).name == "labyrinthus:button13" or minetest.get_node(e2m2).name == "labyrinthus:yellow_block" or minetest.get_node(e2m2).name == "labyrinthus:red_with_no_yellow" then
    elseif minetest.get_node(e2m2).name == "default:junglewood" then
        if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			if minetest.get_node(e1m3).name == "labyrinthus:water" then
                minetest.set_node(e1m3, {name="labyrinthus:water_wood"})
            else
                minetest.set_node(e2m3, {name="default:junglewood"})
            end
            minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,"wood") and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            if minetest.get_node(e1m3).name == "labyrinthus:water" then
                minetest.set_node(e1m3, {name="labyrinthus:water_wood"})
            else
                minetest.set_node(e2m3, {name="default:junglewood"})
            end
            minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:water_ball" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			if minetest.get_node(e1m3).name == "labyrinthus:water" then
            else
                minetest.set_node(e2m3, {name="labyrinthus:water_ball"})
            end
            minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,"wood") and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            if minetest.get_node(e1m3).name == "labyrinthus:water" then
            else
                minetest.set_node(e2m3, {name="labyrinthus:water_ball"})
            end
            minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e1m2).name == "labyrinthus:gate" then
		minetest.set_node(e2m1, {name="air"})
		player_inv:set_stack(ko, 1, "default:dirt "..koad)
		Other(player, pbjnr)
		minetest.set_node(e2m2, {name="nyancat:nyancat"})
		anotherstep = 1
    elseif minetest.get_node(e2m2).name == "default:diamondblock" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
            minetest.set_node(e2m3, {name="default:diamondblock"})
            if minetest.get_node({x=e2m3.x+1, y=e2m3.y, z=-77}).name == "default:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x+1, y=e2m3.y, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x-1, y=e2m3.y, z=-77}).name == "default:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x-1, y=e2m3.y, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x, y=e2m3.y+1, z=-77}).name == "default:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x, y=e2m3.y+1, z=-77}, {name="air"})
            end
            if minetest.get_node({x=e2m3.x, y=e2m3.y-1, z=-77}).name == "default:diamondblock" then
                minetest.set_node(e2m3, {name="air"})
                minetest.set_node({x=e2m3.x, y=e2m3.y-1, z=-77}, {name="air"})
            end  
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "default:meselamp" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="default:meselamp"})
            minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:red_pyramid" then
        if Is_Node(nodex,nodey,nil) then
			minetest.set_node(e2m2, {name="air"})
			minetest.set_node(e2m1, {name="air"})
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
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:green_pyramid" then
        if Is_Node(nodex,nodey,nil) then
			minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
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
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:blue_pyramid" then
        if Is_Node(nodex,nodey,nil) then
			minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
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
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:transport_stone" then
        if Is_Node(nodex,nodey,nil) then
			if minetest.get_node(e1m3).name == "labyrinthus:gate_arrows" then
                minetest.set_node(e2m3, {name="labyrinthus:transport_stone_gate_arrows"})
			else
				minetest.set_node(e2m3, {name="labyrinthus:transport_stone"})
			end
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:transport_stone_gate_arrows" then
        if Is_Node(nodex,nodey,nil) then
			if minetest.get_node(e1m3).name == "labyrinthus:empty_gate_purple" then
                minetest.set_node(e1m3, {name="labyrinthus:gate"})
			else
				minetest.set_node(e2m3, {name="labyrinthus:transport_stone_gate_arrows"})
			end
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:arrow4" then
		minetest.set_node(e2m2, {name="air"})
		if dir1 == "up" then
			local bow_x = x+10
			local bow_y = y+10
			local d = 0
			while Is_Node(bow_x,bow_y,"arrow4") and d == 0 do
				if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow4_2" then
					d = 1
					minetest.set_node({x=bow_x, y=bow_y, z=-76}, {name="default:sand"})
				end
				bow_y = bow_y+1
			end
			bow_y = bow_y-1
			if d == 0 then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
			end
		elseif dir1 == "down" then
			local bow_x = x+10
			local bow_y = y+6
			local d = 0
			while Is_Node(bow_x,bow_y,"arrow4") and d == 0 do
				if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow4_2" then
					d = 1
					minetest.set_node({x=bow_x, y=bow_y, z=-76}, {name="default:sand"})
				end
				bow_y = bow_y-1
			end
			bow_y = bow_y+1
			if d == 0 then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
			end
		elseif dir1 == "right" then
			local bow_x = x+12
			local bow_y = y+8
			local d = 0
			while Is_Node(bow_x,bow_y,"arrow4") and d == 0 do
				if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow4_2" then
					d = 1
					minetest.set_node({x=bow_x, y=bow_y, z=-76}, {name="default:sand"})
				end
				bow_x = bow_x+1
			end
			bow_x = bow_x-1
			if d == 0 then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
			end
		elseif dir1 == "left" then
			local bow_x = x+8
			local bow_y = y+8
			local d = 0
			while Is_Node(bow_x,bow_y,"arrow4") and d == 0 do
				if minetest.get_node({x=bow_x, y=bow_y, z=-76}).name == "labyrinthus:arrow4_2" then
					d = 1
					minetest.set_node({x=bow_x, y=bow_y, z=-76}, {name="default:sand"})
				end
				bow_x = bow_x-1
			end
			bow_x = bow_x+1
			if d == 0 then
				minetest.set_node({x=bow_x, y=bow_y, z=-77}, {name="labyrinthus:arrow4"})
			end
		end
		if Is_Node(e2m2.x,e2m2.y,nil) then
			minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
				Other(player, pbjnr)
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
			end
		end
    elseif minetest.get_node(e2m2).name == "labyrinthus:arrow3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:arrow3"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
            update()
            if minetest.get_node(e1m1).name == "labyrinthus:boom" then
                minetest.set_node(e1m1, {name="default:sand"})
                local x = player_inv:get_stack("x", 1):get_count()
                local y = player_inv:get_stack("y", 1):get_count()
                for j=10,29 do
                    for l=9,20 do
                        if minetest.get_node({x=j, y=l, z=-77}).name == "tnt:tnt" then
                            minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                            if minetest.get_node({x=j-1, y=l, z=-77}).name == "default:cobble" then
                                minetest.set_node({x=j-1, y=l, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j+1, y=l, z=-77}).name == "default:cobble" then
                                minetest.set_node({x=j+1, y=l, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j, y=l-1, z=-77}).name == "default:cobble" then
                                minetest.set_node({x=j, y=l-1, z=-77}, {name="air"})
                            end
                            if minetest.get_node({x=j, y=l+1, z=-77}).name == "default:cobble" then
                                minetest.set_node({x=j, y=l+1, z=-77}, {name="air"})
                            end
                        end
                    end
                end
            end
            local bones = player_inv:get_stack("b", 1):get_count()
            if minetest.get_node(e1m1).name == "default:sand" then
                if bones == 1 then
                    minetest.set_node(e1m1, {name="bones:bones"})
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
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			minetest.set_node(e2m3, {name="labyrinthus:bow_right"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,nil) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            minetest.set_node(e2m3, {name="labyrinthus:bow_right"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_left" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			minetest.set_node(e2m3, {name="labyrinthus:bow_left"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,nil) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            minetest.set_node(e2m3, {name="labyrinthus:bow_left"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_down" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			minetest.set_node(e2m3, {name="labyrinthus:bow_down"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,nil) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            minetest.set_node(e2m3, {name="labyrinthus:bow_down"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:bow_up" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			minetest.set_node(e2m3, {name="labyrinthus:bow_up"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,nil) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            minetest.set_node(e2m3, {name="labyrinthus:bow_up"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan1" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan1"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan2"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan3"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:nyan4" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:nyan4"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:eye2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:glass"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:glass" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:glass"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "tnt:tnt" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" and minetest.get_node(e1m2).name == "labyrinthus:dirt" and Is_Node(nodex,nodey,"dirt") then
			minetest.set_node(e2m3, {name="tnt:tnt"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
		elseif Is_Node(nodex,nodey,nil) and minetest.get_node(e1m1).name ~= "labyrinthus:dirt" then
            minetest.set_node(e2m3, {name="tnt:tnt"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e1m2).name == "labyrinthus:dirt" then
		if minetest.get_node(e1m1).name == "labyrinthus:dirt" or overdirt then
			minetest.set_node(e2m1, {name="air"})
			player_inv:set_stack(ko, 1, "default:dirt "..koad)
			Other(player, pbjnr)
			minetest.set_node(e2m2, {name="nyancat:nyancat"})
		end
    elseif minetest.get_node(e2m2).name == "labyrinthus:4" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:3"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:3" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:2"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:2" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:1"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:1" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:0"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:red" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:blue"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:blue" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:yellow"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:yellow" then
        if Is_Node(nodex,nodey,nil) then
            minetest.set_node(e2m3, {name="labyrinthus:red"})
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:red2" then
        if Is_Node(nodex,nodey,"red") then
            if minetest.get_node(e1m3).name == "labyrinthus:red1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="default:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
            end
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:green2" then
        if Is_Node(nodex,nodey,"green") then
            if minetest.get_node(e1m3).name == "labyrinthus:green1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="default:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
            end
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:blue2" then
        if Is_Node(nodex,nodey,"blue") then
            if minetest.get_node(e1m3).name == "labyrinthus:blue1" then
            elseif minetest.get_node(e1m3).name == "labyrinthus:green_col" then
                minetest.set_node(e2m3, {name="labyrinthus:green2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:blue_col" then
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
                minetest.set_node(e1m3, {name="default:sand"})
            elseif minetest.get_node(e1m3).name == "labyrinthus:red_col" then
                minetest.set_node(e2m3, {name="labyrinthus:red2"})
                minetest.set_node(e1m3, {name="default:sand"})
            else
                minetest.set_node(e2m3, {name="labyrinthus:blue2"})
            end
            minetest.set_node(e2m2, {name="air"})
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
    elseif minetest.get_node(e2m2).name == "labyrinthus:key1" then
        if key > 0 then
            player_inv:set_stack("k", 1, "default:dirt "..(key-1))
            minetest.set_node(e2m1, {name="air"})
			if donetp2 == 0 then
				player_inv:set_stack(ko, 1, "default:dirt "..koad)
				Other(player, pbjnr)
				minetest.set_node(e2m2, {name="nyancat:nyancat"})
			end
        end
	elseif minetest.get_node(e2m2).name == "labyrinthus:yellow_red" then
		if dir1 == "up" then
			local red = player_inv:get_stack("re", 1):get_count()
			if red > 0 then
				player_inv:set_stack("re", 1, "default:dirt "..(red-1))
				minetest.set_node(e2m2, {name="labyrinthus:red_with_no_yellow"})
				local yellow = player_inv:get_stack("ye", 1):get_count()
				player_inv:set_stack("ye", 1, "default:dirt "..(yellow+1))
			end
		end
    elseif donetp2 == 0 then
        minetest.set_node(e2m1, {name="air"})
        player_inv:set_stack(ko, 1, "default:dirt "..koad)
        Other(player, pbjnr)
        minetest.set_node(e2m2, {name="nyancat:nyancat"})
    end
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local bones = player_inv:get_stack("b", 1):get_count()
	if minetest.get_node(e1m2).name == "labyrinthus:empty_gate" and minetest.get_node(e2m2).name == "nyancat:nyancat" then
		local purple = player_inv:get_stack("p", 1):get_count()
		if purple > 0 then
            player_inv:set_stack("p", 1, "default:dirt "..(purple-1))
			minetest.set_node(e1m2, {name="labyrinthus:empty_gate_purple"})
		end
	end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "default:sand" then
        if bones == 1 then
            minetest.set_node({x=x+10, y=y+8, z=-76}, {name="bones:bones"})
        end
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:button11" then
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="labyrinthus:button12"})
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:moon" then
        for i = 9, 30 do
            for j = 0,14 do
                minetest.set_node({x=i, y=22, z=-89+j}, {name="default:stone"})
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
        player_inv:set_stack("time", 1, "default:dirt")
    end
    local time = player_inv:get_stack("time", 1):get_count()
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name ~= "labyrinthus:time30" and time == 1 then
        player_inv:set_stack("time", 1, "default:dirt 2")
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:fire" and trfire == true then
        player_inv:set_stack("f", 1, "default:dirt "..(fire+1))
        player_inv:set_stack("a2", 1, nil)
        local fire = player_inv:get_stack("f", 1):get_count()
        if fire > 1 then
            player_inv:set_stack("x", 1, nil)
            player_inv:set_stack("y", 1, nil)
            player_inv:set_stack("z", 1, nil)
            minetest.set_node({x=x+10, y=y+8, z=-77}, {name="air"})
            minetest.chat_send_all("Oh no!! You killed the Nyancat!!")
        else
            minetest.chat_send_all("That hurt!")
        end
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:arrow" then
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            minetest.set_node({x=x+10, y=y+8, z=-76}, {name="default:sand"})
        end
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "default:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="bones:bones"})
            end
        end
        player_inv:set_stack("a", 1, "default:dirt")
    end
    if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "labyrinthus:arrow2" then
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="default:sand"})
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "default:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="bones:bones"})
            end
        end
        player_inv:set_stack("a2", 1, "default:dirt")
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
        minetest.set_node({x=x+10, y=y+8, z=-76}, {name="default:sand"})
        local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
        local bones = player_inv:get_stack("b", 1):get_count()
        if minetest.get_node({x=x+10, y=y+8, z=-76}).name == "default:sand" then
            if bones == 1 then
                minetest.set_node({x=x+10, y=y+8, z=-76}, {name="bones:bones"})
            end
        end
        for j=10,29 do
            for l=9,20 do
                if minetest.get_node({x=j, y=l, z=-77}).name == "tnt:tnt" then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    if minetest.get_node({x=j-1, y=l, z=-77}).name == "default:cobble" then
                        minetest.set_node({x=j-1, y=l, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j+1, y=l, z=-77}).name == "default:cobble" then
                        minetest.set_node({x=j+1, y=l, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j, y=l-1, z=-77}).name == "default:cobble" then
                        minetest.set_node({x=j, y=l-1, z=-77}, {name="air"})
                    end
                    if minetest.get_node({x=j, y=l+1, z=-77}).name == "default:cobble" then
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
                    minetest.set_node({x=i, y=k, z=-76}, {name="default:sand"})
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
        lv = io.open(minetest.get_worldpath().."/level"..ll..".txt", "r")
	    local level = lv:read("*l")
        lv:close()
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
        if tonumber(level) == tonumber(level2) then
            le = io.open(minetest.get_worldpath().."/level"..ll..".txt", "w")
		    le:write(level+1)
		    le:close()
        end
    end
	if anotherstep == 1 then
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
function Right(pos, node, player, overdirt, trfire)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local key = player_inv:get_stack("k", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
    local ll = player_inv:get_stack("ll", 1):get_count()
    local bones = player_inv:get_stack("b", 1):get_count()
    local level2 = player_inv:get_stack("l", ll):get_count()
    local fire = player_inv:get_stack("f", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
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
        move(player,player_inv,x,y,z,key,s,ll,bones,level2,fire,time,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Up(pos, node, player, overdirt, trfire)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local key = player_inv:get_stack("k", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
    local ll = player_inv:get_stack("ll", 1):get_count()
    local bones = player_inv:get_stack("b", 1):get_count()
    local level2 = player_inv:get_stack("l", ll):get_count()
    local fire = player_inv:get_stack("f", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
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
        move(player,player_inv,x,y,z,key,s,ll,bones,level2,fire,time,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Down(pos, node, player, overdirt, trfire)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local key = player_inv:get_stack("k", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
    local ll = player_inv:get_stack("ll", 1):get_count()
    local level2 = player_inv:get_stack("l", ll):get_count()
    local fire = player_inv:get_stack("f", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
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
        move(player,player_inv,x,y,z,key,s,ll,bones,level2,fire,time,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end
function Left(pos, node, player, overdirt, trfire)
    local player_inv = player:get_inventory()
    local x = player_inv:get_stack("x", 1):get_count()
    local y = player_inv:get_stack("y", 1):get_count()
    local z = player_inv:get_stack("z", 1):get_count()
    local key = player_inv:get_stack("k", 1):get_count()
    local s = player_inv:get_stack("s", 1):get_count()
    local ll = player_inv:get_stack("ll", 1):get_count()
    local level2 = player_inv:get_stack("l", ll):get_count()
    local fire = player_inv:get_stack("f", 1):get_count()
    local time = player_inv:get_stack("time", 1):get_count()
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
        move(player,player_inv,x,y,z,key,s,ll,bones,level2,fire,time,e1m1,e1m2,e1m3,e2m1,e2m2,e2m3,ko,koad,nodex,nodey,dir1,dir2,pbjnr,trfire,overdirt)
    end
end

function Right2(pos, node, player, overdirt)
    Load(player)
    local player_inv = player:get_inventory()
    local a = player_inv:get_stack("a", 1):get_count()
    local a2 = player_inv:get_stack("a2", 1):get_count()
    local ff = 0
    tptp = 0
    player_inv:set_stack("r", 1, "default:dirt")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "air" and minetest.get_node({x=x+11, y=y+8, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+11, y=y+8, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "default:diamondblock" and Is_Node(x+12,y+8,nil) then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Right(pos, node, player, overdirt, true)
            else
                ff = 1
            end
        else
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "air" and minetest.get_node({x=x+9, y=y+8, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+9, y=y+8, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "default:diamondblock" and Is_Node(x+8,y+8,nil) then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Left(pos, node, player, overdirt, true)
            else
                ff = 1
            end
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
    player_inv:set_stack("r", 1, "default:dirt 4")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "air" and minetest.get_node({x=x+10, y=y+9, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+10, y=y+9, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "default:diamondblock" and Is_Node(x+10,y+10,nil) then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Up(pos, node, player, overdirt, true)
            else
                ff = 1
            end
        else
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "air" and minetest.get_node({x=x+10, y=y+7, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+10, y=y+7, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "default:diamondblock" and Is_Node(x+10,y+6,nil) then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Down(pos, node, player, overdirt, true)
            else
                ff = 1
            end
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
    player_inv:set_stack("r", 1, "default:dirt 2")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "air" and minetest.get_node({x=x+10, y=y+7, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+10, y=y+7, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "default:diamondblock" and Is_Node(x+10,y+6,nil) then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Down(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+7, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Down(pos, node, player, overdirt, true)
            else
                ff = 1
            end
        else
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "air" and minetest.get_node({x=x+10, y=y+9, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+10, y=y+9, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "default:diamondblock" and Is_Node(x+10,y+10,nil) then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Up(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+10, y=y+9, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Up(pos, node, player, overdirt, true)
            else
                ff = 1
            end
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
    player_inv:set_stack("r", 1, "default:dirt 3")
    while ff == 0 and a2 == 1 and tptp < 10 do
        local a = player_inv:get_stack("a", 1):get_count()
        if a == 0 then
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "air" and minetest.get_node({x=x+9, y=y+8, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+9, y=y+8, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "default:diamondblock" and Is_Node(x+8,y+8,nil) then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Left(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+9, y=y+8, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Left(pos, node, player, overdirt, true)
            else
                ff = 1
            end
        else
            local x = player_inv:get_stack("x", 1):get_count()
            local y = player_inv:get_stack("y", 1):get_count()
            local z = player_inv:get_stack("z", 1):get_count()
            local k = player_inv:get_stack("k", 1):get_count()
            if minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "air" and minetest.get_node({x=x+11, y=y+8, z=-77+z}).name ~= "labyrinthus:water" and minetest.get_node({x=x+11, y=y+8, z=-77+z}).name ~= "labyrinthus:rainbow" then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "default:diamondblock" and Is_Node(x+12,y+8,nil) then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "labyrinthus:key1" and k > 0 then
                Right(pos, node, player, overdirt, true)
            elseif minetest.get_node({x=x+11, y=y+8, z=-78+z}).name == "labyrinthus:pbj_pup" then
                Right(pos, node, player, overdirt, true)
            else
                ff = 1
            end
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
    local d = 0
    if s > 0 then
        if r == 1 then
            while x < 18 and d == 0 do
                if minetest.get_node({x=x+11, y=y+8, z=-77}).name == "default:apple" then
                    if minetest.get_node({x=x+11, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        x = x+2
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+11, y=y+8, z=-77}).name == "air" or minetest.get_node({x=x+11, y=y+8, z=-77}).name == "default:meselamp" then
                    if minetest.get_node({x=x+11, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        minetest.set_node({x=x+11, y=y+8, z=-78+z}, {name="labyrinthus:ball2"})
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
                if minetest.get_node({x=x+10, y=y+7, z=-77}).name == "default:apple" then
                    if minetest.get_node({x=x+10, y=y+7, z=-76}).name ~= "labyrinthus:key2" then
                        y = y-2
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+10, y=y+7, z=-77}).name == "air" or minetest.get_node({x=x+10, y=y+7, z=-77}).name == "default:meselamp" then
                    if minetest.get_node({x=x+10, y=y+7, z=-76}).name ~= "labyrinthus:key2" then
                        minetest.set_node({x=x+10, y=y+7, z=-78+z}, {name="labyrinthus:ball2"})
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
                if minetest.get_node({x=x+9, y=y+8, z=-77}).name == "default:apple" then
                    if minetest.get_node({x=x+9, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        x = x-2
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+9, y=y+8, z=-77}).name == "air" or minetest.get_node({x=x+9, y=y+8, z=-77}).name == "default:meselamp" then
                    if minetest.get_node({x=x+9, y=y+8, z=-76}).name ~= "labyrinthus:key2" then
                        minetest.set_node({x=x+9, y=y+8, z=-78+z}, {name="labyrinthus:ball2"})
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
                if minetest.get_node({x=x+10, y=y+9, z=-77}).name == "default:apple" then
                    if minetest.get_node({x=x+10, y=y+9, z=-76}).name ~= "labyrinthus:key2" then
                        y = y+2
                    else
                        d = 1
                    end
                elseif minetest.get_node({x=x+10, y=y+9, z=-77}).name == "air" or minetest.get_node({x=x+10, y=y+9, z=-77}).name == "default:meselamp" then
                    if minetest.get_node({x=x+10, y=y+9, z=-76}).name ~= "labyrinthus:key2" then
                        minetest.set_node({x=x+10, y=y+9, z=-78+z}, {name="labyrinthus:ball2"})
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
                    if minetest.get_node({x=i, y=k, z=-77}).name == "labyrinthus:ball2" then
                        minetest.set_node({x=i, y=k, z=-77}, {name="air"})
                    end
                end
            end
        end, pos, str)
        player_inv:set_stack("s", 1, "") 
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
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j-1, y=l, z=-77}).name == "air" and minetest.get_node({x=j-1, y=l, z=-76}).name == "default:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j-1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j-1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j-1, y=l, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j-1, y=l, z=-76}).name == "default:sand" and d == 0 then
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
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j+1, y=l, z=-77}).name == "air" and minetest.get_node({x=j+1, y=l, z=-76}).name == "default:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j+1, y=l, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j+1, y=l, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j+1, y=l, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j+1, y=l, z=-76}).name == "default:sand" and d == 0 then
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
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l+1, z=-77}).name == "air" and minetest.get_node({x=j, y=l+1, z=-76}).name == "default:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l+1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l+1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l+1, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j, y=l+1, z=-76}).name == "default:sand" and d == 0 then
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
                if minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and minetest.get_node({x=j, y=l-1, z=-77}).name == "air" and minetest.get_node({x=j, y=l-1, z=-76}).name == "default:sand" and d == 0 then
                    minetest.set_node({x=j, y=l, z=-77}, {name="air"})
                    minetest.set_node({x=j, y=l-1, z=-77}, {name="labyrinthus:pbj_pup"})
                    d = 1
                elseif minetest.get_node({x=j, y=l, z=-77}).name == "labyrinthus:pbj_pup" and (minetest.get_node({x=j, y=l-1, z=-77}).name == "nyancat:nyancat" or minetest.get_node({x=j, y=l-1, z=-77}).name == "labyrinthus:nyancat2") and minetest.get_node({x=j, y=l-1, z=-76}).name == "default:sand" and d == 0 then
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
    if block == nil then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2"  and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
    elseif block == "wood" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
    elseif block == "red" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then	
							return true
						end
					end
                end
            end
        end
    elseif block == "green" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
    elseif block == "blue" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
	elseif block == "dirt" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2"  and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
	elseif block == "arrow4" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:water" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
            if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" then
                if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2"  and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
                    if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
							return true
						end
					end
                end
            end
        end
	elseif block == "bow" then
        if minetest.get_node({x=x, y=y, z=-77}).name == "air" or minetest.get_node({x=x, y=y, z=-77}).name == "labyrinthus:bow_right" or minetest.get_node({x=x, y=y, z=-77}).name == "labyrinthus:bow_left" or minetest.get_node({x=x, y=y, z=-77}).name == "labyrinthus:bow_down" or minetest.get_node({x=x, y=y, z=-77}).name == "labyrinthus:bow_up" then
			if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:blue1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:moon" then
				if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:key2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:tp" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:ball1" and minetest.get_node({x=x, y=y, z=-76}).name ~= "nyancat:nyancat_rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "bones:bones" then
					if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:button12" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:fire" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:round4" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow2"  and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sun" then
						if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:cyan" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:purple" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:yellow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:red3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:gate" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:arrow4_2" then
							if minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow2" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:rainbow3" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:sand_for_green_dirt" and minetest.get_node({x=x, y=y, z=-76}).name ~= "labyrinthus:wood_for_yellow" then
								return true
							end
						end
					end
                end
            end
        end
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
    player_inv:set_size("r", 1)
    player_inv:set_size("s", 1)
    player_inv:set_size("l", 5)
    player_inv:set_size("b", 1)
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
function New2(player)
    local player_inv = player:get_inventory()
    Load(player)
    local file = io.open(minetest.get_worldpath().."/move1.txt", "r")
    local c = fsize(file)
    file:close()
    if c > 5 then
        lv = io.open(minetest.get_worldpath().."/move1.txt", "r")
        local ar1 = {}
        local ar2 = {}
        for i=1,12 do
	        ar1[i] = lv:read("*l")
        end
        local zw = lv:read("*l")
        for i=1,12 do
	        ar2[i] = lv:read("*l")
        end
        local zw2 = lv:read("*l")
        local rrr1 = lv:read("*l")
        local rrr2 = lv:read("*l")
        local rrr3 = lv:read("*l")
        local rrr4 = lv:read("*l")
        local rrr5 = lv:read("*l")
        local rrr6 = lv:read("*l")
        local rrr7 = lv:read("*l")
        local rrr8 = lv:read("*l")
        local rrr9 = lv:read("*l")
        local rrr10 = lv:read("*l")
        local rrr11 = lv:read("*l")
        local rrr12 = lv:read("*l")
        local rrr13 = lv:read("*l")
        local rrr14 = lv:read("*l")
        local rrr15 = lv:read("*l")
        local rrr16 = lv:read("*l")
		local rrr17 = lv:read("*l")
		local rrr18 = lv:read("*l")
		local rrr19 = lv:read("*l")
		local rrr20 = lv:read("*l")
		local rrr21 = lv:read("*l")
        for i=10,29 do
            for j=-78,-76 do
                for k=9,20 do
                    minetest.set_node({x=i, y=k, z=j}, {name="air"})
                end
            end
        end
        for j = 1, 12 do
            for i = 1, string.len(ar1[j]) do
                if string.sub(ar1[j], i, i) == "0" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="default:sand"})
                elseif string.sub(ar1[j], i, i) == "1" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water"})
                elseif string.sub(ar1[j], i, i) == "2" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:rainbow"})
                elseif string.sub(ar1[j], i, i) == "3" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red1"})
                elseif string.sub(ar1[j], i, i) == "4" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green1"})
                elseif string.sub(ar1[j], i, i) == "5" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button1"})
                elseif string.sub(ar1[j], i, i) == "6" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue1"})
                elseif string.sub(ar1[j], i, i) == "7" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_col"})
                elseif string.sub(ar1[j], i, i) == "8" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_col"})
                elseif string.sub(ar1[j], i, i) == "9" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue_col"})
                elseif string.sub(ar1[j], i, i) == "a" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:key2"})
                elseif string.sub(ar1[j], i, i) == "b" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:tp"})
                elseif string.sub(ar1[j], i, i) == "c" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ball1"})
                elseif string.sub(ar1[j], i, i) == "d" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:boom"})
                elseif string.sub(ar1[j], i, i) == "e" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:00"})
                elseif string.sub(ar1[j], i, i) == "f" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:eye1"})
                elseif string.sub(ar1[j], i, i) == "g" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:box"})
                elseif string.sub(ar1[j], i, i) == "h" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="bones:bones"})
                elseif string.sub(ar1[j], i, i) == "i" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button13"})
                elseif string.sub(ar1[j], i, i) == "j" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:fire"})
                elseif string.sub(ar1[j], i, i) == "k" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow"})
                elseif string.sub(ar1[j], i, i) == "l" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round2"})
                elseif string.sub(ar1[j], i, i) == "m" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round3"})
                elseif string.sub(ar1[j], i, i) == "n" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow2"})
                elseif string.sub(ar1[j], i, i) == "o" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_sand"})
                elseif string.sub(ar1[j], i, i) == "p" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:moon"})
                elseif string.sub(ar1[j], i, i) == "q" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sun"})
                elseif string.sub(ar1[j], i, i) == "r" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_wood"})
                elseif string.sub(ar1[j], i, i) == "s" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:time"..rrr14})
                elseif string.sub(ar1[j], i, i) == "t" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice1"})
                elseif string.sub(ar1[j], i, i) == "u" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice2"})
                elseif string.sub(ar1[j], i, i) == "v" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice3"})
                elseif string.sub(ar1[j], i, i) == "w" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round4"})
                elseif string.sub(ar1[j], i, i) == "x" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round1"})
				elseif string.sub(ar1[j], i, i) == "y" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:dirt"})
				elseif string.sub(ar1[j], i, i) == "z" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:rainbow2"})
				elseif string.sub(ar1[j], i, i) == "A" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:purple"})
				elseif string.sub(ar1[j], i, i) == "B" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:empty_gate"})
				elseif string.sub(ar1[j], i, i) == "C" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:gate_arrows"})
				elseif string.sub(ar1[j], i, i) == "D" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_cross"})
				elseif string.sub(ar1[j], i, i) == "E" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_cross"})
				elseif string.sub(ar1[j], i, i) == "F" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue_cross"})
				elseif string.sub(ar1[j], i, i) == "G" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:purple_dirt"})
				elseif string.sub(ar1[j], i, i) == "H" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:gate"})
				elseif string.sub(ar1[j], i, i) == "I" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green"})
				elseif string.sub(ar1[j], i, i) == "J" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_wood_with_green"})
				elseif string.sub(ar1[j], i, i) == "K" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sand_for_green"})
				elseif string.sub(ar1[j], i, i) == "L" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:cyan"})
				elseif string.sub(ar1[j], i, i) == "M" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:bow"})
				elseif string.sub(ar1[j], i, i) == "N" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow4_2"})
				elseif string.sub(ar1[j], i, i) == "O" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_dirt"})
				elseif string.sub(ar1[j], i, i) == "P" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:cyan_dirt"})
				elseif string.sub(ar1[j], i, i) == "Q" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:tp2"})
				elseif string.sub(ar1[j], i, i) == "R" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:yellow2"})
				elseif string.sub(ar1[j], i, i) == "S" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:yellow_dirt"})
				elseif string.sub(ar1[j], i, i) == "T" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:wood_for_yellow"})
				elseif string.sub(ar1[j], i, i) == "U" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_stone"})
				elseif string.sub(ar1[j], i, i) == "V" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sand_for_green_dirt"})
				elseif string.sub(ar1[j], i, i) == "W" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red3"})
                elseif string.sub(ar1[j], i, i) == "!" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button12"})
                elseif string.sub(ar1[j], i, i) == "§" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button2"})
				elseif string.sub(ar1[j], i, i) == "$" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:empty_gate_purple"})
				elseif string.sub(ar1[j], i, i) == "%" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:gate"})
				elseif string.sub(ar1[j], i, i) == "&" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button3"})
				elseif string.sub(ar1[j], i, i) == "/" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="default:wood"})
                end
            end
        end
        for j = 1, 12 do
            for i = 1, string.len(ar2[j]) do
                if string.sub(ar2[j], i, i) == "1" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:junglewood"})
                elseif string.sub(ar2[j], i, i) == "2" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:stone"})
                elseif string.sub(ar2[j], i, i) == "3" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:meselamp"})
                elseif string.sub(ar2[j], i, i) == "4" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red2"})
                elseif string.sub(ar2[j], i, i) == "5" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:green2"})
                elseif string.sub(ar2[j], i, i) == "6" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:button2"})
                elseif string.sub(ar2[j], i, i) == "7" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue2"})
                elseif string.sub(ar2[j], i, i) == "8" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:key1"})
                elseif string.sub(ar2[j], i, i) == "9" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:diamondblock"})
                elseif string.sub(ar2[j], i, i) == "a" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:pbj_pup"})
                elseif string.sub(ar2[j], i, i) == "b" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:cobble"})
                elseif string.sub(ar2[j], i, i) == "c" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="tnt:tnt"})
                elseif string.sub(ar2[j], i, i) == "d" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:apple"})
                elseif string.sub(ar2[j], i, i) == "e" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:4"})
                elseif string.sub(ar2[j], i, i) == "f" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:3"})
                elseif string.sub(ar2[j], i, i) == "g" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:2"})
                elseif string.sub(ar2[j], i, i) == "h" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:1"})
                elseif string.sub(ar2[j], i, i) == "i" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:eye2"})
                elseif string.sub(ar2[j], i, i) == "j" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red"})
                elseif string.sub(ar2[j], i, i) == "k" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue"})
                elseif string.sub(ar2[j], i, i) == "l" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow"})
                elseif string.sub(ar2[j], i, i) == "m" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:glass"})
                elseif string.sub(ar2[j], i, i) == "n" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan1"})
                elseif string.sub(ar2[j], i, i) == "o" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan2"})
                elseif string.sub(ar2[j], i, i) == "p" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan3"})
                elseif string.sub(ar2[j], i, i) == "q" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan4"})
                elseif string.sub(ar2[j], i, i) == "r" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:arrow3"})
				elseif string.sub(ar2[j], i, i) == "s" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:leaves"})
				elseif string.sub(ar2[j], i, i) == "t" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:water_ball"})
				elseif string.sub(ar2[j], i, i) == "u" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:transport_stone"})
				elseif string.sub(ar2[j], i, i) == "v" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red_pyramid"})
				elseif string.sub(ar2[j], i, i) == "w" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:green_pyramid"})
				elseif string.sub(ar2[j], i, i) == "x" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue_pyramid"})
				elseif string.sub(ar2[j], i, i) == "y" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_right"})
				elseif string.sub(ar2[j], i, i) == "z" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_left"})
				elseif string.sub(ar2[j], i, i) == "A" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_down"})
				elseif string.sub(ar2[j], i, i) == "B" then
					minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_up"})
				elseif string.sub(ar2[j], i, i) == "C" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:button3"})
				elseif string.sub(ar2[j], i, i) == "D" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow_block", param2 = 8})
				elseif string.sub(ar2[j], i, i) == "E" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow_red"})
                elseif string.sub(ar2[j], i, i) == "!" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="nyancat:nyancat"})
                elseif string.sub(ar2[j], i, i) == "§" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:button13"})
				elseif string.sub(ar2[j], i, i) == "$" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:transport_stone_gate_arrows"})
				elseif string.sub(ar2[j], i, i) == "%" then
                    minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red_with_no_yellow"})
                end
            end
        end
		player_inv:set_stack("re", 1, "default:dirt "..rrr2)
		player_inv:set_stack("ye", 1, "default:dirt "..rrr3)
		player_inv:set_stack("c", 1, "default:dirt "..rrr4)
		player_inv:set_stack("p", 1, "default:dirt "..rrr5)
		player_inv:set_stack("g", 1, "default:dirt "..rrr6)
        player_inv:set_stack("k", 1, "default:dirt "..rrr7)
        player_inv:set_stack("r", 1, "default:dirt "..rrr8)
        player_inv:set_stack("s", 1, "default:dirt "..rrr9)
        player_inv:set_stack("b", 1, "default:dirt "..rrr10)
        player_inv:set_stack("a", 1, "default:dirt "..rrr11)
        player_inv:set_stack("a2", 1, "default:dirt "..rrr12)
        player_inv:set_stack("time", 1, "default:dirt "..rrr13)
        player_inv:set_stack("f", 1, "default:dirt "..rrr15)
        player_inv:set_stack("x", 1, "default:dirt "..rrr16)
        player_inv:set_stack("y", 1, "default:dirt "..rrr17)
        player_inv:set_stack("z", 1, "default:dirt "..rrr18)
		local x = player_inv:get_stack("x", 1):get_count()
        local y = player_inv:get_stack("y", 1):get_count()
		minetest.set_node({x=x+10, y=y+8, z=-77}, {name="nyancat:nyancat"})
        pon = tonumber(rrr19)
        rrr = tonumber(rrr20)
        rrrr = tonumber(rrr21)
        if rrr1 == "false" then
            for i = 9, 30 do
                for j = 0,14 do
                    minetest.set_node({x=i, y=22, z=-89+j}, {name="labyrinthus:meselamp"})
                end
            end
        elseif rrr1 == "true" then
            for i = 9, 30 do
                for j = 0,14 do
                    minetest.set_node({x=i, y=22, z=-89+j}, {name="default:stone"})
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
        update()
    end
end
function New(player,page)
    local player_inv = player:get_inventory()
    Load(player)
    player_inv:set_size("f", 1)
    lv = io.open(minetest.get_worldpath().."/level1.txt", "r")
	local level = lv:read("*l")
    lv:close()
    local lv = io.open(minetest.get_modpath("labyrinthus").."/lv"..page..".txt", "r")
    local ar1 = {}
    local ar2 = {}
	if string.sub(page, 1, 1) == "5" then
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
	if string.sub(page, 1, 1) == "5" then
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
	local rrr1 = lv:read("*l")
	local rrr2 = lv:read("*l")
	local rrr3 = lv:read("*l")
    for i=10,29 do
        for j=-78,-76 do
            for k=9,20 do
                minetest.set_node({x=i, y=k, z=j}, {name="air"})
            end
        end
    end
    for j = 1, 12 do
        for i = 1, string.len(ar1[j]) do
            if string.sub(ar1[j], i, i) == "0" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="default:sand"})
            elseif string.sub(ar1[j], i, i) == "1" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water"})
            elseif string.sub(ar1[j], i, i) == "2" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:rainbow"})
            elseif string.sub(ar1[j], i, i) == "3" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red1"})
            elseif string.sub(ar1[j], i, i) == "4" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green1"})
            elseif string.sub(ar1[j], i, i) == "5" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button1"})
            elseif string.sub(ar1[j], i, i) == "6" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue1"})
            elseif string.sub(ar1[j], i, i) == "7" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_col"})
            elseif string.sub(ar1[j], i, i) == "8" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_col"})
            elseif string.sub(ar1[j], i, i) == "9" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue_col"})
            elseif string.sub(ar1[j], i, i) == "a" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:key2"})
            elseif string.sub(ar1[j], i, i) == "b" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:tp"})
            elseif string.sub(ar1[j], i, i) == "c" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ball1"})
            elseif string.sub(ar1[j], i, i) == "d" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:boom"})
            elseif string.sub(ar1[j], i, i) == "e" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:00"})
            elseif string.sub(ar1[j], i, i) == "f" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:eye1"})
            elseif string.sub(ar1[j], i, i) == "g" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:box"})
            elseif string.sub(ar1[j], i, i) == "h" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="bones:bones"})
            elseif string.sub(ar1[j], i, i) == "i" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:button11"})
            elseif string.sub(ar1[j], i, i) == "j" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:fire"})
            elseif string.sub(ar1[j], i, i) == "k" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow"})
            elseif string.sub(ar1[j], i, i) == "l" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round2"})
            elseif string.sub(ar1[j], i, i) == "m" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round3"})
            elseif string.sub(ar1[j], i, i) == "n" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow2"})
            elseif string.sub(ar1[j], i, i) == "o" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_sand"})
            elseif string.sub(ar1[j], i, i) == "p" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:moon"})
            elseif string.sub(ar1[j], i, i) == "q" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sun"})
            elseif string.sub(ar1[j], i, i) == "r" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_wood"})
            elseif string.sub(ar1[j], i, i) == "s" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:time30"})
            elseif string.sub(ar1[j], i, i) == "t" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice1"})
            elseif string.sub(ar1[j], i, i) == "u" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice2"})
            elseif string.sub(ar1[j], i, i) == "v" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:ice3"})
            elseif string.sub(ar1[j], i, i) == "w" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round4"})
            elseif string.sub(ar1[j], i, i) == "x" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:round1"})
			elseif string.sub(ar1[j], i, i) == "y" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:dirt"})
			elseif string.sub(ar1[j], i, i) == "z" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:rainbow2"})
			elseif string.sub(ar1[j], i, i) == "A" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:purple"})
			elseif string.sub(ar1[j], i, i) == "B" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:empty_gate"})
			elseif string.sub(ar1[j], i, i) == "C" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:gate_arrows"})
			elseif string.sub(ar1[j], i, i) == "D" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red_cross"})
			elseif string.sub(ar1[j], i, i) == "E" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_cross"})
			elseif string.sub(ar1[j], i, i) == "F" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:blue_cross"})
			elseif string.sub(ar1[j], i, i) == "G" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:purple_dirt"})
			elseif string.sub(ar1[j], i, i) == "H" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:gate"})
			elseif string.sub(ar1[j], i, i) == "I" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green"})
			elseif string.sub(ar1[j], i, i) == "J" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_wood_with_green"})
			elseif string.sub(ar1[j], i, i) == "K" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sand_for_green"})
			elseif string.sub(ar1[j], i, i) == "L" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:cyan"})
			elseif string.sub(ar1[j], i, i) == "M" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:bow"})
			elseif string.sub(ar1[j], i, i) == "N" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:arrow4_2"})
			elseif string.sub(ar1[j], i, i) == "O" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:green_dirt"})
			elseif string.sub(ar1[j], i, i) == "P" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:cyan_dirt"})
			elseif string.sub(ar1[j], i, i) == "Q" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:tp2"})
			elseif string.sub(ar1[j], i, i) == "R" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:yellow2"})
			elseif string.sub(ar1[j], i, i) == "S" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:yellow_dirt"})
			elseif string.sub(ar1[j], i, i) == "T" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:wood_for_yellow"})
			elseif string.sub(ar1[j], i, i) == "U" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:water_stone"})
			elseif string.sub(ar1[j], i, i) == "V" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:sand_for_green_dirt"})
			elseif string.sub(ar1[j], i, i) == "W" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-76}, {name="labyrinthus:red3"})
            end
        end
    end
    for j = 1, 12 do
        for i = 1, string.len(ar2[j]) do
            if string.sub(ar2[j], i, i) == "1" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:junglewood"})
            elseif string.sub(ar2[j], i, i) == "2" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:stone"})
            elseif string.sub(ar2[j], i, i) == "3" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:meselamp"})
            elseif string.sub(ar2[j], i, i) == "4" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red2"})
            elseif string.sub(ar2[j], i, i) == "5" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:green2"})
            elseif string.sub(ar2[j], i, i) == "6" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:button2"})
            elseif string.sub(ar2[j], i, i) == "7" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue2"})
            elseif string.sub(ar2[j], i, i) == "8" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:key1"})
            elseif string.sub(ar2[j], i, i) == "9" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:diamondblock"})
            elseif string.sub(ar2[j], i, i) == "a" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:pbj_pup"})
            elseif string.sub(ar2[j], i, i) == "b" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:cobble"})
            elseif string.sub(ar2[j], i, i) == "c" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="tnt:tnt"})
            elseif string.sub(ar2[j], i, i) == "d" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="default:apple"})
            elseif string.sub(ar2[j], i, i) == "e" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:4"})
            elseif string.sub(ar2[j], i, i) == "f" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:3"})
            elseif string.sub(ar2[j], i, i) == "g" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:2"})
            elseif string.sub(ar2[j], i, i) == "h" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:1"})
            elseif string.sub(ar2[j], i, i) == "i" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:eye2"})
            elseif string.sub(ar2[j], i, i) == "j" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red"})
            elseif string.sub(ar2[j], i, i) == "k" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue"})
            elseif string.sub(ar2[j], i, i) == "l" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow"})
            elseif string.sub(ar2[j], i, i) == "m" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:glass"})
            elseif string.sub(ar2[j], i, i) == "n" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan1"})
            elseif string.sub(ar2[j], i, i) == "o" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan2"})
            elseif string.sub(ar2[j], i, i) == "p" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan3"})
            elseif string.sub(ar2[j], i, i) == "q" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:nyan4"})
            elseif string.sub(ar2[j], i, i) == "r" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:arrow3"})
			elseif string.sub(ar2[j], i, i) == "s" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:leaves"})
			elseif string.sub(ar2[j], i, i) == "t" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:water_ball"})
			elseif string.sub(ar2[j], i, i) == "u" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:transport_stone"})
			elseif string.sub(ar2[j], i, i) == "v" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:red_pyramid"})
			elseif string.sub(ar2[j], i, i) == "w" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:green_pyramid"})
			elseif string.sub(ar2[j], i, i) == "x" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:blue_pyramid"})
			elseif string.sub(ar2[j], i, i) == "y" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_right"})
			elseif string.sub(ar2[j], i, i) == "z" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_left"})
			elseif string.sub(ar2[j], i, i) == "A" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_down"})
			elseif string.sub(ar2[j], i, i) == "B" then
				minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:bow_up"})
			elseif string.sub(ar2[j], i, i) == "C" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:button3"})
			elseif string.sub(ar2[j], i, i) == "D" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow_block", param2 = 8})
			elseif string.sub(ar2[j], i, i) == "E" then
                minetest.set_node({x=i+9, y=(13-j)+8, z=-77}, {name="labyrinthus:yellow_red"})
            end
        end
    end
    player_inv:set_stack("x", 1, "default:dirt "..rrr1)
    player_inv:set_stack("y", 1, "default:dirt "..rrr2)
    player_inv:set_stack("z", 1, "default:dirt "..rrr3)
    player_inv:set_stack("k", 1, nil)
    player_inv:set_stack("r", 1, nil)
    player_inv:set_stack("s", 1, nil)
	player_inv:set_stack("p", 1, nil)
	player_inv:set_stack("g", 1, nil)
	player_inv:set_stack("c", 1, nil)
	player_inv:set_stack("ye", 1, nil)
	player_inv:set_stack("re", 1, nil)
    player_inv:set_stack("b", 1, nil)
    player_inv:set_stack("f", 1, nil)
    player_inv:set_stack("a", 1, nil)
    player_inv:set_stack("a2", 1, nil)
    player_inv:set_stack("time", 1, nil)
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
    local z = player_inv:get_stack("z", 1):get_count()
    rrr = 0
    minetest.set_node({x=x+10, y=y+8, z=-78+z}, {name="nyancat:nyancat"})
    update()
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
local w11 = {}
w11.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec..lvbut(0,25,level2)
        if tonumber(level2) > 25 then
            formspec = formspec.."button[2.5,6;1,1;wab;>]"
        end
	return formspec		
end
local w12 = {}
w12.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;waa;<]"
        formspec = formspec..lvbut(25,25,level2)
        if tonumber(level2) > 50 then
            formspec = formspec.."button[2.5,6;1,1;wac;>]"
        end
	return formspec		
end
local w13 = {}
w13.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wab;<]"
        formspec = formspec..lvbut(50,25,level2)
        if tonumber(level2) > 75 then
            formspec = formspec.."button[2.5,6;1,1;wad;>]"
        end
	return formspec		
end
local w14 = {}
w14.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wac;<]"
        formspec = formspec..lvbut(75,25,level2)
        if tonumber(level2) > 100 then
            formspec = formspec.."button[2.5,6;1,1;wae;>]"
        end
	return formspec		
end
local w15 = {}
w15.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wad;<]"
        formspec = formspec..lvbut(100,25,level2)
        if tonumber(level2) > 125 then
            formspec = formspec.."button[2.5,6;1,1;waf;>]"
        end
	return formspec		
end
local w16 = {}
w16.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level1.txt", "r")
	local level = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wae;<]"
        formspec = formspec..lvbut(125,25,level2)
        if tonumber(level2) > 150 then
            formspec = formspec.."button[2.5,6;1,1;wag;>]"
        end
	return formspec		
end
local w17 = {}
w17.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;waf;<]"
        formspec = formspec..lvbut(150,25,level2)
        if tonumber(level2) > 175 then
            formspec = formspec.."button[2.5,6;1,1;wah;>]"
        end
	return formspec		
end
local w18 = {}
w18.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wag;<]"
        formspec = formspec..lvbut(175,25,level2)
        if tonumber(level2) > 200 then
            formspec = formspec.."button[2.5,6;1,1;wai;>]"
        end
	return formspec		
end
local w19 = {}
w19.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wah;<]"
        formspec = formspec..lvbut(200,25,level2)
        if tonumber(level2) > 225 then
            formspec = formspec.."button[2.5,6;1,1;waj;>]"
        end
	return formspec		
end
local w110 = {}
w110.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level2.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/250]"
        formspec = formspec.."button[1.5,6;1,1;wai;<]"
        formspec = formspec..lvbut(225,25,level2)
        if tonumber(level2) > 250 then
            formspec = formspec.."label[0,5.7;play world 1, 3 and 4]"
        end
	return formspec		
end
local w21 = {}
w21.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec..lvbut(0,25,level2)
        if tonumber(level2) > 25 then
            formspec = formspec.."button[2.5,6;1,1;wbb;>]"
        end
	return formspec		
end
local w22 = {}
w22.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wba;<]"
        formspec = formspec..lvbut(25,25,level2)
        if tonumber(level2) > 50 then
            formspec = formspec.."button[2.5,6;1,1;wbc;>]"
        end
	return formspec		
end
local w23 = {}
w23.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wbb;<]"
        formspec = formspec..lvbut(50,25,level2)
        if tonumber(level2) > 75 then
            formspec = formspec.."button[2.5,6;1,1;wbd;>]"
        end
	return formspec		
end
local w24 = {}
w24.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wbc;<]"
        formspec = formspec..lvbut(75,25,level2)
        if tonumber(level2) > 100 then
            formspec = formspec.."button[2.5,6;1,1;wbe;>]"
        end
	return formspec		
end
local w25 = {}
w25.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wbd;<]"
        formspec = formspec..lvbut(100,25,level2)
        if tonumber(level2) > 125 then
            formspec = formspec.."button[2.5,6;1,1;wbf;>]"
        end
	return formspec		
end
local w26 = {}
w26.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wbe;<]"
        formspec = formspec..lvbut(125,25,level2)
        if tonumber(level2) > 150 then
            formspec = formspec.."button[2.5,6;1,1;wbg;>]"
        end
	return formspec		
end
local w27 = {}
w27.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level3.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/174]"
        formspec = formspec.."button[1.5,6;1,1;wbf;<]"
        formspec = formspec..lvbut(150,24,level2)
        if tonumber(level2) > 174 then
            formspec = formspec.."label[0,5.8;play world 1, 2 and 4]"
        end
	return formspec		
end
local w31 = {}
w31.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level4.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/86]"
        formspec = formspec..lvbut(0,25,level2)
        if tonumber(level2) > 25 then
            formspec = formspec.."button[2.5,6;1,1;wcb;>]"
        end
	return formspec		
end
local w32 = {}
w32.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level4.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/86]"
        formspec = formspec.."button[1.5,6;1,1;wca;<]"
        formspec = formspec..lvbut(25,25,level2)
        if tonumber(level2) > 50 then
            formspec = formspec.."button[2.5,6;1,1;wcc;>]"
        end
	return formspec		
end
local w33 = {}
w33.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level4.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/86]"
        formspec = formspec.."button[1.5,6;1,1;wcb;<]"
        formspec = formspec..lvbut(50,25,level2)
        if tonumber(level2) > 75 then
            formspec = formspec.."button[2.5,6;1,1;wcd;>]"
        end
	return formspec		
end
local w34 = {}
w34.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level4.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/86]"
        formspec = formspec.."button[1.5,6;1,1;wcc;<]"
        formspec = formspec..lvbut(75,11,level2)
        if tonumber(level2) > 86 then
            formspec = formspec.."label[0,4;play world 1, 2 and 3]"
        end
	return formspec		
end
local w51 = {}
w51.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level5.txt", "r")
	local level5 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level5)-1).."/50]"
        formspec = formspec..lvbut(0,25,level5)
        if tonumber(level5) > 25 then
            formspec = formspec.."button[2.5,6;1,1;wdb;>]"
        end
	return formspec		
end
local w52 = {}
w52.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level5.txt", "r")
	local level5 = lv:read("*l")
    lv:close()
    local player_inv = player:get_inventory()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level5)-1).."/50]"
		formspec = formspec.."button[1.5,6;1,1;wda;<]"
        formspec = formspec..lvbut(25,25,level5)
        if tonumber(level5) > 50 then
            formspec = formspec.."label[0,6;more comming soon]"
        end
	return formspec		
end
local tu = {}
tu.get_formspec = function(player, pos)
	if player == nil then
        return
    end
	local player_inv = player:get_inventory()
    lv = io.open(minetest.get_worldpath().."/level1.txt", "r")
	local level2 = lv:read("*l")
    lv:close()
	formspec = "size[5,6.5]"
        .."label[0,0;World Level:     "..(tonumber(level2)-1).."/18]"
        formspec = formspec..lvbut(0,18,level2)
        if tonumber(level2) > 18 then
            formspec = formspec.."label[0,5;play world 2, 3 and 4]"
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
        minetest.show_formspec(player:get_player_name(), "tu" , tu.get_formspec(player))
    end,
})
minetest.register_node("labyrinthus:restart",{
	tiles  = {"default_desert_sand.png^labyrinthus_move_reset.png"},
	description = "Reset move",
    paramtype = "light",
	light_source = 1,
    --groups = {snappy=1,choppy=2,oddly_breakable_by_hand=2,flammable=3},
    on_punch = function(pos, node, player, pointed_thing)
        New2(player)
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
            minetest.show_formspec(player:get_player_name(), "w11" , w11.get_formspec(player))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w12" , w12.get_formspec(player))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w13" , w13.get_formspec(player))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w14" , w14.get_formspec(player))
        elseif page == 5 then
            minetest.show_formspec(player:get_player_name(), "w15" , w15.get_formspec(player))
        elseif page == 6 then
            minetest.show_formspec(player:get_player_name(), "w16" , w16.get_formspec(player))
        elseif page == 7 then
            minetest.show_formspec(player:get_player_name(), "w17" , w17.get_formspec(player))
        elseif page == 8 then
            minetest.show_formspec(player:get_player_name(), "w18" , w18.get_formspec(player))
        elseif page == 9 then
            minetest.show_formspec(player:get_player_name(), "w19" , w19.get_formspec(player))
        elseif page == 10 then
            minetest.show_formspec(player:get_player_name(), "w110" , w110.get_formspec(player))
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
            minetest.show_formspec(player:get_player_name(), "w21" , w21.get_formspec(player))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w22" , w22.get_formspec(player))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w23" , w23.get_formspec(player))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w24" , w24.get_formspec(player))
        elseif page == 5 then
            minetest.show_formspec(player:get_player_name(), "w25" , w25.get_formspec(player))
        elseif page == 6 then
            minetest.show_formspec(player:get_player_name(), "w26" , w26.get_formspec(player))
        elseif page == 7 then
            minetest.show_formspec(player:get_player_name(), "w27" , w27.get_formspec(player))
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
            minetest.show_formspec(player:get_player_name(), "w51" , w31.get_formspec(player))
        elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w52" , w32.get_formspec(player))
        elseif page == 3 then
            minetest.show_formspec(player:get_player_name(), "w33" , w33.get_formspec(player))
        elseif page == 4 then
            minetest.show_formspec(player:get_player_name(), "w34" , w34.get_formspec(player))
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
            minetest.show_formspec(player:get_player_name(), "w51" , w51.get_formspec(player))
		elseif page == 2 then
            minetest.show_formspec(player:get_player_name(), "w52" , w52.get_formspec(player))
        end
    end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
    Load(player)
	if formname == "tu" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"1_"..v)
                player_inv:set_stack("l",  1, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 1")
            end
        end
        minetest.show_formspec(player:get_player_name(), "", "")
	end
    if fields.waa then
        player_inv:set_stack("page1",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w11" , w11.get_formspec(player))
    elseif fields.wab then
        player_inv:set_stack("page1",  1, "default:dirt")
        minetest.show_formspec(player:get_player_name(), "w12" , w12.get_formspec(player))
    elseif fields.wac then
        player_inv:set_stack("page1",  1, "default:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w13" , w13.get_formspec(player))
    elseif fields.wad then
        player_inv:set_stack("page1",  1, "default:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w14" , w14.get_formspec(player))
    elseif fields.wae then
        player_inv:set_stack("page1",  1, "default:dirt 4")
        minetest.show_formspec(player:get_player_name(), "w15" , w15.get_formspec(player))
    elseif fields.waf then
        player_inv:set_stack("page1",  1, "default:dirt 5")
        minetest.show_formspec(player:get_player_name(), "w16" , w16.get_formspec(player))
    elseif fields.wag then
        player_inv:set_stack("page1",  1, "default:dirt 6")
        minetest.show_formspec(player:get_player_name(), "w17" , w17.get_formspec(player))
    elseif fields.wah then
        player_inv:set_stack("page1",  1, "default:dirt 7")
        minetest.show_formspec(player:get_player_name(), "w18" , w18.get_formspec(player))
    elseif fields.wai then
        player_inv:set_stack("page1",  1, "default:dirt 8")
        minetest.show_formspec(player:get_player_name(), "w19" , w19.get_formspec(player))
    elseif fields.waj then
        player_inv:set_stack("page1",  1, "default:dirt 9")
        minetest.show_formspec(player:get_player_name(), "w110" , w110.get_formspec(player))
    elseif fields.wba then
        player_inv:set_stack("page2",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w21" , w21.get_formspec(player))
    elseif fields.wbb then
        player_inv:set_stack("page2",  1, "default:dirt")
        minetest.show_formspec(player:get_player_name(), "w22" , w22.get_formspec(player))
    elseif fields.wbc then
        player_inv:set_stack("page2",  1, "default:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w23" , w23.get_formspec(player))
    elseif fields.wbd then
        player_inv:set_stack("page2",  1, "default:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w24" , w24.get_formspec(player))
    elseif fields.wbe then
        player_inv:set_stack("page2",  1, "default:dirt 4")
        minetest.show_formspec(player:get_player_name(), "w25" , w25.get_formspec(player))
    elseif fields.wbf then
        player_inv:set_stack("page2",  1, "default:dirt 5")
        minetest.show_formspec(player:get_player_name(), "w26" , w26.get_formspec(player))
    elseif fields.wbg then
        player_inv:set_stack("page2",  1, "default:dirt 6")
        minetest.show_formspec(player:get_player_name(), "w27" , w27.get_formspec(player))
    elseif fields.wca then
        player_inv:set_stack("page3",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w31" , w31.get_formspec(player))
    elseif fields.wcb then
        player_inv:set_stack("page3",  1, "default:dirt")
        minetest.show_formspec(player:get_player_name(), "w32" , w32.get_formspec(player))
    elseif fields.wcc then
        player_inv:set_stack("page3",  1, "default:dirt 2")
        minetest.show_formspec(player:get_player_name(), "w33" , w33.get_formspec(player))
    elseif fields.wcd then
        player_inv:set_stack("page3",  1, "default:dirt 3")
        minetest.show_formspec(player:get_player_name(), "w34" , w34.get_formspec(player))
	elseif fields.wda then
        player_inv:set_stack("page5",  1, nil)
        minetest.show_formspec(player:get_player_name(), "w51" , w51.get_formspec(player))
	elseif fields.wdb then
        player_inv:set_stack("page5",  1, "default:dirt")
        minetest.show_formspec(player:get_player_name(), "w52" , w52.get_formspec(player))
    else
        minetest.show_formspec(player:get_player_name(), "", "")
	end
    if formname == "w11" or formname == "w12" or formname == "w13" or formname == "w14" or formname == "w15" or formname == "w16" or formname == "w17" or formname == "w18" or formname == "w19" or formname == "w110" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"2_"..v)
                player_inv:set_stack("l",  2, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 2")
            end
        end
	end
    if formname == "w21" or formname == "w22" or formname == "w23" or formname == "w24" or formname == "w25" or formname == "w26" or formname == "w27" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"3_"..v)
                player_inv:set_stack("l",  3, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 3")
            end
        end
	end
    if formname == "w31" or formname == "w32" or formname == "w33" or formname == "w34" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"4_"..v)
                player_inv:set_stack("l",  4, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 4")
            end
        end
	end
	if formname == "w51" or formname == "w52" then
        for k, v in pairs(fields) do
            if tonumber(v) ~= nil then
                New(player,"5_"..v)
                player_inv:set_stack("l",  5, "default:dirt "..v)
                player_inv:set_stack("ll", 1, "default:dirt 5")
            end
        end
	end
end)