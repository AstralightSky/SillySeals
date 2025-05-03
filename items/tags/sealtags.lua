SMODS.Tag({
    key = "chronomicon",
    atlas = "SealsTags",
    pos = { x = 0, y = 0 },
    loc_vars = function(self, info_queue)
        info_queue[#info_queue + 1] = { set = "Other", key = "p_sillyseals_sealspectraljumbo1", specific_vars = { 1, 4 } }
        return { vars = {} }
    end,
    apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_sillyseals_sealspectraljumbo1"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
    end,
})

SMODS.Tag{
	key = "dilation",
	atlas = "SealsTags",
	pos = { x = 1, y = 0 },
	config = { type = "new_blind_choice" },
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = G.P_CENTERS.p_sillyseals_sealspectralspecial
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			local lock = tag.ID
			G.CONTROLLER.locks[lock] = true
			tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
				local key = "p_sillyseals_sealspectralspecial"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				if G.GAME.modifiers.cry_force_edition and not G.GAME.modifiers.cry_force_random_edition then
					card:set_edition(nil, true, true)
				elseif G.GAME.modifiers.cry_force_random_edition then
					local edition = Cryptid.poll_random_edition()
					card:set_edition(edition, true, true)
				end
				card:start_materialize()
				G.CONTROLLER.locks[lock] = nil
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
	in_pool = function()
		return false
	end,
}

SMODS.Tag{
	key = "slots",
	atlas = "SealsTags",
	pos = { x = 2, y = 0 },
	config = { type = "new_blind_choice", odds = 4 },
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Tag", key = "tag_sillyseals_dilation" }
		return { vars = { G.GAME.probabilities.normal or 1, self.config.odds } }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			if pseudorandom("sillyseals_slotstag") < G.GAME.probabilities.normal / tag.config.odds then
				local lock = tag.ID
				G.CONTROLLER.locks[lock] = true
				tag:yep("+", G.C.SECONDARY_SET.Spectral, function()
					local emp = Tag("tag_sillyseals_dilation")
					if tag.ability.shiny then -- good fucking luck
						emp.ability.shiny = Cryptid.is_shiny()
					end
					add_tag(emp)
					tag.triggered = true
					emp:apply_to_run({ type = "new_blind_choice" })
					G.CONTROLLER.locks[lock] = nil
					return true
				end)
			else
				tag:nope()
				tag.triggered = true
				for i = 1, #G.GAME.tags do
					if G.GAME.tags[i] ~= tag then
						if G.GAME.tags[i]:apply_to_run({ type = "new_blind_choice" }) then
							break
						end
					end
				end
			end
			tag.triggered = true
			return true
		end
	end,
}