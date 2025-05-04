SMODS.Atlas({
    key = "modicon",
    path = "sortatro.png",
    px = 34,
    py = 34
});

local oldSmodsCollectionPool = SMODS.collection_pool

SMODS.collection_pool = function(basePool)
    local pool = oldSmodsCollectionPool(basePool)

    if basePool == G.P_CENTER_POOLS.Joker then
        local alerts, others = {}, {}
        for _, card in ipairs(pool) do
            if card.discovered and not card.alerted then
                table.insert(alerts, card)
            else
                table.insert(others, card)
            end
        end
        for i = #pool, 1, -1 do
            pool[i] = nil
        end
        for _, c in ipairs(alerts) do
            table.insert(pool, c)
        end
        for _, c in ipairs(others) do
            table.insert(pool, c)
        end
    end

    return pool
end
