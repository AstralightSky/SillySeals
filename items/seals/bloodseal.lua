SMODS.Seal{
	key = 'bloodseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "A20000",
    config = { exponentiation_mult = 2 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local deletable_jokers = {}
			for k, v in pairs(G.jokers.cards) do
				if not v.ability.eternal then
					deletable_jokers[#deletable_jokers + 1] = v
				end
			end
			local _rarity = nil
			local _rarity_tier = 0
			local _loop_done = false
			while _loop_done == false do
				if _rarity == nil then
					_rarity = 1
					_rarity_tier = 1
					--sendInfoMessage("rarity is now common", "Blood Seal")
				elseif _rarity == 1 then
					_rarity = 2
					_rarity_tier = 2
					--sendInfoMessage("rarity is now uncommon", "Blood Seal")
				elseif _rarity == 2 then
					_rarity = 3
					_rarity_tier = 3
					--sendInfoMessage("rarity is now rare", "Blood Seal")
				elseif _rarity == 3 then
					_rarity = "cry_epic"
					_rarity_tier = 4
					--sendInfoMessage("rarity is now epic", "Blood Seal")
				elseif _rarity == "cry_epic" then
					_rarity = 4
					_rarity_tier = 5
					--sendInfoMessage("rarity is now legendary", "Blood Seal")
				elseif _rarity == 4 then
					_rarity = "cry_exotic"
					_rarity_tier = 6
					--sendInfoMessage("rarity is now exotic", "Blood Seal")
				elseif _rarity == "cry_exotic" then
					_loop_done = true
				end
				for k, v in pairs(G.jokers.cards) do
					if v.config.center.rarity == _rarity and _loop_done == false then
						v:start_dissolve(nil, nil)
						_loop_done = true
						--sendInfoMessage("joker destroyed, loop exited", "Blood Seal")
					end
				end
			end
			G.GAME.hands[context.scoring_name].chips = G.GAME.hands[context.scoring_name].chips ^ (_rarity_tier * self.config.exponentiation_mult)
			G.GAME.hands[context.scoring_name].mult = G.GAME.hands[context.scoring_name].mult ^ (_rarity_tier * self.config.exponentiation_mult)
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.exponentiation_mult } }
    end,
	atlas = 'Crimson'
}