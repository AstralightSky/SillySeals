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