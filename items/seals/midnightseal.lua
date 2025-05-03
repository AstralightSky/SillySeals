SMODS.Seal{
	key = 'midnightseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "00003E",
    config = { hand_level_up_mult = 10 },
	no_edeck = true,
	weight = 0.008,
    calculate = function(self, card, context)
		if context.playing_card_end_of_round then
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(v, k, true, v.level * (self.config.hand_level_up_mult - 1))
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.hand_level_up_mult } }
    end,
	atlas = 'Midnight'
}