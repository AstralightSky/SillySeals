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
        ease_colour(G.C.UI_CHIPS, copy_table(G.C.RED), 0.3)
        ease_colour(G.C.UI_MULT, copy_table(G.C.BLUE), 0.3)
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

----SEAL RARITIES---

----SEALS----

--RARE SEALS--

SMODS.Seal{
	key = 'hotpinkseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "ff0088",
    config = { retriggers = 1 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then
                return {
                    repetitions = self.config.retriggers * #G.play.cards,
                    card = card,
                    --sendInfoMessage("Retriggers: " .. (self.config.retriggers * #G.play.cards), "Hot Pink Seal")
                }
            end
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.retriggers } }
    end,
	atlas = 'HotPink'
}

SMODS.Seal{
	key = 'deepblueseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "5065FA",
    config = { planets_amount = 8 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.playing_card_end_of_round then
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					sendDebugMessage(inspect(context), "Deep Blue Seal")
					local card_type = "Planet"
					local _planet, _hand, _tally = nil, nil, -1
					if G.GAME.last_hand_played then
						for k, v in pairs(G.P_CENTER_POOLS.Planet) do
							if v.config.hand_type == G.GAME.last_hand_played then
								_planet = v.key
								break
							end
						end
						for k, v in ipairs(G.handlist) do
							if G.GAME.hands[v].visible and G.GAME.hands[v].played > _tally then
								_hand = v
							   _tally = G.GAME.hands[v].played
							   --sendInfoMessage("Hand: " .. _hand, "Deep Blue Seal")
							end
						end
					end
					if _hand == G.GAME.last_hand_played then
						for i = 1, self.config.planets_amount do
							local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, _planet, "deepblueseal")
	
							card:set_edition({ negative = true }, true)
							card:add_to_deck()
							G.consumeables:emplace(card)
						end
					end
					return true                
				end,
			}))
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.planets_amount } }
    end,
	atlas = 'DeepBlue'
}

SMODS.Seal{
	key = 'lilacseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "BE7EFA",
    config = { spectral_cards = 2, discarded_cards = 5 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.discard then
			----sendInfoMessage("Discarding possible Lilac seals", "Lilac Seal")
            local lilac_seals = 0
			local create_spectrals = false
            for i = 1, #G.hand.highlighted do
				----sendInfoMessage(G.hand.highlighted[i].seal, "Lilac Seal")
                if G.hand.highlighted[i].seal == "sillyseals_lilacseal" then
                    lilac_seals = lilac_seals + 1
					----sendInfoMessage("Lilac seal found", "Lilac Seal")
					----sendInfoMessage("Current Lilac Seals: " .. lilac_seals, "Lilac Seal")
					if lilac_seals >= self.config.discarded_cards then
						create_spectrals = true
					end
                end
            end
            if create_spectrals == true then
				for i = 1, self.config.spectral_cards do
					--SMODS.create_card(Spectral, G.consumeables, nil, nil, nil, nil, nil, nil, nil, nil, nil)
					local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'lilacseal')
					card:set_edition({ negative = true }, true)
					card:add_to_deck()
					G.consumeables:emplace(card)
				end
			end
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.spectral_cards, self.config.discarded_cards } }
    end,
	atlas = 'Lilac'
}

SMODS.Seal{
	key = 'magentaseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "ff00ff",
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			level_up_hand(nil, context.scoring_name, true, (G.GAME.current_round.hands_left * 2))
			--sendInfoMessage("Level ups:" .. G.GAME.current_round.hands_left, "Magenta Seal")
			--sendInfoMessage("Hand to level up:" .. context.scoring_name, "Magenta Seal")
		end
    end,
	atlas = 'Magenta'
}

SMODS.Seal{
	key = 'limeseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "22ff00",
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			--Code for finding the next edition in the collection borrowed from Cryptid ://REWORK (Credit to MathIsFun)
			local found_index = 1
			if card.edition then
				for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
					if v.key == card.edition.key then
						found_index = i
						break
					end
				end
			end
			found_index = found_index + 1
			if found_index > #G.P_CENTER_POOLS.Edition then
				found_index = found_index - #G.P_CENTER_POOLS.Edition
			end
			card:set_edition(G.P_CENTER_POOLS.Edition[found_index].key, true)
			--sendInfoMessage(G.P_CENTER_POOLS.Edition[found_index].key, "Lime Seal")
		end
    end,
	atlas = 'Lime'
}

