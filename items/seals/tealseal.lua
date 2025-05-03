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
				local deck_index = math.random(#G.playing_cards)
				G.playing_cards[deck_index]:set_seal("sillyseals_tealseal")
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