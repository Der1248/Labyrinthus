local digtime = 42
local caps = {times = {digtime, digtime, digtime}, uses = 0, maxlevel = 256}

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
minetest.register_on_joinplayer(function(player)
    --player:set_inventory_formspec(set.get_formspec(player, player:getpos()))
end)
