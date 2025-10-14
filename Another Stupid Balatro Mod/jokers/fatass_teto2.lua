SMODS.Joker{ --Fatass Teto
    key = "fatass_teto2",
    config = {
        extra = {
            sell_value = 1,
            dollars = 10,
            ante_value = 2
        }
    },
    loc_txt = {
        ['name'] = 'Fatass Teto',
        ['text'] = {
            [1] = '{C:red}-2{} Joker slot',
            [2] = 'if you hold in hand {C:attention} 10{}, give {C:gold}$10{} Dollars',
            [3] = 'When a {C:attention} boss blind{} is defeated, set the ante to 2 for {C:red}fat{} is {C:hearts}Teto{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 7
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = "shit_shitpost",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card:get_id() == 10 then
                return {
                    func = function()
                    return true
                end,
                    message = "undefined+"..tostring(card.ability.extra.sell_value).." Sell Value",
                    extra = {
                        dollars = card.ability.extra.dollars,
                        colour = G.C.MONEY
                        }
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                    local mod = card.ability.extra.ante_value - G.GAME.round_resets.ante
		ease_ante(mod)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.round_resets.blind_ante = card.ability.extra.ante_value
				return true
			end,
		}))
                    return true
                end,
                    message = "Ante set to " .. card.ability.extra.ante_value .. "!"
                }
        end
    end,

    add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = math.max(1, G.jokers.config.card_limit - 1)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + 1
    end
}