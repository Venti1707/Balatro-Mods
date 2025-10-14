SMODS.Joker{ --Eggold
    key = "eggold2",
    config = {
        extra = {
            sell_value = 10
        }
    },
    loc_txt = {
        ['name'] = 'Eggold',
        ['text'] = {
            [1] = 'Gains {C:money}$10{} of {C:attention}sell value{} at end of round'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        local target_card = G.jokers.cards[my_pos]
                    return true
                end,
                    message = "+"..tostring(card.ability.extra.sell_value).." Sell Value"
                }
        end
    end
}