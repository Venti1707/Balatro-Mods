SMODS.Joker{ --Dc. TC
    key = "dctc",
    config = {
        extra = {
            chips = 70
        }
    },
    loc_txt = {
        ['name'] = 'Dc. TC',
        ['text'] = {
            [1] = '{C:blue}+70{} Chips, finish to score is you have {C:hearts}Ace {}create {C:tarot}Death{}',
            [2] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["shit_tyler"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["j_shit_acethejoker"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"j_shit_acethejoker\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["c_death"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_death\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.after and context.cardarea == G.jokers  then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_anothers_acetyler" then
              return true
          end
      end
      return false
  end)() then
                return {
                    message = "so Tyler if you had the chance to tell him something What would you tell him?",
                    extra = {
                        
    func = function()
    for i = 1, math.min(undefined, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Tarot', key = 'c_death'})                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
                    end
                    return true
                  end,
                        colour = G.C.PURPLE
                        }
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.chips
                }
        end
    end
}