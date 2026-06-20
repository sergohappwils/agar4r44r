-- ClassName: LocalScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.TradeClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__SoundService__3 = game:GetService("SoundService");
local l__UserInputService__4 = game:GetService("UserInputService");
local l__LocalPlayer__5 = l__Players__1.LocalPlayer;
local l__PlayerGui__6 = l__LocalPlayer__5:WaitForChild("PlayerGui");
local l__Framework__7 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__TradeNetwork__8 = l__Framework__7:WaitForChild("TradeNetwork");
local l__Gameplay__9 = l__ReplicatedStorage__2:WaitForChild("Gameplay", 30);
if l__Gameplay__9 then
    l__Gameplay__9 = l__Gameplay__9:WaitForChild("Network", 30);
end;
if l__Gameplay__9 then
    l__Gameplay__9 = l__Gameplay__9:WaitForChild("UpdateControlSettings", 30);
end;
local l__Action__10 = l__TradeNetwork__8:WaitForChild("Action");
local l__Update__11 = l__TradeNetwork__8:WaitForChild("Update");
local l__PromptHandler__12 = require(l__Framework__7:WaitForChild("PromptHandler"));
local l__ClientPlayerState__13 = require(l__Framework__7:WaitForChild("ClientPlayerState"));
local l__GameDatabase__14 = require(l__Framework__7:WaitForChild("GameDatabase"));
local v1 = nil;
local v2 = l__Framework__7:FindFirstChild("TotalStatsCalculator");
local u3;
if v2 then
    local v4;
    v4, u3 = pcall(require, v2);
    if not v4 then
        u3 = v1;
    end;
else
    u3 = v1;
