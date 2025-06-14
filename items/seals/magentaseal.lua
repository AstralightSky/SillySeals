SMODS.Seal{
	key = 'magentaseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "ff00ff",
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			level_up_hand(nil, context.scoring_name, true, (G.GAME.current_round.hands_left * 2))
			card_eval_status_text(
				card, 
				'extra', 
				nil, nil, nil, 
				{message = {localize("magentaseal_popup1")..context.scoring_name..": +"..(G.GAME.current_round.hands_left * 2)}}
			)
			--sendInfoMessage("Level ups:" .. G.GAME.current_round.hands_left, "Magenta Seal")
			--sendInfoMessage("Hand to level up:" .. context.scoring_name, "Magenta Seal")
		end
    end,
	atlas = 'Magenta'
}