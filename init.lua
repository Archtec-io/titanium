-- load illumination api
dofile(minetest.get_modpath("titanium") .. "/illumination.lua")

-- force Techage to load meridium code
wielded_light = {}

-- blocks
minetest.register_node("titanium:titanium_in_ground", {
	description = "Titanium Ore",
	tiles = {"default_stone.png^titanium_titanium_in_ground.png"},
	is_ground_content = true,
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults(),
	drop = "titanium:titanium"
})

minetest.register_node("titanium:block", {
	description = "Titanium Block",
	tiles  = {"titanium_block.png"},
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults()
})

minetest.register_node("titanium:glass", {
	description = "Titanium Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"titanium_glass.png", "titanium_glass_stripes.png"},
	paramtype = "light",
	sunlight_propagates = true,
	groups = {snappy = 1, cracky = 2, oddly_breakable_by_hand = 2},
	sounds = default.node_sound_glass_defaults()
})

minetest.register_craftitem("titanium:titanium", {
	description = "Titanium",
	inventory_image = "titanium_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item
})

minetest.register_craftitem("titanium:tougher_titanium", {
	description = "Tougher Titanium",
	inventory_image = "tougher_titanium.png",
	on_place_on_ground = minetest.craftitem_place_item
})

minetest.register_node("titanium:titanium_plate", {
	description = "Titanium Plate",
	tiles  = {"titanium_plate.png"},
	inventory_image = "titanium_plate.png",
	groups = {cracky = 1},
	sounds = default.node_sound_stone_defaults()
})

-- tools
minetest.register_tool("titanium:sword", {
	description = "Titanium Sword",
	inventory_image = "titanium_sword.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			snappy={times={[2]=0.60, [3]=0.20}, uses=1000, maxlevel=1},
			choppy={times={[3]=0.70}, uses=1000, maxlevel=0}
		},
		damage_groups = {fleshy=6},
	}
})

minetest.register_tool("titanium:axe", {
	description = "Titanium Axe",
	inventory_image = "titanium_axe.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.50, [2]=1.50, [3]=1.00}, uses=150, maxlevel=2},
		},
		damage_groups = {fleshy=4},
	},
})

minetest.register_tool("titanium:shovel", {
	description = "Titanium Shovel",
	inventory_image = "titanium_shovel.png",
	tool_capabilities = {
		max_drop_level=1,
		groupcaps={
			crumbly={times={[1]=1.0, [2]=0.50, [3]=0.50}, uses=150, maxlevel=3}
		},
		damage_groups = {fleshy=3},
	},
})

minetest.register_tool("titanium:pick", {
	description = "Titanium Pickaxe",
	inventory_image = "titanium_pick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			crumbly={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3},
			snappy={times={[1]=2.4, [2]=1.0, [3]=0.6}, uses=160, maxlevel=3}
		},
		damage_groups = {fleshy=4},
	},
})

-- crafting
minetest.register_craft({
	output = "titanium:pick",
	recipe = {
		{"titanium:titanium", "titanium:titanium", "titanium:titanium"},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "titanium:axe",
	recipe = {
		{"titanium:titanium", "titanium:titanium", ""},
		{"titanium:titanium", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "titanium:shovel",
	recipe = {
		{"", "titanium:titanium", ""},
		{"", "default:stick", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "titanium:sword",
	recipe = {
		{"", "titanium:titanium", ""},
		{"", "titanium:titanium", ""},
		{"", "default:stick", ""},
	}
})

minetest.register_craft({
	output = "titanium:block",
	recipe = {
		{"titanium:titanium", "titanium:titanium", "titanium:titanium"},
		{"titanium:titanium", "titanium:titanium", "titanium:titanium"},
		{"titanium:titanium", "titanium:titanium", "titanium:titanium"},
	}
})

minetest.register_craft({
	output = "titanium:titanium 9",
	recipe = {
		{"titanium:block"},
	}
})

minetest.register_craft({
	output = "titanium:glass",
	recipe = {
		{"", "titanium:titanium", ""},
		{"titanium:titanium", "default:glass", "titanium:titanium"},
		{"", "titanium:titanium", ""},
	}
})

minetest.register_craft({
	output = "titanium:tougher_titanium",
	recipe = {
		{"titanium:titanium", "titanium:titanium"},
		{"titanium:titanium", "titanium:titanium"},
	}
})

minetest.register_craft({
	output = "titanium:titanium_plate 9",
	recipe = {
		{"titanium:tougher_titanium", "titanium:titanium", "titanium:tougher_titanium"},
		{"titanium:titanium", "titanium:tougher_titanium", "titanium:titanium"},
		{"titanium:tougher_titanium", "titanium:titanium", "titanium:tougher_titanium"},
	}
})

minetest.register_ore({
	ore_type = "scatter",
	ore =      "titanium:titanium_in_ground",
	wherein =  "default:stone",
	noise_params = {
		offset = 0,
		scale = 1,
		spread = {x=100, y=100, z=100},
		seed = 21,
		octaves = 2,
		persist = 0.70,
	},
	clust_scarcity = 8192,
	clust_num_ores = 5,
	clust_size = 2,
	y_min = -31000,
	y_max = -1500,
})

minetest.register_tool("titanium:sam_titanium", {
	description = "Google Glass Titanium",
	inventory_image = "sam_titanium.png",
	stack_max = 1,
	groups = {tool = 1},
	on_use = function()
	end,
})

minetest.register_craft({
	output = "titanium:sam_titanium",
	recipe = {
		{"titanium:titanium_plate", "default:torch", "titanium:titanium_plate"},
		{"titanium:glass", "default:mese_crystal", "titanium:glass"},
	}
})

minetest.log("info", "[Titanium Mod] Loaded!")
