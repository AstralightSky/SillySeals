SMODS.Seal{
	key = 'tealseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX '2F87A3',
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if 
			context.destroying_card
			and context.destroy_card == card
			and context.cardarea == G.play 
			and G.GAME.round_resets.ante % G.GAME.win_ante == 0
			and #G.play.cards >= 5
			and Seals.teal_seal_activated == false
		then
			card.will_shatter = true
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
			for k, v in ipairs(G.play.cards) do
				SMODS.debuff_card(v, true, 'tealseal')
			end
			return { remove = true }
		end
		if context.after and context.cardarea == G.play then Seals.teal_seal_activated = false end
    end,
	atlas = 'Teal'
}