-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.TutorialController

-- Decompiled with Potassium's decompiler.

local u1 = {};
local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__RunService__3 = game:GetService("RunService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__TweenService__5 = game:GetService("TweenService");
local l__ClientPlayerState__6 = require(l__ReplicatedStorage__2:WaitForChild("Framework"):WaitForChild("ClientPlayerState"));
local function u14(p2, u3, u4, u5) --[[ Line: 13 ]]
    -- upvalues: l__TweenService__5 (copy), l__RunService__3 (copy)
    local u6 = Instance.new("TextLabel");
    u6.Font = Enum.Font.GothamBlack;
    u6.TextColor3 = Color3.fromRGB(255, 215, 0);
    u6.TextStrokeTransparency = 0;
    u6.BackgroundTransparency = 1;
    u6.TextScaled = true;
    u6.ZIndex = 100;
    u6.Size = UDim2.fromOffset(72, 72);
    u6.AnchorPoint = Vector2.new(0.5, 0.5);
    u6.Text = u4 == "right" and "➡" or "⬇";
    u6.Parent = p2;
    local u7 = Instance.new("NumberValue");
    u7.Value = 0;
    u7.Parent = u6;
    local u8 = l__TweenService__5:Create(u7, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
        Value = 18
    });
    local function v12() --[[ Line: 33 ]]
        -- upvalues: u3 (copy), u6 (copy), u5 (copy), u4 (copy), u7 (copy)
        if u3 and u3.Parent then
            local l__AbsolutePosition__7 = u3.AbsolutePosition;
            local l__AbsoluteSize__8 = u3.AbsoluteSize;
            local v9 = l__AbsolutePosition__7.X + l__AbsoluteSize__8.X * 0.5;
            local v10 = l__AbsolutePosition__7.Y + l__AbsoluteSize__8.Y * 0.5;
            local v11 = tonumber(u5) or 38;
            if u4 == "right" then
                u6.Position = UDim2.fromOffset(l__AbsolutePosition__7.X - v11 - u7.Value, v10);
            else
                u6.Position = UDim2.fromOffset(v9, l__AbsolutePosition__7.Y - v11 - u7.Value);
            end;
        else
            u6:Destroy();
        end;
    end;
    local u13 = l__RunService__3.RenderStepped:Connect(v12);
    u6.Destroying:Connect(function() --[[ Line: 53 ]]
        -- upvalues: u13 (copy), u8 (copy), u7 (copy)
        u13:Disconnect();
        u8:Cancel();
        u7:Destroy();
    end);
    v12();
    u8:Play();
    return u6, u8;
end;
function u1.Init() --[[ Line: 65 ]]
    -- upvalues: l__Players__1 (copy), l__ClientPlayerState__6 (copy), u14 (copy), u1 (copy)
    local l__LocalPlayer__9 = l__Players__1.LocalPlayer;
    task.spawn(function() --[[ Line: 68 ]]
        -- upvalues: l__ClientPlayerState__6 (ref), l__LocalPlayer__9 (copy), u14 (ref), u1 (ref)
        local v15 = l__ClientPlayerState__6.WaitForProxy("Gameplay", l__LocalPlayer__9, 10);
        if v15 then
            local v16 = v15:GetAttribute("Playtime");
            if v16 and v16 > 0 then
            else
                local l__PlayerGui__10 = l__LocalPlayer__9:WaitForChild("PlayerGui", 10);
                local l__Gui__11 = l__PlayerGui__10:WaitForChild("Gui", 10);
                local l__Play__12 = l__Gui__11:WaitForChild("Menu", 10):WaitForChild("Center", 10):WaitForChild("Play", 10);
                if l__Play__12 then
                    local u17 = Instance.new("ScreenGui");
                    u17.Name = "TutorialGui";
                    u17.DisplayOrder = 1000;
                    u17.IgnoreGuiInset = l__Gui__11.IgnoreGuiInset;
                    u17.Parent = l__PlayerGui__10;
                    task.wait(1);
                    local u18, u19 = u14(u17, l__Play__12, "down", 20);
                    local u20 = nil;
                    u20 = l__Play__12.MouseButton1Click:Connect(function() --[[ Line: 96 ]]
                        -- upvalues: u20 (ref), u19 (copy), u18 (copy), u1 (ref), l__LocalPlayer__9 (ref), u17 (copy)
                        u20:Disconnect();
                        u19:Cancel();
                        u18:Destroy();
                        u1.StartGameplayTutorial(l__LocalPlayer__9, u17);
                    end);
                end;
            end;
        end;
    end);
