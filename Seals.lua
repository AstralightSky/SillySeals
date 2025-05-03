----------------------------------------------
------------MOD CODE -------------------------

function find_hidden_spectrals()
	for i = 1, #G.P_CENTER_POOLS.Spectral do
		if G.P_CENTER_POOLS.Spectral[i].hidden == true then
			table.insert(Seals.hidden_spectral_cards, G.P_CENTER_POOLS.Spectral[i].key)
		end
	end
	return Seals.hidden_spectral_cards
end	

function get_seal_spectral_rarity(rarity)
	if rarity == "rare" then return 0.25
	elseif rarity == "epic" then return 0.08
	elseif rarity == "legendary" then return 0.03
	elseif rarity == "other" then return 0
	end
end

--[[SMODS.ObjectType{
	key = 'Seal_Spectral_Set',
	default = 'multivision',
	cards = {
		["sillyseals_multivision"] = true,
		["sillyseals_abyss"] = true,
		["sillyseals_resurrection"] = true,
		["sillyseals_reinforce"] = true,
		["sillyseals_empower"] = true,
		["sillyseals_assortment"] = true,
		["sillyseals_geode"] = true,

		["sillyseals_hellfire"] = true,
		["sillyseals_sunrays"] = true,
		["sillyseals_dial"] = true,
		["sillyseals_palette"] = true,
		["sillyseals_deposit"] = true,

		["sillyseals_royalty"] = true,
		["sillyseals_spectrum"] = true,
		["sillyseals_quadrants"] = true,
		["sillyseals_sirius"] = true,

		["sillyseals_ringularity"] = true
	},
	rarities = {
		{key="sillyseals_multivision",rate=0.25},
		{key="sillyseals_abyss",rate=0.25},
		{key="sillyseals_resurrection",rate=0.25},
		{key="sillyseals_reinforce",rate=0.25},
		{key="sillyseals_empower",rate=0.25},
		{key="sillyseals_assortment",rate=0.25},
		{key="sillyseals_geode",rate=0.25},

		{key="sillyseals_hellfire",rate=0.08},
		{key="sillyseals_sunrays",rate=0.08},
		{key="sillyseals_dial",rate=0.08},
		{key="sillyseals_palette",rate=0.08},
		{key="sillyseals_deposit",rate=0.08},

		{key="sillyseals_royalty",rate=0.03},
		{key="sillyseals_spectrum",rate=0.03},
		{key="sillyseals_quadrants",rate=0.03},
		{key="sillyseals_sirius",rate=0.03},

		{key="sillyseals_ringularity",rate=0},
	}
}]]

Seals = {
	rare_seals = {
		'sillyseals_hotpinkseal',
		'sillyseals_deepblueseal',
		'sillyseals_lilacseal',
		'sillyseals_magentaseal',
		'sillyseals_limeseal',
		'sillyseals_neapolitanseal',
		'sillyseals_gemstoneseal',
	},
	epic_seals = {
		'sillyseals_infernalseal',
		'sillyseals_solarseal',
		'sillyseals_switchseal',
		'sillyseals_primaryseal',
		'sillyseals_platinumseal',
	},
	legendary_seals = {
		'sillyseals_peachseal',
		'sillyseals_rainbowseal',
		'sillyseals_wildseal',
		'sillyseals_midnightseal',
	},
	exotic_seals = {
		'sillyseals_bloodseal',
		'sillyseals_violetseal',
		'sillyseals_diamondseal',
		'sillyseals_tealseal',
	},
	rare_seal_spectrals = {
		'c_sillyseals_multivision',
		'c_sillyseals_abyss',
		'c_sillyseals_resurrection',
		'c_sillyseals_reinforce',
		'c_sillyseals_empower',
		'c_sillyseals_assortment',
		'c_sillyseals_geode',
	},
	epic_seal_spectrals = {
		'c_sillyseals_hellfire',
		'c_sillyseals_sunrays',
		'c_sillyseals_dial',
		'c_sillyseals_palette',
		'c_sillyseals_deposit',
	},
	legendary_seal_spectrals = {
		'c_sillyseals_royalty',
		'c_sillyseals_spectrum',
		'c_sillyseals_quadrants',
		'c_sillyseals_sirius',
	},
	hidden_spectral_cards = {},
	teal_seal_activated = false
}

--[[function verify_seal_rarity(seal, rarity)
	return jl.bf(seal, Seals. .. rarity .. _seals)
end]]

silly_seals = SMODS.current_mod
seals_config = silly_seals.config 
silly_seals.enabled = copy_table(seals_config)

