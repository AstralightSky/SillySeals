sillyseals_solarseal =
SMODS.Seal{
	key = 'solarseal',
	pos = { x = 0, y = 0 },
	no_edeck = true,
	weight = 0.05,
    badge_colour = SMODS.Gradients.sillyseals_colour_solar,
    config = { ascended_multiplier = 5 },
	loc_vars = function(self)
        return { vars = { self.config.ascended_multiplier } }
    end,
	atlas = 'Solar'
}