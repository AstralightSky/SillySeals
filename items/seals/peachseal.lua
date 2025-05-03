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