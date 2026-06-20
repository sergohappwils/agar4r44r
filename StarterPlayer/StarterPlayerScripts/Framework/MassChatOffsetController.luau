-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.MassChatOffsetController

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__StarterGui__2 = game:GetService("StarterGui");
local l__TextChatService__3 = game:GetService("TextChatService");
local l__TweenService__4 = game:GetService("TweenService");
local l__MainScreenGui__5 = l__Players__1.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainScreenGui", 30);
local v1;
if l__MainScreenGui__5 then
    v1 = l__MainScreenGui__5:WaitForChild("Mass", 30);
    if not (v1 and v1:IsA("GuiObject")) then
        v1 = nil;
    end;
else
    v1 = nil;
end;
if v1 then
    local l__Position__6 = v1.Position;
    local v2 = UDim2.new(l__Position__6.X.Scale, l__Position__6.X.Offset, l__Position__6.Y.Scale + 0.32, l__Position__6.Y.Offset);
    local v3 = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out);
    local v4 = nil;
    while task.wait(0.1) do
        local v5, v6 = pcall(function() --[[ Line: 41 ]]
            -- upvalues: l__StarterGui__2 (copy)
            return l__StarterGui__2:GetCore("ChatActive");
        end);
        local v7;
        if v5 then
            v7 = v6 == true;
        else
            local v8 = l__TextChatService__3:FindFirstChild("ChatWindowConfiguration");
            if v8 == nil then
                v7 = false;
            else
                v7 = v8.Enabled == true;
            end;
        end;
        if v7 == v4 then
            v7 = v4;
        else
            local v9 = {};
            local v10;
            if v7 then
                v10 = v2;
            else
                v10 = l__Position__6;
            end;
            v9.Position = v10;
            l__TweenService__4:Create(v1, v3, v9):Play();
        end;
        v4 = v7;
    end;
end;