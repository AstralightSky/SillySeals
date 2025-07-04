SMODS.Seal{
	key = 'bloodseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "A20000",
    config = { exponentiation_add = 1 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.after and context.cardarea == G.play then
			local deletable_jokers = {}
			for k, v in pairs(G.jokers.cards) do
				if not v.ability.eternal then
					deletable_jokers[#deletable_jokers + 1] = v
				end
			end
			local _rarity = nil
			local _rarity_tier = 0
			local _loop_done = false
			local _rarity_name = ""
			while _loop_done == false do
				if _rarity == nil then
					_rarity = 1
					_rarity_tier = 1
					_rarity_name = localize("rarity_common")
				elseif _rarity == 1 then
					_rarity = 2
					_rarity_tier = 2
					_rarity_name = localize("rarity_uncommon")
				elseif _rarity == 2 then
					_rarity = 3
					_rarity_tier = 3
					_rarity_name = localize("rarity_rare")
				elseif _rarity == 3 then
					_rarity = "cry_epic"
					_rarity_tier = 4
					_rarity_name = localize("rarity_epic")
				elseif _rarity == "cry_epic" then
					_rarity = 4
					_rarity_tier = 5
					_rarity_name = localize("rarity_legendary")
				elseif _rarity == 4 then
					_rarity = "cry_exotic"
					_rarity_tier = 6
					_rarity_name = localize("rarity_exotic")
				elseif _rarity == "cry_exotic" then
					_loop_done = true
				end
				for k, v in pairs(G.jokers.cards) do
					if v.config.center.rarity == _rarity and _loop_done == false then
						G.E_MANAGER:add_event(Event({
							trigger = "after",
							delay = 0.0,
							func = function()
								v:start_dissolve(nil, nil)
								return true                
							end,
						}))
						card_eval_status_text(
							card, 
							'extra', 
							nil, nil, nil, 
							{message = {_rarity_name..localize("bloodseal_popup1")}}
						)
						card_eval_status_text(
							card, 
							'extra', 
							nil, nil, nil, 
							{message = {context.scoring_name..": ^"..(_rarity_tier + self.config.exponentiation_add)..localize("bloodseal_popup2")}}
						)
						card_eval_status_text(
							card, 
							'extra', 
							nil, nil, nil, 
							{message = {context.scoring_name..": ^"..(_rarity_tier + self.config.exponentiation_add)..localize("bloodseal_popup3")}}
						)
						_loop_done = true
					end
				end
			end
			G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips ^ (_rarity_tier + self.config.exponentiation_add)
			G.GAME.hands[context.scoring_name].mult = G.GAME.hands[context.scoring_name].mult ^ (_rarity_tier + self.config.exponentiation_add)
			G.GAME.hands[context.scoring_name].l_chips = G.GAME.hands[context.scoring_name].l_chips ^ (_rarity_tier + self.config.exponentiation_add)
			G.GAME.hands[context.scoring_name].l_mult = G.GAME.hands[context.scoring_name].l_mult ^ (_rarity_tier + self.config.exponentiation_add)
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.exponentiation_add } }
    end,
	atlas = 'Crimson'
}