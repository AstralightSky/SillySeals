for i = 1, 4 do
	SMODS.Booster{
		key = 'sealspectral' .. i,
		loc_txt = {
			name = 'Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i - 1, y = 0},
		weight = .3,
		cost = 4,
		config = {extra = 2, choose = 1},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 25, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

for i = 1, 2 do
	SMODS.Booster{
		key = 'sealspectraljumbo' .. i,
		loc_txt = {
			name = 'Jumbo Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i - 1, y = 1},
		weight = .1,
		cost = 10,
		config = {extra = 4, choose = 1},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 40, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

for i = 1, 2 do
	SMODS.Booster{
		key = 'sealspectralmega',
		loc_txt = {
			name = 'Mega Seal Spectral Pack',
			text = {
				'Choose {C:attention}#1#{} of up to',
				'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
				'be used immediately',
				'{C:green}2.5% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
			}
		},
		atlas = 'sealspectralboosters',
		pos = {x = i + 1, y = 1},
		weight = .05,
		cost = 20,
		config = {extra = 4, choose = 2},
		discovered = true,
		draw_hand = true,
		loc_vars = function(self, info_queue, card)
			return { vars = {card.ability.choose, card.ability.extra} }
		end,
        ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
		create_UIBox = function(self)
			local _size = SMODS.OPENED_BOOSTER.ability.extra
			G.pack_cards = CardArea(
				G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
				math.max(1,math.min(_size,5))*G.CARD_W*1.1,
				1.05*G.CARD_H, 
				{card_limit = _size, type = 'consumeable', highlight_limit = 1})
	
			local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
				{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
					{n=G.UIT.R, config={align = "cm"}, nodes={
					{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
						{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
							{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
				{n=G.UIT.R, config={align = "cm"}, nodes={}},
				{n=G.UIT.R, config={align = "tm"}, nodes={
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
						UIBox_dyn_container({
							{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
								{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
									{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
									{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
						}),}},
					{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
						{n=G.UIT.R,config={minh =0.2}, nodes={}},
						{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
							{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
			return t
		end,
        particles = function(self)
            G.booster_pack_sparkles = Particles(1, 1, 0,0, {
                timer = 0.015,
                scale = 0.1,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
        end,
        create_card = function(self, card, i)
			local possible = {}
			if math.floor(i) == 1 and jl.chance('sealspectralpack_ringularity', 40, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
			elseif jl.chance('sealspectralpack_legendary', 20, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			elseif jl.chance('sealspectralpack_epic', 5, true) then
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			else
				return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
			end
        end,
	}
end

SMODS.Booster{
	key = 'sealspectralspecial',
	loc_txt = {
		name = 'Special Seal Spectral Pack',
		text = {
			'Choose {C:attention}#1#{} of up to',
			'{C:attention}#2# {C:spectral}Seal Spectral{} cards to',
			'be used immediately',
			'{C:green}100% chance{} to contain {C:cry_exotic,s:1.5,E:1}Ringularity{}',
		}
	},
	atlas = 'sealspectralboosters',
	pos = {x = 3, y = 1},
	weight = 0,
	cost = 25,
	config = {extra = 4, choose = 2},
	discovered = true,
	draw_hand = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {card.ability.choose, card.ability.extra} }
	end,
	ease_background_colour = function(self) ease_background_colour_blind(G.STATES.SPECTRAL_PACK) end,
	create_UIBox = function(self)
		local _size = SMODS.OPENED_BOOSTER.ability.extra
		G.pack_cards = CardArea(
			G.ROOM.T.x + 9 + G.hand.T.x, G.hand.T.y,
			math.max(1,math.min(_size,5))*G.CARD_W*1.1,
			1.05*G.CARD_H, 
			{card_limit = _size, type = 'consumeable', highlight_limit = 1})

		local t = {n=G.UIT.ROOT, config = {align = 'tm', r = 0.15, colour = G.C.CLEAR, padding = 0.15}, nodes={
			{n=G.UIT.R, config={align = "cl", colour = G.C.CLEAR,r=0.15, padding = 0.1, minh = 2, shadow = true}, nodes={
				{n=G.UIT.R, config={align = "cm"}, nodes={
				{n=G.UIT.C, config={align = "cm", padding = 0.1}, nodes={
					{n=G.UIT.C, config={align = "cm", r=0.2, colour = G.C.CLEAR, shadow = true}, nodes={
						{n=G.UIT.O, config={object = G.pack_cards}},}}}}}},
			{n=G.UIT.R, config={align = "cm"}, nodes={}},
			{n=G.UIT.R, config={align = "tm"}, nodes={
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05}, nodes={
					UIBox_dyn_container({
						{n=G.UIT.C, config={align = "cm", padding = 0.05, minw = 4}, nodes={
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_sealspectralpack')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.7, maxw = 4, pop_in = 0.5})}}}},
							{n=G.UIT.R,config={align = "bm", padding = 0.05}, nodes={
								{n=G.UIT.O, config={object = DynaText({string = {localize('k_choose')..' '}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}},
								{n=G.UIT.O, config={object = DynaText({string = {{ref_table = G.GAME, ref_value = 'pack_choices'}}, colours = {G.C.WHITE},shadow = true, rotate = true, bump = true, spacing =2, scale = 0.5, pop_in = 0.7})}}}},}}
					}),}},
				{n=G.UIT.C,config={align = "tm", padding = 0.05, minw = 2.4}, nodes={
					{n=G.UIT.R,config={minh =0.2}, nodes={}},
					{n=G.UIT.R,config={align = "tm",padding = 0.2, minh = 1.2, minw = 1.8, r=0.15,colour = G.C.GREY, one_press = true, button = 'skip_booster', hover = true,shadow = true, func = 'can_skip_booster'}, nodes = {
						{n=G.UIT.T, config={text = localize('b_skip'), scale = 0.5, colour = G.C.WHITE, shadow = true, focus_args = {button = 'y', orientation = 'bm'}, func = 'set_button_pip'}}}}}}}}}}}}
		return t
	end,
	particles = function(self)
		G.booster_pack_sparkles = Particles(1, 1, 0,0, {
			timer = 0.015,
			scale = 0.1,
			initialize = true,
			lifespan = 3,
			speed = 0.2,
			padding = -1,
			attach = G.ROOM_ATTACH,
			colours = {G.C.WHITE, lighten(G.C.GOLD, 0.2)},
			fill = true
		})
		G.booster_pack_sparkles.fade_alpha = 1
		G.booster_pack_sparkles:fade(1, 0)
	end,
	create_card = function(self, card, i)
		local possible = {}
		if math.floor(i) == 1 then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = 'c_sillyseals_ringularity', key_append = "spe"}
		elseif jl.chance('sealspectralpack_legendary', 20, true) then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.legendary_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		elseif jl.chance('sealspectralpack_epic', 5, true) then
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.epic_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		else
			return {set = "Spectral", area = G.pack_cards, skip_materialize = true, soulable = false, key = pseudorandom_element(Seals.rare_seal_spectrals, pseudoseed('sealspectrals')), key_append = "spe"}
		end
	end,
}