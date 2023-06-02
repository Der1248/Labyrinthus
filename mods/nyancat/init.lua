minetest.register_node("nyancat:nyancat", {
	description = "Nyan Cat",
	tiles = {"nyancat_side.png", "nyancat_side.png", "nyancat_side.png",
		"nyancat_side.png", "nyancat_back.png", "nyancat_front.png"},
	paramtype = "light",
	light_source = 4,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	legacy_facedir_simple = true,
})

minetest.register_node("nyancat:nyancat_rainbow", {
	description = "Nyan Cat Rainbow",
	tiles = {
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png^[transformR90",
		"nyancat_rainbow.png"
	},
	paramtype = "light",
	light_source = 0,
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
})

