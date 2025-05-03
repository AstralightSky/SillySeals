SMODS.Seal{
	key = 'limeseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "22ff00",
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
			--Code for finding the next edition in the collection borrowed from Cryptid ://REWORK (Credit to MathIsFun)
			local found_index = 1
			if card.edition then
				for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
					if v.key == card.edition.key then
						found_index = i
						break
					end
				end
			end
			found_index = found_index + 1
			if found_index > #G.P_CENTER_POOLS.Edition then
				found_index = found_index - #G.P_CENTER_POOLS.Edition
			end
			card:set_edition(G.P_CENTER_POOLS.Edition[found_index].key, true)
			--sendInfoMessage(G.P_CENTER_POOLS.Edition[found_index].key, "Lime Seal")
		end
    end,
	atlas = 'Lime'
}