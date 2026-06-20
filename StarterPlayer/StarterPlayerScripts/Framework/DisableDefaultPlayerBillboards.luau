-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.DisableDefaultPlayerBillboards

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local function u2(u1) --[[ Line: 3 ]]
    if u1 then
        pcall(function() --[[ Line: 8 ]]
            -- upvalues: u1 (copy)
            u1.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
        end);
        pcall(function() --[[ Line: 12 ]]
            -- upvalues: u1 (copy)
            u1.HealthDisplayType = Enum.HumanoidHealthDisplayType.AlwaysOff;
        end);
    end;
end;
local function u6(u3) --[[ Line: 17 ]]
    -- upvalues: u2 (copy)
    local v4 = u3:FindFirstChildOfClass("Humanoid");
    if v4 then
        u2(v4);
    end;
    task.spawn(function() --[[ Line: 23 ]]
        -- upvalues: u3 (copy), u2 (ref)
        local l__Humanoid__2 = u3:WaitForChild("Humanoid", 5);
        if l__Humanoid__2 then
            u2(l__Humanoid__2);
        end;
    end);
    u3.ChildAdded:Connect(function(p5) --[[ Line: 30 ]]
        -- upvalues: u2 (ref)
        if p5:IsA("Humanoid") then
            u2(p5);
        end;
    end);
end;
local function v8(p7) --[[ Line: 37 ]]
    -- upvalues: u6 (copy)
    if p7.Character then
        u6(p7.Character);
    end;
    p7.CharacterAdded:Connect(u6);
end;
for _, v9 in ipairs(l__Players__1:GetPlayers()) do
    if v9.Character then
        u6(v9.Character);
    end;
    v9.CharacterAdded:Connect(u6);
end;
l__Players__1.PlayerAdded:Connect(v8);