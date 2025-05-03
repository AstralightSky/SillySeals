SMODS.Seal{
	key = 'lilacseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "BE7EFA",
    config = { spectral_cards = 2, discarded_cards = 5 },
	no_edeck = true,
	weight = 0.3,
    calculate = function(self, card, context)
        if context.discard then
			----sendInfoMessage("Discarding possible Lilac seals", "Lilac Seal")
            local lilac_seals = 0
			local create_spectrals = false
            for i = 1, #G.hand.highlighted do
				----sendInfoMessage(G.hand.highlighted[i].seal, "Lilac Seal")
                if G.hand.highlighted[i].seal == "sillyseals_lilacseal" then
                    lilac_seals = lilac_seals + 1
					----sendInfoMessage("Lilac seal found", "Lilac Seal")
					----sendInfoMessage("Current Lilac Seals: " .. lilac_seals, "Lilac Seal")
					if lilac_seals >= self.config.discarded_cards then
						create_spectrals = true
					end
                end
            end
            if create_spectrals == true then
				for i = 1, self.config.spectral_cards do
					--SMODS.create_card(Spectral, G.consumeables, nil, nil, nil, nil, nil, nil, nil, nil, nil)
					local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'lilacseal')
					card:set_edition({ negative = true }, true)
					card:add_to_deck()
					G.consumeables:emplace(card)
				end
			end
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.spectral_cards, self.config.discarded_cards } }
    end,
	atlas = 'Lilac'
}