if seals_config["Max Seal Rarity"] == nil then
	seals_config["Max Seal Rarity"] = 6
end
if seals_config["Seal Booster Packs"] == nil then
	seals_config["Seal Booster Packs"] = true
end

G.FUNCS.mf_change_artpack = function(args)
	mf_config["Programmer Art"] = (args.to_val == "Programmer")
  end

G.FUNCS.seals_wondrous_transcendent = function(args)
	mf_config["Programmer Art"] = (args.to_val == "Programmer")
  end

--[[SMODS.current_mod.config_tab = function()
    return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 4}, nodes = {
		{n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
            {n = G.UIT.C, config = { align = "cm", padding = 0.05 }, nodes = {
                create_option_cycle({label = localize('seals_config_max_seal_rarity'), w = 4.5, scale = 0.8, options = {"You\'re Boring", "Rare", "Epic", "Legendary", "Exotic/Ritualistic", "Wondrous/Transcendent"}, ref_table = seals_config, ref_value = "Max Seal Rarity", current_option = (seals_config["Max Seal Rarity"] and 6 or 6) })
			}},
        }},
        {n = G.UIT.R, config = {align = "cm", padding = 0}, nodes = {
            {n = G.UIT.C, config = { align = "cm", padding = 0.15 }, nodes = {
                create_toggle{ label = localize("seals_config_seal_boosters"), ref_table = seals_config, ref_value = "Seal Booster Packs" }},
            }},
        }},
    }
end]]

----COLOURS----

SMODS.Gradient({
    key="colour_neapolitan", 
    colours={HEX("7C2E1C"), HEX("EEECD2"), HEX("E8A8F7"), HEX("EEECD2")},
    cycle=10
})

SMODS.Gradient({
    key="colour_gemstone", 
    colours={HEX("7FEBA7"), HEX("7FEBD2")},
    cycle=10
})

SMODS.Gradient({
    key="colour_solar", 
    colours={HEX("FFD95C"), HEX("FFF4D0")},
    cycle=10
})

SMODS.Gradient({
    key="colour_switch", 
    colours={HEX("ED5249"), HEX("21AAFF"), HEX("FFD95C")},
    cycle=10
})

SMODS.Gradient({
    key="colour_primary", 
    colours={HEX("ED5249"), HEX("21AAFF"), HEX("FFD95C")},
    cycle=10
})

SMODS.Gradient({
    key="colour_rainbow", 
    colours={HEX("ED5249"), HEX("F75B38"), HEX("FFD95C"), HEX("38F73F"), HEX("21AAFF"), HEX("A267E4")},
    cycle=3
})

SMODS.Gradient({
    key="colour_wild", 
    colours={HEX("ED5249"), HEX("21AAFF"), HEX("FFD95C"), HEX("38F73F")},
    cycle=10
})

SMODS.load_file("items/seals/hotpinkseal.lua")()
SMODS.load_file("items/seals/deepblueseal.lua")()
SMODS.load_file("items/seals/lilacseal.lua")()
SMODS.load_file("items/seals/magentaseal.lua")()
SMODS.load_file("items/seals/limeseal.lua")()
SMODS.load_file("items/seals/neapolitanseal.lua")()
SMODS.load_file("items/seals/gemstoneseal.lua")()

SMODS.load_file("items/seals/infernalseal.lua")()
SMODS.load_file("items/seals/switchseal.lua")()
SMODS.load_file("items/seals/solarseal.lua")()
SMODS.load_file("items/seals/primaryseal.lua")()
SMODS.load_file("items/seals/platinumseal.lua")()

SMODS.load_file("items/seals/peachseal.lua")()
SMODS.load_file("items/seals/rainbowseal.lua")()
SMODS.load_file("items/seals/wildseal.lua")()
SMODS.load_file("items/seals/midnightseal.lua")()

SMODS.load_file("items/seals/bloodseal.lua")()
SMODS.load_file("items/seals/violetseal.lua")()
SMODS.load_file("items/seals/diamondseal.lua")()
SMODS.load_file("items/seals/tealseal.lua")()

SMODS.load_file("items/consumables/sealspectrals.lua")()
SMODS.load_file("items/boosters/sealboosters.lua")()
SMODS.load_file("items/tags/sealtags.lua")()

----BORROWED FUNCTIONS---

