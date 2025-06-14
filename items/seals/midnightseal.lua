SMODS.Seal{
	key = 'midnightseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "00003E",
    config = { hand_level_up_mult = 8 },
	no_edeck = true,
	weight = 0.008,
    calculate = function(self, card, context)
		if context.end_of_round and context.cardarea == G.hand and context.other_card == card then
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1, delay = 1}, {handname = localize("sillyseals_allhands")})
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1, delay = 1}, {level = 'x' .. tostring(self.config.hand_level_up_mult)})
			update_hand_text({sound = 'button', volume = 0.7, pitch = 1, delay = 1}, {chips = '+++', mult = '+++'})
			for k, v in pairs(G.GAME.hands) do
				level_up_hand(v, k, true, v.level * (self.config.hand_level_up_mult - 1))
			end
			jl.ch()
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.hand_level_up_mult } }
    end,
	atlas = 'Midnight'
}