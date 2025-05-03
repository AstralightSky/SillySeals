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