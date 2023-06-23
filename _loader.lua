local Tinkr = ...
local Evaluator = Tinkr.Util.Evaluator

local LoadMeDaddy = CreateFrame("frame", "LoadMeDaddy")
LoadMeDaddy:RegisterEvent("PLAYER_ENTERING_WORLD")


--[[
        Priest T10
        [1] = 11808, -- Head
        [3] = 51257, -- Shoulder
        [5] = 51259, -- Chest
        [16] = 50734, -- Mainhand
        [17] = 51408, -- Offhand
        [10] = 51256, -- Gloves
        [6] = 51337, -- Waist
        [7] = 51258, -- Legs
        [8] = 51366, -- Feet
        [9] = 51367 -- Wrist
--]]

--[[
        Priest Slut
        [1] = 32329, -- Head
        [3] = 32273, -- Shoulder
        [5] = 14175, -- Chest
        [16] = 46017, -- Mainhand
        [17] = 51408, -- Offhand
        [10] = 0, -- Gloves
        [6] = 0, -- Waist
        [7] = 9999, -- Legs
        [8] = 1780, -- Feet
        [9] = 0, -- Wrist
        [19] = 38312 -- Tabard

--]]

--[[
        Paladin T10
        [1] = 51272, -- Head
        [3] = 51269, -- Shoulder
        [5] = 51265, -- Chest
        [16] = 46017, -- Mainhand
        [17] = 50616, -- Offhand
        [10] = 51276, -- Gloves
        [6] = 50667, -- Waist
        [7] = 51271, -- Legs
        [8] = 50632, -- Feet
        [9] = 50721,  -- Wrist
        [19] = 0 -- Tabard
]]

local equipmentMappings = {
    Priest = {
        [1] = 19999,
        [3] = 17622,
        [4] = 0,
        [5] = 9998,
        [6] = 0,
        [7] = 9999,
        [8] = 10026,
        [10] = 10003,
        [15] = 0,
        [16] = 33754,
        [17] = 25195,
        [18] = 0,
        [19] = 0,
    },
    Paladin = {
        [1] = 30988,
        [3] = 30998,
        [4] = 0,
        [5] = 14966,
        [6] = 16910,
        [7] = 14970,
        [8] = 14972,
        [9] = 14974,
        [10] = 14967,
        [15] = 0,
        [16] = 46017,
        [17] = 34185,
        [18] = 0,
        [19] = 20132,
    }
}

LoadMeDaddy:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_ENTERING_WORLD" then
        local class = UnitClass("player")
        local mappings = equipmentMappings[class]
        if mappings then
            for slot, itemID in pairs(mappings) do
                Eval('RunMacroText("/tinkr morph item ' .. slot .. ' ' .. itemID .. '")', 'r')
            end
        end
    end
end)

local class = UnitClass("player")
local mappings = equipmentMappings[class]
if mappings then
    for slot, itemID in pairs(mappings) do
        Eval('RunMacroText("/tinkr morph item ' .. slot .. ' ' .. itemID .. '")', 'r')
    end
end