SMODS.Seal{
	key = 'neapolitanseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_neapolitan,
    config = { colours_amount = 5 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			local _hand = G.GAME.hands[G.FUNCS.get_poker_hand_info(G.play.cards)]
			if 
				_hand == 'Five of a Kind' 
				or _hand == 'Flush House' 
				or _hand == 'Flush Five' 
				or next(context.poker_hands["cry_Bulwark"])
				or next(context.poker_hands["cry_Clusterfuck"])
				or next(context.poker_hands["cry_UltPair"])
				or next(context.poker_hands["cry_WholeDeck"])
			then
   		        local card_type = "Colour"
        		local rng_seed = "white"
				for i = 1, self.config.colours_amount do
					local colour_card = create_card(card_type, G.consumeables, nil, nil, nil, nil, nil, rng_seed)
  	 	 	        colour_card:add_to_deck()
   		         	G.consumeables:emplace(colour_card)
				end
			end
			--sendInfoMessage("Neapolitan seal played", "Neapolitan Seal")
		end
    end,
    loc_vars = function(self)
        return { vars = { self.config.colours_amount } }
    end,
	atlas = 'Neapolitan'
}

SMODS.Seal{
	key = 'gemstoneseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_gemstone,
    config = { money_mult = 3 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			ease_dollars(G.GAME.hands[G.FUNCS.get_poker_hand_info(G.play.cards)].played * self.config.money_mult)
		end
    end,
    loc_vars = function(self)
        return { vars = { self.config.money_mult } }
    end,
	--[[draw = function(self, card, layer)
        G.shared_seals["gemstoneseal"].role.draw_major = card
        G.shared_seals["gemstoneseal"]:draw_shader('dissolve', nil, nil, nil, card.children.center)
        G.shared_seals["gemstoneseal"]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end,]]
	atlas = 'Gemstone'
}



--EPIC SEALS--

SMODS.Seal{
	key = 'infernalseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "FF5500",
    config = { quintuple_tags = 2 },
	no_edeck = true,
	weight = 0.05,
    calculate = function(self, card, context)
		if context.playing_card_end_of_round then
			for i = 1, self.config.quintuple_tags do
				add_tag(Tag("tag_cry_quintuple"))
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.quintuple_tags } }
    end,
	atlas = 'Infernal'
}

sillyseals_solarseal =
SMODS.Seal{
	key = 'solarseal',
	pos = { x = 0, y = 0 },
	no_edeck = true,
	weight = 0.05,
    badge_colour = SMODS.Gradients.sillyseals_colour_solar,
    config = { ascended_multiplier = 5 },
	loc_vars = function(self)
        return { vars = { self.config.ascended_multiplier } }
    end,
	atlas = 'Solar'
}

SMODS.Seal{
	key = 'switchseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_switch,
    config = { joker_targets = 1 },
	no_edeck = true,
	weight = 0.05,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			if card.edition then
				for k, v in ipairs(context.scoring_hand) do
					v:set_edition(card.edition.key, true)
				end
				if G.jokers.cards[1] then
					for i = 1, self.config.joker_targets do
						local already_has_edition = true
						while already_has_edition == true do
							local _joker = pseudorandom(pseudoseed("sillyseals_switchseal"), 1, #G.jokers.cards)
							if G.jokers.cards[_joker] then
								if G.jokers.cards[_joker].edition then
									if G.jokers.cards[_joker].edition.key ~= card.edition.key then
										G.jokers.cards[_joker]:set_edition(card.edition.key, true)
										already_has_edition = false
									end
								else
									G.jokers.cards[_joker]:set_edition(card.edition.key, true)
									already_has_edition = false
								end
							else
								already_has_edition = false
							end
						end
					end
				end
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.joker_targets } }
    end,
	atlas = 'Switch'
}


