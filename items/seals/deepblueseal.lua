SMODS.Seal{
	key = 'deepblueseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "5065FA",
    config = { planets_amount = 8 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.playing_card_end_of_round then
			for i = 1, #G.hand.cards do 
				if 
					G.hand.cards[i].seal == 'sillyseals_deepblueseal' 
					and G.hand.cards[i] == card
				then
					G.E_MANAGER:add_event(Event({
						trigger = "before",
						delay = 0.0,
						func = function()
							--sendDebugMessage(inspect(context), "Deep Blue Seal")
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
			end
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.planets_amount } }
    end,
	atlas = 'DeepBlue'
}