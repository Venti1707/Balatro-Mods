SMODS.Joker{ --Demonic Circle
    key = "demoniccircle",
    config = {
        extra = {
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Demonic Circle',
        ['text'] = {
            [1] = 'If played hand contains three {C:attention}6 {}cards, create a {C:spectral}Ouija {}card',
            [2] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = "shit_hell",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["c_ouija"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_ouija\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 6 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount == 3
end)() then
                func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', key = 'c_ouija'})                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                end
                return {
                    message = created_consumable and localize('k_plus_spectral') or nil
                }
            end
        end
    end
}