SMODS.Seal{
	key = 'primaryseal',
	pos = { x = 0, y = 0 },
	no_edeck = true,
	weight = 0.05,
    badge_colour = SMODS.Gradients.sillyseals_colour_primary,
    config = { extra_chips_add = 500, extra_chips_mult = 1.1 },
    calculate = function(self, card, context)
		if context.pre_discard then
			for i = 1, #G.hand.cards do
				G.hand.cards[i].ability.perma_bonus = math.floor(G.hand.cards[i].ability.perma_bonus + self.config.extra_chips_add)
				G.hand.cards[i].ability.perma_bonus = math.floor(G.hand.cards[i].ability.perma_bonus * self.config.extra_chips_mult)
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.extra_chips_add, self.config.extra_chips_mult, } }
    end,
	atlas = 'Primary'
}

SMODS.Seal{
	key = 'platinumseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "AFB8FA",
    config = { money_per_tarot = 8 },
	no_edeck = true,
	weight = 0.05,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local tarots_in_tray = 0
			for i = 1, #G.consumeables.cards do
				--sendInfoMessage("called once for every consumable you got", "Platinum Seal")
				if G.consumeables.cards[i]:gc().set == 'Tarot' then
					tarots_in_tray = tarots_in_tray + 1
					--sendInfoMessage("add tarot", "Platinum Seal")
				end
			end
			ease_dollars(tarots_in_tray * self.config.money_per_tarot)
		end
    end, 
	loc_vars = function(self)
        return { vars = { self.config.money_per_tarot } }
    end,
	atlas = 'Platinum'
}


--LEGENDARY SEALS--

SMODS.Seal{
	key = 'peachseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "FAA896",
	no_edeck = true,
	weight = 0.008,
    calculate = function(self, card, context)
		if context.pre_discard and G.GAME.current_round.discards_left == 1 then
			for i = 1, #G.hand.highlighted do
                if G.hand.highlighted[i].seal == "sillyseals_peachseal" then
					local card = create_card("Spectral", G.jokers, nil, nil, nil, nil, "c_soul")
					card:add_to_deck()
					G.consumeables:emplace(card)
					card:juice_up(0.3, 0.5)
                end
            end
		end
    end,
	atlas = 'Peach'
}

SMODS.Seal{
	key = 'rainbowseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_rainbow,
    config = { colour_card_advance = 5 },
	no_edeck = true,
	weight = 0.008,
    calculate = function(self, card, context)
		if context.after then
			for i = 1, #G.hand.cards do 
				if 
					G.hand.cards[i].seal == 'sillyseals_rainbowseal' 
					and G.hand.cards[i] == card
				then
					for k, v in ipairs(G.consumeables.cards) do
						if v:gc().set == 'Colour' then
							for i = 1, self.config.colour_card_advance do
								trigger_colour_end_of_round(v)
							end
						end
					end
				end
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.colour_card_advance } }
    end,
	atlas = 'Rainbow'
}

SMODS.Seal{
	key = 'wildseal',
	pos = { x = 0, y = 0 },
	no_edeck = true,
	weight = 0.008,
    badge_colour = SMODS.Gradients.sillyseals_colour_wild,
    config = { extra_chips_add = 1000, extra_chips_mult = 2, wild_extra_chips_add = 5000, wild_extra_chips_mult = 10},
    calculate = function(self, card, context)
		if context.pre_discard then
			for i = 1, #G.playing_cards do
				if G.playing_cards[i].ability.effect == "Wild Card" then
					G.playing_cards[i].ability.perma_bonus = math.floor(G.playing_cards[i].ability.perma_bonus + self.config.wild_extra_chips_add)
					G.playing_cards[i].ability.perma_bonus = math.floor(G.playing_cards[i].ability.perma_bonus * self.config.wild_extra_chips_mult)
				else
					G.playing_cards[i].ability.perma_bonus = math.floor(G.playing_cards[i].ability.perma_bonus + self.config.extra_chips_add)
					G.playing_cards[i].ability.perma_bonus = math.floor(G.playing_cards[i].ability.perma_bonus * self.config.extra_chips_mult)
				end
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.extra_chips_add, self.config.extra_chips_mult, self.config.wild_extra_chips_add, self.config.wild_extra_chips_mult} }
    end,
	atlas = 'Wild'
}

