SMODS.Seal{
	key = 'gemstoneseal',
	pos = { x = 0, y = 0 },
    badge_colour = SMODS.Gradients.sillyseals_colour_gemstone,
    config = { money_mult = 3 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			ease_dollars(G.GAME.hands[G.FUNCS.get_poker_hand_info(G.play.cards)].played * self.config.money_mult)
		end
    end,
    loc_vars = function(self)
        return { vars = { self.config.money_mult } }
    end,
	--[[draw = function(self, card, layer)
        G.shared_seals["gemstoneseal"].role.draw_major = card
        G.shared_seals["gemstoneseal"]:draw_shader('dissolve', nil, nil, nil, card.children.center)
        G.shared_seals["gemstoneseal"]:draw_shader('voucher', nil, card.ARGS.send_to_shader, nil, card.children.center)
    end,]]
	atlas = 'Gemstone'
}