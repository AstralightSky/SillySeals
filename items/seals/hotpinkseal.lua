SMODS.Seal{
  key = 'hotpinkseal',
  pos = { x = 0, y = 0 },
    badge_colour = HEX "ff0088",
    config = { retriggers = 1 },
  no_edeck = true,
  weight = 0.3,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.play then
                return {
                    repetitions = self.config.retriggers * #G.play.cards,
                    card = card,
                    --sendInfoMessage("Retriggers: " .. (self.config.retriggers * #G.play.cards), "Hot Pink Seal")
                }
            end
        end
    end,
    loc_vars = function(self)
        return { vars = { self.config.retriggers } }
    end,
  atlas = 'HotPink'
}