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