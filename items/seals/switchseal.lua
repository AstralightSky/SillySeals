SMODS.Seal{
	key = 'switchseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_switch,
    config = { joker_targets = 1, editioned_planets = 5 },
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
				for i = 1, self.config.editioned_planets do
					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
							local card2 = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'switch_planet')
							card2:set_edition(card.edition, true)
							card2:add_to_deck()
							G.consumeables:emplace(card2)
							card:juice_up(0.3, 0.5)
						return true
					end }))
				end
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.joker_targets, self.config.editioned_planets } }
    end,
	atlas = 'Switch'
}