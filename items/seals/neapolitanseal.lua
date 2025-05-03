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