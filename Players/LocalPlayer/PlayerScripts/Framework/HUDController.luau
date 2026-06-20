-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.HUDController

-- Decompiled with Potassium's decompiler.

local v1 = {};
local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__TweenService__3 = game:GetService("TweenService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__Framework__5 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__LevelService__6 = require(l__Framework__5:WaitForChild("LevelService"));
local l__ClientPlayerState__7 = require(l__Framework__5:WaitForChild("ClientPlayerState"));
local l__ReorderAbilitiesEvent__8 = l__ReplicatedStorage__2:WaitForChild("Gameplay"):WaitForChild("Network"):WaitForChild("ReorderAbilitiesEvent");
local function u26(p2) --[[ Line: 17 ]]
    -- upvalues: l__ClientPlayerState__7 (copy), l__Players__1 (copy), l__UserInputService__4 (copy), l__ReorderAbilitiesEvent__8 (copy)
    if p2 then
        local u3 = l__ClientPlayerState__7.WaitForProxy("Equipped.Abilities", l__Players__1.LocalPlayer, 10);
        if u3 then
            local u4 = {};
            local u5 = nil;
            local u6 = nil;
            for _, v7 in ipairs(p2:GetChildren()) do
                if v7:IsA("GuiButton") or v7:IsA("Frame") then
                    table.insert(u4, v7);
                end;
            end;
            table.sort(u4, function(p8, p9) --[[ Line: 30 ]]
                return (tonumber(p8.Name:match("%d+")) or 0) < (tonumber(p9.Name:match("%d+")) or 0);
            end);
            for u10, u11 in ipairs(u4) do
                u11.InputBegan:Connect(function(p12) --[[ Line: 37 ]]
                    -- upvalues: u3 (copy), u10 (copy), u5 (ref), u6 (ref), u11 (copy)
                    if p12.UserInputType == Enum.UserInputType.MouseButton1 or p12.UserInputType == Enum.UserInputType.Touch then
                        local v13 = u3:GetAttribute("Slot" .. u10);
                        if not v13 or (v13 == "None" or v13 == "") then
                            return;
                        end;
                        u5 = u10;
                        u6 = u11:Clone();
                        u6.Parent = u11.Parent.Parent;
                        u6.Size = u11.Size;
                        u6.ZIndex = 100;
                        u6.BackgroundTransparency = 0.5;
                        u6.AnchorPoint = Vector2.new(0.5, 0.5);
                        u6.Position = UDim2.new(0, p12.Position.X, 0, p12.Position.Y);
                        for _, v14 in pairs(u6:GetDescendants()) do
                            if v14:IsA("GuiObject") then
                                v14.ZIndex = v14.ZIndex + 100;
                            end;
                        end;
                    end;
                end);
            end;
            l__UserInputService__4.InputChanged:Connect(function(p15) --[[ Line: 58 ]]
                -- upvalues: u5 (ref), u6 (ref)
                if u5 and (u6 and (p15.UserInputType == Enum.UserInputType.MouseMovement or p15.UserInputType == Enum.UserInputType.Touch)) then
                    u6.Position = UDim2.new(0, p15.Position.X, 0, p15.Position.Y);
                end;
            end);
            l__UserInputService__4.InputEnded:Connect(function(p16) --[[ Line: 64 ]]
                -- upvalues: u5 (ref), l__Players__1 (ref), u4 (copy), u3 (copy), l__ReorderAbilitiesEvent__8 (ref), u6 (ref)
                if (p16.UserInputType == Enum.UserInputType.MouseButton1 or p16.UserInputType == Enum.UserInputType.Touch) and u5 then
                    local v17 = l__Players__1.LocalPlayer.PlayerGui:GetGuiObjectsAtPosition(p16.Position.X, p16.Position.Y);
                    local v18 = nil;
                    for _, v19 in ipairs(v17) do
                        for v20, v21 in ipairs(u4) do
                            if v19 == v21 or v19.Parent == v21 then
                                v18 = v20;
                                break;
                            end;
                        end;
                        if v18 then
                            break;
                        end;
                    end;
                    if v18 and v18 ~= u5 then
                        local v22 = {};
                        for v23 = 1, 10 do
                            local v24 = u3:GetAttribute("Slot" .. v23);
                            if v24 and (v24 ~= "None" and v24 ~= "") then
                                table.insert(v22, v24);
                            end;
                        end;
                        if u5 <= #v22 and v18 <= #v22 + 1 then
                            local v25 = table.remove(v22, u5);
                            table.insert(v22, v18, v25);
                            l__ReorderAbilitiesEvent__8:FireServer(v22);
                        end;
                    end;
                    if u6 then
                        u6:Destroy();
                        u6 = nil;
                    end;
                    u5 = nil;
                end;
            end);
        end;
    end;
end;
function v1.Init() --[[ Line: 96 ]]
    -- upvalues: l__Players__1 (copy), l__ClientPlayerState__7 (copy), l__LevelService__6 (copy), l__TweenService__3 (copy), u26 (copy)
    local l__LocalPlayer__9 = l__Players__1.LocalPlayer;
    task.spawn(function() --[[ Line: 99 ]]
        -- upvalues: l__LocalPlayer__9 (copy), l__ClientPlayerState__7 (ref), l__LevelService__6 (ref), l__TweenService__3 (ref), u26 (ref)
        local l__PlayerGui__10 = l__LocalPlayer__9:WaitForChild("PlayerGui", 10);
        if l__PlayerGui__10 then
            local l__Gui__11 = l__PlayerGui__10:WaitForChild("Gui", 10);
            local l__MainScreenGui__12 = l__PlayerGui__10:WaitForChild("MainScreenGui", 10);
            if l__Gui__11 and l__MainScreenGui__12 then
                local u27 = l__MainScreenGui__12:FindFirstChild("Mass");
                if u27 then
                    u27 = u27:FindFirstChild("TextLabel");
                end;
                local u28 = l__MainScreenGui__12:FindFirstChild("ScreenMenu");
                local u29;
                if u28 then
                    u29 = u28:FindFirstChild("Gold");
                else
                    u29 = u28;
                end;
                if u29 then
                    u29 = u29:FindFirstChild("Gold");
                end;
                if u29 then
                    u29 = u29:FindFirstChild("Amount");
                end;
                local u30 = l__Gui__11:FindFirstChild("Menu");
                if u30 then
                    u30 = l__Gui__11.Menu:FindFirstChild("Left");
                end;
                local u31;
                if u30 then
                    u31 = u30:FindFirstChild("Gold");
                else
                    u31 = u30;
                end;
                if u31 then
                    u31 = u31:FindFirstChild("Amount");
                end;
                local u32 = l__Gui__11:FindFirstChild("Shop");
                if u32 then
                    u32 = u32:FindFirstChild("GoldValue");
                end;
                if u32 then
                    u32 = u32:FindFirstChild("Amount");
                end;
                if u28 then
                    u28 = u28:FindFirstChild("Level");
                end;
                local u33;
                if u30 then
                    u33 = u30:FindFirstChild("Level");
                else
                    u33 = u30;
                end;
                if u30 then
                    u30 = u30:FindFirstChild("Exp");
                end;
                if u30 then
                    u30 = u30:FindFirstChild("bar");
                end;
                local u34;
                if u30 then
                    u34 = u30:FindFirstChild("Percent");
                else
                    u34 = u30;
                end;
                local u35 = l__ClientPlayerState__7.WaitForProxy("Stats", l__LocalPlayer__9, 10);
                local u36 = l__ClientPlayerState__7.WaitForProxy("Gameplay", l__LocalPlayer__9, 10);
                if u27 then
                    local function v38() --[[ Line: 134 ]]
                        -- upvalues: l__LocalPlayer__9 (ref), u27 (copy)
                        local v37 = tonumber(l__LocalPlayer__9:GetAttribute("RuntimeSize")) or 0;
                        u27.Text = "Mass: " .. tostring(v37):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
                    end;
                    v38();
                    l__LocalPlayer__9:GetAttributeChangedSignal("RuntimeSize"):Connect(v38);
                end;
                if u35 then
                    local function v41() --[[ Line: 144 ]]
                        -- upvalues: u35 (copy), u29 (copy), u31 (copy), u32 (copy)
                        local v39 = u35:GetAttribute("Gold") or 0;
                        local v40 = tostring(v39):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
                        if u29 then
                            u29.Text = v40;
                        end;
                        if u31 then
                            u31.Text = v40;
                        end;
                        if u32 then
                            u32.Text = v40;
                        end;
                    end;
                    v41();
                    u35:GetAttributeChangedSignal("Gold"):Connect(v41);
                end;
                if u36 then
                    local function v45() --[[ Line: 157 ]]
                        -- upvalues: u36 (copy), l__LevelService__6 (ref), u28 (copy), u33 (copy), u30 (copy), l__TweenService__3 (ref), u34 (copy)
                        local v42 = u36:GetAttribute("XP") or 0;
                        local v43 = l__LevelService__6.CalculateLevelInfo(v42);
                        local v44 = l__LevelService__6.GetColorForLevel(v43.Level);
                        if u28 then
                            u28.Text = tostring(v43.Level);
                            u28.BackgroundColor3 = v44;
                        end;
                        if u33 then
                            u33.Text = tostring(v43.Level);
                            u33.BackgroundColor3 = v44;
                        end;
                        if u30 then
                            l__TweenService__3:Create(u30, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                                Size = UDim2.new(v43.ProgressRatio, 0, 1, 0)
                            }):Play();
                            u30.BackgroundColor3 = v44;
                        end;
                        if u34 then
                            u34.Text = tostring(v43.ProgressPercent) .. "%";
                        end;
                    end;
                    v45();
                    u36:GetAttributeChangedSignal("XP"):Connect(v45);
                end;
                u26((l__MainScreenGui__12:FindFirstChild("УКАЖИ_ПУТЬ_К_ПАПКЕ_С_КНОПКАМИ_АБИЛОК")));
            end;
        end;
    end);
end;
return v1;