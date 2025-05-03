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