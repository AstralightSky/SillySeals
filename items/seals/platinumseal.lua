SMODS.Seal{
	key = 'platinumseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "AFB8FA",
    config = { money_per_tarot = 8 },
	no_edeck = true,
	weight = 0.05,
    calculate = function(self, card, context)
		if context.main_scoring and context.cardarea == G.play then
			local tarots_in_tray = 0
			for i = 1, #G.consumeables.cards do
				--sendInfoMessage("called once for every consumable you got", "Platinum Seal")
				if G.consumeables.cards[i]:gc().set == 'Tarot' then
					tarots_in_tray = tarots_in_tray + 1
					--sendInfoMessage("add tarot", "Platinum Seal")
				end
			end
			ease_dollars(tarots_in_tray * self.config.money_per_tarot)
		end
    end, 
	loc_vars = function(self)
        return { vars = { self.config.money_per_tarot } }
    end,
	atlas = 'Platinum'
}