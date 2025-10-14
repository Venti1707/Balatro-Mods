SMODS.Joker{ --Cryptido
    key = "cryptido",
    config = {
        extra = {
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cryptido',
        ['text'] = {
            [1] = 'Create a {C:dark_edition}Negative{} {C:spectral}Cryptid{} if you have a {C:spectral}Cryptid{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 4
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
        local info_queue_1 = G.P_CENTERS["c_cryptid"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_cryptid\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
            if (function()
    local count = 0
    for _, consumable_card in pairs(G.consumeables.cards or {}) do
        if consumable_card.config.center.key == "c_cryptid" then
            count = count + 1
        end
    end
    return count >= 1
end)() then
                return {
                    
    func = function()
    for i = 1, 1 do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', key = 'c_cryptid'})                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                  end
                }
            end
        end
    end
}