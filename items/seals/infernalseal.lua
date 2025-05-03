SMODS.Seal{
	key = 'infernalseal',
	pos = { x = 0, y = 0 },
    badge_colour = HEX "FF5500",
    config = { quintuple_tags = 2 },
	no_edeck = true,
	weight = 0.05,
    calculate = function(self, card, context)
		if context.playing_card_end_of_round then
			for i = 1, self.config.quintuple_tags do
				add_tag(Tag("tag_cry_quintuple"))
			end
		end
    end,
	loc_vars = function(self)
        return { vars = { self.config.quintuple_tags } }
    end,
	atlas = 'Infernal'
}