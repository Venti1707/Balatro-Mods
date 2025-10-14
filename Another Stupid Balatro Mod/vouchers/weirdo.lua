SMODS.Voucher {
    key = 'weirdo',
    pos = { x = 7, y = 0 },
    config = { extra = {
        rarity_rate = 0.1
    } },
    loc_txt = {
        name = 'Weirdo',
        text = {
        [1] = '{C:rare}Rare{} Jokers appear 2X more frequently in the shop'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    requires = {'v_disintegration'},
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.rare_mod = 0.1
                return true
            end
        }))
    end
}