--[[SMODS.Seal{
	key = 'wildseal',
	pos = { x = 0, y = 0 },
	no_edeck = true,
	weight = 0.008,
    badge_colour = SMODS.Gradients.sillyseals_colour_wild,
    config = { extra_chips_add = 1, extra_chips_mult = 1.1, wild_extra_chips_add = 5, wild_extra_chips_mult = 2},
    calculate = function(self, card, context)
		if context.pre_discard then
			for i = 1, #G.hand.cards do
				if G.playing_cards[i].ability.effect == "Wild Card" then
					G.playing_cards[i].ability.perma_x_chips = (math.floor((G.playing_cards[i].ability.perma_x_chips + self.config.wild_extra_chips_add) * 100)) / 100
					G.playing_cards[i].ability.perma_x_chips = (math.floor((G.playing_cards[i].ability.perma_x_chips * self.config.wild_extra_chips_mult) * 100)) / 100
				else
					G.playing_cards[i].ability.perma_x_chips = (math.floor((G.playing_cards[i].ability.perma_x_chips + self.config.extra_chips_add) * 100)) / 100
					G.playing_cards[i].ability.perma_x_chips = (math.floor((G.playing_cards[i].ability.perma_x_chips * self.config.extra_chips_mult) * 100)) / 100
				end
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.extra_chips_add, self.config.extra_chips_mult, self.config.wild_extra_chips_add, self.config.wild_extra_chips_mult} }
    end,
	atlas = 'Wild'
}]]

SMODS.Seal{
	key = 'midnightseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "00003E",
    config = { hand_level_up_mult = 10 },
	no_edeck = true,
	weight = 0.008,
    calculate = function(self, card, context)
		if context.playing_card_end_of_round then
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(v, k, true, v.level * (self.config.hand_level_up_mult - 1))
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.hand_level_up_mult } }
    end,
	atlas = 'Midnight'
}

--EXOTIC SEALS--

SMODS.Seal{
	key = 'bloodseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "A20000",
    config = { exponentiation_mult = 2 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local deletable_jokers = {}
			for k, v in pairs(G.jokers.cards) do
				if not v.ability.eternal then
					deletable_jokers[#deletable_jokers + 1] = v
				end
			end
			local _rarity = nil
			local _rarity_tier = 0
			local _loop_done = false
			while _loop_done == false do
				if _rarity == nil then
					_rarity = 1
					_rarity_tier = 1
					--sendInfoMessage("rarity is now common", "Blood Seal")
				elseif _rarity == 1 then
					_rarity = 2
					_rarity_tier = 2
					--sendInfoMessage("rarity is now uncommon", "Blood Seal")
				elseif _rarity == 2 then
					_rarity = 3
					_rarity_tier = 3
					--sendInfoMessage("rarity is now rare", "Blood Seal")
				elseif _rarity == 3 then
					_rarity = "cry_epic"
					_rarity_tier = 4
					--sendInfoMessage("rarity is now epic", "Blood Seal")
				elseif _rarity == "cry_epic" then
					_rarity = 4
					_rarity_tier = 5
					--sendInfoMessage("rarity is now legendary", "Blood Seal")
				elseif _rarity == 4 then
					_rarity = "cry_exotic"
					_rarity_tier = 6
					--sendInfoMessage("rarity is now exotic", "Blood Seal")
				elseif _rarity == "cry_exotic" then
					_loop_done = true
				end
				for k, v in pairs(G.jokers.cards) do
					if v.config.center.rarity == _rarity and _loop_done == false then
						v:start_dissolve(nil, nil)
						_loop_done = true
						--sendInfoMessage("joker destroyed, loop exited", "Blood Seal")
					end
				end
			end
			G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips ^ (_rarity_tier * self.config.exponentiation_mult)
			G.GAME.hands[context.scoring_name].mult = G.GAME.hands[context.scoring_name].mult ^ (_rarity_tier * self.config.exponentiation_mult)
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.exponentiation_mult } }
    end,
	atlas = 'Crimson'
}

--local _hidden_spectral = jl.rndelement(Seals.hidden_spectral_cards)