end;
local l__Gui__15 = l__PlayerGui__6:WaitForChild("Gui", 30);
if l__Gui__15 then
    local l__Menu__16 = l__Gui__15:WaitForChild("Menu", 30);
    local l__Trade__17 = l__Gui__15:WaitForChild("Trade", 30);
    local l__ActiveTradeSession__18 = l__Gui__15:WaitForChild("ActiveTradeSession", 30);
    if l__Menu__16 and (l__Trade__17 and l__ActiveTradeSession__18) then
        local u5 = nil;
        local u6 = nil;
        local u7 = nil;
        local u8 = nil;
        local u9 = nil;
        local u10 = nil;
        local u11 = 0;
        local u12 = l__SoundService__3:FindFirstChild("AgaricTradeAudio");
        if not u12 then
            u12 = Instance.new("Folder");
            u12.Name = "AgaricTradeAudio";
            u12.Parent = l__SoundService__3;
        end;
        local u13 = {
            Open = {
                Name = "Trade_Open",
                Id = "9119740460",
                Volume = 0.13,
                Speed = 1.06
            },
            Close = {
                Name = "Trade_Close",
                Id = "9119738974",
                Volume = 0.13,
                Speed = 1.02
            },
            Request = {
                Name = "Trade_Request",
                Id = "9119740460",
                Volume = 0.16,
                Speed = 1.16
            },
            Incoming = {
                Name = "Trade_Incoming",
                Id = "9116395424",
                Volume = 0.12,
                Speed = 1.05
            },
            Accept = {
                Name = "Trade_Accept",
                Id = "98007189797443",
                Volume = 0.16,
                Speed = 1.1
            },
            Add = {
                Name = "Trade_AddItem",
                Id = "98007189797443",
                Volume = 0.14,
                Speed = 1.2
            },
            Remove = {
                Name = "Trade_RemoveItem",
                Id = "9119738974",
                Volume = 0.12,
                Speed = 1.12
            },
            Cancel = {
                Name = "Trade_Cancel",
                Id = "9119738974",
                Volume = 0.15,
                Speed = 0.96
            },
            Complete = {
                Name = "Trade_Complete",
                Id = "113890702074571",
                Volume = 0.2,
                Speed = 1
            },
            Error = {
                Name = "Trade_Error",
                Id = "9119738974",
                Volume = 0.12,
                Speed = 0.86
            }
        };
        local u14 = {};
        local u15 = {};
        local function u20(p16) --[[ Line: 92 ]]
            -- upvalues: u13 (copy), u14 (copy), u12 (ref)
            local v17 = u13[p16] or u13.Open;
            local v18 = u14[p16];
            if not (v18 and v18.Parent) then
                v18 = u12:FindFirstChild(v17.Name);
                if not (v18 and v18:IsA("Sound")) then
                    if v18 then
                        v18:Destroy();
                    end;
                    v18 = Instance.new("Sound");
                    v18.Name = v17.Name;
                    v18.Parent = u12;
                end;
                u14[p16] = v18;
            end;
            local v19 = tostring(v17.Id or "");
            if string.sub(v19, 1, 13) ~= "rbxassetid://" then
                v19 = "rbxassetid://" .. v19;
            end;
            v18.SoundId = v19;
            v18.Volume = v17.Volume or 0.14;
            v18.PlaybackSpeed = v17.Speed or 1;
            v18.Looped = false;
            return v18;
        end;
        local function u26(p21) --[[ Line: 114 ]]
            -- upvalues: l__ClientPlayerState__13 (copy), l__LocalPlayer__5 (copy), u13 (copy), u15 (copy), u20 (copy)
            local v22 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
            if v22 then
                v22 = v22:GetAttribute("SfxEnabled");
            end;
            if v22 ~= false then
                local v23 = u13[p21] and p21 and p21 or "Open";
                local v24 = os.clock();
                if v24 < (u15[v23] or 0) + 0.08 then
                else
                    u15[v23] = v24;
                    local u25 = u20(v23);
                    pcall(function() --[[ Line: 125 ]]
                        -- upvalues: u25 (copy)
                        u25.TimePosition = 0;
                        u25:Play();
                    end);
                end;
            end;
        end;
        local function u32(u27, u28, p29) --[[ Line: 137 ]]
            -- upvalues: l__Action__10 (copy), l__PromptHandler__12 (copy)
            local v30, v31 = pcall(function() --[[ Line: 138 ]]
                -- upvalues: l__Action__10 (ref), u27 (copy), u28 (copy)
                return l__Action__10:InvokeServer(u27, u28 or {});
            end);
            if not v30 then
                if not p29 and (l__PromptHandler__12 and l__PromptHandler__12.ShowNotification) then
                    l__PromptHandler__12.ShowNotification("Error", "Trade request failed.");
                end;
                return {
                    Ok = false,
                    Message = "Trade request failed."
                };
            end;
            if type(v31) ~= "table" then
                return {
                    Ok = false,
                    Message = "Invalid trade response."
                };
            end;
            if v31.Ok == false and (v31.Message and not p29) then
                local l__Message__19 = v31.Message;
                if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                    l__PromptHandler__12.ShowNotification("Error", l__Message__19 or "");
                end;
            end;
            return v31;
        end;
        Color3.fromRGB(112, 112, 112);
        local u33 = Color3.fromRGB(28, 28, 28);
        local u34 = Color3.fromRGB(100, 200, 100);
        local u35 = Color3.fromRGB(255, 170, 0);
        local u36 = Color3.fromRGB(0, 140, 220);
        local u37 = Color3.fromRGB(70, 180, 70);
        local u38 = Color3.fromRGB(200, 60, 60);
        local u39 = Color3.fromRGB(28, 28, 28);
        local u40 = Color3.fromRGB(84, 84, 84);
        local u41 = Color3.fromRGB(72, 72, 72);
        local u42 = Color3.fromRGB(30, 30, 34);
        local u43 = Color3.fromRGB(0, 133, 220);
        local u44 = Color3.fromRGB(255, 210, 65);
        local u45 = Color3.fromRGB(95, 220, 115);
        local function v49(p46, p47) --[[ Line: 221 ]]
            if p46:IsA("GuiObject") and p46.ZIndex < p47 then
                p46.ZIndex = p47;
            end;
            for _, v48 in ipairs(p46:GetDescendants()) do
                if v48:IsA("GuiObject") and v48.ZIndex < p47 then
                    v48.ZIndex = p47;
                end;
            end;
        end;
        v49(l__Trade__17, 340);
        v49(l__ActiveTradeSession__18, 340);
        if l__Trade__17:IsA("GuiObject") then
            l__Trade__17.BackgroundTransparency = math.max(l__Trade__17.BackgroundTransparency, 0.34);
            l__Trade__17.ClipsDescendants = true;
            local v50 = l__Trade__17:FindFirstChildOfClass("UICorner");
            if not v50 then
                v50 = Instance.new("UICorner");
                v50.Parent = l__Trade__17;
            end;
            v50.CornerRadius = UDim.new(0, 8);
        end;
        if l__ActiveTradeSession__18:IsA("GuiObject") then
            l__ActiveTradeSession__18.BackgroundTransparency = math.max(l__ActiveTradeSession__18.BackgroundTransparency, 0.34);
            l__ActiveTradeSession__18.ClipsDescendants = true;
            local v51 = l__ActiveTradeSession__18:FindFirstChildOfClass("UICorner");
            if not v51 then
                v51 = Instance.new("UICorner");
                v51.Parent = l__ActiveTradeSession__18;
            end;
            v51.CornerRadius = UDim.new(0, 6);
        end;
        local u52 = Instance.new("TextButton");
        u52.Name = "TradeClickBlocker";
        u52.Active = true;
        u52.AutoButtonColor = false;
        u52.BackgroundTransparency = 1;
        u52.BorderSizePixel = 0;
        u52.Size = UDim2.new(1, 0, 1, 0);
        u52.Text = "";
        u52.Visible = false;
        u52.ZIndex = 330;
        pcall(function() --[[ Line: 256 ]]
            -- upvalues: u52 (copy)
            u52.Modal = true;
        end);
        u52.Parent = l__Gui__15;
        if l__Menu__16 then
            l__Menu__16 = l__Menu__16:FindFirstChild("Trade", true);
        end;
        if not (l__Menu__16 and l__Menu__16:IsA("TextButton")) then
            l__Menu__16 = nil;
        end;
        if l__Menu__16 then
            l__Menu__16.Active = true;
            l__Menu__16.Selectable = true;
            l__Menu__16.AutoButtonColor = true;
            l__Menu__16.BackgroundColor3 = Color3.fromRGB(0, 133, 220);
            l__Menu__16.FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
            l__Menu__16.TextColor3 = Color3.new(1, 1, 1);
            l__Menu__16.TextStrokeTransparency = 1;
            l__Menu__16.TextTransparency = 0;
            for _, v53 in ipairs(l__Menu__16:GetChildren()) do
                if v53.Name == "Menu" and v53:IsA("TextLabel") then
                    if v53.BackgroundTransparency < 1 then
                        v53:Destroy();
                    else
                        v53.Text = "";
                        v53.Visible = false;
                    end;
                end;
            end;
        end;
        local v54 = l__Trade__17:FindFirstChild("Close");
        if v54 and v54:IsA("TextButton") then
            v54.Active = true;
            v54.AutoButtonColor = true;
        end;
        local u55 = l__Trade__17:FindFirstChild("TradeScrolling");
        local u56;
        if u55 then
            u56 = u55:FindFirstChild("Player");
        else
            u56 = u55;
        end;
        if u56 and u56:IsA("GuiObject") then
            u56.Visible = false;
            u56.LayoutOrder = -100000;
        end;
        local u57 = nil;
        local function u61(p58, p59, p60) --[[ Line: 328 ]]
            if p58 then
                p58.Text = p60 and "DISABLE TRADE" or "ENABLE TRADE";
                p58.BackgroundColor3 = p60 and Color3.fromRGB(205, 75, 60) or Color3.fromRGB(58, 145, 80);
            end;
            if p59 then
                p59.Text = p60 and "Players can send you trade requests." or "Incoming trade requests are blocked.";
                p59.TextColor3 = p60 and Color3.fromRGB(190, 220, 255) or Color3.fromRGB(255, 185, 155);
            end;
        end;
        local function u71(u62, p63) --[[ Line: 339 ]]
            -- upvalues: u57 (ref), l__ClientPlayerState__13 (copy), l__LocalPlayer__5 (copy), l__Gameplay__9 (copy), l__PromptHandler__12 (copy)
            local v64;
            if u57 == nil then
                local v65 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
                if v65 then
                    v65 = v65:GetAttribute("TradeRequestsEnabled");
                end;
                if v65 == nil then
                    v64 = true;
                else
                    u57 = v65 ~= false;
                    v64 = u57;
                end;
            else
                v64 = u57;
            end;
            local v66 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
            u57 = u62;
            if v66 then
                v66:SetAttribute("TradeRequestsEnabled", u62);
            end;
            if p63 then
                p63(u62);
            end;
            local v67, v68 = pcall(function() --[[ Line: 350 ]]
                -- upvalues: l__Gameplay__9 (ref), u62 (copy)
                return not (l__Gameplay__9 and l__Gameplay__9:IsA("RemoteFunction")) and {
                    Ok = false,
                    Message = "Settings are not available."
                } or l__Gameplay__9:InvokeServer({
                    Action = "SetTradeRequestsEnabled",
                    Enabled = u62
                });
            end);
            if v67 and (type(v68) == "table" and v68.Ok ~= false) then
                local v69 = v68.Message or "Trade request settings saved.";
                if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                    l__PromptHandler__12.ShowNotification("Info", v69 or "");
                end;
                return true;
            end;
            u57 = v64;
            if v66 then
                v66:SetAttribute("TradeRequestsEnabled", v64);
            end;
            if p63 then
                p63(v64);
            end;
            local v70 = type(v68) == "table" and v68.Message or "Could not save trade settings.";
            if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                l__PromptHandler__12.ShowNotification("Error", v70 or "");
            end;
            return false;
        end;
        local function u92() --[[ Line: 373 ]]
            -- upvalues: u55 (copy), u61 (copy), u57 (ref), l__ClientPlayerState__13 (copy), l__LocalPlayer__5 (copy), u71 (copy)
            if u55 then
                local u72 = Instance.new("Frame");
                u72.Name = "TradeRequestsToggle";
                u72.BackgroundColor3 = Color3.fromRGB(64, 64, 64);
                u72.BackgroundTransparency = 0.18;
                u72.BorderSizePixel = 0;
                u72.Size = UDim2.new(1, -8, 0, 58);
                u72.LayoutOrder = -1000;
                u72.Parent = u55;
                local v73 = Instance.new("UICorner");
                v73.CornerRadius = UDim.new(0, 8);
                v73.Parent = u72;
                local v74 = Instance.new("TextLabel");
                v74.Name = "Title";
                v74.BackgroundTransparency = 1;
                v74.Font = Enum.Font.GothamBold;
                v74.Text = "Incoming trades";
                v74.TextColor3 = Color3.new(1, 1, 1);
                v74.TextSize = 15;
                v74.TextXAlignment = Enum.TextXAlignment.Left;
                v74.Position = UDim2.new(0, 12, 0, 7);
                v74.Size = UDim2.new(1, -164, 0, 20);
                v74.Parent = u72;
                local u75 = Instance.new("TextLabel");
                u75.Name = "Detail";
                u75.BackgroundTransparency = 1;
                u75.Font = Enum.Font.Gotham;
                u75.TextSize = 11;
                u75.TextWrapped = true;
                u75.TextXAlignment = Enum.TextXAlignment.Left;
                u75.Position = UDim2.new(0, 12, 0, 29);
                u75.Size = UDim2.new(1, -164, 0, 20);
                u75.Parent = u72;
                local u76 = Instance.new("TextButton");
                u76.Name = "TradeRequestsButton";
                u76.AnchorPoint = Vector2.new(1, 0.5);
                u76.BorderSizePixel = 0;
                u76.Font = Enum.Font.GothamBlack;
                u76.TextColor3 = Color3.new(1, 1, 1);
                if u76 and u76:IsA("GuiButton") then
                    u76:SetAttribute("SfxKind", "Click");
                end;
                u76.TextScaled = true;
                u76.Position = UDim2.new(1, -10, 0.5, 0);
                u76.Size = UDim2.new(0, 136, 0, 34);
                u76.Parent = u72;
                if u76 and u76:IsA("GuiButton") then
                    u76:SetAttribute("SfxKind", "Click");
                end;
                local v77 = Instance.new("UICorner");
                v77.CornerRadius = UDim.new(0, 7);
                v77.Parent = u76;
                local v78 = Instance.new("UITextSizeConstraint");
                v78.MinTextSize = 8;
                v78.MaxTextSize = 12;
                v78.Parent = u76;
                local function u80(p79) --[[ Line: 427 ]]
                    -- upvalues: u61 (ref), u76 (copy), u75 (copy)
                    u61(u76, u75, p79);
                end;
                local v81;
                if u57 == nil then
                    local v82 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
                    local v83 = v82;
                    if v83 then
                        v83 = v82:GetAttribute("TradeRequestsEnabled");
                    end;
                    if v83 == nil then
                        v81 = true;
                    else
                        u57 = v83 ~= false;
                        v81 = u57;
                    end;
                else
                    v81 = u57;
                end;
                u61(u76, u75, v81);
                local u84 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
                if u84 then
                    local u85 = nil;
                    u85 = u84:GetAttributeChangedSignal("TradeRequestsEnabled"):Connect(function() --[[ Line: 435 ]]
                        -- upvalues: u72 (copy), u85 (ref), u84 (copy), u57 (ref), l__ClientPlayerState__13 (ref), l__LocalPlayer__5 (ref), u61 (ref), u76 (copy), u75 (copy)
                        if u72.Parent then
                            local v86 = u84:GetAttribute("TradeRequestsEnabled");
                            if v86 ~= nil then
                                u57 = v86 ~= false;
                            end;
                            local v87;
                            if u57 == nil then
                                local v88 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
                                if v88 then
                                    v88 = v88:GetAttribute("TradeRequestsEnabled");
                                end;
                                if v88 == nil then
                                    v87 = true;
                                else
                                    u57 = v88 ~= false;
                                    v87 = u57;
                                end;
                            else
                                v87 = u57;
                            end;
                            u61(u76, u75, v87);
                        else
                            u85:Disconnect();
                        end;
                    end);
                end;
                u76.MouseButton1Click:Connect(function() --[[ Line: 449 ]]
                    -- upvalues: u71 (ref), u57 (ref), l__ClientPlayerState__13 (ref), l__LocalPlayer__5 (ref), u80 (copy)
                    local v89 = u71;
                    local v90;
                    if u57 == nil then
                        local v91 = l__ClientPlayerState__13.GetProxy("Settings", l__LocalPlayer__5);
                        if v91 then
                            v91 = v91:GetAttribute("TradeRequestsEnabled");
                        end;
                        if v91 == nil then
                            v90 = true;
                        else
                            u57 = v91 ~= false;
                            v90 = u57;
                        end;
                    else
                        v90 = u57;
                    end;
                    v89(not v90, u80);
                end);
            end;
        end;
        local function u94() --[[ Line: 454 ]]
            -- upvalues: u55 (copy), u56 (copy)
            if u55 then
                for _, v93 in ipairs(u55:GetChildren()) do
                    if v93 == u56 then
                        if v93:IsA("GuiObject") then
                            v93.Visible = false;
                        end;
                    elseif v93:IsA("GuiObject") then
                        v93:Destroy();
                    end;
                end;
            end;
        end;
        local function u103() --[[ Line: 467 ]]
            local v95 = Instance.new("Frame");
            v95.Name = "Player";
            v95.BackgroundColor3 = Color3.fromRGB(77, 77, 77);
            v95.BackgroundTransparency = 0.2;
            v95.BorderSizePixel = 0;
            v95.Size = UDim2.new(1, -8, 0, 60);
            local v96 = Instance.new("UICorner");
            v96.CornerRadius = UDim.new(0, 8);
            v96.Parent = v95;
            local v97 = Instance.new("ImageLabel");
            v97.Name = "Avatar";
            v97.BackgroundTransparency = 1;
            v97.Position = UDim2.new(0, 8, 0.5, -22);
            v97.Size = UDim2.new(0, 44, 0, 44);
            v97.Parent = v95;
            local v98 = Instance.new("UICorner");
            v98.CornerRadius = UDim.new(0, 12);
            v98.Parent = v97;
            local v99 = Instance.new("TextLabel");
            v99.Name = "Displayname";
            v99.BackgroundTransparency = 1;
            v99.Font = Enum.Font.GothamBold;
            v99.TextColor3 = Color3.new(1, 1, 1);
            v99.TextSize = 16;
            v99.TextXAlignment = Enum.TextXAlignment.Left;
            v99.Position = UDim2.new(0, 60, 0, 10);
            v99.Size = UDim2.new(1, -170, 0, 22);
            v99.Parent = v95;
            local v100 = Instance.new("TextLabel");
            v100.Name = "PlayerName";
            v100.BackgroundTransparency = 1;
            v100.Font = Enum.Font.Gotham;
            v100.TextColor3 = Color3.fromRGB(160, 160, 160);
            v100.TextSize = 12;
            v100.TextXAlignment = Enum.TextXAlignment.Left;
            v100.Position = UDim2.new(0, 60, 0, 32);
            v100.Size = UDim2.new(1, -170, 0, 18);
            v100.Parent = v95;
            local v101 = Instance.new("TextButton");
            v101.Name = "TradeButton";
            v101.AnchorPoint = Vector2.new(1, 0.5);
            v101.BackgroundColor3 = Color3.fromRGB(0, 160, 255);
            v101.BorderSizePixel = 0;
            v101.Font = Enum.Font.GothamBlack;
            v101.TextColor3 = Color3.new(1, 1, 1);
            v101.TextSize = 13;
            v101.Position = UDim2.new(1, -8, 0.5, 0);
            v101.Size = UDim2.new(0, 90, 0, 32);
            v101.Parent = v95;
            local v102 = Instance.new("UICorner");
            v102.CornerRadius = UDim.new(0, 7);
            v102.Parent = v101;
            return v95;
        end;
        local function u105() --[[ Line: 522 ]]
            -- upvalues: u55 (copy)
            if u55 then
                local v104 = u55:FindFirstChildOfClass("UIListLayout");
                if not v104 then
                    v104 = Instance.new("UIListLayout");
                    v104.Parent = u55;
                end;
                v104.SortOrder = Enum.SortOrder.LayoutOrder;
                v104.Padding = UDim.new(0, 8);
                v104.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                u55.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                u55.CanvasSize = UDim2.new(0, 0, 0, 0);
            end;
        end;
        local function u123() --[[ Line: 550 ]]
            -- upvalues: l__Trade__17 (copy), u11 (ref), u55 (copy), u105 (copy), u94 (copy), u32 (copy), u92 (copy), u56 (copy), u103 (copy), u26 (copy), l__PromptHandler__12 (copy)
            if l__Trade__17.Visible then
                u11 = u11 + 1;
                local v106 = u11;
                local v107;
                if u55 then
                    v107 = (tonumber(u55:GetAttribute("TradeRefreshVersion")) or 0) + 1;
                    u55:SetAttribute("TradeRefreshVersion", v107);
                else
                    v107 = 0;
                end;
                u105();
                u94();
                local v108 = u32("GetPlayers", {}, true);
                if v106 == u11 and l__Trade__17.Visible then
                    if u55 and tonumber(u55:GetAttribute("TradeRefreshVersion")) ~= v107 then
                    else
                        u94();
                        u92();
                        local v109 = v108.Players or {};
                        if #v109 == 0 then
                        else
                            local v110 = {};
                            local v111 = 0;
                            for _, u112 in ipairs(v109) do
                                local v113 = tonumber(u112.UserId) or 0;
                                if v113 ~= 0 and not v110[v113] then
                                    v110[v113] = true;
                                    v111 = v111 + 1;
                                    local v114 = "Player_" .. tostring(v113);
                                    local v115 = u55:FindFirstChild(v114);
                                    if v115 and v115:IsA("GuiObject") then
                                        v115:Destroy();
                                    end;
                                    local v116 = u56 and u56:Clone() or u103();
                                    v116.Name = v114;
                                    v116.Visible = true;
                                    v116.LayoutOrder = v111;
                                    v116.Parent = u55;
                                    local v117;
                                    if v116 then
                                        v117 = v116:FindFirstChild("Displayname", true);
                                    else
                                        v117 = v116;
                                    end;
                                    if not (v117 and v117:IsA("TextLabel")) then
                                        v117 = nil;
                                    end;
                                    if v117 then
                                        v117.Text = tostring(u112.DisplayName or (u112.Name or "Player"));
                                    end;
                                    local v118;
                                    if v116 then
                                        v118 = v116:FindFirstChild("PlayerName", true);
                                    else
                                        v118 = v116;
                                    end;
                                    if not (v118 and v118:IsA("TextLabel")) then
                                        v118 = nil;
                                    end;
                                    if v118 then
                                        v118.Text = "@" .. tostring(u112.Name or "Player");
                                    end;
                                    local v119 = v116:FindFirstChild("Avatar", true);
                                    if v119 and v119:IsA("ImageLabel") then
                                        v119.Image = "rbxthumb://type=AvatarHeadShot&id=" .. tostring(u112.UserId) .. "&w=150&h=150";
                                    end;
                                    if v116 then
                                        v116 = v116:FindFirstChild("TradeButton", true);
                                    end;
                                    if not (v116 and v116:IsA("TextButton")) then
                                        v116 = nil;
                                    end;
                                    if v116 then
                                        local u120 = tostring(u112.Status or "Available");
                                        v116.Active = u120 == "Available";
                                        v116.AutoButtonColor = u120 == "Available";
                                        if u120 == "Self" then
                                            v116.Text = "YOU";
                                            v116.BackgroundColor3 = Color3.fromRGB(75, 75, 75);
                                        elseif u120 == "Pending" then
                                            v116.Text = "PENDING";
                                            v116.BackgroundColor3 = Color3.fromRGB(215, 160, 45);
                                        elseif u120 == "Busy" then
                                            v116.Text = "BUSY";
                                            v116.BackgroundColor3 = Color3.fromRGB(95, 95, 95);
                                        elseif u120 == "Disabled" then
                                            v116.Text = "OFF";
                                            v116.BackgroundColor3 = Color3.fromRGB(95, 95, 95);
                                        else
                                            v116.Text = "TRADE";
                                            v116.BackgroundColor3 = Color3.fromRGB(0, 160, 255);
                                        end;
                                        v116.MouseButton1Click:Connect(function() --[[ Line: 628 ]]
                                            -- upvalues: u120 (copy), u32 (ref), u112 (copy), u26 (ref), l__PromptHandler__12 (ref)
                                            if u120 == "Available" then
                                                local v121 = u32("SendRequest", {
                                                    TargetUserId = u112.UserId
                                                });
                                                if v121.Ok then
                                                    u26("Request");
                                                    local v122 = v121.Message or "Trade request sent.";
                                                    if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                                                        l__PromptHandler__12.ShowNotification("Info", v122 or "");
                                                    end;
                                                else
                                                    u26("Error");
                                                end;
                                            end;
                                        end);
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        local function v126() --[[ Line: 649 ]]
            -- upvalues: u26 (copy), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u6 (ref), u7 (ref), u52 (copy), l__Gui__15 (copy)
            u26("Close");
            l__Trade__17.Visible = false;
            local v124 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
            u52.Visible = v124;
            if v124 then
                local v125 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                if v125 and v125:IsA("GuiObject") then
                    v125.Visible = false;
                end;
            end;
        end;
        if l__Menu__16 then
            l__Menu__16.MouseButton1Click:Connect(function() --[[ Line: 656 ]]
                -- upvalues: l__Trade__17 (copy), u26 (copy), l__ActiveTradeSession__18 (copy), u6 (ref), u7 (ref), u52 (copy), l__Gui__15 (copy), u123 (copy)
                if l__Trade__17.Visible then
                    u26("Close");
                    l__Trade__17.Visible = false;
                    local v127 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
                    u52.Visible = v127;
                    if v127 then
                        local v128 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                        if v128 and v128:IsA("GuiObject") then
                            v128.Visible = false;
                        end;
                    end;
                else
                    u26("Open");
                    l__Trade__17.Visible = true;
                    local v129 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
                    u52.Visible = v129;
                    if v129 then
                        local v130 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                        if v130 and v130:IsA("GuiObject") then
                            v130.Visible = false;
                        end;
                    end;
                    u123();
                end;
            end);
        end;
        if v54 and v54:IsA("TextButton") then
            if v54 and v54:IsA("GuiButton") then
                v54:SetAttribute("SfxKind", "Close");
            end;
            v54.MouseButton1Click:Connect(v126);
        end;
        local function u133(p131) --[[ Line: 670 ]]
            -- upvalues: l__LocalPlayer__5 (copy)
            if not p131 or type(p131.Players) ~= "table" then
                return nil;
            end;
            for _, v132 in ipairs(p131.Players) do
                if tonumber(v132.UserId) ~= l__LocalPlayer__5.UserId then
                    return v132;
                end;
            end;
            return nil;
        end;
        local function u136(p134, p135) --[[ Line: 680 ]]
            return p134 and type(p134.Offers) == "table" and (p134.Offers[tostring(p135)] or {}) or {};
        end;
        local function u144(u137, p138) --[[ Line: 701 ]]
            -- upvalues: u10 (ref), u9 (ref)
            if u137 and p138 then
                local v139 = tonumber(p138.CountdownSeconds) or 5;
                local v140 = math.floor(v139);
                local v141 = math.max(1, v140);
                local u142 = tostring(p138.Id or "") .. ":" .. tostring(p138.State) .. ":" .. tostring(v141);
                if u10 == u142 then
                else
                    u10 = nil;
                    if u9 then
                        task.cancel(u9);
                        u9 = nil;
                    end;
                    u10 = u142;
                    local u143 = v141;
                    u137.Text = "TRADE IN: " .. tostring(u143);
                    u9 = task.spawn(function() --[[ Line: 712 ]]
                        -- upvalues: u143 (ref), u10 (ref), u142 (copy), u137 (copy)
                        while u143 > 1 and u10 == u142 do
                            task.wait(1);
                            u143 = u143 - 1;
                            if u10 ~= u142 then
                                return;
                            end;
                            if u137.Parent then
                                u137.Text = "TRADE IN: " .. tostring(u143);
                            end;
                        end;
                    end);
                end;
            end;
        end;
        local function u148(p145) --[[ Line: 726 ]]
            if p145 then
                for _, v146 in ipairs(p145:GetChildren()) do
                    if v146:IsA("GuiObject") then
                        v146:Destroy();
                    end;
                end;
                local v147 = p145:FindFirstChildOfClass("UIListLayout");
                if not v147 then
                    v147 = Instance.new("UIListLayout");
                    v147.Parent = p145;
                end;
                v147.FillDirection = Enum.FillDirection.Horizontal;
                v147.SortOrder = Enum.SortOrder.LayoutOrder;
                v147.Padding = UDim.new(0, 6);
                v147.VerticalAlignment = Enum.VerticalAlignment.Center;
                p145.AutomaticCanvasSize = Enum.AutomaticSize.X;
                p145.CanvasSize = UDim2.new(0, 0, 0, 0);
                p145.ScrollingDirection = Enum.ScrollingDirection.X;
                p145.ScrollBarThickness = 5;
                p145.BackgroundTransparency = math.max(p145.BackgroundTransparency, 0.28);
            end;
        end;
        local function u156(p149, p150, p151, p152) --[[ Line: 749 ]]
            -- upvalues: u39 (copy)
            local v153 = Instance.new("TextButton");
            v153.Name = p150;
            v153.BackgroundColor3 = p151 or u39;
            v153.BackgroundTransparency = 0.15;
            v153.BorderSizePixel = 0;
            v153.AutoButtonColor = false;
            v153.Text = "";
            v153.Size = UDim2.new(0.118000001, 0, 1, 0);
            v153.LayoutOrder = p152 or 0;
            v153.ZIndex = 341;
            v153.Parent = p149;
            local v154 = Instance.new("UICorner");
            v154.CornerRadius = UDim.new(0, 7);
            v154.Parent = v153;
            local v155 = Instance.new("UIAspectRatioConstraint");
            v155.AspectRatio = 1;
            v155.Parent = v153;
            return v153;
        end;
        local function u161(p157) --[[ Line: 790 ]]
            local v158 = tonumber(p157) or 0;
            local v159 = math.floor(v158);
            local v160 = math.max(0, v159);
            if v160 >= 1000000000 then
                return string.format("%.1fB", v160 / 1000000000):gsub("%.0", "");
            elseif v160 >= 1000000 then
                return string.format("%.1fM", v160 / 1000000):gsub("%.0", "");
            elseif v160 >= 1000 then
                return string.format("%.1fK", v160 / 1000):gsub("%.0", "");
            else
                return tostring(v160);
            end;
        end;
        local function u166(p162) --[[ Line: 802 ]]
            local v163 = tonumber(p162) or 0;
            local v164 = math.floor(v163);
            local v165 = math.max(0, v164);
            return tostring(v165):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
        end;
        local function u172(u167, p168) --[[ Line: 807 ]]
            -- upvalues: l__GameDatabase__14 (copy), u3 (ref), u166 (copy), u45 (copy), u44 (copy)
            if not p168 then
                local l__Items__20 = l__GameDatabase__14.Items;
                if type(l__Items__20) == "table" then
                    p168 = l__Items__20[tostring(u167 or "")];
                    if type(p168) ~= "table" then
                        p168 = nil;
                    end;
                else
                    p168 = nil;
                end;
            end;
            if type(p168) ~= "table" then
                return nil;
            end;
            if u3 and p168.TotalStats == true then
                local v169, v170 = pcall(function() --[[ Line: 814 ]]
                    -- upvalues: u3 (ref), u167 (copy)
                    return u3.GetItemValue((tostring(u167 or "")));
                end);
                if v169 and (tonumber(v170) and tonumber(v170) > 0) then
                    return {
                        Kind = "Dynamic",
                        Text = u166(v170),
                        Color = u45
                    };
                end;
            end;
            local v171 = tonumber(p168.Price);
            return v171 and v171 > 0 and {
                Kind = "Static",
                Text = u166(v171),
                Color = u44
            } or nil;
        end;
        local function u181(p173, p174, p175, p176, p177, p178) --[[ Line: 837 ]]
            -- upvalues: u44 (copy)
            if not p174 or (not p174.Text or p174.Text == "") then
                return nil;
            end;
            local v179 = Instance.new("TextLabel");
            v179.Name = "Price";
            v179.BackgroundColor3 = Color3.fromRGB(12, 12, 14);
            v179.BackgroundTransparency = 0.08;
            v179.BorderSizePixel = 0;
            v179.Font = Enum.Font.GothamBlack;
            v179.Text = tostring(p174.Text);
            v179.TextColor3 = p174.Color or u44;
            v179.TextSize = p178 or 9;
            v179.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
            v179.TextStrokeTransparency = 0.35;
            v179.TextTruncate = Enum.TextTruncate.AtEnd;
            v179.TextXAlignment = Enum.TextXAlignment.Center;
            v179.Position = p176;
            v179.Size = p177;
            v179.ZIndex = p175;
            v179.Parent = p173;
            local v180 = Instance.new("UICorner");
            v180.CornerRadius = UDim.new(0, 4);
            v180.Parent = v179;
            return v179;
        end;
        local function u195(p182, p183, p184, p185, p186, p187, p188) --[[ Line: 862 ]]
            local v189 = Instance.new("Frame");
            v189.Name = "IconHolder";
            v189.AnchorPoint = Vector2.new(0.5, 0);
            v189.BackgroundColor3 = Color3.fromRGB(36, 36, 40);
            v189.BackgroundTransparency = 0.05;
            v189.BorderSizePixel = 0;
            v189.Position = UDim2.new(0.5, 0, 0, p188 or 8);
            v189.Size = UDim2.new(0, p187, 0, p187);
            v189.ZIndex = p186;
            v189.Parent = p182;
            local v190 = Instance.new("UICorner");
            v190.CornerRadius = UDim.new(0, 8);
            v190.Parent = v189;
            if p185 and p185 ~= "" then
                local v191 = Instance.new("ImageLabel");
                v191.Name = "Icon";
                v191.BackgroundTransparency = 1;
                v191.Image = p185;
                v191.ScaleType = Enum.ScaleType.Fit;
                v191.Size = UDim2.new(1, -4, 1, -4);
                v191.Position = UDim2.new(0, 2, 0, 2);
                v191.ZIndex = p186 + 1;
                v191.Parent = v189;
                return v189;
            end;
            local v192 = Instance.new("TextLabel");
            v192.Name = "Fallback";
            v192.BackgroundTransparency = 1;
            v192.Font = Enum.Font.GothamBlack;
            local v193 = tostring(p184 or (p183 or "?")):match("%w") or "?";
            v192.Text = string.upper(v193);
            v192.TextColor3 = Color3.fromRGB(235, 245, 255);
            local v194 = math.floor(p187 * 0.45);
            v192.TextSize = math.max(18, v194);
            v192.Size = UDim2.new(1, 0, 1, 0);
            v192.ZIndex = p186 + 1;
            v192.Parent = v189;
            return v189;
        end;
        local function u213(p196, u197, p198, p199) --[[ Line: 901 ]]
            -- upvalues: l__GameDatabase__14 (copy), u156 (copy), u39 (copy), l__UserInputService__4 (copy), l__Gui__15 (copy), u195 (copy), u172 (copy), u181 (copy), u161 (copy), u32 (copy), u26 (copy)
            local v200 = tostring(u197.Name or (u197.ItemKey or "Item"));
            local v201 = tostring(u197.ImageId or "");
            if v201 == "" then
                local l__ItemKey__21 = u197.ItemKey;
                local v202 = nil;
                if not v202 then
                    local l__Items__22 = l__GameDatabase__14.Items;
                    if type(l__Items__22) == "table" then
                        v202 = l__Items__22[tostring(l__ItemKey__21 or "")];
                        if type(v202) ~= "table" then
                            v202 = nil;
                        end;
                    else
                        v202 = nil;
                    end;
                end;
                local v203;
                if v202 then
                    v203 = v202.ImageId or (v202.Image or v202.Icon or (v202.Thumbnail or nil));
                else
                    v203 = nil;
                end;
                v201 = v203 and tostring(v203) or "";
            end;
            local v204 = u156(p196, "Offer_" .. tostring(u197.SlotId or u197.ItemKey), u39, p199);
            v204.AutoButtonColor = p198 == true;
            v204.Font = Enum.Font.GothamBold;
            v204.Text = "";
            local v205 = p198 and Color3.fromRGB(120, 190, 255) or Color3.fromRGB(255, 255, 255);
            local v206 = Instance.new("UIStroke");
            v206.Color = v205 or Color3.fromRGB(255, 255, 255);
            v206.Transparency = p198 and 0.45 or 0.82 or 0.8;
            v206.Parent = v204;
            local v207 = not l__UserInputService__4.TouchEnabled;
            if v207 then
                v207 = l__Gui__15.AbsoluteSize.X > 700;
            end;
            u195(v204, u197.ItemKey, v200, v201, 342, v207 and 88 or 42, v207 and 14 or 16);
            local v208 = u172(u197.ItemKey);
            if v208 then
                u181(v204, v208, 345, v207 and UDim2.new(0, 5, 1, -41) or UDim2.new(0, 3, 1, -16), v207 and UDim2.new(1, -10, 0, 17) or UDim2.new(1, -6, 0, 14), v207 and 11 or 8);
            end;
            local v209 = Instance.new("TextLabel");
            v209.Name = "Amount";
            v209.AnchorPoint = Vector2.new(1, 0);
            v209.BackgroundColor3 = Color3.fromRGB(0, 133, 220);
            v209.BackgroundTransparency = 0.05;
            v209.BorderSizePixel = 0;
            v209.Font = Enum.Font.GothamBlack;
            v209.Text = "x" .. u161(u197.Amount or 1);
            v209.TextColor3 = Color3.new(1, 1, 1);
            v209.TextSize = v207 and 10 or 8;
            v209.Position = v207 and UDim2.new(1, -4, 0, 4) or UDim2.new(1, -3, 0, 1);
            v209.Size = v207 and UDim2.new(0, 34, 0, 16) or UDim2.new(0, 30, 0, 13);
            v209.ZIndex = 344;
            v209.Parent = v204;
            local v210 = Instance.new("UICorner");
            v210.CornerRadius = UDim.new(0, v207 and 5 or 4 or 6);
            v210.Parent = v209;
            local v211 = Instance.new("TextLabel");
            v211.Name = "Name";
            v211.BackgroundTransparency = 1;
            v211.Font = Enum.Font.GothamBold;
            v211.Text = v200;
            v211.TextColor3 = Color3.new(1, 1, 1);
            v211.TextSize = v207 and 10 or 7;
            v211.TextTruncate = Enum.TextTruncate.AtEnd;
            v211.TextXAlignment = Enum.TextXAlignment.Center;
            v211.Position = v207 and UDim2.new(0, 5, 1, -22) or UDim2.new(0, 4, 1, v208 and -29 or -17);
            v211.Size = v207 and UDim2.new(1, -10, 0, 18) or UDim2.new(1, -8, 0, v208 and 11 or 14);
            v211.Visible = v207 or v208 == nil;
            v211.ZIndex = 343;
            v211.Parent = v204;
            if p198 then
                if v204 and v204:IsA("GuiButton") then
                    v204:SetAttribute("SfxKind", "Unequip");
                end;
                v204.MouseButton1Click:Connect(function() --[[ Line: 959 ]]
                    -- upvalues: u32 (ref), u197 (copy), u26 (ref)
                    local v212 = u32("RemoveItem", {
                        SlotId = u197.SlotId
                    });
                    if v212 and v212.Ok then
                        u26("Remove");
                    else
                        u26("Error");
                    end;
                end);
            end;
        end;
        local function u219(p214, p215) --[[ Line: 970 ]]
            -- upvalues: u156 (copy), u5 (ref), u8 (ref)
            local v216 = u156(p214, "AddButton", Color3.fromRGB(18, 18, 18), p215);
            v216.AutoButtonColor = true;
            v216.Font = Enum.Font.GothamBlack;
            v216.Text = "+";
            v216.TextColor3 = Color3.new(1, 1, 1);
            v216.TextScaled = true;
            if v216 and v216:IsA("GuiButton") then
                v216:SetAttribute("SfxKind", "Open");
            end;
            local v217 = Color3.fromRGB(120, 190, 255);
            local v218 = Instance.new("UIStroke");
            v218.Color = v217 or Color3.fromRGB(255, 255, 255);
            v218.Transparency = 0.5;
            v218.Parent = v216;
            v216.MouseButton1Click:Connect(function() --[[ Line: 979 ]]
                -- upvalues: u5 (ref), u8 (ref)
                if u5 and u8 then
                    u8();
                end;
            end);
        end;
        local function u222() --[[ Line: 992 ]]
            -- upvalues: u6 (ref), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u7 (ref), u52 (copy), l__Gui__15 (copy)
            if u6 then
                u6:Destroy();
                u6 = nil;
            end;
            local v220 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
            u52.Visible = v220;
            if v220 then
                local v221 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                if v221 and v221:IsA("GuiObject") then
                    v221.Visible = false;
                end;
            end;
        end;
        local u223 = {
            {
                Id = "All",
                Label = "All"
            },
            {
                Id = "Skin",
                Label = "Skins"
            },
            {
                Id = "Accessory",
                Label = "Accessories"
            },
            {
                Id = "Case",
                Label = "Cases"
            },
            {
                Id = "Ability",
                Label = "Abilities"
            }
        };
        local function u227() --[[ Line: 1017 ]]
            -- upvalues: u5 (ref), u136 (copy), l__LocalPlayer__5 (copy)
            local v224 = {};
            if not u5 then
                return v224;
            end;
            for _, v225 in ipairs((u136(u5, l__LocalPlayer__5.UserId))) do
                local v226 = tostring(v225.ItemKey or "");
                if v226 ~= "" then
                    v224[v226] = (v224[v226] or 0) + (tonumber(v225.Amount) or 0);
                end;
            end;
            return v224;
        end;
        local function u245() --[[ Line: 1031 ]]
            -- upvalues: l__ClientPlayerState__13 (copy), u227 (copy), l__GameDatabase__14 (copy)
            local v228 = l__ClientPlayerState__13.WaitForProxy("Inventory", nil, 5);
            local v229 = {};
            if not v228 then
                return v229;
            end;
            local v230 = u227();
            for _, v231 in ipairs(v228:GetChildren()) do
                local l__Name__23 = v231.Name;
                local l__Items__24 = l__GameDatabase__14.Items;
                local v232;
                if type(l__Items__24) == "table" then
                    v232 = l__Items__24[tostring(l__Name__23 or "")];
                    if type(v232) ~= "table" then
                        v232 = nil;
                    end;
                else
                    v232 = nil;
                end;
                if v232 and (v232.TradeLocked ~= true and (v232.SubscriptionBound == nil and v231:GetAttribute("TradeLocked") ~= true)) then
                    local v233 = v231:GetAttribute("Amount");
                    local v234;
                    if v233 == nil then
                        v234 = 1;
                    else
                        local v235 = tonumber(v233) or 0;
                        local v236 = math.floor(v235);
                        v234 = math.max(0, v236);
                    end;
                    local v237 = math.max(0, v234 - (v230[l__Name__23] or 0));
                    if v237 > 0 then
                        local v238 = tostring(v232.DisplayName or (v232.Name or l__Name__23));
                        local v239 = tostring(v232.Type or "Other");
                        local v240 = {
                            ItemKey = l__Name__23,
                            Name = v238,
                            Amount = v237,
                            OwnedAmount = v234,
                            Type = v239
                        };
                        local v241 = tostring(v239 or "");
                        v240.Category = v241 == "Skin" and "Skin" or (v241 == "Accessory" and "Accessory" or (v241 == "Case" and "Case" or (v241 == "Ability" and "Ability" or "All")));
                        if not v232 then
                            local l__Items__25 = l__GameDatabase__14.Items;
                            if type(l__Items__25) == "table" then
                                v232 = l__Items__25[tostring(l__Name__23 or "")];
                                if type(v232) ~= "table" then
                                    v232 = nil;
                                end;
                            else
                                v232 = nil;
                            end;
                        end;
                        local v242;
                        if v232 then
                            v242 = v232.ImageId or (v232.Image or v232.Icon or (v232.Thumbnail or nil));
                        else
                            v242 = nil;
                        end;
                        v240.ImageId = v242 and tostring(v242) or "";
                        v240.SearchText = string.lower(v238 .. " " .. l__Name__23 .. " " .. v239);
                        table.insert(v229, v240);
                    end;
                end;
            end;
            table.sort(v229, function(p243, p244) --[[ Line: 1063 ]]
                if p243.Category == p244.Category then
                    return p243.Name < p244.Name;
                else
                    return p243.Category < p244.Category;
                end;
            end);
            return v229;
        end;
        local function u249(p246, p247) --[[ Line: 1072 ]]
            -- upvalues: u32 (copy), u26 (copy), l__PromptHandler__12 (copy)
            local v248 = u32("AddItem", {
                ItemKey = p246,
                Amount = p247
            });
            if v248 and v248.Ok then
                u26("Add");
                if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                    l__PromptHandler__12.ShowNotification("Success", "Added to trade.");
                    return v248;
                end;
            else
                u26("Error");
            end;
            return v248;
        end;
        local function u252() --[[ Line: 1083 ]]
            -- upvalues: u7 (ref), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u6 (ref), u52 (copy), l__Gui__15 (copy)
            if u7 then
                u7:Destroy();
                u7 = nil;
            end;
            local v250 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
            u52.Visible = v250;
            if v250 then
                local v251 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                if v251 and v251:IsA("GuiObject") then
                    v251.Visible = false;
                end;
            end;
        end;
        local function u298(u253) --[[ Line: 1091 ]]
            -- upvalues: u249 (copy), u7 (ref), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u6 (ref), u52 (copy), l__Gui__15 (copy), l__UserInputService__4 (copy), u38 (copy), l__PromptHandler__12 (copy), u43 (copy), u37 (copy), u252 (copy)
            local v254 = tonumber(u253.Amount) or 1;
            local v255 = math.floor(v254);
            local u256 = math.max(1, v255);
            if u256 <= 1 then
                u249(u253.ItemKey, 1);
            else
                if u7 then
                    u7:Destroy();
                    u7 = nil;
                end;
                local v257 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                u52.Visible = v257;
                if v257 then
                    local v258 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                    if v258 and v258:IsA("GuiObject") then
                        v258.Visible = false;
                    end;
                end;
                local v259 = l__UserInputService__4.TouchEnabled or l__Gui__15.AbsoluteSize.X <= 700;
                local u260 = Instance.new("TextButton");
                u260.Name = "TradeAmountPrompt";
                u260.Active = true;
                u260.AutoButtonColor = false;
                u260.BackgroundTransparency = 1;
                u260.BorderSizePixel = 0;
                u260.Size = UDim2.new(1, 0, 1, 0);
                u260.Text = "";
                u260.ZIndex = 440;
                u260.Parent = l__Gui__15;
                pcall(function() --[[ Line: 1111 ]]
                    -- upvalues: u260 (copy)
                    u260.Modal = true;
                end);
                u7 = u260;
                local v261 = Instance.new("Frame");
                v261.Name = "Panel";
                v261.AnchorPoint = Vector2.new(0.5, 0.5);
                v261.BackgroundColor3 = Color3.fromRGB(38, 38, 42);
                v261.BackgroundTransparency = 0.04;
                v261.BorderSizePixel = 0;
                v261.Position = UDim2.new(0.5, 0, 0.5, 0);
                v261.Size = UDim2.new(0, v259 and 280 or 340, 0, v259 and 166 or 178);
                v261.ZIndex = 441;
                v261.Parent = u260;
                local v262 = Instance.new("UICorner");
                v262.CornerRadius = UDim.new(0, 8);
                v262.Parent = v261;
                local v263 = Color3.fromRGB(130, 130, 135);
                local v264 = Instance.new("UIStroke");
                v264.Color = v263 or Color3.fromRGB(255, 255, 255);
                v264.Transparency = 0.35;
                v264.Parent = v261;
                local v265 = Instance.new("TextLabel");
                v265.BackgroundTransparency = 1;
                v265.Font = Enum.Font.GothamBlack;
                v265.Text = "Amount to add";
                v265.TextColor3 = Color3.fromRGB(255, 255, 255);
                v265.TextSize = v259 and 15 or 17;
                v265.TextXAlignment = Enum.TextXAlignment.Left;
                v265.Position = UDim2.new(0, 16, 0, 10);
                v265.Size = UDim2.new(1, -46, 0, 22);
                v265.ZIndex = 442;
                v265.Parent = v261;
                local v266 = Instance.new("TextButton");
                v266.Name = "Close";
                v266.AnchorPoint = Vector2.new(1, 0);
                v266.BackgroundColor3 = u38;
                v266.BorderSizePixel = 0;
                v266.Font = Enum.Font.GothamBlack;
                v266.Text = "X";
                v266.TextColor3 = Color3.new(1, 1, 1);
                v266.TextSize = v259 and 12 or 14;
                v266.Position = UDim2.new(1, -10, 0, 9);
                v266.Size = UDim2.new(0, v259 and 25 or 28, 0, v259 and 25 or 28);
                v266.ZIndex = 443;
                v266.Parent = v261;
                local v267 = Instance.new("UICorner");
                v267.CornerRadius = UDim.new(0, 6);
                v267.Parent = v266;
                local u268 = Instance.new("TextBox");
                u268.Name = "AmountInput";
                u268.BackgroundColor3 = Color3.fromRGB(25, 25, 28);
                u268.BackgroundTransparency = 0.02;
                u268.BorderSizePixel = 0;
                u268.ClearTextOnFocus = false;
                u268.Font = Enum.Font.GothamBold;
                u268.PlaceholderText = "1-" .. tostring(u256);
                u268.PlaceholderColor3 = Color3.fromRGB(160, 160, 165);
                u268.Text = "1";
                u268.TextColor3 = Color3.fromRGB(255, 255, 255);
                u268.TextSize = v259 and 14 or 16;
                u268.TextXAlignment = Enum.TextXAlignment.Center;
                u268.Position = UDim2.new(0, 16, 0, v259 and 42 or 46);
                u268.Size = UDim2.new(1, -32, 0, v259 and 34 or 38);
                u268.ZIndex = 442;
                u268.Parent = v261;
                local v269 = Instance.new("UICorner");
                v269.CornerRadius = UDim.new(0, 7);
                v269.Parent = u268;
                local v270 = Instance.new("Frame");
                v270.BackgroundTransparency = 1;
                v270.Position = UDim2.new(0, 16, 0, v259 and 84 or 92);
                v270.Size = UDim2.new(1, -32, 0, v259 and 28 or 32);
                v270.ZIndex = 442;
                v270.Parent = v261;
                local v271 = Instance.new("UIListLayout");
                v271.FillDirection = Enum.FillDirection.Horizontal;
                v271.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                v271.SortOrder = Enum.SortOrder.LayoutOrder;
                v271.Padding = UDim.new(0, 8);
                v271.Parent = v270;
                for v272, u273 in ipairs({ 1, 5, 25 }) do
                    local v274 = u273 <= u256;
                    local v275 = Instance.new("TextButton");
                    v275.Name = "Quick" .. tostring(u273);
                    v275.BackgroundColor3 = v274 and u43 or Color3.fromRGB(72, 72, 76);
                    v275.BackgroundTransparency = v274 and 0.02 or 0.25;
                    v275.BorderSizePixel = 0;
                    v275.AutoButtonColor = v274;
                    v275.Active = v274;
                    v275.Font = Enum.Font.GothamBlack;
                    v275.Text = tostring(u273);
                    v275.TextColor3 = v274 and Color3.new(1, 1, 1) or Color3.fromRGB(170, 170, 175);
                    v275.TextSize = v259 and 13 or 15;
                    v275.Size = UDim2.new(0, v259 and 54 or 70, 1, 0);
                    v275.LayoutOrder = v272;
                    v275.ZIndex = 443;
                    v275.Parent = v270;
                    if v275 and v275:IsA("GuiButton") then
                        v275:SetAttribute("SfxKind", "Equip");
                    end;
                    local v276 = Instance.new("UICorner");
                    v276.CornerRadius = UDim.new(0, 6);
                    v276.Parent = v275;
                    if v274 then
                        v275.MouseButton1Click:Connect(function() --[[ Line: 1219 ]]
                            -- upvalues: u273 (copy), u256 (copy), l__PromptHandler__12 (ref), u7 (ref), l__Trade__17 (ref), l__ActiveTradeSession__18 (ref), u6 (ref), u52 (ref), l__Gui__15 (ref), u249 (ref), u253 (copy)
                            local v277 = tonumber(u273) or 0;
                            local v278 = math.floor(v277);
                            if v278 <= 0 or u256 < v278 then
                                if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                                    l__PromptHandler__12.ShowNotification("Error", "Invalid amount.");
                                end;
                            else
                                if u7 then
                                    u7:Destroy();
                                    u7 = nil;
                                end;
                                local v279 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                                u52.Visible = v279;
                                if v279 then
                                    local v280 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                                    if v280 and v280:IsA("GuiObject") then
                                        v280.Visible = false;
                                    end;
                                end;
                                u249(u253.ItemKey, v278);
                            end;
                        end);
                    end;
                end;
                local v281 = Instance.new("Frame");
                v281.BackgroundTransparency = 1;
                v281.Position = UDim2.new(0, 16, 1, v259 and -42 or -46);
                v281.Size = UDim2.new(1, -32, 0, v259 and 30 or 34);
                v281.ZIndex = 442;
                v281.Parent = v261;
                local v282 = Instance.new("UIListLayout");
                v282.FillDirection = Enum.FillDirection.Horizontal;
                v282.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                v282.SortOrder = Enum.SortOrder.LayoutOrder;
                v282.Padding = UDim.new(0, 10);
                v282.Parent = v281;
                local v283 = Instance.new("TextButton");
                v283.BackgroundColor3 = Color3.fromRGB(95, 105, 112);
                v283.BorderSizePixel = 0;
                v283.Font = Enum.Font.GothamBlack;
                v283.Text = "Cancel";
                v283.TextColor3 = Color3.new(1, 1, 1);
                v283.TextSize = v259 and 12 or 14;
                v283.Size = UDim2.new(0, v259 and 102 or 128, 1, 0);
                v283.ZIndex = 443;
                v283.Parent = v281;
                if v283 and v283:IsA("GuiButton") then
                    v283:SetAttribute("SfxKind", "Close");
                end;
                local v284 = Instance.new("UICorner");
                v284.CornerRadius = UDim.new(0, 7);
                v284.Parent = v283;
                local v285 = Instance.new("TextButton");
                v285.BackgroundColor3 = u37;
                v285.BorderSizePixel = 0;
                v285.Font = Enum.Font.GothamBlack;
                v285.Text = "Add";
                v285.TextColor3 = Color3.new(1, 1, 1);
                v285.TextSize = v259 and 12 or 14;
                v285.Size = UDim2.new(0, v259 and 102 or 128, 1, 0);
                v285.ZIndex = 443;
                v285.Parent = v281;
                if v285 and v285:IsA("GuiButton") then
                    v285:SetAttribute("SfxKind", "Equip");
                end;
                local v286 = Instance.new("UICorner");
                v286.CornerRadius = UDim.new(0, 7);
                v286.Parent = v285;
                if v266 and v266:IsA("GuiButton") then
                    v266:SetAttribute("SfxKind", "Close");
                end;
                v266.MouseButton1Click:Connect(u252);
                v283.MouseButton1Click:Connect(u252);
                v285.MouseButton1Click:Connect(function() --[[ Line: 1268 ]]
                    -- upvalues: u268 (copy), u256 (copy), l__PromptHandler__12 (ref), u7 (ref), l__Trade__17 (ref), l__ActiveTradeSession__18 (ref), u6 (ref), u52 (ref), l__Gui__15 (ref), u249 (ref), u253 (copy)
                    local v287 = tonumber(u268.Text) or 0;
                    local v288 = math.floor(v287);
                    if v288 <= 0 or u256 < v288 then
                        if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                            l__PromptHandler__12.ShowNotification("Error", "Invalid amount.");
                        end;
                    else
                        if u7 then
                            u7:Destroy();
                            u7 = nil;
                        end;
                        local v289 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                        u52.Visible = v289;
                        if v289 then
                            local v290 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                            if v290 and v290:IsA("GuiObject") then
                                v290.Visible = false;
                            end;
                        end;
                        u249(u253.ItemKey, v288);
                    end;
                end);
                u268.FocusLost:Connect(function(p291) --[[ Line: 1271 ]]
                    -- upvalues: u268 (copy), u256 (copy), l__PromptHandler__12 (ref), u7 (ref), l__Trade__17 (ref), l__ActiveTradeSession__18 (ref), u6 (ref), u52 (ref), l__Gui__15 (ref), u249 (ref), u253 (copy)
                    if p291 then
                        local v292 = tonumber(u268.Text) or 0;
                        local v293 = math.floor(v292);
                        if v293 <= 0 or u256 < v293 then
                            if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                                l__PromptHandler__12.ShowNotification("Error", "Invalid amount.");
                            end;
                        else
                            if u7 then
                                u7:Destroy();
                                u7 = nil;
                            end;
                            local v294 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                            u52.Visible = v294;
                            if v294 then
                                local v295 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                                if v295 and v295:IsA("GuiObject") then
                                    v295.Visible = false;
                                end;
                            end;
                            u249(u253.ItemKey, v293);
                        end;
                    end;
                end);
                local v296 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
                u52.Visible = v296;
                if v296 then
                    local v297 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                    if v297 and v297:IsA("GuiObject") then
                        v297.Visible = false;
                    end;
                end;
            end;
        end;
        local function _() --[[ Line: 1279 ]]
            -- upvalues: u6 (ref), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u7 (ref), u52 (copy), l__Gui__15 (copy), u5 (ref), u41 (copy), u38 (copy), u222 (copy), u42 (copy), u245 (copy), u223 (copy), u43 (copy), u195 (copy), u161 (copy), u172 (copy), u181 (copy), u298 (copy)
            if u6 then
                u6:Destroy();
                u6 = nil;
            end;
            local v299 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
            u52.Visible = v299;
            if v299 then
                local v300 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                if v300 and v300:IsA("GuiObject") then
                    v300.Visible = false;
                end;
            end;
            if u5 then
                local u301 = Instance.new("TextButton");
                u301.Name = "TradeInventoryPicker";
                u301.Active = true;
                u301.AutoButtonColor = false;
                u301.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
                u301.BackgroundTransparency = 1;
                u301.BorderSizePixel = 0;
                u301.Size = UDim2.new(1, 0, 1, 0);
                u301.Text = "";
                u301.ZIndex = 420;
                pcall(function() --[[ Line: 1293 ]]
                    -- upvalues: u301 (copy)
                    u301.Modal = true;
                end);
                u301.Parent = l__Gui__15;
                u6 = u301;
                local v302 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                u52.Visible = v302;
                if v302 then
                    local v303 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                    if v303 and v303:IsA("GuiObject") then
                        v303.Visible = false;
                    end;
                end;
                local l__AbsoluteSize__26 = l__Gui__15.AbsoluteSize;
                if l__AbsoluteSize__26.X <= 0 or l__AbsoluteSize__26.Y <= 0 then
                    l__AbsoluteSize__26 = Vector2.new(1280, 720);
                end;
                local u304 = l__AbsoluteSize__26.X <= 700 and true or l__AbsoluteSize__26.Y <= 500;
                local v305 = u304 and 92 or 126;
                local u306 = u304 and 96 or 128;
                local v307 = Instance.new("Frame");
                v307.Name = "Panel";
                v307.AnchorPoint = Vector2.new(0.5, 0.5);
                v307.BackgroundColor3 = u41;
                v307.BackgroundTransparency = 0.02;
                v307.BorderSizePixel = 0;
                v307.Position = UDim2.new(0.5, 0, 0.5, 0);
                v307.Size = u304 and UDim2.new(0.92, 0, 0.72, 0) or UDim2.new(0.62, 0, 0.68, 0);
                v307.ZIndex = 421;
                v307.Parent = u301;
                local v308 = Instance.new("UICorner");
                v308.CornerRadius = UDim.new(0, 8);
                v308.Parent = v307;
                local v309 = Color3.fromRGB(130, 130, 130);
                local v310 = Instance.new("UIStroke");
                v310.Color = v309 or Color3.fromRGB(255, 255, 255);
                v310.Transparency = 0.55;
                v310.Parent = v307;
                local v311 = Instance.new("UISizeConstraint");
                v311.MinSize = u304 and Vector2.new(300, 280) or Vector2.new(520, 360);
                v311.MaxSize = u304 and Vector2.new(520, 420) or Vector2.new(760, 520);
                v311.Parent = v307;
                local v312 = Instance.new("TextLabel");
                v312.BackgroundTransparency = 1;
                v312.Font = Enum.Font.GothamBlack;
                v312.Text = "Choose item";
                v312.TextColor3 = Color3.new(1, 1, 1);
                v312.TextSize = u304 and 16 or 20;
                v312.TextXAlignment = Enum.TextXAlignment.Left;
                v312.Position = UDim2.new(0, 16, 0, 12);
                v312.Size = UDim2.new(1, -70, 0, 26);
                v312.ZIndex = 422;
                v312.Parent = v307;
                local v313 = Instance.new("TextButton");
                v313.Name = "Close";
                v313.AnchorPoint = Vector2.new(1, 0);
                v313.BackgroundColor3 = u38;
                v313.BorderSizePixel = 0;
                v313.Font = Enum.Font.GothamBold;
                v313.Text = "X";
                v313.TextColor3 = Color3.new(1, 1, 1);
                v313.TextSize = u304 and 14 or 16;
                v313.Position = UDim2.new(1, -12, 0, 12);
                v313.Size = UDim2.new(0, u304 and 30 or 34, 0, u304 and 26 or 28);
                v313.ZIndex = 422;
                v313.Parent = v307;
                local v314 = Instance.new("UICorner");
                v314.CornerRadius = UDim.new(0, 6);
                v314.Parent = v313;
                v313.MouseButton1Click:Connect(u222);
                local u315 = Instance.new("TextBox");
                u315.Name = "Search";
                u315.BackgroundColor3 = Color3.fromRGB(30, 30, 34);
                u315.BackgroundTransparency = 0.05;
                u315.BorderSizePixel = 0;
                u315.ClearTextOnFocus = false;
                u315.Font = Enum.Font.GothamMedium;
                u315.PlaceholderText = "Search items";
                u315.PlaceholderColor3 = Color3.fromRGB(170, 170, 170);
                u315.Text = "";
                u315.TextColor3 = Color3.new(1, 1, 1);
                u315.TextSize = u304 and 12 or 14;
                u315.TextXAlignment = Enum.TextXAlignment.Left;
                u315.Position = UDim2.new(0, v305 + 24, 0, u304 and 60 or 64);
                u315.Size = UDim2.new(1, -v305 - 42, 0, u304 and 28 or 32);
                u315.ZIndex = 422;
                u315.Parent = v307;
                local v316 = Instance.new("UICorner");
                v316.CornerRadius = UDim.new(0, 6);
                v316.Parent = u315;
                local v317 = Instance.new("UIPadding");
                v317.PaddingLeft = UDim.new(0, 10);
                v317.PaddingRight = UDim.new(0, 10);
                v317.Parent = u315;
                local u318 = Instance.new("TextLabel");
                u318.Name = "InventoryCount";
                u318.BackgroundTransparency = 1;
                u318.Font = Enum.Font.GothamBold;
                u318.Text = "";
                u318.TextColor3 = Color3.fromRGB(230, 230, 230);
                u318.TextSize = u304 and 10 or 12;
                u318.TextXAlignment = Enum.TextXAlignment.Left;
                u318.Position = UDim2.new(0, v305 + 24, 0, u304 and 39 or 38);
                u318.Size = UDim2.new(1, -v305 - 42, 0, 18);
                u318.ZIndex = 422;
                u318.Parent = v307;
                local v319 = Instance.new("Frame");
                v319.Name = "Categories";
                v319.BackgroundColor3 = Color3.fromRGB(38, 38, 42);
                v319.BackgroundTransparency = 0.12;
                v319.BorderSizePixel = 0;
                v319.Position = UDim2.new(0, 14, 0, u304 and 60 or 64);
                v319.Size = UDim2.new(0, v305, 1, u304 and -74 or -78);
                v319.ZIndex = 422;
                v319.Parent = v307;
                local v320 = Instance.new("UICorner");
                v320.CornerRadius = UDim.new(0, 6);
                v320.Parent = v319;
                local v321 = Instance.new("UIListLayout");
                v321.SortOrder = Enum.SortOrder.LayoutOrder;
                v321.Padding = UDim.new(0, u304 and 5 or 6);
                v321.Parent = v319;
                local v322 = Instance.new("UIPadding");
                v322.PaddingTop = UDim.new(0, 8);
                v322.PaddingLeft = UDim.new(0, 7);
                v322.PaddingRight = UDim.new(0, 7);
                v322.Parent = v319;
                local u323 = Instance.new("ScrollingFrame");
                u323.Name = "ItemGrid";
                u323.BackgroundColor3 = u42;
                u323.BackgroundTransparency = 0.14;
                u323.BorderSizePixel = 0;
                u323.Position = UDim2.new(0, v305 + 24, 0, u304 and 100 or 108);
                u323.Size = UDim2.new(1, -v305 - 38, 1, u304 and -114 or -122);
                u323.ScrollBarThickness = 6;
                u323.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                u323.CanvasSize = UDim2.new(0, 0, 0, 0);
                u323.ZIndex = 422;
                u323.Parent = v307;
                local v324 = Instance.new("UICorner");
                v324.CornerRadius = UDim.new(0, 6);
                v324.Parent = u323;
                local v325 = Instance.new("UIGridLayout");
                v325.SortOrder = Enum.SortOrder.LayoutOrder;
                v325.CellPadding = UDim2.new(0, u304 and 7 or 9, 0, u304 and 7 or 9);
                v325.CellSize = UDim2.new(0, u306, 0, u306);
                v325.HorizontalAlignment = Enum.HorizontalAlignment.Left;
                v325.Parent = u323;
                local v326 = Instance.new("UIPadding");
                v326.PaddingTop = UDim.new(0, 10);
                v326.PaddingLeft = UDim.new(0, 10);
                v326.PaddingRight = UDim.new(0, 10);
                v326.PaddingBottom = UDim.new(0, 10);
                v326.Parent = u323;
                local u327 = u245();
                local u328 = {
                    All = #u327
                };
                local u329 = {};
                local u330 = "All";
                local u331 = {};
                for _, v332 in ipairs(u223) do
                    u329[v332.Id] = v332.Label;
                    if u328[v332.Id] == nil then
                        u328[v332.Id] = 0;
                    end;
                end;
                for _, v333 in ipairs(u327) do
                    if v333.Category ~= "All" and u328[v333.Category] ~= nil then
                        local l__Category__27 = v333.Category;
                        u328[l__Category__27] = u328[l__Category__27] + 1;
                    end;
                end;
                local function u337() --[[ Line: 1457 ]]
                    -- upvalues: u331 (copy), u330 (ref), u43 (ref), u329 (copy), u328 (copy)
                    for v334, v335 in pairs(u331) do
                        local v336 = v334 == u330;
                        v335.BackgroundColor3 = v336 and u43 or Color3.fromRGB(58, 58, 64);
                        v335.TextColor3 = v336 and Color3.new(1, 1, 1) or Color3.fromRGB(220, 220, 220);
                        v335.Text = string.format("%s (%d)", u329[v334] or v334, u328[v334] or 0);
                    end;
                end;
                local function u339() --[[ Line: 1466 ]]
                    -- upvalues: u323 (copy)
                    for _, v338 in ipairs(u323:GetChildren()) do
                        if v338:IsA("GuiObject") then
                            v338:Destroy();
                        end;
                    end;
                end;
                local function u358() --[[ Line: 1484 ]]
                    -- upvalues: u339 (copy), u337 (copy), u315 (copy), u328 (copy), u330 (ref), u327 (copy), u306 (copy), u323 (copy), u195 (ref), u304 (copy), u43 (ref), u161 (ref), u172 (ref), u181 (ref), u6 (ref), l__Trade__17 (ref), l__ActiveTradeSession__18 (ref), u7 (ref), u52 (ref), l__Gui__15 (ref), u298 (ref), u329 (copy), u318 (copy)
                    u339();
                    u337();
                    local v340 = string.lower(u315.Text or "");
                    local v341 = u328[u330] or #u327;
                    local v342 = 0;
                    for _, u343 in ipairs(u327) do
                        local v344;
                        if u330 == "All" or u343.Category == u330 then
                            v344 = (v340 == "" or string.find(u343.SearchText, v340, 1, true)) and true or false;
                        else
                            v344 = false;
                        end;
                        if v344 then
                            v342 = v342 + 1;
                            local v345 = Instance.new("TextButton");
                            v345.Name = "Item_" .. u343.ItemKey;
                            v345.BackgroundColor3 = Color3.fromRGB(32, 32, 36);
                            v345.BackgroundTransparency = 0.02;
                            v345.BorderSizePixel = 0;
                            v345.AutoButtonColor = true;
                            v345.Text = "";
                            v345.Size = UDim2.new(0, u306, 0, u306);
                            v345.LayoutOrder = v342;
                            v345.ZIndex = 423;
                            v345.Parent = u323;
                            local v346 = Instance.new("UICorner");
                            v346.CornerRadius = UDim.new(0, 7);
                            v346.Parent = v345;
                            local v347 = Color3.fromRGB(120, 120, 125);
                            local v348 = Instance.new("UIStroke");
                            v348.Color = v347 or Color3.fromRGB(255, 255, 255);
                            v348.Transparency = 0.72;
                            v348.Parent = v345;
                            u195(v345, u343.ItemKey, u343.Name, u343.ImageId, 424, u304 and 54 or 80, u304 and 21 or 24);
                            local v349 = Instance.new("TextLabel");
                            v349.Name = "Amount";
                            v349.AnchorPoint = Vector2.new(1, 0);
                            v349.BackgroundColor3 = u43;
                            v349.BackgroundTransparency = 0.02;
                            v349.BorderSizePixel = 0;
                            v349.Font = Enum.Font.GothamBlack;
                            v349.Text = "x" .. u161(u343.Amount);
                            v349.TextColor3 = Color3.new(1, 1, 1);
                            v349.TextSize = u304 and 9 or 10;
                            v349.Position = UDim2.new(1, -5, 0, 5);
                            v349.Size = UDim2.new(0, u304 and 34 or 42, 0, u304 and 15 or 17);
                            v349.ZIndex = 426;
                            v349.Parent = v345;
                            local v350 = Instance.new("UICorner");
                            v350.CornerRadius = UDim.new(0, 5);
                            v350.Parent = v349;
                            local v351 = Instance.new("TextLabel");
                            v351.Name = "Type";
                            v351.BackgroundColor3 = Color3.fromRGB(70, 70, 76);
                            v351.BackgroundTransparency = 0.12;
                            v351.BorderSizePixel = 0;
                            v351.Font = Enum.Font.GothamBold;
                            v351.Text = u343.Type;
                            v351.TextColor3 = Color3.fromRGB(230, 230, 230);
                            v351.TextSize = u304 and 7 or 8;
                            v351.TextTruncate = Enum.TextTruncate.AtEnd;
                            v351.Position = UDim2.new(0, 5, 0, 5);
                            v351.Size = UDim2.new(0, u304 and 38 or 46, 0, u304 and 14 or 16);
                            v351.ZIndex = 426;
                            v351.Parent = v345;
                            local v352 = Instance.new("UICorner");
                            v352.CornerRadius = UDim.new(0, 4);
                            v352.Parent = v351;
                            local v353 = u172(u343.ItemKey);
                            if v353 then
                                u181(v345, v353, 425, UDim2.new(0, 6, 1, u304 and -30 or -38), UDim2.new(1, -12, 0, u304 and 12 or 14), u304 and 8 or 9);
                            end;
                            local v354 = Instance.new("TextLabel");
                            v354.Name = "Name";
                            v354.BackgroundTransparency = 1;
                            v354.Font = Enum.Font.GothamBold;
                            v354.Text = u343.Name;
                            v354.TextColor3 = Color3.new(1, 1, 1);
                            v354.TextSize = u304 and 9 or 10;
                            v354.TextTruncate = Enum.TextTruncate.AtEnd;
                            v354.TextXAlignment = Enum.TextXAlignment.Center;
                            v354.Position = v353 and UDim2.new(0, 6, 1, u304 and -18 or -23) or UDim2.new(0, 6, 1, u304 and -20 or -23);
                            v354.Size = UDim2.new(1, -12, 0, u304 and 16 or 18);
                            v354.ZIndex = 425;
                            v354.Parent = v345;
                            v345.MouseButton1Click:Connect(function() --[[ Line: 1560 ]]
                                -- upvalues: u6 (ref), l__Trade__17 (ref), l__ActiveTradeSession__18 (ref), u7 (ref), u52 (ref), l__Gui__15 (ref), u298 (ref), u343 (copy)
                                if u6 then
                                    u6:Destroy();
                                    u6 = nil;
                                end;
                                local v355 = l__Trade__17.Visible or l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil);
                                u52.Visible = v355;
                                if v355 then
                                    local v356 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                                    if v356 and v356:IsA("GuiObject") then
                                        v356.Visible = false;
                                    end;
                                end;
                                task.defer(function() --[[ Line: 1562 ]]
                                    -- upvalues: u298 (ref), u343 (ref)
                                    u298(u343);
                                end);
                            end);
                        end;
                    end;
                    u318.Text = string.format("Exclusive items: %d | %s: %d%s", #u327, u329[u330] or u330, v342, v340 == "" and "" or ("/" .. tostring(v341) .. " shown" or ""));
                    if v342 == 0 then
                        local v357 = Instance.new("TextLabel");
                        v357.Name = "Empty";
                        v357.BackgroundTransparency = 1;
                        v357.Font = Enum.Font.GothamBold;
                        v357.Text = #u327 == 0 and "No tradeable items." or "No items found.";
                        v357.TextColor3 = Color3.fromRGB(220, 220, 220);
                        v357.TextSize = u304 and 13 or 16;
                        v357.Size = UDim2.new(1, -20, 0, 44);
                        v357.ZIndex = 423;
                        v357.Parent = u323;
                    end;
                end;
                for v359, u360 in ipairs(u223) do
                    local v361 = Instance.new("TextButton");
                    v361.Name = "Filter_" .. u360.Id;
                    v361.BackgroundColor3 = Color3.fromRGB(58, 58, 64);
                    v361.BackgroundTransparency = 0.05;
                    v361.BorderSizePixel = 0;
                    v361.Font = Enum.Font.GothamBold;
                    v361.Text = u360.Label;
                    v361.TextSize = u304 and 10 or 12;
                    v361.TextColor3 = Color3.fromRGB(220, 220, 220);
                    v361.Size = UDim2.new(1, 0, 0, u304 and 24 or 30);
                    v361.LayoutOrder = v359;
                    v361.ZIndex = 423;
                    v361.Parent = v319;
                    if v361 and v361:IsA("GuiButton") then
                        v361:SetAttribute("SfxKind", "Click");
                    end;
                    local v362 = Instance.new("UICorner");
                    v362.CornerRadius = UDim.new(0, 6);
                    v362.Parent = v361;
                    u331[u360.Id] = v361;
                    v361.MouseButton1Click:Connect(function() --[[ Line: 1603 ]]
                        -- upvalues: u330 (ref), u360 (copy), u358 (copy)
                        u330 = u360.Id;
                        u358();
                    end);
                end;
                u315:GetPropertyChangedSignal("Text"):Connect(u358);
                u358();
            end;
        end;
        local function u369(p363, p364, p365, p366) --[[ Line: 1613 ]]
            -- upvalues: u148 (copy), u213 (copy), u219 (copy), u156 (copy), u40 (copy)
            u148(p363);
            local v367 = 1;
            for _, v368 in ipairs(p364) do
                if v367 <= 8 then
                    u213(p363, v368, p366, v367);
                    v367 = v367 + 1;
                end;
            end;
            if p365 and v367 <= 8 then
                u219(p363, v367);
                v367 = v367 + 1;
            end;
            while v367 <= 8 do
                u156(p363, "EmptySlot", u40, v367).BackgroundTransparency = 0.45;
                v367 = v367 + 1;
            end;
        end;
        local function u378(p370, p371, p372, p373, p374, p375) --[[ Line: 1632 ]]
            if p370 and p370:IsA("GuiObject") then
                p370.BackgroundColor3 = p374;
                p370.BackgroundTransparency = 0.28;
                p370.ClipsDescendants = true;
                local v376 = p370:FindFirstChildOfClass("UICorner");
                if not v376 then
                    v376 = Instance.new("UICorner");
                    v376.Parent = p370;
                end;
                v376.CornerRadius = UDim.new(0, 6);
            end;
            if p372 and p372:IsA("GuiObject") then
                p372.BackgroundColor3 = p374;
                p372.BackgroundTransparency = 0.22;
                p372.ClipsDescendants = true;
                local v377 = p372:FindFirstChildOfClass("UICorner");
                if not v377 then
                    v377 = Instance.new("UICorner");
                    v377.Parent = p372;
                end;
                v377.CornerRadius = UDim.new(0, 4);
            end;
            if p371 and p371:IsA("TextLabel") then
                p371.Text = " " .. p373 .. (p375 or "");
                p371.BackgroundColor3 = p374;
                p371.BackgroundTransparency = 0;
            end;
        end;
        local function u412(p379) --[[ Line: 1652 ]]
            -- upvalues: u5 (ref), l__ActiveTradeSession__18 (copy), u26 (copy), l__Trade__17 (copy), u6 (ref), u7 (ref), u52 (copy), l__Gui__15 (copy), u133 (copy), l__LocalPlayer__5 (copy), u10 (ref), u9 (ref), u144 (copy), u34 (copy), u33 (copy), u35 (copy), u378 (copy), u136 (copy), u369 (copy), u38 (copy), u36 (copy), u37 (copy)
            u5 = p379;
            l__ActiveTradeSession__18.Visible = true;
            u26("Close");
            l__Trade__17.Visible = false;
            local v380 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
            u52.Visible = v380;
            if v380 then
                local v381 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                if v381 and v381:IsA("GuiObject") then
                    v381.Visible = false;
                end;
            end;
            local v382 = u133(p379);
            local v383 = v382 and (tostring(v382.DisplayName or (v382.Name or "Player")) or "Player") or "Player";
            local l__UserId__28 = l__LocalPlayer__5.UserId;
            local v384 = p379 and p379.Accepted;
            if v384 then
                v384 = p379.Accepted[tostring(l__UserId__28)] == true;
            end;
            local v385;
            if v382 then
                local l__UserId__29 = v382.UserId;
                local v386 = p379 and p379.Accepted;
                if v386 then
                    v386 = p379.Accepted[tostring(l__UserId__29)] == true;
                end;
                v385 = v386 or false;
            else
                v385 = false;
            end;
            local l__UserId__30 = l__LocalPlayer__5.UserId;
            local v387 = p379 and p379.Confirmed;
            if v387 then
                v387 = p379.Confirmed[tostring(l__UserId__30)] == true;
            end;
            local v388;
            if v382 then
                local l__UserId__31 = v382.UserId;
                local v389 = p379 and p379.Confirmed;
                if v389 then
                    v389 = p379.Confirmed[tostring(l__UserId__31)] == true;
                end;
                v388 = v389 or false;
            else
                v388 = false;
            end;
            local v390, v391;
            if p379.State == "Confirming" then
                v390 = v387 and "Ready" or "Waiting";
                v391 = v388 and "Ready" or "Waiting";
            else
                v390 = v384 and "Ready" or "Editing";
                v391 = v385 and "Ready" or "Editing";
            end;
            local v392 = l__ActiveTradeSession__18:FindFirstChild("Buttons");
            if v392 and v392:IsA("GuiObject") then
                v392.BackgroundTransparency = 0.28;
                v392.ClipsDescendants = true;
                local v393 = v392:FindFirstChildOfClass("UICorner");
                if not v393 then
                    v393 = Instance.new("UICorner");
                    v393.Parent = v392;
                end;
                v393.CornerRadius = UDim.new(0, 6);
            end;
            local v394;
            if v392 then
                v394 = v392:FindFirstChild("TextLabel");
            else
                v394 = v392;
            end;
            if v394 and v394:IsA("TextLabel") then
                v394.AnchorPoint = Vector2.new(0, 0.5);
                v394.Position = UDim2.new(0.02, 0, 0.5, 0);
                v394.Size = UDim2.new(0.66, 0, 0.62, 0);
                v394.BackgroundTransparency = 1;
                v394.Font = Enum.Font.GothamMedium;
                v394.TextColor3 = Color3.new(1, 1, 1);
                v394.TextSize = 18;
                v394.TextScaled = false;
                v394.TextWrapped = false;
                v394.TextTruncate = Enum.TextTruncate.AtEnd;
                v394.TextXAlignment = Enum.TextXAlignment.Left;
                v394.TextYAlignment = Enum.TextYAlignment.Center;
                if p379.State == "Processing" then
                    u10 = nil;
                    if u9 then
                        task.cancel(u9);
                        u9 = nil;
                    end;
                    v394.Text = "Processing trade...";
                elseif p379.State == "Countdown" then
                    u144(v394, p379);
                elseif p379.State == "Confirming" then
                    u10 = nil;
                    if u9 then
                        task.cancel(u9);
                        u9 = nil;
                    end;
                    v394.Text = "CONFIRM TRADE!";
                else
                    u10 = nil;
                    if u9 then
                        task.cancel(u9);
                        u9 = nil;
                    end;
                    v394.Text = "You: " .. v390 .. " | Them: " .. v391;
                end;
            end;
            local v395 = l__ActiveTradeSession__18:FindFirstChild("Your");
            local v396 = l__ActiveTradeSession__18:FindFirstChild("He");
            local v397;
            if v395 then
                v397 = v395:FindFirstChild("ScrollingFrame");
            else
                v397 = v395;
            end;
            local v398;
            if v396 then
                v398 = v396:FindFirstChild("ScrollingFrame");
            else
                v398 = v396;
            end;
            local v399;
            if v395 then
                v399 = v395:FindFirstChild("TextLabel");
            else
                v399 = v395;
            end;
            local v400;
            if v396 then
                v400 = v396:FindFirstChild("TextLabel");
            else
                v400 = v396;
            end;
            local v401 = v384 and u34 or u33;
            local v402 = v385 and u34 or u33;
            local v403, v404;
            if p379.State == "Confirming" then
                v401 = v387 and u34 or u35;
                v402 = v388 and u34 or u35;
                v403 = v387 and " (Ready)" or " (Waiting)";
                v404 = v388 and " (Ready)" or " (Waiting)";
            else
                v403 = v384 and " (Ready)" or "";
                v404 = v385 and " (Ready)" or "";
            end;
            u378(v395, v399, v397, "Your items", v401, v403);
            u378(v396, v400, v398, v383 .. " items", v402, v404);
            local v405 = u136(p379, l__LocalPlayer__5.UserId);
            local v406 = v382 and (u136(p379, v382.UserId) or {}) or {};
            u369(v397, v405, p379.State == "Editing", p379.State == "Editing");
            u369(v398, v406, false, false);
            local v407;
            if v392 then
                v407 = v392:FindFirstChild("Decline");
            else
                v407 = v392;
            end;
            if v407 and v407:IsA("TextButton") then
                v407.Active = true;
                v407.AutoButtonColor = true;
                v407.AnchorPoint = Vector2.new(1, 0.5);
                v407.Position = UDim2.new(0.865, -8, 0.5, 0);
                v407.Size = UDim2.new(0.115, 0, 0.72, 0);
                v407.Text = "Cancel";
                v407.TextScaled = true;
                v407.BackgroundColor3 = u38;
                if v407 and v407:IsA("GuiButton") then
                    v407:SetAttribute("SfxKind", "Close");
                end;
            end;
            if v392 then
                v392 = v392:FindFirstChild("Accept");
            end;
            if v392 and v392:IsA("TextButton") then
                local v408 = p379.State == "Processing";
                local v409;
                if p379.State == "Confirming" then
                    v409 = not v387;
                else
                    v409 = false;
                end;
                local v410 = not v408;
                if v410 then
                    local v411;
                    if p379.State == "Confirming" then
                        v411 = v387;
                    else
                        v411 = false;
                    end;
                    v410 = not v411;
                end;
                v392.Active = v410;
                v392.AutoButtonColor = v392.Active;
                v392.AnchorPoint = Vector2.new(1, 0.5);
                v392.Position = UDim2.new(0.99, -8, 0.5, 0);
                v392.Size = UDim2.new(0.115, 0, 0.72, 0);
                if v408 then
                    v392.Text = "Processing...";
                elseif v409 then
                    v392.Text = "CONFIRM!";
                elseif v384 or v387 then
                    v392.Text = "You Are Ready";
                else
                    v392.Text = "Accept";
                end;
                v392.TextScaled = true;
                if v392 and v392:IsA("GuiButton") then
                    v392:SetAttribute("SfxKind", "Equip");
                end;
                if v409 then
                    v392.BackgroundColor3 = u36;
                    return;
                end;
                if v384 or v387 then
                    v392.BackgroundColor3 = u34;
                    return;
                end;
                v392.BackgroundColor3 = u37;
            end;
        end;
        local v413 = l__ActiveTradeSession__18:FindFirstChild("Buttons");
        if v413 then
            local v414 = v413:FindFirstChild("Accept");
            if v414 and v414:IsA("TextButton") then
                if v414 and v414:IsA("GuiButton") then
                    v414:SetAttribute("SfxKind", "Equip");
                end;
                v414.MouseButton1Click:Connect(function() --[[ Line: 1779 ]]
                    -- upvalues: u32 (copy), u26 (copy)
                    local v415 = u32("Accept", {});
                    if v415 and v415.Ok then
                        u26("Accept");
                    else
                        u26("Error");
                    end;
                end);
            end;
            local v416 = v413:FindFirstChild("Decline");
            if v416 and v416:IsA("TextButton") then
                if v416 and v416:IsA("GuiButton") then
                    v416:SetAttribute("SfxKind", "Close");
                end;
                v416.MouseButton1Click:Connect(function() --[[ Line: 1791 ]]
                    -- upvalues: u32 (copy), u26 (copy)
                    local v417 = u32("Cancel", {});
                    if v417 and v417.Ok then
                        u26("Cancel");
                    else
                        u26("Error");
                    end;
                end);
            end;
        end;
        local u418 = nil;
        l__Update__11.OnClientEvent:Connect(function(p419, p420) --[[ Line: 1804 ]]
            -- upvalues: u26 (copy), l__PromptHandler__12 (copy), u123 (copy), u418 (ref), u412 (copy), u5 (ref), u10 (ref), u9 (ref), u6 (ref), l__Trade__17 (copy), l__ActiveTradeSession__18 (copy), u7 (ref), u52 (copy), l__Gui__15 (copy)
            if p419 == "Notify" then
                local v421 = p420 or {};
                local v422 = tostring(v421.Text or "");
                if string.find(string.lower(v422), "trade", 1, true) then
                    u26(tostring(v421.Type or "Info") == "Error" and "Error" or "Incoming");
                end;
                local v423 = v421.Type or "Info";
                local v424 = v421.Text or "";
                if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                    l__PromptHandler__12.ShowNotification(v423 or "Info", v424 or "");
                end;
            else
                if p419 == "PlayerListDirty" then
                    u123();
                    return;
                end;
                if p419 == "SessionStarted" or p419 == "SessionUpdate" then
                    local v425 = type(p420) == "table" and (tostring(p420.SessionId or (p420.Id or "")) or "") or "";
                    local v426 = type(p420) == "table" and (tostring(p420.State or "") or "") or "";
                    local v427 = p419 .. ":" .. v425 .. ":" .. v426;
                    if v426 == "Confirming" and u418 ~= v427 then
                        u26("Accept");
                    end;
                    u418 = v427;
                    u412(p420);
                    return;
                end;
                if p419 == "SessionClosed" then
                    u5 = nil;
                    u10 = nil;
                    if u9 then
                        task.cancel(u9);
                        u9 = nil;
                    end;
                    if u6 then
                        u6:Destroy();
                        u6 = nil;
                    end;
                    local v428 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                    u52.Visible = v428;
                    if v428 then
                        local v429 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                        if v429 and v429:IsA("GuiObject") then
                            v429.Visible = false;
                        end;
                    end;
                    if u7 then
                        u7:Destroy();
                        u7 = nil;
                    end;
                    local v430 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                    u52.Visible = v430;
                    if v430 then
                        local v431 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                        if v431 and v431:IsA("GuiObject") then
                            v431.Visible = false;
                        end;
                    end;
                    l__ActiveTradeSession__18.Visible = false;
                    local v432 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
                    u52.Visible = v432;
                    if v432 then
                        local v433 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
                        if v433 and v433:IsA("GuiObject") then
                            v433.Visible = false;
                        end;
                    end;
                    local v434 = p420 or {};
                    if v434.Completed then
                        u26("Complete");
                    else
                        u26("Cancel");
                    end;
                    u418 = nil;
                    if v434.Reason then
                        local v435 = v434.Completed and "Success" or "Warning";
                        local l__Reason__32 = v434.Reason;
                        if l__PromptHandler__12 and l__PromptHandler__12.ShowNotification then
                            l__PromptHandler__12.ShowNotification(v435 or "Info", l__Reason__32 or "");
                        end;
                    end;
                end;
            end;
        end);
        l__Players__1.PlayerAdded:Connect(u123);
        l__Players__1.PlayerRemoving:Connect(u123);
        l__Trade__17.Visible = false;
        l__ActiveTradeSession__18.Visible = false;
        local v436 = l__Trade__17.Visible or (l__ActiveTradeSession__18.Visible or (u6 ~= nil and true or u7 ~= nil));
        u52.Visible = v436;
        if v436 then
            local v437 = l__Gui__15:FindFirstChild("ModeDescriptionTooltip");
            if v437 and v437:IsA("GuiObject") then
                v437.Visible = false;
            end;
        end;
    end;
end;