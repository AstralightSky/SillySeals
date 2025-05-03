SMODS.Seal{
	key = 'violetseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "4D00FA",
    config = { extra_spectrals = 2 },
	no_edeck = true,
	weight = 0.001,
    calculate = function(self, card, context)
		if context.destroying_card and context.cardarea == G.play and context.destroy_card == card then
			card.will_shatter = true
			G.E_MANAGER:add_event(Event({
				trigger = "before",
				delay = 0.0,
				func = function()
					local _tags = self.config.extra_spectrals
					for k, v in pairs(G.GAME.tags) do
						_tags = _tags + 1
					end
					for i = 1, _tags do
						local _hidden_spectral = jl.rndelement(Seals.hidden_spectral_cards)
						local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, _hidden_spectral, 'violetseal')
						card:set_edition({ negative = true }, true)
						card:add_to_deck()
						G.consumeables:emplace(card)
					end
					return true
				end,
			}))

			return { remove = true }
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.extra_spectrals } }
    end,
	atlas = 'Violet'
}