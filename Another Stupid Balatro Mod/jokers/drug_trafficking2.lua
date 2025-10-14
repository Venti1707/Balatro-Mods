SMODS.Joker{ --Drug trafficking
    key = "drug_trafficking2",
    config = {
        extra = {
            Negative = -6,
            Negative22 = -100,
            dollars = 100,
            hand_size = 6,
            odds = 2,
            sell_value = 600,
            hands = 6,
            permanent = 0
        }
    },
    loc_txt = {
        ['name'] = 'Drug trafficking',
        ['text'] = {
            [1] = '{C:money}100{} Dollars when starting a {C:attention}Blind{}, {C:attention}-6{}{} hand size',
            [2] = '{C:inactive}(Jimbo se paso de curioso){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 1,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    set_ability = function(self, card, initial)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if true then
                return {
                    dollars = card.ability.extra.dollars,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.hand_size).." Hand Size", colour = G.C.RED})
                G.hand:change_size(-card.ability.extra.hand_size)
                return true
            end,
                        colour = G.C.BLUE
                        }
                ,
                    func = function()
                        if SMODS.pseudorandom_probability(card, 'group_0_31cf5fbd', 1, card.ability.extra.odds, 'j_shit_drug_trafficking2', false) then
              SMODS.calculate_effect({func = function()
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "undefined-"..tostring(card.ability.extra.sell_value).." Sell Value", colour = G.C.MONEY})
          end
                        return true
                    end
                }
            end
        end
        if context.selling_self  then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+"..tostring(card.ability.extra.hands).." Hand", colour = G.C.GREEN})
                
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hands
        ease_hands_played(card.ability.extra.hands)
        
                return true
            end
                }
        end
    end
}