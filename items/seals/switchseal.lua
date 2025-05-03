SMODS.Seal{
	key = 'switchseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_switch,
    config = { joker_targets = 1 },
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
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.joker_targets } }
    end,
	atlas = 'Switch'
}