local pokerhandinforef = G.FUNCS.get_poker_hand_info
function G.FUNCS.get_poker_hand_info(_cards)
    local text, loc_disp_text, poker_hands, scoring_hand, disp_text = pokerhandinforef(_cards)
    for i, v in pairs(scoring_hand) do
        if v.seal == "sillyseals_solarseal" then 
			G.GAME.current_round.current_hand.cry_asc_num = G.GAME.current_round.current_hand.cry_asc_num + sillyseals_solarseal.config.ascended_multiplier 
		end
    end
    if to_big(G.GAME.current_round.current_hand.cry_asc_num) > to_big(0) then
        ease_colour(G.C.UI_CHIPS, copy_table(G.C.GOLD), 0.3)
        ease_colour(G.C.UI_MULT, copy_table(G.C.GOLD), 0.3)
    else
        ease_colour(G.C.UI_CHIPS, copy_table(G.C.BLUE), 0.3)
        ease_colour(G.C.UI_MULT, copy_table(G.C.RED), 0.3)
    end
    G.GAME.current_round.current_hand.cry_asc_num_text = (G.GAME.current_round.current_hand.cry_asc_num and ((type(G.GAME.current_round.current_hand.cry_asc_num) == "table" and G.GAME.current_round.current_hand.cry_asc_num:gt(to_big(0)) or G.GAME.current_round.current_hand.cry_asc_num > 0))) and " (+" .. G.GAME.current_round.current_hand.cry_asc_num .. ")" or ""
    return text, loc_disp_text, poker_hands, scoring_hand, disp_text
end

local inj = SMODS.injectItems
function SMODS.injectItems(...)
	inj(...)
	find_hidden_spectrals()
end

----ATLASES----

--OTHER--

SMODS.Atlas {
	key = "modicon",
	path = "seals_avatar.png",
	px = 34,
	py = 34
}

SMODS.Atlas{
    key = 'SealsSpectrals',
    path = 'sillyseals_spectrals.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'SealsJokers',
    path = 'sillyseals_jokers.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'sealspectralboosters',
    path = 'sillyseals_sealspectralpacks.png',
	px = 71,
	py = 95
}

SMODS.Atlas({
	key = "SealsTags",
	path = "sillyseals_tags.png",
	px = 34,
	py = 34
  })

--RARE SEALS--

SMODS.Atlas{
    key = 'HotPink',
    path = 'hot_pink_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'DeepBlue',
    path = 'deep_blue_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Lilac',
    path = 'lilac_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Magenta',
    path = 'magenta_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Lime',
    path = 'lime_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Neapolitan',
    path = 'neapolitan_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Gemstone',
    path = 'gemstone_seal.png',
    px = 70,
    py = 95
}

--EPIC SEALS--

SMODS.Atlas{
    key = 'Infernal',
    path = 'infernal_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Switch',
    path = 'switch_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Solar',
    path = 'solar_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Primary',
    path = 'primary_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Platinum',
    path = 'platinum_seal.png',
    px = 70,
    py = 95
}

--LEGENDARY SEALS--

SMODS.Atlas{
    key = 'Peach',
    path = 'peach_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Rainbow',
    path = 'rainbow_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Wild',
    path = 'wild_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Midnight',
    path = 'midnight_seal.png',
    px = 70,
    py = 95
}

--EXOTIC SEALS--

SMODS.Atlas{
    key = 'Crimson',
    path = 'crimson_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Violet',
    path = 'violet_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Teal',
    path = 'teal_seal.png',
    px = 70,
    py = 95
}
SMODS.Atlas{
    key = 'Diamond',
    path = 'diamond_seal.png',
    px = 70,
    py = 95
}

--EXOTIC+ SEALS--

SMODS.Atlas{
    key = 'vantablack',
    path = 'vantablack_seal.png',
    px = 70,
    py = 95
}

SMODS.Atlas{
    key = 'Motherboard',
    path = 'motherboard_seal.png',
    px = 70,
    py = 95
}


----JOKERS----

--[[

SMODS.Joker {
	key = 'tesseract',
	loc_txt = {
		name = 'Tesseract',
		text = {
			'{C:attention}Seals{} of {C:cry_epic}Epic{} or {C:attention}higher rarity',
			'have the effects of {C:attention}all Vanilla',
			'{C:attention}seals'
		}
	},
	pos = { x = 0, y = 2 },
	soul_pos = { x = 1, y = 2 },
    rarity = 4,
	atlas = 'SealsJokers'
}

SMODS.Joker {
	key = 'datum',
	loc_txt = {
		name = 'Datum',
		text = {
			'{C:cry_exotic}Exotic{} and {C:cry_exotic}Exotic+{} seals',
			'give {X:dark_edition,C:white}^2{} {C:red}Mult'
		}
	},
    rarity = 'cry_exotic',
}

]]

----TAGS----

----------------------------------------------
------------MOD CODE END----------------------
