SMODS.Joker{ --Destiny
    key = "destiny",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Destiny',
        ['text'] = {
            [1] = 'All played {C:orange}Ace{} become {C:orange}Lucky{} cards when scored'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 7,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 14 then
                context.other_card:set_ability(G.P_CENTERS.m_lucky)
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}