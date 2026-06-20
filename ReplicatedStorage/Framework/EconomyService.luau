-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.EconomyService

-- Decompiled with Potassium's decompiler.

local l__TotalStats__1 = game:GetService("ReplicatedStorage"):WaitForChild("TotalStats");
local l__Items__2 = l__TotalStats__1:WaitForChild("Items");
local l__Stats__3 = l__TotalStats__1:WaitForChild("Stats");
return {
    GetPrice = function(p1) --[[ Name: GetPrice, Line 11 ]]
        -- upvalues: l__Stats__3 (copy), l__Items__2 (copy)
        local v2 = l__Stats__3:GetAttribute("TotalDiamondsSpent") or 0;
        if v2 <= 0 then
            return 0;
        end;
        local v3 = l__Items__2:GetAttributes();
        local v4 = 0;
        for _, v5 in pairs(v3) do
            if type(v5) == "number" and v5 > 0 then
                v4 = v4 + 1;
            end;
        end;
        if v4 == 0 then
            return 0;
        end;
        local v6 = v2 / v4;
        local v7 = l__Items__2:GetAttribute(p1) or 0;
        return v7 <= 0 and 0 or math.floor(v6 / v7 + 0.5);
    end
};