end;
function u1.StartGameplayTutorial(p21, u22) --[[ Line: 106 ]]
    -- upvalues: l__UserInputService__4 (copy), u14 (copy), l__TweenService__5 (copy)
    task.wait(1.5);
    if l__UserInputService__4.TouchEnabled then
        local l__MobileAgaricControls__13 = p21:WaitForChild("PlayerGui"):WaitForChild("MobileAgaricControls", 5);
        if l__MobileAgaricControls__13 then
            local u23 = nil;
            local v24 = nil;
            local u25 = nil;
            local u26 = nil;
            local u27 = nil;
            for _, v28 in ipairs(l__MobileAgaricControls__13:GetChildren()) do
                if v28:IsA("TextButton") then
                    if v28.Text == "FEED" then
                        u23 = v28;
                    end;
                    if v28.Text == "SPLIT" then
                        v24 = v28;
                    end;
                    if v28.Text == "+" then
                        u25 = v28;
                    end;
                    if v28.Text == "-" then
                        u26 = v28;
                    end;
                    if v28.Text == "FREEZE" then
                        u27 = v28;
                    end;
                end;
            end;
            if u23 and (v24 and (u25 and (u26 and u27))) then
                local u29, u30 = u14(u22, v24, "down");
                local u31 = nil;
                u31 = v24.MouseButton1Click:Connect(function() --[[ Line: 138 ]]
                    -- upvalues: u31 (ref), u30 (ref), u29 (ref), u14 (ref), u22 (copy), u23 (ref), u26 (ref), u25 (ref), u27 (ref)
                    u31:Disconnect();
                    u30:Cancel();
                    u29:Destroy();
                    local v32, v33 = u14(u22, u23, "down");
                    u29 = v32;
                    u30 = v33;
                    local u34 = nil;
                    u34 = u23.InputBegan:Connect(function(p35) --[[ Line: 147 ]]
                        -- upvalues: u34 (ref), u30 (ref), u29 (ref), u14 (ref), u22 (ref), u26 (ref), u25 (ref), u27 (ref)
                        if p35.UserInputType == Enum.UserInputType.Touch or p35.UserInputType == Enum.UserInputType.MouseButton1 then
                            u34:Disconnect();
                            u30:Cancel();
                            u29:Destroy();
                            local v36, v37 = u14(u22, u26, "right");
                            u29 = v36;
                            u30 = v37;
                            local u38 = nil;
                            u38 = u26.MouseButton1Click:Connect(function() --[[ Line: 157 ]]
                                -- upvalues: u38 (ref), u30 (ref), u29 (ref), u14 (ref), u22 (ref), u25 (ref), u27 (ref)
                                u38:Disconnect();
                                u30:Cancel();
                                u29:Destroy();
                                local v39, v40 = u14(u22, u25, "right");
                                u29 = v39;
                                u30 = v40;
                                local u41 = nil;
                                u41 = u25.MouseButton1Click:Connect(function() --[[ Line: 166 ]]
                                    -- upvalues: u41 (ref), u30 (ref), u29 (ref), u14 (ref), u22 (ref), u27 (ref)
                                    u41:Disconnect();
                                    u30:Cancel();
                                    u29:Destroy();
                                    local v42, v43 = u14(u22, u27, "right");
                                    u29 = v42;
                                    u30 = v43;
                                    local u44 = nil;
                                    u44 = u27.MouseButton1Click:Connect(function() --[[ Line: 175 ]]
                                        -- upvalues: u44 (ref), u30 (ref), u29 (ref), u14 (ref), u22 (ref), u27 (ref)
                                        u44:Disconnect();
                                        u30:Cancel();
                                        u29:Destroy();
                                        local v45, v46 = u14(u22, u27, "right");
                                        u29 = v45;
                                        u30 = v46;
                                        local u47 = nil;
                                        u47 = u27.MouseButton1Click:Connect(function() --[[ Line: 184 ]]
                                            -- upvalues: u47 (ref), u30 (ref), u29 (ref), u22 (ref)
                                            u47:Disconnect();
                                            u30:Cancel();
                                            u29:Destroy();
                                            u22:Destroy();
                                        end);
                                    end);
                                end);
                            end);
                        end;
                    end);
                end);
            else
                u22:Destroy();
            end;
        else
            u22:Destroy();
        end;
    else
        local u48 = Instance.new("TextLabel");
        u48.Text = "Press [ SPACE ] to split";
        u48.Font = Enum.Font.GothamBlack;
        u48.TextColor3 = Color3.new(1, 1, 1);
        u48.TextStrokeTransparency = 0;
        u48.BackgroundTransparency = 0.5;
        u48.BackgroundColor3 = Color3.new(0, 0, 0);
        u48.TextScaled = true;
        u48.AnchorPoint = Vector2.new(0.5, 1);
        u48.Size = UDim2.new(0.4, 0, 0.08, 0);
        u48.Position = UDim2.new(0.5, 0, 0.85, 0);
        local v49 = Instance.new("UICorner");
        v49.CornerRadius = UDim.new(0.2, 0);
        v49.Parent = u48;
        u48.Parent = u22;
        local u50 = l__TweenService__5:Create(u48, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
            TextTransparency = 0.4
        });
        u50:Play();
        local u51 = 1;
        local u52 = nil;
        local u53 = nil;
        u52 = l__UserInputService__4.InputBegan:Connect(function(p54, p55) --[[ Line: 228 ]]
            -- upvalues: u51 (ref), u48 (copy), u52 (ref), u53 (ref), l__UserInputService__4 (ref), u50 (copy), l__TweenService__5 (ref), u22 (copy)
            if p55 then
            elseif u51 == 1 and p54.KeyCode == Enum.KeyCode.Space then
                u51 = 2;
                u48.Text = "Press [ W ] to feed / eject mass";
            else
                if u51 == 2 and p54.KeyCode == Enum.KeyCode.W then
                    u51 = 3;
                    u48.Text = "Scroll [ Mouse Wheel ] to zoom in/out";
                    u52:Disconnect();
                    u53 = l__UserInputService__4.InputChanged:Connect(function(p56, _) --[[ Line: 240 ]]
                        -- upvalues: u53 (ref), u51 (ref), u48 (ref), u52 (ref), l__UserInputService__4 (ref), u50 (ref), l__TweenService__5 (ref), u22 (ref)
                        if p56.UserInputType == Enum.UserInputType.MouseWheel then
                            u53:Disconnect();
                            u51 = 4;
                            u48.Text = "Press [ F ] to turn ON Freeze";
                            u52 = l__UserInputService__4.InputBegan:Connect(function(p57, p58) --[[ Line: 248 ]]
                                -- upvalues: u51 (ref), u48 (ref), u52 (ref), u50 (ref), l__TweenService__5 (ref), u22 (ref)
                                if p58 then
                                elseif u51 == 4 and p57.KeyCode == Enum.KeyCode.F then
                                    u51 = 5;
                                    u48.Text = "Press [ F ] again to turn OFF Freeze";
                                else
                                    if u51 == 5 and p57.KeyCode == Enum.KeyCode.F then
                                        u52:Disconnect();
                                        u50:Cancel();
                                        local v59 = l__TweenService__5:Create(u48, TweenInfo.new(0.5), {
                                            TextTransparency = 1,
                                            BackgroundTransparency = 1
                                        });
                                        v59:Play();
                                        v59.Completed:Connect(function() --[[ Line: 261 ]]
                                            -- upvalues: u22 (ref)
                                            u22:Destroy();
                                        end);
                                    end;
                                end;
                            end);
                        end;
                    end);
                end;
            end;
        end);
    end;
end;
return u1;