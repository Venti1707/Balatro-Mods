SMODS.Joker{ --END
    key = "end",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'END',
        ['text'] = {
            [1] = 'If the {C:attention}first hand{} of the round has only {C:attention}1 {}card,',
            [2] = 'mark it as negative and draw a card to add to that {C:attention}hand{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 6
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["e_negative"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"e_negative\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (#context.full_hand == 1 and G.GAME.current_round.hands_played == 0) then
                context.other_card:set_edition("e_negative", true)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}