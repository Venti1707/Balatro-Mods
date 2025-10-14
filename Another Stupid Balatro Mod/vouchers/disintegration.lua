SMODS.Voucher {
    key = 'disintegration',
    pos = { x = 3, y = 0 },
    config = { extra = {
        rarity_rate = 0.35
    } },
    loc_txt = {
        name = 'Disintegration',
        text = {
        [1] = '{C:common}Common{} Jokers appear 2X minus frequently in the shop'
    }
    },
    unlocked = true,
    discovered = true,
    no_collection = false,
    can_repeat_soul = false,
    atlas = 'CustomVouchers',
     redeem = function(self, card)
            G.E_MANAGER:add_event(Event({
            func = function()
        G.GAME.common_mod = 0.35
                return true
            end
        }))
    end
}