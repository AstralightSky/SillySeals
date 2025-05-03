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