SMODS.Seal{
	key = 'violetseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "4D00FA",
    config = { extra_spectrals = 2 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.destroying_card and not card.will_shatter then
			card.will_shatter = true
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local _tags = self.config.extra_spectrals
					for k, v in pairs(G.GAME.tags) do
						_tags = _tags + 1
					end
					for i = 1, _tags do
						local _hidden_spectral = jl.rndelement(Seals.hidden_spectral_cards)
						local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, _hidden_spectral, 'violetseal')
						card:set_edition({ negative = true }, true)
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
					return true
				end,
			}))

			return { remove = true }
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.extra_spectrals } }
    end,
	atlas = 'Violet'
}

SMODS.Seal{
	key = 'diamondseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "50D5FA",
    config = { negative_squared_jokers = 1, money = 25 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			for i = 1, self.config.negative_squared_jokers do
				local nsquared = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_cry_negative', 'diamond_seal')
				nsquared.no_forced_edition = true
				nsquared:set_edition({negative = true}, true)
				nsquared.no_forced_edition = nil
				nsquared:add_to_deck()
				G.jokers:emplace(nsquared)
			end
			ease_dollars(self.config.money)
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.hidden_negative_squared_jokers, self.config.money } }
    end,
	atlas = 'Diamond'
}

SMODS.Seal{
	key = 'tealseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX '2F87A3',
    config = { ante_multiplier = 4 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if 
			context.destroy_card 
			and context.cardarea == G.play 
			and G.GAME.round_resets.ante % self.config.ante_multiplier == 0
			and #context.full_hand >= 5
		then
			if Seals.teal_seal_activated == false then
				Seals.teal_seal_activated = true
				G.E_MANAGER:add_event(Event({
					trigger = "after",
					delay = 0.4,
					func = function()
						play_sound("timpani")
						local card = create_card("Joker", G.jokers, nil, "cry_exotic", nil, nil, nil, "tealseal")
						card:add_to_deck()
						G.jokers:emplace(card)
						card:juice_up(0.3, 0.5)
						return true
					end,
				}))
				local deck_index = math.random(#G.deck.cards)
				G.deck.cards[deck_index]:set_seal("sillyseals_tealseal")
			end
			for k, v in ipairs(context.full_hand) do
				if v == context.destroy_card then return { remove = true }
				end
			end
		end
		if context.after and context.cardarea == G.play then Seals.teal_seal_activated = false end
    end,
	loc_vars = function(self)
        return { vars = { self.config.hidden_spectral_cards, self.config.discarded_cards } }
    end,
	atlas = 'Teal'
}

--[[

--WONDROUS SEALS--

SMODS.Seal{
	key = 'lavenderseal',
	loc_txt = {
		name = 'Lavender Seal',
        label = 'Lavender Seal',
		text = {
	    	'Create 2 random Booster Packs if used in a',
	    	'Two Pair, hand changes every round'
		}
	},
	pos = { x = 0, y = 0 },
    badge_colour = HEX "FF5500",
    config = {},
    calculate = function(self, card, context)

    end,
	atlas = 'Lavender'
}

]]

----SPECTRALS----

SMODS.Consumable{
	key = 'multivision',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_hotpinkseal_seal",
		-- Tooltip args
		seal = { retriggers = 1 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_hotpinkseal_seal", specific_vars = { self.config.seal.retriggers } }
        return { vars = { center.ability.max_highlighted} }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 0, y = 0 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_hotpinkseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'abyss',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_deepblueseal_seal",
		-- Tooltip args
		seal = { planets_amount = 8 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_deepblueseal_seal", specific_vars = { self.config.seal.planets_amount } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 1, y = 0 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_deepblueseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'resurrection',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_lilacseal_seal",
		-- Tooltip args
		seal = { spectral_cards = 2, discarded_cards = 5 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_lilacseal_seal", specific_vars = { self.config.seal.spectral_cards, self.config.seal.discarded_cards } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 2, y = 0 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_lilacseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'reinforce',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_magentaseal_seal",
		-- Tooltip args
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_magentaseal_seal" }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 3, y = 0 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_magentaseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'empower',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_limeseal_seal",
		-- Tooltip args
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_limeseal_seal", }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 0, y = 1 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_limeseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'assortment',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_neapolitanseal_seal",
		-- Tooltip args
		seal = { colours_amount = 5 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_neapolitanseal_seal", specific_vars = { self.config.seal.colours_amount } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 1, y = 1 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_neapolitanseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'geode',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_gemstoneseal_seal",
		-- Tooltip args
		seal = { money_mult = 3 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_gemstoneseal_seal", specific_vars = { self.config.seal.money_mult } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 10,
	atlas = "SealsSpectrals",
	pos = { x = 2, y = 1 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.25)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_gemstoneseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'hellfire',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_infernalseal_seal",
		-- Tooltip args
		seal = { quintuple_tags = 2 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_infernalseal_seal", specific_vars = { self.config.seal.quintuple_tags } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 15,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 3, y = 1 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.6)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_infernalseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'sunrays',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_solarseal_seal",
		-- Tooltip args
		seal = { ascended_multiplier = 5 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_solarseal_seal", specific_vars = { self.config.seal.ascended_multiplier } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 15,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 0, y = 2 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.6)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_solarseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'dial',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_switchseal_seal",
		-- Tooltip args
		seal = { joker_targets = 1 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_switchseal_seal", specific_vars = { self.config.seal.joker_targets } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 15,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 1, y = 2 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.6)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_switchseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'palette',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_primaryseal_seal",
		-- Tooltip args
		seal = { extra_chips_add = 500, extra_chips_mult = 1.1 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_primaryseal_seal", specific_vars = { self.config.seal.extra_chips_add, self.config.seal.extra_chips_mult } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 15,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 2, y = 2 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.6)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_primaryseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'deposit',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_platinumseal_seal",
		-- Tooltip args
		seal = { money_per_tarot = 8 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_platinumseal_seal", specific_vars = { self.config.seal.money_per_tarot } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 15,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 3, y = 2 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -0.6)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_platinumseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'royalty',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_peachseal_seal",
		-- Tooltip args
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_peachseal_seal" }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 30,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 0, y = 3 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -1)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_peachseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'spectrum',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_seal_seal",
		-- Tooltip args
		seal = { colour_card_advance = 5 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_rainbowseal_seal", specific_vars = { self.config.seal.colour_card_advance } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 30,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 1, y = 3 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -1)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_rainbowseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'quadrants',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_wildseal_seal",
		-- Tooltip args
		seal = { extra_chips_add = 1000, extra_chips_mult = 2, wild_extra_chips_add = 5000, wild_extra_chips_mult = 10 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
		info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_wildseal_seal", specific_vars = { self.config.seal.extra_chips_add, self.config.seal.extra_chips_mult, self.config.seal.wild_extra_chips_add, self.config.seal.wild_extra_chips_mult } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 30,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 2, y = 3 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -1)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_wildseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'sirius',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		-- This will add a tooltip.
		mod_conv = "sillyseals_midnightseal_seal",
		-- Tooltip args
		seal = { hand_level_up_mult = 10 },
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        info_queue[#info_queue + 1] = { set = "Other", key = "sillyseals_midnightseal_seal", specific_vars = { self.config.seal.hand_level_up_mult } }
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 30,
	hidden = true,
	soul_rate = 0,
	atlas = "SealsSpectrals",
	pos = { x = 3, y = 3 },
	use = function(self, card, area, copier) 
		ease_dollars(G.GAME.dollars * -1)
		local used_consumable = copier or card
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal("sillyseals_midnightseal")
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

SMODS.Consumable{
	key = 'ringularity',
    object_type = "Consumable",
	set = "Spectral",
    config = {
		max_highlighted = 1,
	},
    loc_vars = function(self,info_queue,center)
        return { vars = { center.ability.max_highlighted } }
    end,
	cost = 30,
	atlas = "SealsSpectrals",
	pos = { x = 0, y = 4 },
	hidden = true,
	use = function(self, card, area, copier) 
		local used_consumable = copier or card
		local _seal = nil
		for i = 1, #G.hand.highlighted do
			local highlighted = G.hand.highlighted[i]
			_seal = jl.rndelement(Seals.exotic_seals)
			G.E_MANAGER:add_event(Event({
				func = function()
					play_sound("tarot1")
					highlighted:juice_up(0.3, 0.5)
					return true
				end,
			}))
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.1,
				func = function()
					if highlighted then
						highlighted:set_seal(_seal)
					end
					return true
				end,
			}))
			delay(0.5)
			G.E_MANAGER:add_event(Event({
				trigger = "after",
				delay = 0.2,
				func = function()
					G.hand:unhighlight_all()
					return true
				end,
			}))
		end
	end,
}

----BOOSTERS----


for i = 1, 4 do
	SMODS.Booster{
		key = 'sealspectral' .. i,
		loc_txt = {
			name = 'Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i - 1, y = 0},
		weight = .3,
		cost = 4,
		config = {extra = 2, choose = 1},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 25, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

for i = 1, 2 do
	SMODS.Booster{
		key = 'sealspectraljumbo' .. i,
		loc_txt = {
			name = 'Jumbo Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i - 1, y = 1},
		weight = .1,
		cost = 10,
		config = {extra = 4, choose = 1},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 40, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

for i = 1, 2 do
	SMODS.Booster{
		key = 'sealspectralmega',
		loc_txt = {
			name = 'Mega Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i + 1, y = 1},
		weight = .05,
		cost = 20,
		config = {extra = 4, choose = 2},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 40, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

SMODS.Booster{
	key = 'sealspectralspecial',
	loc_txt = {
		name = 'Special Seal Spectral Pack',
		text = {
			'Choose {C:attention}#1#{} of up to',
			'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
			'be used immediately',
			'{C:green}100% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
		}
	},
	atlas = 'sealspectralboosters',
	pos = {x = 3, y = 1},
	weight = 0,
	cost = 25,
	config = {extra = 4, choose = 2},
	discovered = true,
	draw_hand = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.choose, card.ability.extra} }
	end,
	ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
					{n=G.UIT.R,config={minh =0.2}, nodes={}},
					{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
						{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
		return t
	end,
	particles = function(self)
		G.booster_pack_sparkles = Particles(1, 1, 0,0, {
			timer = 0.015,
			scale = 0.1,
			initialize = true,
			lifespan = 3,
			speed = 0.2,
			padding = -1,
			attach = G.ROOM_ATTACH,
			colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
			fill = true
		})
		G.booster_pack_sparkles.fade_alpha = 1
		G.booster_pack_sparkles:fade(1, 0)
	end,
	create_card = function(self, card, i)
		local possible = {}
		if math.floor(i) == 1 then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
		elseif jl.chance('sealspectralpack_legendary', 20, true) then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		elseif jl.chance('sealspectralpack_epic', 5, true) then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		else
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		end
	end,
}

----TAGS----

SMODS.Tag({
    key = "chronomicon",
    atlas = "SealsTags",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "p_sillyseals_sealspectraljumbo1", specific_vars = { 1, 4 } }
        return { vars = {} }
    end,
    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_sillyseals_sealspectraljumbo1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
})

SMODS.Tag{
	key = "dilation",
	atlas = "SealsTags",
	pos = { x = 1, y = 0 },
	config = { type = "new_blind_choice" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_sillyseals_sealspectralspecial
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_sillyseals_sealspectralspecial"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return false
	end,
}

SMODS.Tag{
	key = "slots",
	atlas = "SealsTags",
	pos = { x = 2, y = 0 },
	config = { type = "new_blind_choice", odds = 4 },
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_sillyseals_dilation" }
		return { vars = { G.GAME.probabilities.normal or 1, self.config.odds } }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			if pseudorandom("sillyseals_slotstag") < G.GAME.probabilities.normal / tag.config.odds then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
					local emp = Tag("tag_sillyseals_dilation")
					if tag.ability.shiny then -- good fucking luck
						emp.ability.shiny = Cryptid.is_shiny()
					end
					add_tag(emp)
					tag.triggered = true
					emp:apply_to_run({ type = "new_blind_choice" })
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
			else
				tag:nope()
				tag.triggered = true
				for i = 1, #G.GAME.tags do
					if G.GAME.tags[i] ~= tag then
						if G.GAME.tags[i]:apply_to_run({ type = "new_blind_choice" }) then
							break
						end
					end
				end
			end
			tag.triggered = true
			return true
		end
	end,
}

----------------------------------------------
------------MOD CODE END----------------------