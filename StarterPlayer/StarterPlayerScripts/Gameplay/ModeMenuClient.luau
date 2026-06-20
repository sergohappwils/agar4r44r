-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Gameplay.ModeMenuClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__SocialService__3 = game:GetService("SocialService");
local l__TextService__4 = game:GetService("TextService");
local l__UserInputService__5 = game:GetService("UserInputService");
local l__Workspace__6 = game:GetService("Workspace");
local l__LocalPlayer__7 = l__Players__1.LocalPlayer;
local l__PlayerGui__8 = l__LocalPlayer__7:WaitForChild("PlayerGui");
local l__Gameplay__9 = l__ReplicatedStorage__2:WaitForChild("Gameplay");
local l__Engine__10 = l__Gameplay__9:WaitForChild("Engine");
local l__Network__11 = l__Gameplay__9:WaitForChild("Network");
local l__SharedGameplay__12 = require(l__Gameplay__9:WaitForChild("SharedGameplay"));
local l__ModeFeatureFlags__13 = require(l__Engine__10:WaitForChild("ModeFeatureFlags"));
task.defer(function() --[[ Line: 19 ]]
    -- upvalues: l__Network__11 (copy), l__SharedGameplay__12 (copy)
    local v1 = l__Network__11:FindFirstChild(l__SharedGameplay__12.NetworkNames.AntiCheatReport);
    if v1 and v1:IsA("RemoteEvent") then
        v1:FireServer({
            Kind = "Surface",
            Surface = "ModeMenu",
            Version = 1
        });
    end;
end);
local v2;
if l__ModeFeatureFlags__13.ModesEnabled == true then
    if l__ModeFeatureFlags__13.TestersOnly == true then
        local l__TesterUserIds__14 = l__ModeFeatureFlags__13.TesterUserIds;
        v2 = type(l__TesterUserIds__14) == "table" and l__TesterUserIds__14[l__LocalPlayer__7.UserId] == true;
    else
        v2 = true;
    end;
else
    v2 = false;
end;
if v2 then
    local v3 = l__PlayerGui__8:FindFirstChild("ModeMenuGui");
    if v3 then
        v3:Destroy();
    end;
    local l__NetworkNames__15 = l__SharedGameplay__12.NetworkNames;
    local u4 = l__Network__11:WaitForChild(l__NetworkNames__15.GetOfficialModes);
    local u5 = l__Network__11:WaitForChild(l__NetworkNames__15.GetModeServers);
    local u6 = l__Network__11:WaitForChild(l__NetworkNames__15.GetFriendPresence);
    local u7 = l__Network__11:WaitForChild(l__NetworkNames__15.GetCustomModes);
    local u8 = l__Network__11:WaitForChild(l__NetworkNames__15.GetCustomModeServers);
    local u9 = l__Network__11:WaitForChild(l__NetworkNames__15.CreateCustomMode);
    local u10 = l__Network__11:WaitForChild(l__NetworkNames__15.UpdateCustomMode);
    local u11 = l__Network__11:WaitForChild(l__NetworkNames__15.DeleteCustomMode);
    local u12 = l__Network__11:WaitForChild(l__NetworkNames__15.RestartCustomMode);
    local u13 = l__Network__11:WaitForChild(l__NetworkNames__15.RequestJoinMode);
    local u14 = l__Network__11:WaitForChild(l__NetworkNames__15.RequestJoinCustomMode);
    local u15 = l__Network__11:WaitForChild(l__NetworkNames__15.RequestJoinFriend);
    local u16 = l__Network__11:WaitForChild(l__NetworkNames__15.SendGameFriendRequest);
    local u17 = l__Network__11:WaitForChild(l__NetworkNames__15.RespondGameFriendRequest);
    local v18 = l__Network__11:WaitForChild(l__NetworkNames__15.ModeTeleportResult);
    local v19 = l__Network__11:WaitForChild(l__NetworkNames__15.CustomModeResult);
    local l__Gui__16 = l__PlayerGui__8:WaitForChild("Gui");
    local l__Menu__17 = l__Gui__16:WaitForChild("Menu");
    local l__Right__18 = l__Menu__17:WaitForChild("Right");
    local l__Mods__19 = l__Right__18:WaitForChild("Mods");
    local l__Modes__20 = l__Mods__19:WaitForChild("Modes");
    local l__Mod__21 = l__Modes__20:WaitForChild("Mod");
    local l__CustomModes__22 = l__Mods__19:WaitForChild("CustomModes");
    local l__Mod__23 = l__CustomModes__22:WaitForChild("Mod");
    local l__Servers__24 = l__Gui__16:WaitForChild("Servers");
    local l__ServersScrolling__25 = l__Servers__24:WaitForChild("ServersScrolling");
    local u20 = os.clock() + 2.5;
    local u21 = Color3.fromRGB(255, 85, 0);
    local u22 = Color3.fromRGB(113, 113, 113);
    local u23 = Color3.fromRGB(72, 92, 86);
    local u24 = Color3.fromRGB(255, 85, 0);
    local u25 = Color3.fromRGB(45, 135, 96);
    local u26 = Color3.fromRGB(255, 85, 0);
    local u27 = Color3.fromRGB(88, 88, 88);
    local u28 = Color3.new(1, 1, 1);
    local u29 = Color3.fromRGB(255, 225, 80);
    local u30 = Color3.fromRGB(255, 95, 80);
    local u31 = nil;
    local u32 = {
        ModeListInterval = 60,
        ServerListInterval = 30,
        PollInterval = 8,
        LastServerAt = 0,
        LastModeAt = {
            Official = 0,
            Custom = 0
        }
    };
    local u33 = {
        Official = false,
        Custom = false
    };
    local u34 = "";
    local u35 = "Official";
    local u36 = nil;
    local u37 = 50;
    local u38 = "";
    local u39 = false;
    local u40 = nil;
    local u41 = nil;
    local function v43() --[[ Line: 69 ]]
        -- upvalues: l__PlayerGui__8 (copy), l__Gui__16 (copy)
        local v42 = l__PlayerGui__8:FindFirstChild("Temp");
        if v42 and v42:IsA("ScreenGui") then
            return v42;
        else
            return l__Gui__16;
        end;
    end;
    local u44 = nil;
    local u45 = "Official";
    local u46 = {};
    for _, v47 in ipairs(l__ServersScrolling__25:GetChildren()) do
        if v47:IsA("Frame") and v47.Name == "Server" then
            v47.Visible = false;
            u31 = u31 or v47;
        end;
    end;
    l__Mod__21.Visible = false;
    l__Mod__23.Visible = false;
    l__Servers__24.Visible = false;
    local l__ModDefult__26 = l__Servers__24:WaitForChild("ModDefult");
    local l__ModeServersStatus__27 = l__Servers__24:WaitForChild("ModeServersStatus");
    local u48 = nil;
    local u49 = nil;
    task.spawn(function() --[[ Line: 133 ]]
        -- upvalues: l__PlayerGui__8 (copy), l__ReplicatedStorage__2 (copy), u49 (ref)
        local l__MainScreenGui__28 = l__PlayerGui__8:WaitForChild("MainScreenGui", 5);
        local l__PopupGui__29 = l__PlayerGui__8:WaitForChild("PopupGui", 5);
        if l__MainScreenGui__28 and l__PopupGui__29 then
            if l__PopupGui__29:FindFirstChild("StandardPrompt") and (l__PopupGui__29:FindFirstChild("InputPrompt") and l__PopupGui__29:FindFirstChild("TradePrompt")) then
                local v50 = l__ReplicatedStorage__2:FindFirstChild("Framework");
                if v50 then
                    v50 = v50:FindFirstChild("PromptHandler");
                end;
                if v50 and v50:IsA("ModuleScript") then
                    local v51, v52 = pcall(require, v50);
                    if v51 and type(v52) == "table" then
                        u49 = v52;
                    end;
                end;
            end;
        end;
    end);
    local l__ModeServersClose__30 = l__Servers__24:WaitForChild("ModeServersClose");
    local function u63(p53, p54, p55) --[[ Line: 175 ]]
        -- upvalues: l__PlayerGui__8 (copy)
        local v56 = l__PlayerGui__8:FindFirstChild("ModeFallbackNotifications");
        if not v56 then
            v56 = Instance.new("ScreenGui");
            v56.Name = "ModeFallbackNotifications";
            v56.ResetOnSpawn = false;
            v56.IgnoreGuiInset = true;
            v56.DisplayOrder = 150;
            v56.Parent = l__PlayerGui__8;
        end;
        local v57 = 0;
        for _, v58 in ipairs(v56:GetChildren()) do
            if v58:IsA("TextLabel") then
                v57 = v57 + 1;
            end;
        end;
        local u59 = Instance.new("TextLabel");
        u59.Name = "Toast";
        u59.AnchorPoint = Vector2.new(0.5, 0);
        u59.Position = UDim2.new(0.5, 0, 0, v57 * 34 + 64);
        u59.Size = UDim2.fromOffset(420, 30);
        local v60;
        if p55 == "Teleport" then
            v60 = Color3.fromRGB(255, 85, 0);
        elseif p54 then
            v60 = Color3.fromRGB(150, 58, 52);
        else
            v60 = Color3.fromRGB(45, 68, 58);
        end;
        u59.BackgroundColor3 = v60;
        u59.BorderSizePixel = 0;
        u59.Font = Enum.Font.GothamMedium;
        u59.Text = p53;
        u59.TextColor3 = Color3.new(1, 1, 1);
        u59.TextScaled = true;
        u59.TextWrapped = true;
        u59.ZIndex = 151;
        u59.Parent = v56;
        local v61 = Instance.new("UICorner");
        v61.CornerRadius = UDim.new(0, 6);
        v61.Parent = u59;
        local v62 = Instance.new("UITextSizeConstraint");
        v62.MinTextSize = 10;
        v62.MaxTextSize = 16;
        v62.Parent = u59;
        task.delay(3, function() --[[ Line: 217 ]]
            -- upvalues: u59 (copy)
            if u59 and u59.Parent then
                u59:Destroy();
            end;
        end);
    end;
    local function v67(p64, p65, p66) --[[ Line: 224 ]]
        -- upvalues: u49 (ref), u63 (copy)
        if u49 and type(u49.ShowNotification) == "function" then
            u49.ShowNotification(p66 == "Teleport" and "Teleport" or (p65 and "Warning" or "Info"), p64);
        else
            u63(p64, p65, p66);
        end;
    end;
    local function u79(u68, p69, ...) --[[ Line: 233 ]]
        local u70 = table.pack(...);
        local u71 = false;
        local u72 = false;
        local u73 = nil;
        task.spawn(function() --[[ Line: 238 ]]
            -- upvalues: u72 (ref), u73 (ref), u68 (copy), u70 (copy), u71 (ref)
            local v74, v75 = pcall(function() --[[ Line: 239 ]]
                -- upvalues: u68 (ref), u70 (ref)
                return u68:InvokeServer(table.unpack(u70, 1, u70.n));
            end);
            u72 = v74;
            u73 = v75;
            u71 = true;
        end);
        local v76 = os.clock() + p69;
        local v77 = u73;
        local v78 = u72;
        while not u71 and os.clock() < v76 do
            task.wait();
        end;
        if u71 then
            return v78, v77, false;
        else
            return false, {
                Ok = false,
                Message = "Request timed out."
            }, true;
        end;
    end;
    local u80 = nil;
    local u81 = 0;
    local u82 = 0;
    local u83 = {};
    local u84 = {};
    local u85 = {};
    local u86 = {};
    local u87 = "Basic";
    local l__OfficialModesButton__31 = l__Mods__19:WaitForChild("OfficialModesButton");
    local l__CustomModesButton__32 = l__Mods__19:WaitForChild("CustomModesButton");
    local l__CreateCustomModeButton__33 = l__Mods__19:WaitForChild("CreateCustomModeButton");
    local l__CustomModeSearchBox__34 = l__Mods__19:WaitForChild("CustomModeSearchBox");
    local function v90(p88) --[[ Line: 271 ]]
        -- upvalues: l__Mods__19 (copy)
        for _, v89 in ipairs(l__Mods__19:GetDescendants()) do
            if v89:IsA("TextLabel") and v89.Text == p88 then
                return v89;
            end;
        end;
        return nil;
    end;
    local u91 = v90("Game Mode");
    local u92 = v90("Players");
    u48 = Instance.new("TextLabel");
    u48.Name = "ModeListStatus";
    u48.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
    u48.BackgroundTransparency = 0.18;
    u48.BorderSizePixel = 0;
    u48.Font = Enum.Font.GothamMedium;
    u48.Text = "";
    u48.TextColor3 = Color3.fromRGB(215, 221, 232);
    u48.TextScaled = true;
    u48.TextWrapped = true;
    u48.Visible = false;
    u48.ZIndex = 25;
    u48.Parent = l__Mods__19;
    Instance.new("UICorner", u48).CornerRadius = UDim.new(0, 5);
    local v93 = Instance.new("UITextSizeConstraint");
    v93.MinTextSize = 9;
    v93.MaxTextSize = 13;
    v93.Parent = u48;
    local u94 = Instance.new("ScrollingFrame");
    u94.Name = "ModeDescriptionTooltip";
    u94.AnchorPoint = Vector2.new(0, 0);
    u94.Size = UDim2.fromOffset(320, 92);
    u94.BackgroundColor3 = Color3.fromRGB(36, 36, 36);
    u94.BackgroundTransparency = 0.04;
    u94.BorderSizePixel = 0;
    u94.ScrollBarThickness = 4;
    u94.ScrollingDirection = Enum.ScrollingDirection.Y;
    u94.CanvasSize = UDim2.fromOffset(0, 92);
    u94.Active = false;
    u94.ZIndex = 300;
    u94.Visible = false;
    u94.Parent = l__Gui__16;
    Instance.new("UICorner", u94).CornerRadius = UDim.new(0, 7);
    local u95 = Instance.new("TextLabel");
    u95.Name = "Text";
    u95.BackgroundTransparency = 1;
    u95.Position = UDim2.fromOffset(10, 8);
    u95.Size = UDim2.new(1, -24, 0, 76);
    u95.Font = Enum.Font.GothamMedium;
    u95.TextColor3 = Color3.fromRGB(255, 255, 255);
    u95.TextSize = 15;
    u95.TextWrapped = true;
    u95.TextXAlignment = Enum.TextXAlignment.Left;
    u95.TextYAlignment = Enum.TextYAlignment.Top;
    u95.ZIndex = 301;
    u95.Parent = u94;
    local function u105() --[[ Line: 340 ]]
        -- upvalues: l__Workspace__6 (copy), l__UserInputService__5 (copy), u94 (copy), l__TextService__4 (copy), u95 (copy)
        local l__CurrentCamera__35 = l__Workspace__6.CurrentCamera;
        local v96;
        if l__CurrentCamera__35 then
            v96 = l__CurrentCamera__35.ViewportSize;
        else
            v96 = Vector2.new(1280, 720);
        end;
        local v97 = math.clamp(v96.X - 16, 220, 360);
        local v98 = math.floor(v97);
        local v99 = math.clamp(v96.Y * 0.34, 78, 150);
        local v100 = math.floor(v99);
        if l__UserInputService__5.TouchEnabled then
            local v101 = math.clamp(v96.X - 20, 240, 420);
            v98 = math.floor(v101);
            local v102 = math.clamp(v96.Y * 0.42, 96, 180);
            v100 = math.floor(v102);
        end;
        u94.Size = UDim2.fromOffset(v98, v100);
        local l__Y__36 = l__TextService__4:GetTextSize(u95.Text, u95.TextSize, u95.Font, Vector2.new(math.max(80, v98 - 24), 1000)).Y;
        local v103 = math.ceil(l__Y__36) + 18;
        local v104 = math.max(v100, v103);
        u95.Size = UDim2.new(1, -24, 0, v104 - 12);
        u94.CanvasSize = UDim2.fromOffset(0, v104);
    end;
    local function u114() --[[ Line: 356 ]]
        -- upvalues: u105 (copy), l__Workspace__6 (copy), l__UserInputService__5 (copy), u94 (copy)
        u105();
        local l__CurrentCamera__37 = l__Workspace__6.CurrentCamera;
        local v106;
        if l__CurrentCamera__37 then
            v106 = l__CurrentCamera__37.ViewportSize;
        else
            v106 = Vector2.new(1280, 720);
        end;
        local v107 = l__UserInputService__5:GetMouseLocation();
        local l__X__38 = u94.AbsoluteSize.X;
        local l__Y__39 = u94.AbsoluteSize.Y;
        local v108 = v107.X + 16;
        local v109 = math.max(8, v106.X - l__X__38 - 8);
        local v110 = math.clamp(v108, 8, v109);
        local v111 = v107.Y + 12;
        local v112 = math.max(8, v106.Y - l__Y__39 - 8);
        local v113 = math.clamp(v111, 8, v112);
        u94.Position = UDim2.fromOffset(v110, v113);
    end;
    local function u115() --[[ Line: 377 ]]
        -- upvalues: u94 (copy)
        u94.Visible = false;
    end;
    l__UserInputService__5.InputChanged:Connect(function(p116) --[[ Line: 381 ]]
        -- upvalues: u94 (copy), u114 (copy)
        if u94.Visible and p116.UserInputType == Enum.UserInputType.MouseMovement then
            u114();
        end;
    end);
    if l__Workspace__6.CurrentCamera then
        l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 388 ]]
            -- upvalues: u94 (copy), u114 (copy)
            if u94.Visible then
                u114();
            end;
        end);
    end;
    local function u119() --[[ Line: 395 ]]
        -- upvalues: l__OfficialModesButton__31 (copy), l__CustomModesButton__32 (copy), l__CreateCustomModeButton__33 (copy), l__CustomModeSearchBox__34 (copy), u35 (ref), l__ModeFeatureFlags__13 (copy), u91 (copy), u92 (copy), l__Modes__20 (copy), l__CustomModes__22 (copy), u48 (ref)
        l__OfficialModesButton__31.Position = UDim2.new(0.04, 0, 0.035, 0);
        l__OfficialModesButton__31.Size = UDim2.new(0.3, 0, 0.085, 0);
        l__CustomModesButton__32.Position = UDim2.new(0.36, 0, 0.035, 0);
        l__CustomModesButton__32.Size = UDim2.new(0.3, 0, 0.085, 0);
        l__CreateCustomModeButton__33.Position = UDim2.new(0.68, 0, 0.035, 0);
        l__CreateCustomModeButton__33.Size = UDim2.new(0.26, 0, 0.085, 0);
        l__CreateCustomModeButton__33.Text = "Create";
        l__CustomModeSearchBox__34.Position = UDim2.new(0.04, 0, 0.13, 0);
        l__CustomModeSearchBox__34.Size = UDim2.new(0.9, 0, 0.07, 0);
        local v117 = u35 == "Custom" and l__ModeFeatureFlags__13.CustomModesEnabled == true and 0.215 or 0.135;
        local v118 = v117 + 0.055;
        if u91 then
            u91.Position = UDim2.new(0.04, 0, v117, 0);
            u91.Size = UDim2.new(0.52, 0, 0.06, 0);
            u91.TextXAlignment = Enum.TextXAlignment.Left;
        end;
        if u92 then
            u92.Position = UDim2.new(0.7, 0, v117, 0);
            u92.Size = UDim2.new(0.24, 0, 0.06, 0);
            u92.TextXAlignment = Enum.TextXAlignment.Center;
        end;
        l__Modes__20.Position = UDim2.new(0.04, 0, v118, 0);
        l__Modes__20.Size = UDim2.new(0.92, 0, 0.965 - v118, 0);
        l__CustomModes__22.Position = UDim2.new(0.04, 0, v118, 0);
        l__CustomModes__22.Size = UDim2.new(0.92, 0, 0.965 - v118, 0);
        if u48 then
            u48.Position = UDim2.new(0.06, 0, 0.925, 0);
            u48.Size = UDim2.new(0.88, 0, 0.04, 0);
        end;
    end;
    local function u133(p120) --[[ Line: 442 ]]
        -- upvalues: l__ModeFeatureFlags__13 (copy), u49 (ref), u63 (copy), u35 (ref), u81 (ref), u119 (copy), l__OfficialModesButton__31 (copy), u26 (copy), u27 (copy), l__CustomModesButton__32 (copy), l__Modes__20 (copy), l__CustomModes__22 (copy), l__CustomModeSearchBox__34 (copy), l__CreateCustomModeButton__33 (copy), l__Servers__24 (copy), u32 (copy), u33 (copy), u36 (ref), u34 (ref), u80 (ref)
        if p120 == "Custom" and l__ModeFeatureFlags__13.CustomModesEnabled ~= true then
            if u49 and type(u49.ShowNotification) == "function" then
                u49.ShowNotification("Warning", "Custom modes are disabled right now.");
                p120 = "Official";
            else
                u63("Custom modes are disabled right now.", true, nil);
                p120 = "Official";
            end;
        end;
        u35 = p120 == "Custom" and "Custom" or "Official";
        u81 = u81 + 1;
        local v121 = l__ModeFeatureFlags__13.CustomModesEnabled == true;
        u119();
        local v122 = l__OfficialModesButton__31;
        local v123;
        if u35 == "Official" then
            v123 = u26;
        else
            v123 = u27;
        end;
        v122.BackgroundColor3 = v123;
        local v124 = l__CustomModesButton__32;
        local v125;
        if u35 == "Custom" then
            v125 = u26;
        else
            v125 = u27;
        end;
        v124.BackgroundColor3 = v125;
        l__CustomModesButton__32.TextTransparency = v121 and 0 or 0.35;
        l__Modes__20.Visible = u35 == "Official";
        local v126 = l__CustomModes__22;
        local v127;
        if u35 == "Custom" then
            v127 = v121;
        else
            v127 = false;
        end;
        v126.Visible = v127;
        local v128 = l__CustomModeSearchBox__34;
        local v129;
        if u35 == "Custom" then
            v129 = v121;
        else
            v129 = false;
        end;
        v128.Visible = v129;
        local v130 = l__CreateCustomModeButton__33;
        if u35 ~= "Custom" then
            v121 = false;
        end;
        v130.Visible = v121;
        l__Servers__24.Visible = false;
        local v131 = u32.LastModeAt[u35] or 0;
        local v132;
        if u33[u35] == true and os.clock() - v131 < u32.ModeListInterval then
            if u35 == "Custom" then
                v132 = u36 ~= u34;
            else
                v132 = false;
            end;
        else
            v132 = true;
        end;
        if v132 and u80 then
            task.defer(u80);
        end;
    end;
    l__OfficialModesButton__31.MouseButton1Click:Connect(function() --[[ Line: 458 ]]
        -- upvalues: u133 (copy)
        u133("Official");
    end);
    l__CustomModesButton__32.MouseButton1Click:Connect(function() --[[ Line: 462 ]]
        -- upvalues: u133 (copy)
        u133("Custom");
    end);
    l__CustomModeSearchBox__34.FocusLost:Connect(function() --[[ Line: 466 ]]
        -- upvalues: u34 (ref), l__CustomModeSearchBox__34 (copy), u33 (copy), u35 (ref), u80 (ref)
        u34 = l__CustomModeSearchBox__34.Text:gsub("^%s+", ""):gsub("%s+$", "");
        u33.Custom = false;
        if u35 == "Custom" and u80 then
            task.defer(u80);
        end;
    end);
    local v134 = l__ModeFeatureFlags__13.CustomModesEnabled == true;
    u119();
    local v135;
    if u35 == "Official" then
        v135 = u26;
    else
        v135 = u27;
    end;
    l__OfficialModesButton__31.BackgroundColor3 = v135;
    local v136;
    if u35 == "Custom" then
        v136 = u26;
    else
        v136 = u27;
    end;
    l__CustomModesButton__32.BackgroundColor3 = v136;
    l__CustomModesButton__32.TextTransparency = v134 and 0 or 0.35;
    l__Modes__20.Visible = u35 == "Official";
    local v137;
    if u35 == "Custom" then
        v137 = v134;
    else
        v137 = false;
    end;
    l__CustomModes__22.Visible = v137;
    local v138;
    if u35 == "Custom" then
        v138 = v134;
    else
        v138 = false;
    end;
    l__CustomModeSearchBox__34.Visible = v138;
    if u35 ~= "Custom" then
        v134 = false;
    end;
    l__CreateCustomModeButton__33.Visible = v134;
    local l__EditCustomModeButton__40 = l__Servers__24:WaitForChild("EditCustomModeButton");
    local u139 = Instance.new("Frame");
    u139.Name = "CustomModeEditor";
    u139.AnchorPoint = Vector2.new(0.5, 0.5);
    u139.Position = UDim2.fromScale(0.5, 0.5);
    u139.Size = UDim2.fromOffset(660, 640);
    u139.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
    u139.BorderSizePixel = 0;
    u139.Visible = false;
    u139.ZIndex = 200;
    u139.Parent = l__Gui__16;
    Instance.new("UICorner", u139).CornerRadius = UDim.new(0, 8);
    local u140 = Instance.new("TextLabel");
    u140.BackgroundTransparency = 1;
    u140.Position = UDim2.fromOffset(16, 10);
    u140.Size = UDim2.new(1, -60, 0, 30);
    u140.Font = Enum.Font.GothamBold;
    u140.Text = "Custom Mode";
    u140.TextColor3 = Color3.new(1, 1, 1);
    u140.TextScaled = true;
    u140.TextXAlignment = Enum.TextXAlignment.Left;
    u140.ZIndex = 201;
    u140.Parent = u139;
    local u141 = Instance.new("TextButton");
    u141.AnchorPoint = Vector2.new(1, 0);
    u141.Position = UDim2.new(1, -10, 0, 10);
    u141.Size = UDim2.fromOffset(28, 28);
    u141.BackgroundColor3 = Color3.fromRGB(155, 58, 58);
    u141.BorderSizePixel = 0;
    u141.Font = Enum.Font.GothamBold;
    u141.Text = "X";
    u141.TextColor3 = Color3.new(1, 1, 1);
    u141.TextScaled = true;
    u141.ZIndex = 201;
    u141.Parent = u139;
    Instance.new("UICorner", u141).CornerRadius = UDim.new(0, 6);
    local u142 = Instance.new("ScrollingFrame");
    u142.Name = "SettingsScroll";
    u142.Position = UDim2.fromOffset(12, 92);
    u142.Size = UDim2.new(1, -24, 1, -224);
    u142.BackgroundColor3 = Color3.fromRGB(34, 34, 34);
    u142.BackgroundTransparency = 0.15;
    u142.BorderSizePixel = 0;
    u142.ScrollBarThickness = 6;
    u142.CanvasSize = UDim2.fromOffset(0, 760);
    u142.ZIndex = 200;
    u142.Parent = u139;
    Instance.new("UICorner", u142).CornerRadius = UDim.new(0, 6);
    local u143 = Instance.new("ScrollingFrame");
    u143.Name = "SettingsTabs";
    u143.Position = UDim2.fromOffset(12, 50);
    u143.Size = UDim2.new(1, -24, 0, 34);
    u143.BackgroundTransparency = 1;
    u143.BorderSizePixel = 0;
    u143.ScrollBarThickness = 0;
    u143.ScrollingDirection = Enum.ScrollingDirection.X;
    u143.CanvasSize = UDim2.fromOffset(640, 0);
    u143.Active = true;
    u143.ZIndex = 202;
    u143.Parent = u139;
    local u144 = Instance.new("Frame");
    u144.Name = "SettingDescription";
    u144.Position = UDim2.new(0, 12, 1, -122);
    u144.Size = UDim2.new(1, -24, 0, 70);
    u144.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
    u144.BackgroundTransparency = 0.05;
    u144.BorderSizePixel = 0;
    u144.ZIndex = 202;
    u144.Parent = u139;
    Instance.new("UICorner", u144).CornerRadius = UDim.new(0, 6);
    local u145 = Instance.new("TextLabel");
    u145.BackgroundTransparency = 1;
    u145.Position = UDim2.fromOffset(10, 6);
    u145.Size = UDim2.new(1, -20, 0, 18);
    u145.Font = Enum.Font.GothamBold;
    u145.Text = "Hover a setting";
    u145.TextColor3 = Color3.fromRGB(255, 170, 80);
    u145.TextSize = 14;
    u145.TextXAlignment = Enum.TextXAlignment.Left;
    u145.ZIndex = 203;
    u145.Parent = u144;
    local u146 = Instance.new("TextLabel");
    u146.BackgroundTransparency = 1;
    u146.Position = UDim2.fromOffset(10, 26);
    u146.Size = UDim2.new(1, -20, 1, -30);
    u146.Font = Enum.Font.Gotham;
    u146.Text = "Move between tabs, then hover any label or value to see what it changes. All values are validated on the server before they can affect gameplay.";
    u146.TextColor3 = Color3.fromRGB(220, 220, 220);
    u146.TextSize = 12;
    u146.TextWrapped = true;
    u146.TextXAlignment = Enum.TextXAlignment.Left;
    u146.TextYAlignment = Enum.TextYAlignment.Top;
    u146.ZIndex = 203;
    u146.Parent = u144;
    local u147 = 4;
    local u148 = 155;
    local u149 = 140;
    local u150 = 145;
    local function u156() --[[ Line: 584 ]]
        -- upvalues: u139 (copy), u147 (ref), u148 (ref), u149 (ref), u150 (ref)
        local l__X__41 = u139.AbsoluteSize.X;
        local v151 = l__X__41 <= 0 and 660 or l__X__41;
        local v152 = math.max(260, v151 - 40);
        if v151 < 430 then
            u147 = 2;
        elseif v151 < 620 then
            u147 = 3;
        else
            u147 = 4;
        end;
        local v153 = math.floor(v152 / u147);
        u148 = math.max(118, v153);
        local v154 = math.min(140, u148 - 12);
        u149 = math.max(108, v154);
        local v155 = math.min(145, u148 - 8);
        u150 = math.max(112, v155);
    end;
    local u157 = {
        {
            Id = "Basic",
            Text = "Basic"
        },
        {
            Id = "Core",
            Text = "Core"
        },
        {
            Id = "World",
            Text = "World"
        },
        {
            Id = "Player",
            Text = "Player"
        },
        {
            Id = "Actions",
            Text = "Actions"
        },
        {
            Id = "Food",
            Text = "Food"
        },
        {
            Id = "Objects",
            Text = "Objects"
        },
        {
            Id = "Physics",
            Text = "Physics"
        },
        {
            Id = "Teams",
            Text = "Teams"
        }
    };
    local u158 = {
        Basic = "The safest first-pass settings: mode name, player cap, map size, starting mass, and max cells.",
        Core = "Access, listing rules, and server tick rates for the custom mode.",
        World = "World generation and safe spawn rules. These values decide map size, map growth, and how far new objects try to spawn from players or other objects.",
        Player = "Player cell rules: starting mass, movement curve, max cells, eating thresholds, self-collision, and score reset limits.",
        Actions = "Active player actions: split, merge, and W/eject behavior. Use these to make modes snappy, slow, chaotic, or strict.",
        Food = "Food and negative food rules. These control amount, size, growth gain, lifetime, chunk density, and how quickly food recycles.",
        Objects = "Map object rules for viruses, spawners, coins, and golden blocks. This tab changes object counts, rewards, pushing, feeding, and cooldown behavior.",
        Physics = "Low-level physics and decay tuning. These values can change server cost, object sleep behavior, bounce sensitivity, and collision scan size.",
        Teams = "Team-mode rules: team count, friendly eating, same-team collision, and bounce behavior between allies."
    };
    local u159 = {
        Name = "The display name players see in the custom mode list and server list. Keep it short and readable; the server trims unsafe characters and length.",
        MaxPlayers = "The maximum number of players that should be allowed into servers for this mode. Higher values make the mode busier, but also increase network and physics load.",
        Public = "If ON, this mode can appear in the public/community list. If OFF, it is meant for private or invite-style use and should not be promoted broadly.",
        BotsEnabled = "If ON, players can activate bot boost packs in this custom mode. Turn it OFF for fair competitive modes.",
        AbilitiesEnabled = "If ON, players can use equipped ability actions and placeable ability items in this custom mode.",
        MapSize = "Base square map size before growth per player is applied. Larger maps spread players out and reduce early fights, but need more food/object coverage.",
        StartMass = "How much mass each player starts with when spawning. This is converted into a starting radius on the server.",
        MaxCells = "Maximum number of cells a player can split into. Higher values create 64/128-style modes, but increase collision and networking work.",
        SpeedMultiplier = "Global movement multiplier for all player cells in this mode. It stacks on top of the detailed movement curve values.",
        FoodAmount = "Target amount of normal food on the map. If this is 0, the server uses the safe default while Food is ON.",
        FoodGivesMass = "If ON, eating normal food increases player size. Food gain min/max controls how much mass each pellet gives.",
        FoodMassMin = "Minimum mass gained from one normal food pellet. Use 10 or more if you want visible score changes.",
        FoodMassMax = "Maximum mass gained from one normal food pellet. If gain = radius^2 is ON, radius controls the gain instead.",
        FoodMassFromRadius = "If ON, food gain is radius squared, so radius 5 gives 25 mass.",
        EjectedMassGivesMass = "If ON, W/ejected mass can be eaten and adds size like food. Can eat own eject controls whether players can eat their own ejected mass.",
        EjectedMassSelfEat = "If ON, players can eat their own W/ejected mass. Turn it OFF for hardcore no-self-feed modes.",
        EjectedMassMinRadius = "Minimum cell radius needed to press W. Lower values let players eject earlier.",
        EjectedMassMinRemainingRadius = "Minimum radius a cell must keep after ejecting mass. Lower values make W available at smaller sizes.",
        ServerTickRate = "How many world update batches per second this mode sends. Lower values reduce Recv spikes and server work; higher values feel more responsive.",
        PhysicsTickRate = "How many fixed physics steps per second this mode runs. Lower values reduce ServerGameplay load; higher values make collision and pushing feel more exact.",
        NegativeFoodAmount = "Target amount of red negative food. When eaten, it subtracts mass instead of adding mass, creating trap or challenge modes.",
        VirusAmount = "Target number of viruses/ spikes on the map. More viruses make split traps and map control more important.",
        SpawnerAmount = "Target number of mass spawners. Spawners can absorb mass and release food pellets back into the world.",
        GoldenBlockPushForce = "How strongly a player collision pushes a golden block. Higher values make the block move more easily when touched.",
        GoldenBlockPushShare = "How much of the collision displacement goes into the golden block instead of pushing the player away. High values make the block feel light.",
        PhysicsSleepSpeed = "Velocity threshold where moving objects are put to sleep. Higher values reduce server work faster, but can make objects stop sooner."
    };
    local function u161(p160) --[[ Line: 663 ]]
        return (p160 == "Name" or (p160 == "MaxPlayers" or (p160 == "MapSize" or (p160 == "StartMass" or p160 == "MaxCells")))) and "Basic" or ((p160 == "Public" or (p160 == "BotsEnabled" or (p160 == "AbilitiesEnabled" or (p160 == "ServerTickRate" or p160 == "PhysicsTickRate")))) and "Core" or ((p160:find("^Map") or (p160:find("Safe") or p160 == "ObjectSafeDistance")) and "World" or ((p160:find("Team") or p160 == "FriendlyEat") and "Teams" or ((p160:find("^Player") or (p160 == "StartMass" or (p160 == "MaxCells" or (p160 == "SpeedMultiplier" or (p160 == "SelfMergeOverlap" or p160 == "OwnCellCollisionIterations"))))) and "Player" or ((p160:find("^Split") or (p160:find("^Merge") or p160:find("^EjectedMass"))) and "Actions" or (p160:find("Food") and "Food" or ((p160:find("^Virus") or (p160:find("^Spawner") or (p160:find("^Gold") or p160:find("^GoldenBlock")))) and "Objects" or ((p160:find("Decay") or (p160:find("Physics") or (p160:find("Collision") or (p160 == "ActiveCollisionPadding" or p160 == "PlayerCollisionPadding")))) and "Physics" or "Core"))))))));
    end;
    local function u165(p162, p163) --[[ Line: 676 ]]
        -- upvalues: u159 (copy)
        local v164 = u159[p162];
        if v164 then
            return v164;
        elseif p162:find("^PlayerMove") then
            return p163 .. " changes the movement speed formula. It affects how fast cells move as their radius grows, so extreme values can make large cells too fast or tiny cells too slow.";
        elseif p162:find("^Split") then
            return p163 .. " tunes split behavior. These values control split cooldown, launch force, recoil, flight time, and how soft cells collide while flying.";
        elseif p162:find("^EjectedMass") then
            return p163 .. " tunes W/ejected mass. It controls cost, projectile speed, spawn offset, lifetime, and how quickly repeated ejecting can happen.";
        elseif p162:find("^Food") then
            return p163 .. " tunes normal food spawning. It affects how much food exists, how big it is, how much mass it gives, and how dense chunks can become.";
        elseif p162:find("^NegativeFood") then
            return p163 .. " tunes negative food. Negative food is a red hazard that reduces player mass when eaten, useful for trap, hardcore, and chaos modes.";
        elseif p162:find("^Virus") then
            return p163 .. " tunes viruses/spikes. It affects amount, radius, pushing, splitting, bounce, and how often the server retries safe virus spawning.";
        elseif p162:find("^Spawner") then
            return p163 .. " tunes mass spawners. It affects how they absorb mass, how they visually grow, and how they release food pellets back onto the map.";
        elseif p162:find("^GoldenBlock") then
            return p163 .. " tunes golden blocks. It affects pushing, feeding, coin output, cooldowns, reward value, and how the block interacts with other map objects.";
        elseif p162:find("Decay") then
            return p163 .. " changes mass decay. Higher decay makes large players shrink faster; lower decay makes long survival and giant cells easier.";
        elseif p162:find("Physics") or p162:find("Collision") then
            return p163 .. " changes low-level physics. Be careful: these values can affect smoothness, server cost, and how often objects collide or go to sleep.";
        elseif p162 == "TeamCount" then
            return "How many teams this custom mode uses. Any whole number from 2 to 16 is allowed; the server creates matching team colors and balances new players into the least populated team.";
        elseif p162:find("Team") or p162 == "FriendlyEat" then
            return p163 .. " changes team-mode rules. It affects how teams are assigned and whether allies can collide with or eat each other.";
        else
            return p163 .. " changes a server-validated custom mode rule. The value is clamped by the server, so invalid or extreme input is corrected before the mode can run.";
        end;
    end;
    local function u180() --[[ Line: 708 ]]
        -- upvalues: u156 (copy), u139 (copy), u157 (copy), u86 (copy), u87 (ref), u143 (copy), u85 (copy), u147 (ref), u148 (ref), u150 (ref), u149 (ref), u142 (copy), u145 (copy), u146 (copy), u158 (copy)
        u156();
        local v166 = u139.AbsoluteSize.X < 520 and 58 or 66;
        for v167, v168 in ipairs(u157) do
            local v169 = u86[v168.Id];
            if v169 then
                v169.Position = UDim2.fromOffset((v167 - 1) * (v166 + 4), 0);
                v169.Size = UDim2.fromOffset(v166, 30);
                local v170;
                if v168.Id == u87 then
                    v170 = Color3.fromRGB(255, 85, 0);
                else
                    v170 = Color3.fromRGB(82, 82, 82);
                end;
                v169.BackgroundColor3 = v170;
            end;
        end;
        if u143:IsA("ScrollingFrame") then
            u143.CanvasSize = UDim2.fromOffset(#u157 * (v166 + 4), 0);
        end;
        local v171 = 0;
        for _, v172 in ipairs(u85) do
            local v173 = v172.Tab == u87;
            if v172.Label then
                v172.Label.Visible = v173;
            end;
            v172.Control.Visible = v173;
            if v173 then
                v171 = v171 + 1;
                local v174 = (v171 - 1) % u147;
                local v175 = math.floor((v171 - 1) / u147);
                local v176 = v174 * u148 + 8;
                local v177 = v175 * 40 + 8;
                if v172.Label then
                    v172.Label.Position = UDim2.fromOffset(v176, v177);
                    v172.Label.Size = UDim2.fromOffset(u150, 14);
                    v172.Control.Position = UDim2.fromOffset(v176, v177 + 16);
                else
                    v172.Control.Position = UDim2.fromOffset(v176, v177 + 8);
                end;
                v172.Control.Size = UDim2.fromOffset(u149, 22);
            end;
        end;
        local v178 = math.ceil(v171 / u147);
        local v179 = math.max(1, v178);
        u142.CanvasSize = UDim2.fromOffset(0, v179 * 40 + 12);
        u142.CanvasPosition = Vector2.new(0, 0);
        u145.Text = u87;
        u146.Text = u158[u87] or "Hover a setting to see what it changes.";
    end;
    local u181 = u48;
    local u182 = u49;
    local u183 = u147;
    local u184 = u148;
    local function u194(u185, u186, p187, p188) --[[ Line: 699 ]]
        -- upvalues: u161 (copy), u85 (copy), u145 (copy), u146 (copy), u165 (copy)
        local v189 = u161(u185);
        u85[#u85 + 1] = {
            Key = u185,
            LabelText = u186,
            Label = p187,
            Control = p188,
            Tab = v189
        };
        p188.MouseEnter:Connect(function() --[[ Line: 702 ]]
            -- upvalues: u185 (copy), u186 (copy), u145 (ref), u146 (ref), u165 (ref)
            local v190 = u185;
            local v191 = u186;
            u145.Text = v191 .. "  /  " .. v190;
            u146.Text = u165(v190, v191);
        end);
        if p187 then
            p187.MouseEnter:Connect(function() --[[ Line: 704 ]]
                -- upvalues: u185 (copy), u186 (copy), u145 (ref), u146 (ref), u165 (ref)
                local v192 = u185;
                local v193 = u186;
                u145.Text = v193 .. "  /  " .. v192;
                u146.Text = u165(v192, v193);
            end);
        end;
    end;
    for v195, u196 in ipairs(u157) do
        local v197 = Instance.new("TextButton");
        v197.Name = u196.Id .. "Tab";
        v197.Position = UDim2.fromOffset((v195 - 1) * 70, 0);
        v197.Size = UDim2.fromOffset(66, 30);
        v197.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
        v197.BorderSizePixel = 0;
        v197.Font = Enum.Font.GothamBold;
        v197.Text = u196.Text;
        v197.TextColor3 = Color3.new(1, 1, 1);
        v197.TextScaled = true;
        v197.ZIndex = 203;
        v197.Parent = u143;
        Instance.new("UICorner", v197).CornerRadius = UDim.new(0, 6);
        v197.MouseButton1Click:Connect(function() --[[ Line: 764 ]]
            -- upvalues: u87 (ref), u196 (copy), u180 (copy)
            u87 = u196.Id;
            u180();
        end);
        u86[u196.Id] = v197;
    end;
    local function v208(p198, p199, p200, p201) --[[ Line: 771 ]]
        -- upvalues: u183 (ref), u184 (ref), u142 (copy), u83 (copy), u194 (copy)
        local v202 = (p201 - 1) % u183;
        local v203 = math.floor((p201 - 1) / u183);
        local v204 = v202 * u184 + 8;
        local v205 = v203 * 40 + 8;
        local v206 = Instance.new("TextLabel");
        v206.BackgroundTransparency = 1;
        v206.Position = UDim2.fromOffset(v204, v205);
        v206.Size = UDim2.fromOffset(145, 14);
        v206.Font = Enum.Font.Gotham;
        v206.Text = p199;
        v206.TextColor3 = Color3.fromRGB(220, 220, 220);
        v206.TextScaled = true;
        v206.TextXAlignment = Enum.TextXAlignment.Left;
        v206.ZIndex = 201;
        v206.Parent = u142;
        local v207 = Instance.new("TextBox");
        v207.Name = p198;
        v207.Position = UDim2.fromOffset(v204, v205 + 16);
        v207.Size = UDim2.fromOffset(140, 22);
        v207.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
        v207.BorderSizePixel = 0;
        v207.ClearTextOnFocus = false;
        v207.Font = Enum.Font.GothamMedium;
        v207.Text = p200;
        v207.TextColor3 = Color3.new(1, 1, 1);
        v207.TextScaled = true;
        v207.ZIndex = 201;
        v207.Parent = u142;
        Instance.new("UICorner", v207).CornerRadius = UDim.new(0, 5);
        u83[p198] = v207;
        u194(p198, p199, v206, v207);
    end;
    local function v222(u209, u210, p211, p212) --[[ Line: 804 ]]
        -- upvalues: u183 (ref), u184 (ref), u142 (copy), u84 (copy), u161 (copy), u85 (copy), u145 (copy), u146 (copy), u165 (copy)
        local v213 = (p212 - 1) % u183;
        local v214 = math.floor((p212 - 1) / u183);
        local v215 = v213 * u184 + 8;
        local v216 = v214 * 40 + 8;
        local u217 = Instance.new("TextButton");
        u217.Name = u209;
        u217.Position = UDim2.fromOffset(v215, v216 + 16);
        u217.Size = UDim2.fromOffset(140, 22);
        u217.BorderSizePixel = 0;
        u217.Font = Enum.Font.GothamBold;
        u217.TextColor3 = Color3.new(1, 1, 1);
        u217.TextScaled = true;
        u217.ZIndex = 201;
        u217.Parent = u142;
        Instance.new("UICorner", u217).CornerRadius = UDim.new(0, 5);
        local u218 = {
            Button = u217,
            Value = p211
        };
        u84[u209] = u218;
        u217.MouseButton1Click:Connect(function() --[[ Line: 825 ]]
            -- upvalues: u218 (copy), u217 (copy), u210 (copy)
            u218.Value = not u218.Value;
            u217.Text = u210 .. ": " .. (u218.Value and "ON" or "OFF");
            u217.BackgroundColor3 = u218.Value and Color3.fromRGB(255, 85, 0) or Color3.fromRGB(82, 82, 82);
        end);
        u217.Text = u210 .. ": " .. (u218.Value and "ON" or "OFF");
        u217.BackgroundColor3 = u218.Value and Color3.fromRGB(255, 85, 0) or Color3.fromRGB(82, 82, 82);
        local v219 = u161(u209);
        u85[#u85 + 1] = {
            Label = nil,
            Key = u209,
            LabelText = u210,
            Control = u217,
            Tab = v219
        };
        u217.MouseEnter:Connect(function() --[[ Line: 702 ]]
            -- upvalues: u209 (copy), u210 (copy), u145 (ref), u146 (ref), u165 (ref)
            local v220 = u209;
            local v221 = u210;
            u145.Text = v221 .. "  /  " .. v220;
            u146.Text = u165(v220, v221);
        end);
    end;
    v208("Name", "Name", "Custom Mode", 1);
    v208("MaxPlayers", "Players 5-999", "25", 2);
    v208("ServerTickRate", "Server tick 8-30", "15", 3);
    v208("PhysicsTickRate", "Physics tick 20-60", "45", 4);
    v208("MapSize", "Map 3000-15000", "6000", 5);
    v208("MapGrowthPerPlayer", "Map growth", "250", 4);
    v208("StartMass", "Start mass", "20", 5);
    v208("MaxCells", "Cells", "16", 6);
    v208("SpeedMultiplier", "Move speed", "1", 7);
    v208("PlayerMaxScore", "Max score 1K-100M", "10000000", 8);
    v208("PlayerEatRatio", "Eat ratio", "1.12", 9);
    v208("PlayerEatOverlap", "Eat overlap", "0.25", 10);
    v208("SelfMergeOverlap", "Merge overlap", "0.35", 11);
    v208("OwnCellCollisionIterations", "Self collide", "3", 12);
    v208("SplitFlightSoftCollision", "Soft split", "0.08", 13);
    v208("SplitCooldown", "Split cd", "0.08", 14);
    v208("SplitForce", "Split force", "1", 15);
    v208("SplitMinRadius", "Split min", "40", 16);
    v208("SplitBaseBoost", "Split boost", "900", 17);
    v208("SplitRadiusBoost", "Radius boost", "4500", 18);
    v208("SplitRadiusBoostCap", "Boost cap", "600", 19);
    v208("SplitSpeedBoostMultiplier", "Speed split", "1.7", 20);
    v208("SplitFlightTime", "Flight time", "0.65", 21);
    v208("SplitRecoilMultiplier", "Split recoil", "0.08", 22);
    v208("SplitSpawnOffset", "Split offset", "0.2", 23);
    v208("MergeDelayMultiplier", "Merge mult", "1", 24);
    v208("MergeDelay", "Merge sec", "0", 25);
    v208("MergePullSpeed", "Merge pull", "1000", 26);
    v208("FoodAmount", "Food count", "900", 27);
    v208("FoodSpawnBatch", "Food batch", "30", 28);
    v208("FoodLifetime", "Food life", "150", 29);
    v208("FoodRadiusMin", "Food r min", "5", 30);
    v208("FoodRadiusMax", "Food r max", "5", 31);
    v208("FoodMassMin", "Food gain min", "10", 32);
    v208("FoodMassMax", "Food gain max", "10", 33);
    v208("NegativeFoodAmount", "Neg food", "0", 34);
    v208("NegativeFoodRadiusMin", "Neg r min", "8", 35);
    v208("NegativeFoodRadiusMax", "Neg r max", "18", 36);
    v208("NegativeFoodMassMin", "Neg m min", "50", 37);
    v208("NegativeFoodMassMax", "Neg m max", "300", 38);
    v208("NegativeFoodLifetime", "Neg life", "180", 39);
    v208("VirusAmount", "Viruses", "25", 40);
    v208("VirusRadius", "Virus radius", "60", 41);
    v208("VirusFriction", "Virus friction", "-3", 42);
    v208("VirusPushScale", "Virus push", "0.35", 43);
    v208("VirusSplitFeedCount", "Virus feed #", "7", 44);
    v208("VirusSplitFeedMassRequired", "Virus feed mass", "100", 45);
    v208("SpawnerAmount", "Spawners", "6", 46);
    v208("SpawnerRadius", "Spawner r", "100", 47);
    v208("GoldAmount", "Gold count", "80", 48);
    v208("GoldValue", "Gold value", "50", 49);
    v208("GoldRadius", "Gold radius", "10", 50);
    v208("GoldenBlockAmount", "Gold blocks", "2", 51);
    v208("GoldenBlockRadius", "Block radius", "160", 52);
    v208("GoldenBlockPushForce", "Block push", "1.75", 53);
    v208("GoldenBlockPushShare", "Block share", "0.72", 54);
    v208("EjectedMassSize", "Eject size", "12", 55);
    v208("EjectedMassSpeed", "Eject speed", "1050", 56);
    v208("EjectedMassMinRadius", "Eject min", "20", 57);
    v208("EjectedMassLifetime", "Eject life", "60", 58);
    v208("EjectedMassFriction", "Eject friction", "-7.5", 59);
    v208("DecayMultiplier", "Decay mult", "1.8", 60);
    v208("DecayMinRadius", "Decay min r", "30", 61);
    v208("NormalDecayRate", "Normal decay", "0.00115", 62);
    v208("FastDecayRate", "Fast decay", "0.0125", 63);
    v208("FastDecayThreshold", "Fast mass", "100000", 64);
    v208("UltraDecayRate", "Ultra decay", "0.025", 65);
    v208("UltraDecayThreshold", "Ultra mass", "13000000", 66);
    v208("TeamCount", "Teams 2-16", "2", 67);
    v208("SameTeamBounce", "Team bounce", "0.85", 68);
    v222("FoodEnabled", "Food", true, 69);
    v222("FoodGivesMass", "Eating grows", true, 70);
    v222("FoodMassFromRadius", "Gain = radius^2", false, 71);
    v222("NegativeFoodEnabled", "Negative food", false, 72);
    v222("VirusEnabled", "Virus", true, 73);
    v222("VirusPushEnabled", "Push virus", false, 74);
    v222("SpikeCollisionEnabled", "Virus collide", true, 75);
    v222("SpawnerEnabled", "Spawners", true, 76);
    v222("GoldEnabled", "Gold", true, 77);
    v222("GoldenBlockEnabled", "Gold blocks", true, 78);
    v222("SplitEnabled", "Split", true, 79);
    v222("EjectedMassEnabled", "W/eject", true, 80);
    v222("EjectedMassCostsMass", "W costs mass", true, 81);
    v222("EjectedMassGivesMass", "Eject gives mass", true, 82);
    v222("EjectedMassSelfEat", "Can eat own eject", true, 83);
    v222("BotsEnabled", "Bots", true, 84);
    v222("AbilitiesEnabled", "Abilities", true, 85);
    v222("DecayEnabled", "Decay", true, 86);
    v222("TeamsEnabled", "Teams", false, 87);
    v222("SameTeamCollision", "Team collision", false, 88);
    v222("FriendlyEat", "Friendly eat", false, 89);
    v222("Public", "Public", true, 90);
    v208("MapSafePadding", "Map padding", "100", 87);
    v208("SafeSpawnAttempts", "Spawn tries", "120", 88);
    v208("PlayerSafeDistance", "Safe dist", "700", 89);
    v208("PlayerSafeRadiusPadding", "Safe radius", "500", 90);
    v208("ObjectSafeDistance", "Object dist", "500", 91);
    v208("PlayerMoveBaseSpeed", "Move base", "180", 92);
    v208("PlayerMoveBaseRadius", "Move radius", "100", 93);
    v208("PlayerMoveMinSpeed", "Move min", "40", 94);
    v208("PlayerMoveMaxSpeed", "Move max", "300", 95);
    v208("PlayerMoveRadiusPower", "Move curve", "1", 96);
    v208("FoodChunkLimitExtra", "Food chunk +", "1", 97);
    v208("FoodRecyclePerTick", "Food cleanup", "15", 98);
    v208("NegativeFoodSpawnBatch", "Neg batch", "12", 99);
    v208("VirusSplitSpeed", "Virus split spd", "1600", 100);
    v208("VirusBounceFactor", "Virus bounce", "0.3", 101);
    v208("VirusAutoSpawnSuccessDelay", "Virus delay", "0.2", 102);
    v208("VirusAutoSpawnFailDelay", "Virus retry", "1.5", 103);
    v208("SpawnerFeedMultiplier", "Spawner feed", "1.333", 104);
    v208("SpawnerVisualCapRadius", "Spawner cap", "750", 105);
    v208("SpawnerDrainInterval", "Drain time", "0.2", 106);
    v208("SpawnerDrainRatio", "Drain ratio", "0.25", 107);
    v208("SpawnerDrainMin", "Drain min", "20", 108);
    v208("SpawnerDrainMax", "Drain max", "3000", 109);
    v208("SpawnerPelletMax", "Pellets max", "8", 110);
    v208("SpawnerPelletMassRatio", "Pellet ratio", "0.1", 111);
    v208("SpawnerPelletMassFloor", "Pellet floor", "50", 112);
    v208("SpawnerPelletMassCap", "Pellet cap", "900", 113);
    v208("SpawnerPelletSpeed", "Pellet speed", "450", 114);
    v208("GoldenBlockFriction", "Block friction", "-1.4", 115);
    v208("GoldenBlockBounceFactor", "Block bounce", "0.5", 116);
    v208("GoldenBlockFeedRequired", "Block feed req", "500", 117);
    v208("GoldenBlockCoinChance", "Coin chance", "0.3", 118);
    v208("GoldenBlockCoinSpeed", "Coin speed", "350", 119);
    v208("GoldenBlockCoinReward", "Coin reward", "50", 120);
    v208("GoldenBlockCapacity", "Block capacity", "10000", 121);
    v208("GoldenBlockCooldown", "Block cd", "60", 122);
    v208("GoldenBlockCoinSpawnOffset", "Coin offset", "40", 123);
    v208("EjectedMassMinRemainingRadius", "Eject keep", "20", 124);
    v208("EjectedMassSpawnOffset", "Eject offset", "15", 125);
    v208("EjectedMassAutoInterval", "Eject rate", "0.1", 126);
    v208("PhysicsSleepSpeed", "Sleep speed", "2", 127);
    v208("PhysicsBounceMinOverlap", "Bounce min", "1.5", 128);
    v208("ActiveCollisionPadding", "Active pad", "20", 129);
    v208("PlayerCollisionPadding", "Player pad", "100", 130);
    u180();
    local u223 = Instance.new("TextButton");
    u223.Position = UDim2.new(0, 16, 1, -42);
    u223.Size = UDim2.fromOffset(180, 32);
    u223.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
    u223.BorderSizePixel = 0;
    u223.Font = Enum.Font.GothamBold;
    u223.Text = "Save";
    u223.TextColor3 = Color3.new(1, 1, 1);
    u223.TextScaled = true;
    u223.ZIndex = 201;
    u223.Parent = u139;
    Instance.new("UICorner", u223).CornerRadius = UDim.new(0, 6);
    local u224 = Instance.new("TextButton");
    u224.Position = UDim2.new(0, 208, 1, -42);
    u224.Size = UDim2.fromOffset(120, 32);
    u224.BackgroundColor3 = Color3.fromRGB(155, 58, 58);
    u224.BorderSizePixel = 0;
    u224.Font = Enum.Font.GothamBold;
    u224.Text = "Delete";
    u224.TextColor3 = Color3.new(1, 1, 1);
    u224.TextScaled = true;
    u224.ZIndex = 201;
    u224.Parent = u139;
    Instance.new("UICorner", u224).CornerRadius = UDim.new(0, 6);
    local u225 = Instance.new("TextButton");
    u225.Position = UDim2.new(0, 340, 1, -42);
    u225.Size = UDim2.fromOffset(145, 32);
    u225.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
    u225.BorderSizePixel = 0;
    u225.Font = Enum.Font.GothamBold;
    u225.Text = "Restart live";
    u225.TextColor3 = Color3.new(1, 1, 1);
    u225.TextScaled = true;
    u225.ZIndex = 201;
    u225.Parent = u139;
    Instance.new("UICorner", u225).CornerRadius = UDim.new(0, 6);
    local function u243() --[[ Line: 1010 ]]
        -- upvalues: l__Workspace__6 (copy), l__UserInputService__5 (copy), u139 (copy), u140 (copy), u141 (copy), u143 (copy), u142 (copy), u144 (copy), u145 (copy), u146 (copy), u223 (copy), u224 (copy), u225 (copy), u180 (copy)
        local l__CurrentCamera__42 = l__Workspace__6.CurrentCamera;
        local v226;
        if l__CurrentCamera__42 then
            v226 = l__CurrentCamera__42.ViewportSize;
        else
            v226 = Vector2.new(1280, 720);
        end;
        local v227 = math.clamp(v226.X - 24, 320, 660);
        local v228 = math.floor(v227);
        local v229 = math.clamp(v226.Y - 24, 240, 640);
        local v230 = math.floor(v229);
        if l__UserInputService__5.TouchEnabled then
            local v231 = math.clamp(v226.X - 18, 320, 660);
            v228 = math.floor(v231);
            local v232 = math.clamp(v226.Y - 18, 230, 640);
            v230 = math.floor(v232);
        end;
        local v233 = v230 < 430 and true or v228 < 560;
        u139.Size = UDim2.fromOffset(v228, v230);
        u140.Position = UDim2.fromOffset(12, 8);
        u140.Size = UDim2.new(1, -56, 0, v233 and 24 or 30);
        u141.Position = UDim2.new(1, -8, 0, 8);
        u141.Size = UDim2.fromOffset(v233 and 24 or 28, v233 and 24 or 28);
        local v234 = v233 and 40 or 50;
        local v235 = v233 and 30 or 34;
        u143.Position = UDim2.fromOffset(12, v234);
        u143.Size = UDim2.fromOffset(v228 - 24, v235);
        local v236 = v233 and 28 or 32;
        local v237 = v230 - v236 - 10;
        local v238 = math.max(v234 + v235 + 78, v237 - (v233 and 48 or 70) - 10);
        u142.Position = UDim2.fromOffset(12, v234 + v235 + 8);
        u142.Size = UDim2.fromOffset(v228 - 24, (math.max(70, v238 - (v234 + v235 + 8) - 8)));
        u142.ScrollBarThickness = v233 and 4 or 6;
        u144.Position = UDim2.fromOffset(12, v238);
        u144.Size = UDim2.fromOffset(v228 - 24, (math.max(42, v237 - v238 - 8)));
        u145.Position = UDim2.fromOffset(8, 5);
        u145.Size = UDim2.new(1, -16, 0, v233 and 15 or 18);
        u145.TextSize = v233 and 12 or 14;
        u146.Position = UDim2.fromOffset(8, v233 and 22 or 26);
        u146.Size = UDim2.new(1, -16, 1, v233 and -24 or -30);
        u146.TextSize = v233 and 10 or 12;
        local v239 = v228 - 32;
        local v240 = not v233 and 180 or math.floor(v239 * 0.34);
        local v241 = not v233 and 120 or math.floor(v239 * 0.26);
        local v242 = math.max(96, v239 - v240 - v241 - 16);
        u223.Position = UDim2.fromOffset(12, v237);
        u223.Size = UDim2.fromOffset(v240, v236);
        u224.Position = UDim2.fromOffset(v240 + 20, v237);
        u224.Size = UDim2.fromOffset(v241, v236);
        u225.Position = UDim2.fromOffset(v240 + 28 + v241, v237);
        u225.Size = UDim2.fromOffset(v242, v236);
        u180();
    end;
    if l__Workspace__6.CurrentCamera then
        l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 1065 ]]
            -- upvalues: u139 (copy), u243 (copy)
            if u139.Visible then
                u243();
            end;
        end);
    end;
    local function u247(p244, p245) --[[ Line: 1072 ]]
        -- upvalues: u84 (copy)
        local v246 = u84[p244];
        if v246 then
            v246.Value = p245;
            v246.Button.Text = v246.Button.Text:gsub(": .*$", ": " .. (v246.Value and "ON" or "OFF"));
            v246.Button.BackgroundColor3 = v246.Value and Color3.fromRGB(255, 85, 0) or Color3.fromRGB(82, 82, 82);
        end;
    end;
    local function u264(p248) --[[ Line: 1080 ]]
        -- upvalues: u41 (ref), u140 (copy), u223 (copy), u224 (copy), u225 (copy), u83 (copy), u247 (copy), u87 (ref), u139 (copy), u243 (copy)
        local v249;
        if p248 then
            v249 = tostring(p248.Id or "") or nil;
        else
            v249 = nil;
        end;
        u41 = v249;
        local v250 = p248 and p248.Settings or nil;
        local v251 = type(v250) == "table" and v250 and v250 or {};
        u140.Text = u41 and u41 ~= "" and "Edit Custom Mode" or "Create Custom Mode";
        u223.Text = u41 and u41 ~= "" and "Save" or "Create";
        local v252 = u224;
        local v253;
        if u41 == nil then
            v253 = false;
        else
            v253 = u41 ~= "";
        end;
        v252.Visible = v253;
        local v254 = u225;
        local v255;
        if u41 == nil then
            v255 = false;
        else
            v255 = u41 ~= "";
        end;
        v254.Visible = v255;
        local v256 = {
            Name = "Custom Mode",
            MaxPlayers = 25,
            ServerTickRate = 15,
            PhysicsTickRate = 45,
            MapSize = 6000,
            MapGrowthPerPlayer = 250,
            MapSafePadding = 100,
            SafeSpawnAttempts = 120,
            PlayerSafeDistance = 700,
            PlayerSafeRadiusPadding = 500,
            ObjectSafeDistance = 500,
            StartMass = 20,
            MaxCells = 16,
            SpeedMultiplier = 1,
            PlayerMoveBaseSpeed = 180,
            PlayerMoveBaseRadius = 100,
            PlayerMoveMinSpeed = 40,
            PlayerMoveMaxSpeed = 300,
            PlayerMoveRadiusPower = 1,
            PlayerMaxScore = 10000000,
            PlayerEatRatio = 1.12,
            PlayerEatOverlap = 0.25,
            SelfMergeOverlap = 0.35,
            OwnCellCollisionIterations = 3,
            SplitFlightSoftCollision = 0.08,
            SplitCooldown = 0.08,
            SplitForce = 1,
            SplitMinRadius = 40,
            SplitBaseBoost = 900,
            SplitRadiusBoost = 4500,
            SplitRadiusBoostCap = 600,
            SplitSpeedBoostMultiplier = 1.7,
            SplitFlightTime = 0.65,
            SplitRecoilMultiplier = 0.08,
            SplitSpawnOffset = 0.2,
            MergeDelayMultiplier = 1,
            MergeDelay = 0,
            MergePullSpeed = 1000,
            FoodAmount = 900,
            FoodSpawnBatch = 30,
            FoodLifetime = 150,
            FoodRadiusMin = 5,
            FoodRadiusMax = 5,
            FoodMassMin = 10,
            FoodMassMax = 10,
            FoodChunkLimitExtra = 1,
            FoodRecyclePerTick = 15,
            NegativeFoodAmount = 0,
            NegativeFoodRadiusMin = 8,
            NegativeFoodRadiusMax = 18,
            NegativeFoodMassMin = 50,
            NegativeFoodMassMax = 300,
            NegativeFoodLifetime = 180,
            NegativeFoodSpawnBatch = 12,
            VirusAmount = 25,
            VirusRadius = 60,
            VirusFriction = -3,
            VirusPushScale = 0.35,
            VirusSplitFeedCount = 7,
            VirusSplitFeedMassRequired = 100,
            VirusSplitSpeed = 1600,
            VirusBounceFactor = 0.3,
            VirusAutoSpawnSuccessDelay = 0.2,
            VirusAutoSpawnFailDelay = 1.5,
            SpawnerAmount = 6,
            SpawnerRadius = 100,
            SpawnerFeedMultiplier = 1.333,
            SpawnerVisualCapRadius = 750,
            SpawnerDrainInterval = 0.2,
            SpawnerDrainRatio = 0.25,
            SpawnerDrainMin = 20,
            SpawnerDrainMax = 3000,
            SpawnerPelletMax = 8,
            SpawnerPelletMassRatio = 0.1,
            SpawnerPelletMassFloor = 50,
            SpawnerPelletMassCap = 900,
            SpawnerPelletSpeed = 450,
            GoldAmount = 80,
            GoldValue = 50,
            GoldRadius = 10,
            GoldenBlockAmount = 2,
            GoldenBlockRadius = 160,
            GoldenBlockPushForce = 1.75,
            GoldenBlockPushShare = 0.72,
            GoldenBlockFriction = -1.4,
            GoldenBlockBounceFactor = 0.5,
            GoldenBlockFeedRequired = 500,
            GoldenBlockCoinChance = 0.3,
            GoldenBlockCoinSpeed = 350,
            GoldenBlockCoinReward = 50,
            GoldenBlockCapacity = 10000,
            GoldenBlockCooldown = 60,
            GoldenBlockCoinSpawnOffset = 40,
            EjectedMassSize = 12,
            EjectedMassSpeed = 1050,
            EjectedMassMinRadius = 20,
            EjectedMassMinRemainingRadius = 14,
            EjectedMassSpawnOffset = 15,
            EjectedMassAutoInterval = 0.1,
            EjectedMassLifetime = 60,
            EjectedMassFriction = -7.5,
            DecayMultiplier = 1.8,
            DecayMinRadius = 30,
            NormalDecayRate = 0.00115,
            FastDecayRate = 0.0125,
            FastDecayThreshold = 100000,
            UltraDecayRate = 0.025,
            UltraDecayThreshold = 13000000,
            PhysicsSleepSpeed = 2,
            PhysicsBounceMinOverlap = 1.5,
            ActiveCollisionPadding = 20,
            PlayerCollisionPadding = 100,
            TeamCount = 2,
            SameTeamBounce = 0.85
        };
        for v257, v258 in pairs(u83) do
            local v259 = v251[v257];
            if v259 == nil then
                v259 = v256[v257];
            end;
            v258.Text = tostring(v259 or "");
        end;
        for v260, v263 in pairs({
            FoodEnabled = true,
            FoodGivesMass = true,
            FoodMassFromRadius = false,
            NegativeFoodEnabled = false,
            VirusEnabled = true,
            VirusPushEnabled = false,
            SpikeCollisionEnabled = true,
            SpawnerEnabled = true,
            GoldEnabled = true,
            GoldenBlockEnabled = true,
            SplitEnabled = true,
            EjectedMassEnabled = true,
            EjectedMassCostsMass = true,
            EjectedMassGivesMass = true,
            EjectedMassSelfEat = true,
            BotsEnabled = true,
            AbilitiesEnabled = true,
            DecayEnabled = true,
            TeamsEnabled = false,
            SameTeamCollision = true,
            FriendlyEat = false,
            Public = true
        }) do
            local v262 = v251[v260];
            if v262 ~= nil then
                local v263 = v262;
            end;
            u247(v260, v263 == true);
        end;
        u87 = "Basic";
        u139.Visible = true;
        u243();
    end;
    local function u270() --[[ Line: 1169 ]]
        -- upvalues: u83 (copy), u84 (copy)
        local v265 = {};
        for v266, v267 in pairs(u83) do
            v265[v266] = v267.Text;
        end;
        for v268, v269 in pairs(u84) do
            v265[v268] = v269.Value;
        end;
        return v265;
    end;
    u141.MouseButton1Click:Connect(function() --[[ Line: 1180 ]]
        -- upvalues: u139 (copy)
        u139.Visible = false;
    end);
    l__CreateCustomModeButton__33.MouseButton1Click:Connect(function() --[[ Line: 1184 ]]
        -- upvalues: u264 (copy)
        u264(nil);
    end);
    l__EditCustomModeButton__40.MouseButton1Click:Connect(function() --[[ Line: 1188 ]]
        -- upvalues: u40 (ref), u264 (copy)
        if u40 and (u40.ModeType == "Custom" and u40.IsOwner == true) then
            u264(u40);
        end;
    end);
    u223.MouseButton1Click:Connect(function() --[[ Line: 1194 ]]
        -- upvalues: u270 (copy), u41 (ref), u10 (copy), u9 (copy), u182 (ref), u63 (copy), u12 (copy), u80 (ref), u139 (copy)
        local u271 = u270();
        local v272 = u41;
        if v272 then
            v272 = u41 ~= "";
        end;
        local v273, v274;
        if v272 then
            v273, v274 = pcall(function() --[[ Line: 1199 ]]
                -- upvalues: u10 (ref), u41 (ref), u271 (copy)
                return u10:InvokeServer(u41, u271);
            end);
        else
            v273, v274 = pcall(function() --[[ Line: 1203 ]]
                -- upvalues: u9 (ref), u271 (copy)
                return u9:InvokeServer(u271);
            end);
        end;
        if v273 and (type(v274) == "table" and v274.Ok == true) then
            if v272 then
                local v275, v276 = pcall(function() --[[ Line: 1214 ]]
                    -- upvalues: u12 (ref), u41 (ref)
                    return u12:InvokeServer(u41);
                end);
                if not v275 or (type(v276) ~= "table" or v276.Ok ~= true) then
                    local v277 = type(v276) == "table" and tostring(v276.Message or "Saved, but could not restart live servers.") or "Saved, but could not restart live servers.";
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification("Warning", v277);
                    else
                        u63(v277, true, nil);
                    end;
                    if u80 then
                        task.defer(u80);
                    end;
                    return;
                end;
                local v278 = tostring(v276.Message or "Custom mode saved and servers are restarting.");
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", v278);
                else
                    u63(v278, false, nil);
                end;
            else
                local v279 = tostring(v274.Message or "Custom mode saved.");
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", v279);
                else
                    u63(v279, false, nil);
                end;
            end;
            u139.Visible = false;
            if u80 then
                task.defer(u80);
            end;
        else
            local v280 = type(v274) == "table" and tostring(v274.Message or "Could not save custom mode.") or "Could not save custom mode.";
            if u182 and type(u182.ShowNotification) == "function" then
                u182.ShowNotification("Warning", v280);
            else
                u63(v280, true, nil);
            end;
        end;
    end);
    u224.MouseButton1Click:Connect(function() --[[ Line: 1231 ]]
        -- upvalues: u41 (ref), u11 (copy), u182 (ref), u63 (copy), u139 (copy), l__Servers__24 (copy), u80 (ref)
        if u41 and u41 ~= "" then
            local v281, v282 = pcall(function() --[[ Line: 1233 ]]
                -- upvalues: u11 (ref), u41 (ref)
                return u11:InvokeServer(u41);
            end);
            if v281 and (type(v282) == "table" and v282.Ok == true) then
                local v283 = tostring(v282.Message or "Custom mode deleted.");
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", v283);
                else
                    u63(v283, false, nil);
                end;
                u139.Visible = false;
                l__Servers__24.Visible = false;
                if u80 then
                    task.defer(u80);
                end;
            else
                local v284 = type(v282) == "table" and tostring(v282.Message or "Could not delete custom mode.") or "Could not delete custom mode.";
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Warning", v284);
                else
                    u63(v284, true, nil);
                end;
            end;
        end;
    end);
    u225.MouseButton1Click:Connect(function() --[[ Line: 1246 ]]
        -- upvalues: u41 (ref), u270 (copy), u10 (copy), u182 (ref), u63 (copy), u12 (copy), u80 (ref)
        if u41 and u41 ~= "" then
            local u285 = u270();
            local v286, v287 = pcall(function() --[[ Line: 1249 ]]
                -- upvalues: u10 (ref), u41 (ref), u285 (copy)
                return u10:InvokeServer(u41, u285);
            end);
            if v286 and (type(v287) == "table" and v287.Ok == true) then
                local v288, v289 = pcall(function() --[[ Line: 1257 ]]
                    -- upvalues: u12 (ref), u41 (ref)
                    return u12:InvokeServer(u41);
                end);
                if v288 and (type(v289) == "table" and v289.Ok == true) then
                    local v290 = tostring(v289.Message or "Custom mode saved and servers are restarting.");
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification("Info", v290);
                    else
                        u63(v290, false, nil);
                    end;
                    if u80 then
                        task.defer(u80);
                    end;
                else
                    local v291 = type(v289) == "table" and tostring(v289.Message or "Could not restart custom mode.") or "Could not restart custom mode.";
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification("Warning", v291);
                    else
                        u63(v291, true, nil);
                    end;
                end;
            else
                local v292 = type(v287) == "table" and tostring(v287.Message or "Could not save custom mode before restart.") or "Could not save custom mode before restart.";
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Warning", v292);
                else
                    u63(v292, true, nil);
                end;
            end;
        end;
    end);
    local v293 = v43();
    local u294 = Instance.new("TextButton");
    u294.Name = "FriendsShade";
    u294.Active = false;
    u294.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    u294.BackgroundTransparency = 1;
    u294.BorderSizePixel = 0;
    u294.Text = "";
    u294.Size = UDim2.fromScale(1, 1);
    u294.Visible = false;
    u294.ZIndex = 220;
    u294.Parent = v293;
    local u295 = Instance.new("Frame");
    u295.Name = "FriendsPanel";
    u295.AnchorPoint = Vector2.new(0, 0);
    u295.Position = UDim2.fromOffset(0, 0);
    u295.Size = UDim2.fromOffset(520, 460);
    u295.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
    u295.BorderSizePixel = 0;
    u295.Visible = false;
    u295.ZIndex = 221;
    u295.Parent = v293;
    Instance.new("UICorner", u295).CornerRadius = UDim.new(0, 8);
    task.spawn(function() --[[ Line: 1294 ]]
        -- upvalues: l__PlayerGui__8 (copy), u295 (copy), u294 (copy)
        local l__Temp__43 = l__PlayerGui__8:WaitForChild("Temp", 5);
        if l__Temp__43 and (l__Temp__43:IsA("ScreenGui") and u295.Parent ~= l__Temp__43) then
            u294.Parent = l__Temp__43;
            u295.Parent = l__Temp__43;
        end;
    end);
    local u296 = Instance.new("TextButton");
    u296.Name = "DragHandle";
    u296.BackgroundTransparency = 1;
    u296.BorderSizePixel = 0;
    u296.Text = "";
    u296.ZIndex = 223;
    u296.Parent = u295;
    local u297 = Instance.new("TextLabel");
    u297.BackgroundTransparency = 1;
    u297.Position = UDim2.fromOffset(14, 9);
    u297.Size = UDim2.new(1, -212, 0, 28);
    u297.Font = Enum.Font.GothamBold;
    u297.Text = "Friends";
    u297.TextColor3 = Color3.new(1, 1, 1);
    u297.TextScaled = true;
    u297.TextXAlignment = Enum.TextXAlignment.Left;
    u297.ZIndex = 222;
    u297.Parent = u295;
    local u298 = Instance.new("TextButton");
    u298.AnchorPoint = Vector2.new(1, 0);
    u298.Position = UDim2.new(1, -10, 0, 10);
    u298.Size = UDim2.fromOffset(28, 28);
    u298.BackgroundColor3 = Color3.fromRGB(155, 58, 58);
    u298.BorderSizePixel = 0;
    u298.Font = Enum.Font.GothamBold;
    u298.Text = "X";
    u298.TextColor3 = Color3.new(1, 1, 1);
    u298.TextScaled = true;
    u298.ZIndex = 223;
    u298.Parent = u295;
    Instance.new("UICorner", u298).CornerRadius = UDim.new(0, 6);
    local u299 = Instance.new("TextButton");
    u299.AnchorPoint = Vector2.new(1, 0);
    u299.Position = UDim2.new(1, -46, 0, 10);
    u299.Size = UDim2.fromOffset(74, 28);
    u299.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
    u299.BorderSizePixel = 0;
    u299.Font = Enum.Font.GothamBold;
    u299.Text = "Refresh";
    u299.TextColor3 = Color3.new(1, 1, 1);
    u299.TextScaled = true;
    u299.ZIndex = 223;
    u299.Parent = u295;
    Instance.new("UICorner", u299).CornerRadius = UDim.new(0, 6);
    local v300 = Instance.new("TextButton");
    v300.Name = "FriendsNotify";
    v300.AnchorPoint = Vector2.new(1, 0);
    v300.Position = UDim2.new(1, -126, 0, 10);
    v300.Size = UDim2.fromOffset(74, 28);
    v300.BackgroundColor3 = Color3.fromRGB(77, 105, 170);
    v300.BorderSizePixel = 0;
    v300.Font = Enum.Font.GothamBold;
    v300.Text = "Notify";
    v300.TextColor3 = Color3.new(1, 1, 1);
    v300.TextScaled = true;
    v300.ZIndex = 223;
    v300.Parent = u295;
    Instance.new("UICorner", v300).CornerRadius = UDim.new(0, 6);
    local u301 = Instance.new("TextLabel");
    u301.BackgroundTransparency = 1;
    u301.Position = UDim2.fromOffset(14, 42);
    u301.Size = UDim2.new(1, -28, 0, 22);
    u301.Font = Enum.Font.Gotham;
    u301.Text = "Loading friends...";
    u301.TextColor3 = Color3.fromRGB(220, 220, 220);
    u301.TextSize = 13;
    u301.TextXAlignment = Enum.TextXAlignment.Left;
    u301.TextTruncate = Enum.TextTruncate.AtEnd;
    u301.ZIndex = 222;
    u301.Parent = u295;
    local v302 = Instance.new("TextBox");
    v302.Name = "FriendSearch";
    v302.BackgroundColor3 = Color3.fromRGB(43, 43, 43);
    v302.BorderSizePixel = 0;
    v302.ClearTextOnFocus = false;
    v302.Font = Enum.Font.Gotham;
    v302.PlaceholderText = "Search friends";
    v302.Text = "";
    v302.TextColor3 = Color3.new(1, 1, 1);
    v302.PlaceholderColor3 = Color3.fromRGB(165, 165, 165);
    v302.TextSize = 13;
    v302.TextXAlignment = Enum.TextXAlignment.Left;
    v302.ZIndex = 222;
    v302.Parent = u295;
    Instance.new("UICorner", v302).CornerRadius = UDim.new(0, 6);
    local u303 = Instance.new("ScrollingFrame");
    u303.Name = "FriendsList";
    u303.Position = UDim2.fromOffset(12, 70);
    u303.Size = UDim2.new(1, -24, 1, -82);
    u303.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
    u303.BackgroundTransparency = 0.08;
    u303.BorderSizePixel = 0;
    u303.ScrollBarThickness = 5;
    u303.CanvasSize = UDim2.fromOffset(0, 0);
    u303.ZIndex = 222;
    u303.Parent = u295;
    Instance.new("UICorner", u303).CornerRadius = UDim.new(0, 6);
    local u304 = Instance.new("UIListLayout");
    u304.Padding = UDim.new(0, 5);
    u304.SortOrder = Enum.SortOrder.LayoutOrder;
    u304.Parent = u303;
    u304:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1416 ]]
        -- upvalues: u303 (copy), u304 (copy)
        u303.CanvasSize = UDim2.fromOffset(0, u304.AbsoluteContentSize.Y + 10);
    end);
    local u305 = 0;
    local u306 = nil;
    local u307 = {
        Count = 0,
        Badge = nil,
        Cache = nil,
        Signature = "",
        RenderSignature = "",
        MaxVisibleRows = 100,
        LastFullRefreshClock = 0,
        InviteRemote = l__Network__11:WaitForChild(l__NetworkNames__15.SendModeInvite),
        Actions = require(script.Parent:WaitForChild("ModeMenuFriendActions"))
    };
    u307.Context = {
        LocalPlayer = l__LocalPlayer__7,
        Network = l__Network__11,
        NetworkNames = l__NetworkNames__15,
        SocialService = l__SocialService__3,
        ShowNotification = v67,
        FriendRequestUi = u307
    };
    function u307.ShowInvite(p308) --[[ Line: 1432 ]]
        -- upvalues: l__PlayerGui__8 (copy), u182 (ref), u63 (copy), u15 (copy)
        local u309 = tonumber(p308.InviterUserId);
        if u309 then
            local u310 = l__PlayerGui__8:FindFirstChild("ModeInvitePromptGui");
            if not u310 then
                u310 = Instance.new("ScreenGui");
                u310.Name = "ModeInvitePromptGui";
                u310.ResetOnSpawn = false;
                u310.IgnoreGuiInset = true;
                u310.DisplayOrder = 175;
                u310.Parent = l__PlayerGui__8;
            end;
            u310:ClearAllChildren();
            local u311 = Instance.new("Frame");
            u311.AnchorPoint = Vector2.new(0.5, 0);
            u311.Position = UDim2.new(0.5, 0, 0, 88);
            u311.Size = UDim2.fromOffset(430, 108);
            u311.BackgroundColor3 = Color3.fromRGB(32, 32, 32);
            u311.BorderSizePixel = 0;
            u311.ZIndex = 176;
            u311.Parent = u310;
            Instance.new("UICorner", u311).CornerRadius = UDim.new(0, 8);
            local v312 = Instance.new("TextLabel");
            v312.BackgroundTransparency = 1;
            v312.Position = UDim2.fromOffset(12, 10);
            v312.Size = UDim2.new(1, -24, 0, 28);
            v312.Font = Enum.Font.GothamBold;
            v312.Text = tostring(p308.InviterName or "Friend") .. " invited you to a mode";
            v312.TextColor3 = Color3.new(1, 1, 1);
            v312.TextScaled = true;
            v312.TextXAlignment = Enum.TextXAlignment.Left;
            v312.ZIndex = 177;
            v312.Parent = u311;
            local v313 = Instance.new("TextLabel");
            v313.BackgroundTransparency = 1;
            v313.Position = UDim2.fromOffset(12, 40);
            v313.Size = UDim2.new(1, -24, 0, 24);
            v313.Font = Enum.Font.Gotham;
            v313.Text = "Mode: " .. tostring(p308.ModeName or "Unknown");
            v313.TextColor3 = Color3.fromRGB(220, 220, 220);
            v313.TextScaled = true;
            v313.TextXAlignment = Enum.TextXAlignment.Left;
            v313.ZIndex = 177;
            v313.Parent = u311;
            local v314 = Instance.new("TextButton");
            v314.Position = UDim2.new(1, -184, 1, -38);
            v314.Size = UDim2.fromOffset(82, 30);
            v314.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
            v314.BorderSizePixel = 0;
            v314.Font = Enum.Font.GothamBold;
            v314.Text = "Accept";
            v314.TextColor3 = Color3.new(1, 1, 1);
            v314.TextScaled = true;
            v314.ZIndex = 178;
            v314.Parent = u311;
            Instance.new("UICorner", v314).CornerRadius = UDim.new(0, 6);
            local v315 = Instance.new("TextButton");
            v315.Position = UDim2.new(1, -94, 1, -38);
            v315.Size = UDim2.fromOffset(82, 30);
            v315.BackgroundColor3 = Color3.fromRGB(86, 86, 86);
            v315.BorderSizePixel = 0;
            v315.Font = Enum.Font.GothamBold;
            v315.Text = "Decline";
            v315.TextColor3 = Color3.new(1, 1, 1);
            v315.TextScaled = true;
            v315.ZIndex = 178;
            v315.Parent = u311;
            Instance.new("UICorner", v315).CornerRadius = UDim.new(0, 6);
            v314.MouseButton1Click:Connect(function() --[[ Line: 1500 ]]
                -- upvalues: u310 (ref), u182 (ref), u63 (ref), u15 (ref), u309 (copy)
                u310:ClearAllChildren();
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Teleport", "Joining friend...");
                else
                    u63("Joining friend...", false, "Teleport");
                end;
                u15:FireServer(u309);
            end);
            v315.MouseButton1Click:Connect(function() --[[ Line: 1505 ]]
                -- upvalues: u310 (ref)
                u310:ClearAllChildren();
            end);
            task.delay(20, function() --[[ Line: 1506 ]]
                -- upvalues: u311 (copy)
                if u311 and u311.Parent then
                    u311:Destroy();
                end;
            end);
        end;
    end;
    local u316 = {};
    local u317 = false;
    local u318 = false;
    local u319 = nil;
    local function u328(p320, p321) --[[ Line: 1519 ]]
        -- upvalues: l__Workspace__6 (copy)
        local l__CurrentCamera__44 = l__Workspace__6.CurrentCamera;
        local v322;
        if l__CurrentCamera__44 then
            v322 = l__CurrentCamera__44.ViewportSize;
        else
            v322 = Vector2.new(1280, 720);
        end;
        local l__AbsoluteSize__45 = p320.AbsoluteSize;
        local v323 = math.max(8, v322.X - l__AbsoluteSize__45.X - 8);
        local v324 = math.max(8, v322.Y - l__AbsoluteSize__45.Y - 8);
        local l__fromOffset__46 = UDim2.fromOffset;
        local v325 = math.clamp(p321.X, 8, v323) + 0.5;
        local v326 = math.floor(v325);
        local v327 = math.clamp(p321.Y, 8, v324) + 0.5;
        p320.Position = l__fromOffset__46(v326, (math.floor(v327)));
    end;
    local function u331(u329, u330) --[[ Line: 1544 ]]
        -- upvalues: u319 (ref)
        u319 = {
            Panel = u329,
            StartInput = Vector2.new(u330.Position.X, u330.Position.Y),
            StartTopLeft = Vector2.new(u329.Position.X.Offset, u329.Position.Y.Offset)
        };
        u330.Changed:Connect(function() --[[ Line: 1550 ]]
            -- upvalues: u330 (copy), u319 (ref), u329 (copy)
            if u330.UserInputState == Enum.UserInputState.End and (u319 and u319.Panel == u329) then
                u319 = nil;
            end;
        end);
    end;
    u296.InputBegan:Connect(function(p332) --[[ Line: 1557 ]]
        -- upvalues: u317 (ref), u331 (copy), u295 (copy)
        if p332.UserInputType == Enum.UserInputType.MouseButton1 or p332.UserInputType == Enum.UserInputType.Touch then
            u317 = true;
            u331(u295, p332);
        end;
    end);
    l__UserInputService__5.InputChanged:Connect(function(p333) --[[ Line: 1565 ]]
        -- upvalues: u319 (ref), u328 (copy)
        if u319 then
            if p333.UserInputType == Enum.UserInputType.MouseMovement or p333.UserInputType == Enum.UserInputType.Touch then
                u328(u319.Panel, u319.StartTopLeft + (Vector2.new(p333.Position.X, p333.Position.Y) - u319.StartInput));
            end;
        end;
    end);
    local function u344() --[[ Line: 1580 ]]
        -- upvalues: l__Workspace__6 (copy), l__UserInputService__5 (copy), u295 (copy), u296 (copy), u297 (copy), u299 (copy), u298 (copy), u301 (copy), u303 (copy)
        local l__CurrentCamera__47 = l__Workspace__6.CurrentCamera;
        local v334;
        if l__CurrentCamera__47 then
            v334 = l__CurrentCamera__47.ViewportSize;
        else
            v334 = Vector2.new(1280, 720);
        end;
        local v335 = math.clamp(v334.X - 24, 320, 520);
        local v336 = math.floor(v335);
        local v337 = math.clamp(v334.Y - 24, 240, 460);
        local v338 = math.floor(v337);
        if l__UserInputService__5.TouchEnabled then
            local v339 = math.clamp(v334.X * 0.58, 300, 420);
            v336 = math.floor(v339);
            local v340 = math.clamp(v334.Y * 0.76, 220, 340);
            v338 = math.floor(v340);
        end;
        local v341 = v338 < 360;
        u295.Size = UDim2.fromOffset(v336, v338);
        u296.Position = UDim2.fromOffset(0, 0);
        u296.Size = UDim2.new(1, -(v341 and 184 or 204), 0, v341 and 38 or 44);
        u297.Position = UDim2.fromOffset(12, 8);
        u297.Size = UDim2.new(1, -(v341 and 188 or 212), 0, v341 and 24 or 28);
        local v342 = u295:FindFirstChild("FriendsNotify");
        if v342 and v342:IsA("TextButton") then
            v342.Position = UDim2.new(1, -(v341 and 112 or 126), 0, 8);
            v342.Size = UDim2.fromOffset(v341 and 64 or 74, v341 and 24 or 28);
        end;
        u299.Position = UDim2.new(1, -42, 0, 8);
        u299.Size = UDim2.fromOffset(v341 and 66 or 74, v341 and 24 or 28);
        u298.Position = UDim2.new(1, -8, 0, 8);
        u298.Size = UDim2.fromOffset(v341 and 24 or 28, v341 and 24 or 28);
        u301.Position = UDim2.fromOffset(12, v341 and 36 or 40);
        u301.Size = UDim2.new(1, -24, 0, v341 and 18 or 20);
        u301.TextSize = v341 and 11 or 13;
        local v343 = u295:FindFirstChild("FriendSearch");
        if v343 and v343:IsA("TextBox") then
            v343.Position = UDim2.fromOffset(10, v341 and 56 or 64);
            v343.Size = UDim2.fromOffset(v336 - 20, v341 and 24 or 28);
            v343.TextSize = v341 and 12 or 13;
        end;
        u303.Position = UDim2.fromOffset(10, v341 and 86 or 100);
        u303.Size = UDim2.fromOffset(v336 - 20, (math.max(100, v338 - (v341 and 96 or 112))));
        u303.ScrollBarThickness = v341 and 4 or 5;
    end;
    local function u346() --[[ Line: 1617 ]]
        -- upvalues: u303 (copy)
        for _, v345 in ipairs(u303:GetChildren()) do
            if v345:IsA("GuiObject") and v345:GetAttribute("FriendPresenceRow") == true then
                v345:Destroy();
            end;
        end;
    end;
    local function u350(p347) --[[ Line: 1625 ]]
        -- upvalues: u295 (copy)
        local v348 = u295:FindFirstChild("FriendSearch");
        local v349 = not (v348 and v348:IsA("TextBox")) and "" or string.lower(v348.Text);
        return v349 == "" and true or string.find(p347, v349, 1, true) ~= nil;
    end;
    local function v354() --[[ Line: 1631 ]]
        -- upvalues: u307 (copy), u303 (copy), u350 (copy)
        if type(u307.RenderCache) == "function" and u307.Cache then
            u307.RenderCache(true);
        else
            for _, v351 in ipairs(u303:GetChildren()) do
                if v351:IsA("GuiObject") and (v351:GetAttribute("FriendPresenceRow") == true and v351.Name ~= "Section") then
                    local v352 = u350;
                    local v353 = v351:GetAttribute("SearchText") or "";
                    v351.Visible = v352((tostring(v353)));
                end;
            end;
        end;
    end;
    local v355 = u295:FindFirstChild("FriendSearch");
    if v355 and v355:IsA("TextBox") then
        v355:GetPropertyChangedSignal("Text"):Connect(v354);
    end;
    local function u359(p356, p357) --[[ Line: 1650 ]]
        -- upvalues: u303 (copy)
        local v358 = Instance.new("TextLabel");
        v358.Name = "Section";
        v358:SetAttribute("FriendPresenceRow", true);
        v358.BackgroundTransparency = 1;
        v358.Size = UDim2.new(1, -8, 0, 20);
        v358.Font = Enum.Font.GothamBold;
        v358.Text = p356;
        v358.TextColor3 = Color3.fromRGB(255, 170, 80);
        v358.TextSize = 13;
        v358.TextXAlignment = Enum.TextXAlignment.Left;
        v358.LayoutOrder = p357;
        v358.ZIndex = 223;
        v358.Parent = u303;
    end;
    function u307.SendInvite(u360, _) --[[ Line: 1690 ]]
        -- upvalues: u182 (ref), u63 (copy), u307 (copy)
        if u182 and type(u182.ShowNotification) == "function" then
            u182.ShowNotification("Info", "Sending invite...");
        else
            u63("Sending invite...", false, nil);
        end;
        task.spawn(function() --[[ Line: 1692 ]]
            -- upvalues: u307 (ref), u360 (copy), u182 (ref), u63 (ref)
            local v361, v362 = pcall(function() --[[ Line: 1693 ]]
                -- upvalues: u307 (ref), u360 (ref)
                return u307.InviteRemote:InvokeServer(u360);
            end);
            if v361 and (type(v362) == "table" and v362.Ok == true) then
                local v363 = tostring(v362.Message or "Invite sent.");
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", v363);
                else
                    u63(v363, false, nil);
                end;
            else
                local v364 = type(v362) == "table" and tostring(v362.Message or "Could not send invite.") or "Could not send invite.";
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Warning", v364);
                else
                    u63(v364, true, nil);
                end;
            end;
        end);
    end;
    local function u422(u365, p366) --[[ Line: 1732 ]]
        -- upvalues: u350 (copy), u303 (copy), l__LocalPlayer__7 (copy), u295 (copy), u316 (copy), l__Players__1 (copy), u182 (ref), u63 (copy), u16 (copy), u306 (ref), u17 (copy), u15 (copy), u307 (copy)
        local v367 = Instance.new("Frame");
        v367.Name = "Friend_" .. tostring(u365.UserId or p366);
        v367:SetAttribute("FriendPresenceRow", true);
        local v368 = string.lower(table.concat({
            tostring(u365.DisplayName or ""),
            tostring(u365.Username or ""),
            tostring(u365.Presence or ""),
            tostring(u365.Location or ""),
            (tostring(u365.ModeName or ""))
        }, " "));
        v367:SetAttribute("SearchText", v368);
        v367.Visible = u350(v368);
        v367.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
        v367.BorderSizePixel = 0;
        v367.Size = UDim2.new(1, -8, 0, 56);
        v367.LayoutOrder = p366;
        v367.ZIndex = 223;
        v367.Parent = u303;
        Instance.new("UICorner", v367).CornerRadius = UDim.new(0, 6);
        local v369 = tostring(u365.Action or "");
        local v370 = tostring(u365.Source or "");
        local v371 = tostring(u365.Presence or "Offline");
        local v372 = tonumber(u365.UserId);
        local v373;
        if v372 == nil or v372 == l__LocalPlayer__7.UserId then
            v373 = false;
        elseif v369 == "Friend" then
            v373 = true;
        elseif v369 == "" then
            v373 = (v370 == "" or v370 == "Roblox") and true or v370 == "Game";
        else
            v373 = false;
        end;
        local v374 = tonumber(l__LocalPlayer__7:GetAttribute("SpawnNearFriendUserId"));
        local v375;
        if u365.CanJoin == true then
            v375 = u365.IsCurrentServer ~= true;
        else
            v375 = false;
        end;
        local v376;
        if v372 == nil or (v372 == l__LocalPlayer__7.UserId or u365.IsCurrentServer == true) then
            v376 = false;
        else
            v376 = (v369 == "Friend" or v370 == "Roblox") and true or v370 == "Game";
        end;
        local v377 = ((v369 == "Accept" or v375) and 1 or 0) + (v373 and 1 or 0) + (v376 and 1 or 0);
        local l__X__48 = u303.AbsoluteSize.X;
        if l__X__48 <= 0 then
            l__X__48 = u295.AbsoluteSize.X - 20;
        end;
        local v378;
        if l__X__48 > 0 then
            v378 = l__X__48 < 430;
        else
            v378 = false;
        end;
        local v379;
        if v378 then
            v379 = v377 >= 2;
        else
            v379 = v378;
        end;
        local v380 = v378 and 66 or 82;
        local v381 = v378 and 62 or 72;
        local v382 = v381 + 4;
        local v383 = -(v380 + 14);
        local v384 = v379 and 12 or v380 + 8 + (v377 <= 0 and 0 or v377 * v382 + 6) + 10;
        local v385 = v383 - (((v369 == "Accept" or v375) and 1 or 0) + (v373 and 1 or 0)) * v382;
        local v386 = v379 and 1 or 0.5;
        local v387 = v379 and -20 or 0;
        if v379 then
            v367.Size = UDim2.new(1, -8, 0, 86);
        end;
        local u388 = Instance.new("ImageLabel");
        u388.Name = "Avatar";
        u388.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
        u388.BorderSizePixel = 0;
        u388.Position = UDim2.fromOffset(10, 8);
        u388.Size = UDim2.fromOffset(40, 40);
        u388.ZIndex = 224;
        u388.Parent = v367;
        Instance.new("UICorner", u388).CornerRadius = UDim.new(1, 0);
        local v389 = tonumber(u365.UserId);
        if v389 and v389 > 0 then
            local u390 = math.floor(v389);
            local v391 = u316[u390];
            if v391 then
                u388.Image = v391;
            else
                task.spawn(function() --[[ Line: 1677 ]]
                    -- upvalues: l__Players__1 (ref), u390 (ref), u316 (ref), u388 (copy)
                    local v392, v393 = pcall(function() --[[ Line: 1678 ]]
                        -- upvalues: l__Players__1 (ref), u390 (ref)
                        return l__Players__1:GetUserThumbnailAsync(u390, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size48x48);
                    end);
                    if v392 and (type(v393) == "string" and v393 ~= "") then
                        u316[u390] = v393;
                        if u388.Parent then
                            u388.Image = v393;
                        end;
                    end;
                end);
            end;
        end;
        local v394 = Instance.new("TextLabel");
        v394.BackgroundTransparency = 1;
        v394.Position = UDim2.new(0, 58, 0, 6);
        v394.Size = UDim2.new(1, -(v384 + 58), 0, 20);
        v394.Font = Enum.Font.GothamBold;
        v394.Text = tostring(u365.DisplayName or (u365.Username or "Friend"));
        v394.TextColor3 = Color3.new(1, 1, 1);
        v394.TextSize = 15;
        v394.TextXAlignment = Enum.TextXAlignment.Left;
        v394.TextTruncate = Enum.TextTruncate.AtEnd;
        v394.ZIndex = 224;
        v394.Parent = v367;
        local v395 = Instance.new("TextLabel");
        v395.BackgroundTransparency = 1;
        v395.Position = UDim2.new(0, 58, 0, 28);
        v395.Size = UDim2.new(1, -(v384 + 58), 0, 20);
        v395.Font = Enum.Font.Gotham;
        local v396 = tostring(u365.ModeName or (u365.Location or v371));
        if v371 ~= "InMode" and v371 ~= "Here" then
            v396 = v371 .. "  -  " .. v396;
        end;
        v395.Text = v369 == "Pending" and "Request sent" or (v369 == "Accept" and "Wants to be game friends" or (v369 == "Add" and "On this server" or (v370 == "Game" and v371 == "Offline" and "Game friend  -  Offline" or v396)));
        local v397;
        if v371 == "Offline" then
            v397 = Color3.fromRGB(150, 150, 150);
        elseif v371 == "Online" then
            v397 = Color3.fromRGB(210, 225, 255);
        else
            v397 = Color3.fromRGB(190, 255, 205);
        end;
        v395.TextColor3 = v397;
        v395.TextSize = 12;
        v395.TextXAlignment = Enum.TextXAlignment.Left;
        v395.TextTruncate = Enum.TextTruncate.AtEnd;
        v395.ZIndex = 224;
        v395.Parent = v367;
        local v398 = Instance.new("TextButton");
        v398.AnchorPoint = Vector2.new(1, 0.5);
        v398.Position = UDim2.new(1, -8, v386, v387);
        v398.Size = UDim2.fromOffset(v380, 32);
        v398.BorderSizePixel = 0;
        v398.Font = Enum.Font.GothamBold;
        v398.TextColor3 = Color3.new(1, 1, 1);
        v398.TextScaled = true;
        v398.ZIndex = 225;
        v398.Parent = v367;
        Instance.new("UICorner", v398).CornerRadius = UDim.new(0, 6);
        local v399 = "";
        local v400 = Color3.fromRGB(78, 78, 78);
        local v401 = true;
        local v402 = nil;
        if v369 == "Add" then
            v400 = Color3.fromRGB(45, 135, 96);
            v402 = function() --[[ Line: 1848 ]]
                -- upvalues: u365 (copy), u182 (ref), u63 (ref), u16 (ref), u306 (ref)
                local l__UserId__49 = u365.UserId;
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", "Sending friend request...");
                else
                    u63("Sending friend request...", false, nil);
                end;
                task.spawn(function() --[[ Line: 1706 ]]
                    -- upvalues: u16 (ref), l__UserId__49 (copy), u182 (ref), u63 (ref), u306 (ref)
                    local v403, v404 = pcall(function() --[[ Line: 1707 ]]
                        -- upvalues: u16 (ref), l__UserId__49 (ref)
                        return u16:InvokeServer(l__UserId__49);
                    end);
                    local v405 = (not v403 or type(v404) ~= "table") and "Could not send friend request." or tostring(v404.Message or "Friend request sent.");
                    if v403 then
                        if type(v404) == "table" then
                            v403 = v404.Ok == true;
                        else
                            v403 = false;
                        end;
                    end;
                    local v406 = not v403;
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification(v406 and "Warning" or "Info", v405);
                    else
                        u63(v405, v406, nil);
                    end;
                    if u306 then
                        u306(true);
                    end;
                end);
            end;
            v399 = "Add";
        elseif v369 == "Pending" then
            v399 = "Sent";
        elseif v369 == "Accept" then
            v400 = Color3.fromRGB(45, 135, 96);
            v402 = function() --[[ Line: 1854 ]]
                -- upvalues: u365 (copy), u182 (ref), u63 (ref), u17 (ref), u306 (ref)
                local l__UserId__50 = u365.UserId;
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", "Accepting friend request...");
                else
                    u63("Accepting friend request...", false, nil);
                end;
                local u407 = true;
                task.spawn(function() --[[ Line: 1720 ]]
                    -- upvalues: u17 (ref), l__UserId__50 (copy), u407 (copy), u182 (ref), u63 (ref), u306 (ref)
                    local v408, v409 = pcall(function() --[[ Line: 1721 ]]
                        -- upvalues: u17 (ref), l__UserId__50 (ref), u407 (ref)
                        return u17:InvokeServer(l__UserId__50, u407);
                    end);
                    local v410 = (not v408 or type(v409) ~= "table") and "Could not update friend request." or tostring(v409.Message or "Friend request updated.");
                    if v408 then
                        if type(v409) == "table" then
                            v408 = v409.Ok == true;
                        else
                            v408 = false;
                        end;
                    end;
                    local v411 = not v408;
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification(v411 and "Warning" or "Info", v410);
                    else
                        u63(v410, v411, nil);
                    end;
                    if u306 then
                        u306(true);
                    end;
                end);
            end;
            v399 = "Accept";
        elseif v369 == "Friend" then
            v399 = "Friend";
        elseif u365.IsCurrentServer == true then
            v399 = "Here";
        elseif u365.CanJoin == true then
            v400 = Color3.fromRGB(255, 85, 0);
            v402 = function() --[[ Line: 1862 ]]
                -- upvalues: u182 (ref), u63 (ref), u15 (ref), u365 (copy)
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Teleport", "Joining friend...");
                else
                    u63("Joining friend...", false, "Teleport");
                end;
                u15:FireServer(u365.UserId);
            end;
            v399 = "Join";
        elseif v371 == "Online" or v371 == "InMode" then
            v400 = Color3.fromRGB(77, 105, 170);
            v402 = function() --[[ Line: 1869 ]]
                -- upvalues: u307 (ref), u365 (copy)
                u307.Actions.InviteRobloxFriend(u307.Context, u365.UserId);
            end;
            v399 = "Notify";
        else
            v401 = false;
        end;
        v398.Text = v399;
        v398.BackgroundColor3 = v400;
        v398.Visible = v401;
        if v402 then
            v398.MouseButton1Click:Connect(v402);
        end;
        if v373 then
            local v412 = Instance.new("TextButton");
            v412.AnchorPoint = Vector2.new(1, 0.5);
            v412.Position = UDim2.new(1, v383 - (v369 ~= "Accept" and not v375 and 0 or v382), v386, v387);
            v412.Size = UDim2.fromOffset(v381, 32);
            local v413;
            if v374 == v372 then
                v413 = Color3.fromRGB(45, 135, 96);
            else
                v413 = Color3.fromRGB(88, 88, 88);
            end;
            v412.BackgroundColor3 = v413;
            v412.BorderSizePixel = 0;
            v412.Font = Enum.Font.GothamBold;
            v412.Text = v374 == v372 and "Near ON" or "Spawn near";
            v412.TextColor3 = Color3.new(1, 1, 1);
            v412.TextScaled = true;
            v412.ZIndex = 225;
            v412.Parent = v367;
            Instance.new("UICorner", v412).CornerRadius = UDim.new(0, 6);
            v412.MouseButton1Click:Connect(function() --[[ Line: 1895 ]]
                -- upvalues: u307 (ref), u365 (copy)
                u307.Actions.SetSpawnNearFriendTarget(u307.Context, u365.UserId);
            end);
        end;
        if v369 == "Accept" then
            local v414 = Instance.new("TextButton");
            v414.AnchorPoint = Vector2.new(1, 0.5);
            v414.Position = UDim2.new(1, v383, v386, v387);
            v414.Size = UDim2.fromOffset(v381, 32);
            v414.BackgroundColor3 = Color3.fromRGB(112, 70, 70);
            v414.BorderSizePixel = 0;
            v414.Font = Enum.Font.GothamBold;
            v414.Text = "Decline";
            v414.TextColor3 = Color3.new(1, 1, 1);
            v414.TextScaled = true;
            v414.ZIndex = 225;
            v414.Parent = v367;
            Instance.new("UICorner", v414).CornerRadius = UDim.new(0, 6);
            v414.MouseButton1Click:Connect(function() --[[ Line: 1914 ]]
                -- upvalues: u365 (copy), u182 (ref), u63 (ref), u17 (ref), u306 (ref)
                local l__UserId__51 = u365.UserId;
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Info", "Declining friend request...");
                else
                    u63("Declining friend request...", false, nil);
                end;
                local u415 = false;
                task.spawn(function() --[[ Line: 1720 ]]
                    -- upvalues: u17 (ref), l__UserId__51 (copy), u415 (copy), u182 (ref), u63 (ref), u306 (ref)
                    local v416, v417 = pcall(function() --[[ Line: 1721 ]]
                        -- upvalues: u17 (ref), l__UserId__51 (ref), u415 (ref)
                        return u17:InvokeServer(l__UserId__51, u415);
                    end);
                    local v418 = (not v416 or type(v417) ~= "table") and "Could not update friend request." or tostring(v417.Message or "Friend request updated.");
                    if v416 then
                        if type(v417) == "table" then
                            v416 = v417.Ok == true;
                        else
                            v416 = false;
                        end;
                    end;
                    local v419 = not v416;
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification(v419 and "Warning" or "Info", v418);
                    else
                        u63(v418, v419, nil);
                    end;
                    if u306 then
                        u306(true);
                    end;
                end);
            end);
        elseif v375 then
            local v420 = Instance.new("TextButton");
            v420.AnchorPoint = Vector2.new(1, 0.5);
            v420.Position = UDim2.new(1, v383, v386, v387);
            v420.Size = UDim2.fromOffset(v381, 32);
            v420.BackgroundColor3 = Color3.fromRGB(77, 105, 170);
            v420.BorderSizePixel = 0;
            v420.Font = Enum.Font.GothamBold;
            v420.Text = "Notify";
            v420.TextColor3 = Color3.new(1, 1, 1);
            v420.TextScaled = true;
            v420.ZIndex = 225;
            v420.Parent = v367;
            Instance.new("UICorner", v420).CornerRadius = UDim.new(0, 6);
            v420.MouseButton1Click:Connect(function() --[[ Line: 1931 ]]
                -- upvalues: u307 (ref), u365 (copy)
                u307.Actions.InviteRobloxFriend(u307.Context, u365.UserId);
            end);
        end;
        if v376 then
            local v421 = Instance.new("TextButton");
            v421.AnchorPoint = Vector2.new(1, 0.5);
            v421.Position = UDim2.new(1, v385, v386, v387);
            v421.Size = UDim2.fromOffset(v381, 32);
            v421.BackgroundColor3 = Color3.fromRGB(49, 135, 126);
            v421.BorderSizePixel = 0;
            v421.Font = Enum.Font.GothamBold;
            v421.Text = "Invite";
            v421.TextColor3 = Color3.new(1, 1, 1);
            v421.TextScaled = true;
            v421.ZIndex = 225;
            v421.Parent = v367;
            Instance.new("UICorner", v421).CornerRadius = UDim.new(0, 6);
            v421.MouseButton1Click:Connect(function() --[[ Line: 1950 ]]
                -- upvalues: u307 (ref), u365 (copy)
                u307.SendInvite(u365.UserId, false);
            end);
        end;
    end;
    function u307.GetSearchQuery() --[[ Line: 1956 ]]
        -- upvalues: u295 (copy)
        local v423 = u295:FindFirstChild("FriendSearch");
        if not (v423 and v423:IsA("TextBox")) then
            return "";
        end;
        local v424 = tostring(v423.Text or "");
        local v425 = string.gsub(v424, "^%s+", "");
        local v426 = string.gsub(v425, "%s+$", "");
        return string.lower(v426);
    end;
    function u307.BuildRowSearchText(p427) --[[ Line: 1967 ]]
        return string.lower(table.concat({
            tostring(p427.DisplayName or ""),
            tostring(p427.Username or ""),
            tostring(p427.Presence or ""),
            tostring(p427.Location or ""),
            tostring(p427.ModeName or ""),
            (tostring(p427.UserId or ""))
        }, " "));
    end;
    function u307.BuildResponseSignature(p428) --[[ Line: 1978 ]]
        local u429 = {};
        local function v433(p430, p431) --[[ Line: 1980 ]]
            -- upvalues: u429 (copy)
            u429[#u429 + 1] = p430;
            if type(p431) == "table" then
                u429[#u429 + 1] = tostring(#p431);
                for _, v432 in ipairs(p431) do
                    if type(v432) == "table" then
                        u429[#u429 + 1] = table.concat({
                            tostring(v432.UserId or ""),
                            tostring(v432.DisplayName or ""),
                            tostring(v432.Username or ""),
                            tostring(v432.Presence or ""),
                            tostring(v432.Location or ""),
                            tostring(v432.ModeName or ""),
                            tostring(v432.CanJoin == true),
                            tostring(v432.IsCurrentServer == true),
                            tostring(v432.Action or ""),
                            (tostring(v432.Source or ""))
                        }, "\31");
                    end;
                end;
            else
                u429[#u429 + 1] = "0";
            end;
        end;
        v433("requests", p428.IncomingRequests);
        v433("server", p428.ServerPlayers);
        v433("friends", p428.Friends);
        return table.concat(u429, "\30");
    end;
    function u307.UpdateStatus(p434, p435) --[[ Line: 2010 ]]
        -- upvalues: u307 (copy), u301 (copy)
        local l__Cache__52 = u307.Cache;
        if type(l__Cache__52) == "table" then
            local v436 = type(l__Cache__52.Friends) ~= "table" and {} or l__Cache__52.Friends;
            local v437 = type(l__Cache__52.IncomingRequests) ~= "table" and {} or l__Cache__52.IncomingRequests;
            local v438 = type(l__Cache__52.ServerPlayers) ~= "table" and {} or l__Cache__52.ServerPlayers;
            local v439 = u307.GetSearchQuery();
            local v440 = tonumber(u307.MaxVisibleRows) or 100;
            if v439 == "" then
                local v441 = #v437 + #v438 + #v436;
                u301.Text = tostring(#v436) .. " friends, " .. tostring(#v438) .. " server players" .. (l__Cache__52.FastOnly == true and " - updating..." or (v440 >= v441 and "" or " - showing first " .. tostring(v440)));
            else
                local v442 = p434 or 0;
                local v443 = p435 or math.min(v442, v440);
                u301.Text = tostring(v442) .. " matches" .. (v443 >= v442 and "" or " - showing first " .. tostring(v440));
            end;
        else
            u301.Text = "No friends loaded yet.";
        end;
    end;
    function u307.RenderCache(p444) --[[ Line: 2031 ]]
        -- upvalues: u307 (copy), u346 (copy), u359 (copy), u422 (copy)
        local l__Cache__53 = u307.Cache;
        if type(l__Cache__53) == "table" then
            local u445 = u307.GetSearchQuery();
            local v446 = tostring(u307.Signature or "") .. "|" .. u445 .. "|" .. tostring(l__Cache__53.FastOnly == true);
            if p444 == true or u307.RenderSignature ~= v446 then
                u307.RenderSignature = v446;
                u346();
                local v447 = type(l__Cache__53.Friends) ~= "table" and {} or l__Cache__53.Friends;
                local v448 = type(l__Cache__53.IncomingRequests) ~= "table" and {} or l__Cache__53.IncomingRequests;
                local v449 = type(l__Cache__53.ServerPlayers) ~= "table" and {} or l__Cache__53.ServerPlayers;
                local u450 = 0;
                local u451 = 0;
                local u452 = 0;
                local u453 = tonumber(u307.MaxVisibleRows) or 100;
                local function v459(p454, p455, p456) --[[ Line: 2058 ]]
                    -- upvalues: u445 (copy), u307 (ref), u451 (ref), u452 (ref), u453 (copy), u450 (ref), u359 (ref), u422 (ref)
                    local v457 = false;
                    if type(p455) == "table" then
                        for _, v458 in ipairs(p455) do
                            if type(v458) == "table" and (not p456 or p456[tostring(v458.Presence or "")] == true) and (u445 == "" or string.find(u307.BuildRowSearchText(v458), u445, 1, true) ~= nil) then
                                u451 = u451 + 1;
                                if u452 < u453 then
                                    if not v457 then
                                        u450 = u450 + 1;
                                        u359(p454, u450);
                                        v457 = true;
                                    end;
                                    u452 = u452 + 1;
                                    u450 = u450 + 1;
                                    u422(v458, u450);
                                end;
                            end;
                        end;
                    end;
                end;
                v459("Game friend requests", v448);
                v459("Players on this server", v449);
                v459("Playing Agaric", v447, {
                    InMode = true,
                    Here = true
                });
                v459("Online", v447, {
                    Online = true,
                    Request = true
                });
                v459("Offline", v447, {
                    Offline = true
                });
                if u450 == 0 then
                    u359(u445 == "" and "No friends found" or "No matching friends", 1);
                end;
                u307.UpdateStatus(u451, u452);
            else
                u307.UpdateStatus();
            end;
        end;
    end;
    function u307.MergeFastResponse(p460) --[[ Line: 2092 ]]
        -- upvalues: u307 (copy)
        if type(p460) ~= "table" or (p460.FastOnly ~= true or (type(u307.Cache) ~= "table" or u307.Cache.FastOnly == true)) then
            return p460;
        end;
        local v461 = type(u307.Cache.Friends) ~= "table" and {} or u307.Cache.Friends;
        local v462 = type(p460.Friends) ~= "table" and {} or p460.Friends;
        local v463 = {};
        local v464 = {};
        for _, v465 in ipairs(v461) do
            if type(v465) == "table" then
                v463[#v463 + 1] = v465;
                v464[tostring(v465.UserId or "")] = #v463;
            end;
        end;
        for _, v466 in ipairs(v462) do
            if type(v466) == "table" then
                local v467 = tostring(v466.UserId or "");
                local v468 = v464[v467];
                if v468 then
                    v463[v468] = v466;
                else
                    v463[#v463 + 1] = v466;
                    v464[v467] = #v463;
                end;
            end;
        end;
        return {
            FastOnly = false,
            Ok = p460.Ok,
            Friends = v463,
            IncomingRequests = p460.IncomingRequests,
            ServerPlayers = p460.ServerPlayers,
            RefreshedAt = p460.RefreshedAt
        };
    end;
    function u307.ApplyResponse(p469, p470) --[[ Line: 2128 ]]
        -- upvalues: u305 (ref), u301 (copy), u307 (copy), u346 (copy), u359 (copy)
        if p470 ~= u305 then
            return false;
        end;
        if type(p469) ~= "table" or p469.Ok ~= true then
            u301.Text = type(p469) == "table" and (tostring(p469.Message or "Could not load friends.") or "Could not load friends.") or "Could not load friends.";
            if not u307.Cache then
                u346();
                u359("No friends available", 1);
            end;
            return false;
        end;
        u307.Count = #(type(p469.IncomingRequests) ~= "table" and {} or p469.IncomingRequests);
        if type(u307.Update) == "function" then
            u307.Update();
        end;
        local v471 = u307.BuildResponseSignature(p469);
        u307.Cache = p469;
        if v471 == u307.Signature then
            u307.UpdateStatus();
        else
            u307.Signature = v471;
            u307.RenderSignature = "";
            u307.RenderCache(true);
        end;
        return true;
    end;
    local function u480(u472) --[[ Line: 2159 ]]
        -- upvalues: u305 (ref), u307 (copy), u301 (copy), u79 (copy), u6 (copy), u346 (copy), u359 (copy)
        u305 = u305 + 1;
        local u473 = u305;
        if u307.Cache then
            u307.RenderCache(false);
            u301.Text = "Checking for updates...";
        else
            u301.Text = "Loading friends...";
        end;
        task.spawn(function() --[[ Line: 2169 ]]
            -- upvalues: u79 (ref), u6 (ref), u472 (copy), u307 (ref), u301 (ref), u346 (ref), u359 (ref), u473 (copy), u305 (ref)
            local v474, v475, v476 = u79(u6, 5, true, u472 == true);
            if v476 then
                if u307.Cache then
                    u301.Text = "Using saved list. Refresh to update.";
                else
                    u301.Text = "Friends are taking longer than expected. Try Refresh.";
                    u346();
                    u359("No friends loaded yet", 1);
                end;
            elseif v474 and u307.ApplyResponse(u307.MergeFastResponse(v475), u473) then
                if u472 == true and true or (not u307.Cache or (u307.Cache.FastOnly == true and true or os.clock() - (tonumber(u307.LastFullRefreshClock) or 0) > 15)) then
                    local v477, v478, v479 = u79(u6, 8, false, u472 == true);
                    if v477 then
                        u307.LastFullRefreshClock = os.clock();
                        u307.ApplyResponse(v478, u473);
                    else
                        if v479 and u473 == u305 then
                            u301.Text = "Friend details are still updating...";
                        end;
                    end;
                end;
            end;
        end);
    end;
    local function u484() --[[ Line: 2199 ]]
        -- upvalues: u344 (copy), u317 (ref), u295 (copy), l__Workspace__6 (copy), u328 (copy), u294 (copy), u480 (ref)
        u344();
        if not u317 then
            local v481 = u295;
            local l__CurrentCamera__54 = l__Workspace__6.CurrentCamera;
            local v482;
            if l__CurrentCamera__54 then
                v482 = l__CurrentCamera__54.ViewportSize;
            else
                v482 = Vector2.new(1280, 720);
            end;
            local l__AbsoluteSize__55 = v481.AbsoluteSize;
            u328(v481, Vector2.new((v482.X - l__AbsoluteSize__55.X) * 0.5, (v482.Y - l__AbsoluteSize__55.Y) * 0.5));
        end;
        local v483 = u295;
        u328(v483, Vector2.new(v483.Position.X.Offset, v483.Position.Y.Offset));
        u294.Visible = false;
        u295.Visible = true;
        if u480 then
            u480();
        end;
    end;
    local function v485() --[[ Line: 2209 ]]
        -- upvalues: u305 (ref), u294 (copy), u295 (copy)
        u305 = u305 + 1;
        u294.Visible = false;
        u295.Visible = false;
    end;
    u298.MouseButton1Click:Connect(v485);
    u294.MouseButton1Click:Connect(v485);
    u299.MouseButton1Click:Connect(function() --[[ Line: 2216 ]]
        -- upvalues: u480 (ref)
        if u480 then
            u480(true);
        end;
    end);
    local v486 = u295:FindFirstChild("FriendsNotify");
    if v486 and v486:IsA("TextButton") then
        v486.MouseButton1Click:Connect(function() --[[ Line: 2222 ]]
            -- upvalues: u307 (copy)
            u307.Actions.PromptExperienceNotifications(u307.Context);
        end);
    end;
    local u487 = {};
    local u488 = Instance.new("Frame");
    u488.Name = "MusicPanel";
    u488.AnchorPoint = Vector2.new(0, 0);
    u488.Position = UDim2.fromOffset(0, 0);
    u488.Size = UDim2.fromOffset(360, 260);
    u488.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
    u488.BorderSizePixel = 0;
    u488.Visible = false;
    u488.ZIndex = 221;
    u488.Parent = v293;
    u487.Panel = u488;
    Instance.new("UICorner", u488).CornerRadius = UDim.new(0, 8);
    task.spawn(function() --[[ Line: 2244 ]]
        -- upvalues: l__PlayerGui__8 (copy), u488 (copy)
        local l__Temp__56 = l__PlayerGui__8:WaitForChild("Temp", 5);
        if l__Temp__56 and (l__Temp__56:IsA("ScreenGui") and u488.Parent ~= l__Temp__56) then
            u488.Parent = l__Temp__56;
        end;
    end);
    local u489 = Instance.new("TextButton");
    u489.Name = "DragHandle";
    u489.BackgroundTransparency = 1;
    u489.BorderSizePixel = 0;
    u489.Text = "";
    u489.ZIndex = 223;
    u489.Parent = u488;
    local u490 = Instance.new("TextLabel");
    u490.BackgroundTransparency = 1;
    u490.Position = UDim2.fromOffset(14, 9);
    u490.Size = UDim2.new(1, -58, 0, 28);
    u490.Font = Enum.Font.GothamBold;
    u490.Text = "Music";
    u490.TextColor3 = Color3.new(1, 1, 1);
    u490.TextScaled = true;
    u490.TextXAlignment = Enum.TextXAlignment.Left;
    u490.ZIndex = 222;
    u490.Parent = u488;
    local u491 = Instance.new("TextButton");
    u491.AnchorPoint = Vector2.new(1, 0);
    u491.Position = UDim2.new(1, -10, 0, 10);
    u491.Size = UDim2.fromOffset(28, 28);
    u491.BackgroundColor3 = Color3.fromRGB(155, 58, 58);
    u491.BorderSizePixel = 0;
    u491.Font = Enum.Font.GothamBold;
    u491.Text = "X";
    u491.TextColor3 = Color3.new(1, 1, 1);
    u491.TextScaled = true;
    u491.ZIndex = 223;
    u491.Parent = u488;
    Instance.new("UICorner", u491).CornerRadius = UDim.new(0, 6);
    local u492 = Instance.new("Frame");
    u492.Name = "Body";
    u492.Position = UDim2.fromOffset(10, 52);
    u492.Size = UDim2.new(1, -20, 1, -62);
    u492.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
    u492.BackgroundTransparency = 0.08;
    u492.BorderSizePixel = 0;
    u492.ZIndex = 222;
    u492.Parent = u488;
    Instance.new("UICorner", u492).CornerRadius = UDim.new(0, 6);
    function u487.ApplyLayout() --[[ Line: 2296 ]]
        -- upvalues: l__Workspace__6 (copy), l__UserInputService__5 (copy), u488 (copy), u489 (copy), u490 (copy), u491 (copy), u492 (copy)
        local l__CurrentCamera__57 = l__Workspace__6.CurrentCamera;
        local v493;
        if l__CurrentCamera__57 then
            v493 = l__CurrentCamera__57.ViewportSize;
        else
            v493 = Vector2.new(1280, 720);
        end;
        local v494 = math.clamp(v493.X - 24, 280, 360);
        local v495 = math.floor(v494);
        local v496 = math.clamp(v493.Y - 24, 210, 260);
        local v497 = math.floor(v496);
        if l__UserInputService__5.TouchEnabled then
            local v498 = math.clamp(v493.X - 18, 280, 360);
            v495 = math.floor(v498);
            local v499 = math.clamp(v493.Y - 18, 200, 260);
            v497 = math.floor(v499);
        end;
        local v500 = v497 < 235;
        u488.Size = UDim2.fromOffset(v495, v497);
        u489.Position = UDim2.fromOffset(0, 0);
        u489.Size = UDim2.new(1, -52, 0, v500 and 36 or 44);
        u490.Position = UDim2.fromOffset(12, 8);
        u490.Size = UDim2.new(1, -58, 0, v500 and 24 or 28);
        u491.Position = UDim2.new(1, -8, 0, 8);
        u491.Size = UDim2.fromOffset(v500 and 24 or 28, v500 and 24 or 28);
        u492.Position = UDim2.fromOffset(10, v500 and 46 or 52);
        u492.Size = UDim2.fromOffset(v495 - 20, (math.max(110, v497 - (v500 and 56 or 62))));
    end;
    u489.InputBegan:Connect(function(p501) --[[ Line: 2316 ]]
        -- upvalues: u318 (ref), u331 (copy), u488 (copy)
        if p501.UserInputType == Enum.UserInputType.MouseButton1 or p501.UserInputType == Enum.UserInputType.Touch then
            u318 = true;
            u331(u488, p501);
        end;
    end);
    function u487.Open() --[[ Line: 2324 ]]
        -- upvalues: u487 (copy), u318 (ref), u488 (copy), l__Workspace__6 (copy), u328 (copy)
        u487.ApplyLayout();
        if not u318 then
            local v502 = u488;
            local l__CurrentCamera__58 = l__Workspace__6.CurrentCamera;
            local v503;
            if l__CurrentCamera__58 then
                v503 = l__CurrentCamera__58.ViewportSize;
            else
                v503 = Vector2.new(1280, 720);
            end;
            local l__AbsoluteSize__59 = v502.AbsoluteSize;
            u328(v502, Vector2.new((v503.X - l__AbsoluteSize__59.X) * 0.5, (v503.Y - l__AbsoluteSize__59.Y) * 0.5));
        end;
        local v504 = u488;
        u328(v504, Vector2.new(v504.Position.X.Offset, v504.Position.Y.Offset));
        u488.Visible = true;
    end;
    function u487.Toggle() --[[ Line: 2333 ]]
        -- upvalues: u488 (copy), u487 (copy)
        if u488.Visible then
            u488.Visible = false;
        else
            u487.Open();
        end;
    end;
    u491.MouseButton1Click:Connect(function() --[[ Line: 2341 ]]
        -- upvalues: u488 (copy)
        u488.Visible = false;
    end);
    local function u509(p505, p506, p507) --[[ Line: 2346 ]]
        p505.Active = true;
        p505.AutoButtonColor = true;
        p505.BackgroundColor3 = p507;
        p505.BorderSizePixel = 0;
        p505.Font = Enum.Font.GothamBold;
        p505.Text = p506;
        p505.TextColor3 = Color3.new(1, 1, 1);
        p505.TextScaled = true;
        p505.ZIndex = 120;
        local v508 = p505:FindFirstChild("TextSizeLimit");
        if not v508 then
            v508 = Instance.new("UITextSizeConstraint");
            v508.Name = "TextSizeLimit";
            v508.Parent = p505;
        end;
        v508.MinTextSize = 10;
        v508.MaxTextSize = 22;
        if not p505:FindFirstChildOfClass("UICorner") then
            Instance.new("UICorner", p505).CornerRadius = UDim.new(0, 6);
        end;
    end;
    function ModeMenu_RemoveAspectConstraints(p510)
        for _, v511 in ipairs(p510:GetChildren()) do
            if v511:IsA("UIAspectRatioConstraint") then
                v511:Destroy();
            end;
        end;
    end;
    function ModeMenu_SetButtonCorner(p512, p513)
        local v514 = p512:FindFirstChildOfClass("UICorner");
        if not v514 then
            v514 = Instance.new("UICorner");
            v514.Parent = p512;
        end;
        v514.CornerRadius = UDim.new(0, p513);
    end;
    local function u517(p515) --[[ Line: 2386 ]]
        ModeMenu_RemoveAspectConstraints(p515);
        p515.Active = true;
        p515.AutoButtonColor = true;
        p515.BackgroundColor3 = Color3.fromRGB(46, 86, 145);
        p515.BorderSizePixel = 0;
        p515.Font = Enum.Font.GothamBold;
        p515.Text = "Friends";
        p515.TextColor3 = Color3.new(1, 1, 1);
        p515.TextScaled = true;
        p515.ZIndex = 120;
        local v516 = p515:FindFirstChild("TextSizeLimit");
        if not v516 then
            v516 = Instance.new("UITextSizeConstraint");
            v516.Name = "TextSizeLimit";
            v516.Parent = p515;
        end;
        v516.MinTextSize = 10;
        v516.MaxTextSize = 18;
        ModeMenu_SetButtonCorner(p515, 8);
    end;
    local function u520(p518) --[[ Line: 2408 ]]
        -- upvalues: l__UserInputService__5 (copy)
        ModeMenu_RemoveAspectConstraints(p518);
        p518.Active = true;
        p518.AutoButtonColor = true;
        p518.BackgroundColor3 = Color3.fromRGB(42, 42, 46);
        p518.BackgroundTransparency = 0.28;
        p518.BorderSizePixel = 0;
        p518.Font = Enum.Font.GothamBold;
        p518.Text = "Music";
        p518.TextColor3 = Color3.new(1, 1, 1);
        p518.TextScaled = true;
        p518.TextWrapped = true;
        p518.ZIndex = l__UserInputService__5.TouchEnabled and 80 or 120;
        local v519 = p518:FindFirstChild("TextSizeLimit");
        if not v519 then
            v519 = Instance.new("UITextSizeConstraint");
            v519.Name = "TextSizeLimit";
            v519.Parent = p518;
        end;
        v519.MinTextSize = 10;
        v519.MaxTextSize = 16;
        ModeMenu_SetButtonCorner(p518, 8);
    end;
    local u521 = nil;
    local u522 = nil;
    function u307.Update() --[[ Line: 2435 ]]
        -- upvalues: u307 (copy), u297 (copy)
        local v523 = tonumber(u307.Count) or 0;
        local v524 = math.floor(v523);
        local v525 = math.max(0, v524);
        u297.Text = v525 <= 0 and "Friends" or "Friends - " .. tostring(v525) .. " requests";
        local v526 = u297;
        local v527;
        if v525 > 0 then
            v527 = Color3.fromRGB(255, 205, 90);
        else
            v527 = Color3.new(1, 1, 1);
        end;
        v526.TextColor3 = v527;
        local l__Badge__60 = u307.Badge;
        if l__Badge__60 and l__Badge__60:IsA("TextLabel") then
            l__Badge__60.Visible = v525 > 0;
            local v528 = math.min(v525, 99);
            l__Badge__60.Text = tostring(v528);
        end;
    end;
    function ModeMenu_GetMinimapSideForMusic()
        -- upvalues: l__PlayerGui__8 (copy)
        local v529 = l__PlayerGui__8:GetAttribute("MinimapSideOverride") or l__PlayerGui__8:GetAttribute("ModeMusicMinimapSide") or "Left";
        return tostring(v529) == "Right" and "Right" or "Left";
    end;
    function ModeMenu_IsMusicButtonEnabled()
        -- upvalues: l__PlayerGui__8 (copy)
        local v530 = l__PlayerGui__8:GetAttribute("MusicButtonEnabledOverride");
        if v530 == nil then
            local v531 = l__PlayerGui__8:GetAttribute("ModeMusicButtonEnabled");
            if v531 == nil then
                return false;
            else
                return v531 ~= false;
            end;
        else
            return v530 ~= false;
        end;
    end;
    local function u536() --[[ Line: 2465 ]]
        -- upvalues: l__Menu__17 (copy), u521 (ref), u522 (ref), l__Gui__16 (copy), l__UserInputService__5 (copy)
        local l__Center__61 = l__Menu__17:WaitForChild("Center");
        if u521 then
            u521.Parent = l__Center__61;
            u521.AnchorPoint = Vector2.new(0, 0);
            u521.Position = UDim2.new(0.082, 0, 0.285, 0);
            u521.Size = UDim2.new(0.295, 0, 0.072, 0);
        end;
        if u522 then
            u522.Parent = l__Center__61;
            u522.Visible = true;
            u522.AnchorPoint = Vector2.new(0, 0);
            u522.Position = UDim2.new(0.392, 0, 0.285, 0);
            u522.Size = UDim2.new(0.18, 0, 0.072, 0);
        end;
        local v532 = l__Gui__16:FindFirstChild("ModeMusicScreenButton", true);
        if v532 and v532:IsA("GuiObject") then
            v532.Parent = l__Gui__16;
            v532.Visible = ModeMenu_IsMusicButtonEnabled();
            v532.ZIndex = 1;
            local v533 = ModeMenu_GetMinimapSideForMusic() == "Right" and "Left" or "Right";
            if l__UserInputService__5.TouchEnabled then
                v532.AnchorPoint = Vector2.new(v533 == "Right" and 1 or 0, 0);
                local v534;
                if v533 == "Right" then
                    v534 = UDim2.new(1, -12, 0, 92);
                else
                    v534 = UDim2.new(0, 12, 0, 92);
                end;
                v532.Position = v534;
                v532.Size = UDim2.fromOffset(54, 54);
                return;
            end;
            v532.AnchorPoint = Vector2.new(v533 == "Right" and 1 or 0, 1);
            local v535;
            if v533 == "Right" then
                v535 = UDim2.new(1, -18, 1, -18);
            else
                v535 = UDim2.new(0, 18, 1, -18);
            end;
            v532.Position = v535;
            v532.Size = UDim2.fromOffset(58, 58);
        end;
    end;
    function ModeMenu_DestroyButtonCopies(p537, p538)
        -- upvalues: l__PlayerGui__8 (copy)
        for _, v539 in ipairs(l__PlayerGui__8:GetDescendants()) do
            if v539 ~= p538 and (v539.Name == p537 and v539:IsA("GuiButton")) then
                v539:Destroy();
            end;
        end;
    end;
    task.spawn(function() --[[ Name: connectFriendsButton, Line 2507 ]]
        -- upvalues: l__PlayerGui__8 (copy), l__Menu__17 (copy), u521 (ref), u522 (ref), l__Gui__16 (copy), u517 (copy), u520 (copy), u509 (copy), u307 (copy), u536 (copy), u484 (copy), u487 (copy)
        local v540 = l__PlayerGui__8:FindFirstChild("Temp") or l__PlayerGui__8:WaitForChild("Temp", 2);
        if v540 then
            v540 = v540:FindFirstChild("Event") or v540:WaitForChild("Event", 2);
        end;
        local l__Center__62 = l__Menu__17:WaitForChild("Center");
        local v541;
        if v540 then
            v541 = v540:FindFirstChild("Friends");
        else
            v541 = v540;
        end;
        if v541 then
            v541:Destroy();
        end;
        if v540 then
            v540 = v540:FindFirstChild("Limited");
        end;
        if v540 then
            v540:Destroy();
        end;
        local v542 = l__Center__62:FindFirstChild("ModeFriendsButton");
        if v542 and v542:IsA("TextButton") then
            u521 = v542;
        else
            if v542 then
                v542:Destroy();
            end;
            u521 = Instance.new("TextButton");
            u521.Name = "ModeFriendsButton";
            u521.Parent = l__Center__62;
        end;
        ModeMenu_DestroyButtonCopies("ModeFriendsButton", u521);
        local v543 = l__Center__62:FindFirstChild("ModeMusicButton");
        if v543 and v543:IsA("TextButton") then
            u522 = v543;
        else
            if v543 then
                v543:Destroy();
            end;
            u522 = Instance.new("TextButton");
            u522.Name = "ModeMusicButton";
            u522.Parent = l__Center__62;
        end;
        ModeMenu_DestroyButtonCopies("ModeMusicButton", u522);
        local v544 = l__Gui__16:FindFirstChild("ModeMusicScreenButton", true);
        if not (v544 and v544:IsA("TextButton")) then
            if v544 then
                v544:Destroy();
            end;
            v544 = Instance.new("TextButton");
            v544.Name = "ModeMusicScreenButton";
            v544.Parent = l__Gui__16;
        end;
        ModeMenu_DestroyButtonCopies("ModeMusicScreenButton", v544);
        u517(u521);
        u520(u522);
        u509(v544, "Music", Color3.fromRGB(42, 42, 46));
        v544.TextWrapped = true;
        local v545 = v544:FindFirstChild("TextSizeLimit");
        if v545 and v545:IsA("UITextSizeConstraint") then
            v545.MaxTextSize = 15;
        end;
        v544.BackgroundTransparency = 0.12;
        v544.ZIndex = 1;
        local v546 = u521:FindFirstChild("RequestBadge");
        if not (v546 and v546:IsA("TextLabel")) then
            if v546 then
                v546:Destroy();
            end;
            v546 = Instance.new("TextLabel");
            v546.Name = "RequestBadge";
            v546.AnchorPoint = Vector2.new(1, 0);
            v546.Position = UDim2.new(1, 4, 0, -6);
            v546.Size = UDim2.fromOffset(20, 20);
            v546.BackgroundColor3 = Color3.fromRGB(235, 65, 65);
            v546.BorderSizePixel = 0;
            v546.Font = Enum.Font.GothamBold;
            v546.TextColor3 = Color3.new(1, 1, 1);
            v546.TextScaled = true;
            v546.Visible = false;
            v546.ZIndex = 121;
            v546.Parent = u521;
            Instance.new("UICorner", v546).CornerRadius = UDim.new(1, 0);
        end;
        u307.Badge = v546;
        if type(u307.Update) == "function" then
            u307.Update();
        end;
        u536();
        u521.MouseButton1Click:Connect(u484);
        u522.MouseButton1Click:Connect(function() --[[ Line: 2593 ]]
            -- upvalues: u487 (ref)
            if u487.Panel then
                u487.Panel.Visible = false;
            end;
        end);
        if v544 and v544:IsA("TextButton") then
            v544.MouseButton1Click:Connect(function() --[[ Line: 2599 ]]
                -- upvalues: u487 (ref)
                if u487.Panel then
                    u487.Panel.Visible = false;
                end;
            end);
        end;
    end);
    l__PlayerGui__8:GetAttributeChangedSignal("MinimapSideOverride"):Connect(u536);
    l__PlayerGui__8:GetAttributeChangedSignal("MusicButtonEnabledOverride"):Connect(u536);
    task.spawn(function() --[[ Line: 2611 ]]
        -- upvalues: l__ReplicatedStorage__2 (copy), l__LocalPlayer__7 (copy), l__PlayerGui__8 (copy), u536 (copy)
        local u547 = require(l__ReplicatedStorage__2:WaitForChild("Framework"):WaitForChild("ClientPlayerState")).WaitForProxy("Settings", l__LocalPlayer__7, 10);
        if u547 then
            local function v549() --[[ Line: 2615 ]]
                -- upvalues: u547 (copy), l__PlayerGui__8 (ref), u536 (ref)
                local v548 = u547:GetAttribute("MinimapSide") or "Left";
                l__PlayerGui__8:SetAttribute("ModeMusicMinimapSide", tostring(v548) == "Right" and "Right" or "Left");
                u536();
            end;
            local function v551() --[[ Line: 2620 ]]
                -- upvalues: u547 (copy), l__PlayerGui__8 (ref), u536 (ref)
                local v550 = u547:GetAttribute("ScreenMusicButtonEnabled");
                if v550 == nil or v550 == "" then
                    v550 = false;
                end;
                l__PlayerGui__8:SetAttribute("ModeMusicButtonEnabled", v550 == true);
                u536();
            end;
            local v552 = u547:GetAttribute("MinimapSide") or "Left";
            l__PlayerGui__8:SetAttribute("ModeMusicMinimapSide", tostring(v552) == "Right" and "Right" or "Left");
            u536();
            local v553 = u547:GetAttribute("ScreenMusicButtonEnabled");
            if v553 == nil or v553 == "" then
                v553 = false;
            end;
            l__PlayerGui__8:SetAttribute("ModeMusicButtonEnabled", v553 == true);
            u536();
            u547:GetAttributeChangedSignal("MinimapSide"):Connect(v549);
            u547:GetAttributeChangedSignal("ScreenMusicButtonEnabled"):Connect(v551);
        end;
    end);
    if l__Workspace__6.CurrentCamera then
        l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 2636 ]]
            -- upvalues: u536 (copy), u295 (copy), u344 (copy), u328 (copy), u487 (copy)
            u536();
            if u295.Visible then
                u344();
                local v554 = u295;
                u328(v554, Vector2.new(v554.Position.X.Offset, v554.Position.Y.Offset));
            end;
            local l__Panel__63 = u487.Panel;
            if l__Panel__63 and l__Panel__63.Visible then
                if u487.ApplyLayout then
                    u487.ApplyLayout();
                end;
                u328(l__Panel__63, Vector2.new(l__Panel__63.Position.X.Offset, l__Panel__63.Position.Y.Offset));
            end;
        end);
    end;
    local function u558(p555, p556) --[[ Line: 2652 ]]
        for _, v557 in ipairs(p555:GetChildren()) do
            if v557:IsA("Frame") and v557:GetAttribute(p556) == true then
                v557:Destroy();
            end;
        end;
    end;
    local function u563(p559) --[[ Line: 2696 ]]
        local v560 = string.upper(p559);
        if #v560 == 2 then
            local v561 = string.byte(v560, 1);
            local v562 = string.byte(v560, 2);
            if v561 < 65 or (v561 > 90 or (v562 < 65 or v562 > 90)) then
                return p559;
            else
                return utf8.char(v561 + 127462 - 65) .. utf8.char(v562 + 127462 - 65);
            end;
        else
            return p559;
        end;
    end;
    local function u572(p564) --[[ Line: 2711 ]]
        -- upvalues: u563 (copy)
        local v565 = {};
        for v566 in string.gmatch(p564, "[^,]+") do
            local v567 = v566:gsub("^%s+", ""):gsub("%s+$", "");
            local v568, v569 = string.match(v567, "^(%a%a)x(%d+)$");
            if v568 then
                local v570 = u563(v568) .. "x" .. v569;
                table.insert(v565, v570);
            elseif string.match(v567, "^%a%a$") then
                local v571 = u563(v567);
                table.insert(v565, v571);
            elseif v567 ~= "" then
                table.insert(v565, v567);
            end;
        end;
        return #v565 <= 0 and "Auto" or table.concat(v565, ", ");
    end;
    local function u575(p573) --[[ Line: 2760 ]]
        for _, v574 in ipairs(p573:GetDescendants()) do
            if v574:IsA("TextLabel") and (v574.Name == "Menu" or v574.Name == "MassValue") and v574:GetAttribute("ModeValueLabel") ~= true then
                v574.Visible = false;
                if v574.Name == "MassValue" then
                    v574.Name = "LegacyMassValue";
                end;
            end;
        end;
    end;
    local function u581(p576, p577) --[[ Line: 2771 ]]
        local v578 = p576:FindFirstChild(p577);
        if v578 and (v578:IsA("TextLabel") and v578:GetAttribute("ModeValueLabel") == true) then
            v578.Visible = true;
            return v578;
        end;
        local v579 = Instance.new("TextLabel");
        v579.Name = p577;
        v579:SetAttribute("ModeValueLabel", true);
        v579.BackgroundTransparency = 1;
        v579.Font = Enum.Font.GothamMedium;
        v579.TextColor3 = Color3.new(1, 1, 1);
        v579.TextScaled = false;
        v579.TextSize = 16;
        v579.TextWrapped = false;
        v579.TextTruncate = Enum.TextTruncate.AtEnd;
        v579.ZIndex = p576.ZIndex + 2;
        v579.Parent = p576;
        local v580 = Instance.new("UITextSizeConstraint");
        v580.MinTextSize = 12;
        v580.MaxTextSize = 30;
        v580.Parent = v579;
        return v579;
    end;
    local function u586(p582) --[[ Line: 2797 ]]
        local v583 = p582:FindFirstChild("ActionButton");
        if v583 and v583:IsA("TextButton") then
            v583.Visible = true;
            return v583;
        end;
        local v584 = Instance.new("TextButton");
        v584.Name = "ActionButton";
        v584.BorderSizePixel = 0;
        v584.AutoButtonColor = true;
        v584.Font = Enum.Font.GothamBold;
        v584.TextColor3 = Color3.new(1, 1, 1);
        v584.TextScaled = true;
        v584.ZIndex = p582.ZIndex + 20;
        v584.Parent = p582;
        Instance.new("UICorner", v584).CornerRadius = UDim.new(0, 6);
        local v585 = Instance.new("UITextSizeConstraint");
        v585.MinTextSize = 10;
        v585.MaxTextSize = 18;
        v585.Parent = v584;
        return v584;
    end;
    local function u601(p587, p588, p589, p590, p591, p592, p593) --[[ Line: 2822 ]]
        -- upvalues: u575 (copy), u581 (copy), u28 (copy), u30 (copy), u29 (copy), u586 (copy), u24 (copy)
        u575(p587);
        local v594 = u581(p587, "RegionValue");
        v594.Position = UDim2.new(0.02, 0, 0.12, 0);
        v594.Size = UDim2.new(0.42, 0, 0.76, 0);
        v594.TextXAlignment = Enum.TextXAlignment.Left;
        v594.Text = p588;
        local v595 = tonumber(p591);
        local v596;
        if v595 then
            if v595 >= 200 then
                v596 = u30;
            elseif v595 >= 100 then
                v596 = u29;
            else
                v596 = u28;
            end;
        else
            v596 = u28;
        end;
        v594.TextColor3 = v596;
        local v597 = u581(p587, "MassValue");
        v597.Position = UDim2.new(0.5, 0, 0.12, 0);
        v597.Size = UDim2.new(0.15, 0, 0.76, 0);
        v597.TextXAlignment = Enum.TextXAlignment.Center;
        v597.Text = p589;
        v597.TextColor3 = u28;
        local v598 = u581(p587, "PlayersValue");
        v598.Position = UDim2.new(0.66, 0, 0.12, 0);
        v598.Size = UDim2.new(0.14, 0, 0.76, 0);
        v598.TextXAlignment = Enum.TextXAlignment.Center;
        v598.Text = p590;
        v598.TextColor3 = u28;
        local v599 = u586(p587);
        v599.Position = UDim2.new(0.82, 0, 0.16, 0);
        v599.Size = UDim2.new(0.16, 0, 0.68, 0);
        v599.Text = p592 or "";
        v599.BackgroundColor3 = p593 or u24;
        local v600;
        if p592 == nil then
            v600 = false;
        else
            v600 = p592 ~= "";
        end;
        v599.Visible = v600;
    end;
    local function u605(p602, u603) --[[ Line: 2854 ]]
        -- upvalues: u20 (copy), u94 (copy)
        local v604 = Instance.new("TextButton");
        v604.Name = "Hitbox";
        v604.BackgroundTransparency = 1;
        v604.BorderSizePixel = 0;
        v604.Text = "";
        v604.Position = UDim2.fromScale(0, 0);
        v604.Size = UDim2.fromScale(1, 1);
        v604.ZIndex = p602.ZIndex + 10;
        v604.Parent = p602;
        v604.MouseButton1Click:Connect(function() --[[ Line: 2864 ]]
            -- upvalues: u20 (ref), u94 (ref), u603 (copy)
            if os.clock() < u20 then
            else
                u94.Visible = false;
                u603();
            end;
        end);
        return v604;
    end;
    local function u611(p606) --[[ Line: 2882 ]]
        -- upvalues: l__Right__18 (copy)
        local v607 = l__Right__18:FindFirstChild("Select");
        for _, v608 in ipairs(l__Right__18:GetChildren()) do
            if v608:IsA("GuiObject") and (v608 ~= v607 and v608.Name ~= "Menu") then
                v608.Visible = v608.Name == p606;
            end;
        end;
        if v607 then
            for _, v609 in ipairs(v607:GetChildren()) do
                if v609:IsA("GuiButton") then
                    local v610;
                    if v609.Name == p606 then
                        v610 = Color3.fromRGB(255, 85, 0);
                    else
                        v610 = Color3.fromRGB(105, 105, 105);
                    end;
                    v609.BackgroundColor3 = v610;
                end;
            end;
        end;
    end;
    function u46.__createServerRow(u612, p613) --[[ Line: 2931 ]]
        -- upvalues: u31 (ref), l__ServersScrolling__25 (copy), u21 (copy), u22 (copy), u24 (copy), u601 (copy), u572 (copy), u182 (ref), u63 (copy), u44 (ref), u45 (ref), u14 (copy), u13 (copy), u605 (copy)
        if u31 then
            local v614 = u31:Clone();
            v614.Name = "ModeServer_" .. tostring(u612.ServerId or p613);
            v614:SetAttribute("GeneratedModeServerRow", true);
            v614.LayoutOrder = p613;
            v614.Visible = true;
            v614.Parent = l__ServersScrolling__25;
            local v615;
            if u612.IsCurrentServer then
                v615 = u21;
            else
                v615 = u22;
            end;
            v614.BackgroundColor3 = v615;
            local v616 = u612.IsCurrentServer and "Current" or (u612.CanJoin == true and "Join" or "Full");
            local v617;
            if u612.CanJoin == true then
                v617 = u24;
            else
                v617 = Color3.fromRGB(86, 86, 86);
            end;
            local v618 = u601;
            local v619;
            if u612.IsCurrentServer then
                local v620 = "Current  ";
                local v621 = u572((tostring(u612.CountrySummary or (u612.Region or "Auto"))));
                local v622 = tonumber(u612.AvgPingMs);
                local v623;
                if v622 then
                    local v624 = math.floor(v622 + 0.5);
                    v623 = v621 .. "  " .. tostring(v624) .. "ms";
                else
                    v623 = v621 .. "  --ms";
                end;
                v619 = v620 .. v623;
            else
                local v625 = u572((tostring(u612.CountrySummary or (u612.Region or "Auto"))));
                local v626 = tonumber(u612.AvgPingMs);
                if v626 then
                    local v627 = math.floor(v626 + 0.5);
                    v619 = v625 .. "  " .. tostring(v627) .. "ms";
                else
                    v619 = v625 .. "  --ms";
                end;
            end;
            local v628 = tonumber(u612.TotalMass) or 0;
            local v629 = math.floor(v628);
            local v630 = math.max(0, v629);
            local v631;
            if v630 >= 1000000 then
                v631 = string.format("%.1fM", v630 / 1000000);
            elseif v630 >= 1000 then
                v631 = string.format("%.1fK", v630 / 1000);
            else
                v631 = tostring(v630);
            end;
            v618(v614, v619, v631, tostring(u612.PlayerCount or 0) .. "/" .. tostring(u612.MaxPlayers or 0), u612.AvgPingMs, v616, v617);
            local function v634() --[[ Line: 2958 ]]
                -- upvalues: u612 (copy), u182 (ref), u63 (ref), u44 (ref), u45 (ref), u14 (ref), u13 (ref)
                if u612.IsCurrentServer then
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification("Info", "You are already on this server.");
                    else
                        u63("You are already on this server.", false, nil);
                    end;
                elseif u612.CanJoin == true then
                    local v632 = tostring(u44);
                    local v633 = tostring(u612.ServerId);
                    if u45 == "Custom" then
                        u14:FireServer(v632, v633);
                    else
                        u13:FireServer(v632, v633);
                    end;
                elseif u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification("Warning", "Server is full or unavailable.");
                else
                    u63("Server is full or unavailable.", true, nil);
                end;
            end;
            u605(v614, v634);
            local v635 = v614:FindFirstChild("ActionButton");
            if v635 and v635:IsA("TextButton") then
                v635.MouseButton1Click:Connect(v634);
            end;
        end;
    end;
    function u46.__createNewServerRow(p636) --[[ Line: 2978 ]]
        -- upvalues: u31 (ref), u44 (ref), l__ServersScrolling__25 (copy), u23 (copy), u601 (copy), u37 (ref), u25 (copy), u45 (ref), u14 (copy), u13 (copy), u605 (copy)
        if u31 and u44 then
            local v637 = u31:Clone();
            v637.Name = "ModeServer_New";
            v637:SetAttribute("GeneratedModeServerRow", true);
            v637.LayoutOrder = p636;
            v637.Visible = true;
            v637.Parent = l__ServersScrolling__25;
            v637.BackgroundColor3 = u23;
            u601(v637, "New server", "0", "0/" .. tostring(u37), nil, "Create", u25);
            local function v639() --[[ Line: 2994 ]]
                -- upvalues: u44 (ref), u45 (ref), u14 (ref), u13 (ref)
                local v638 = u44;
                if v638 then
                    if u45 == "Custom" then
                        u14:FireServer(v638, nil);
                        return;
                    end;
                    u13:FireServer(v638, nil);
                end;
            end;
            u605(v637, v639);
            local v640 = v637:FindFirstChild("ActionButton");
            if v640 and v640:IsA("TextButton") then
                v640.MouseButton1Click:Connect(v639);
            end;
        end;
    end;
    function u46.__loadServers(u641, p642, p643, p644) --[[ Line: 3008 ]]
        -- upvalues: u82 (ref), u44 (ref), u45 (ref), u38 (ref), u40 (ref), u32 (copy), l__Right__18 (copy), l__Servers__24 (copy), l__EditCustomModeButton__40 (copy), l__ModDefult__26 (copy), u558 (copy), l__ServersScrolling__25 (copy), l__ModeServersStatus__27 (copy), u8 (copy), u5 (copy), u182 (ref), u63 (copy), u46 (copy), u37 (ref)
        u82 = u82 + 1;
        local v645 = u82;
        local u646 = tostring(p643 and (p643.ModeType or "Official") or "Official");
        u44 = u641;
        u45 = u646;
        u38 = p642;
        u40 = p643;
        u32.LastServerAt = os.clock();
        l__Right__18:SetAttribute("SelectedModeId", u641);
        l__Right__18:SetAttribute("SelectedModeType", u646);
        l__Right__18:SetAttribute("SelectedModeName", p642);
        l__Servers__24.Visible = true;
        local v647 = l__EditCustomModeButton__40;
        local v648;
        if u45 == "Custom" and p643 ~= nil then
            v648 = p643.IsOwner == true;
        else
            v648 = false;
        end;
        v647.Visible = v648;
        if l__ModDefult__26 and l__ModDefult__26:IsA("TextLabel") then
            l__ModDefult__26.Text = p642;
        end;
        if not p644 then
            u558(l__ServersScrolling__25, "GeneratedModeServerRow");
            if l__ModeServersStatus__27 then
                l__ModeServersStatus__27.Text = "Loading servers...";
                l__ModeServersStatus__27.TextColor3 = Color3.fromRGB(215, 221, 232);
            end;
        end;
        local v649, v650 = pcall(function() --[[ Line: 3032 ]]
            -- upvalues: u646 (copy), u8 (ref), u641 (copy), u5 (ref)
            if u646 == "Custom" then
                return u8:InvokeServer(u641);
            else
                return u5:InvokeServer(u641);
            end;
        end);
        if v645 == u82 and (u44 == u641 and u45 == u646) then
            if v649 and type(v650) == "table" then
                local v651 = tonumber(v650.MaxPlayers) or (u37 or 50);
                local v652 = math.floor(v651);
                u37 = math.max(1, v652);
                local l__Servers__64 = v650.Servers;
                local v653 = type(l__Servers__64) ~= "table" and {} or l__Servers__64;
                table.sort(v653, function(p654, p655) --[[ Line: 3059 ]]
                    if type(p654) == "table" then
                        if type(p655) == "table" then
                            local v656 = tonumber(p654.AvgPingMs) or (1 / 0);
                            local v657 = tonumber(p655.AvgPingMs) or (1 / 0);
                            if v656 == v657 then
                                local v658 = tonumber(p654.PlayerCount) or 0;
                                local v659 = tonumber(p655.PlayerCount) or 0;
                                if v658 == v659 then
                                    return tostring(p654.ServerId or "") < tostring(p655.ServerId or "");
                                else
                                    return v659 < v658;
                                end;
                            else
                                return v656 < v657;
                            end;
                        else
                            return true;
                        end;
                    else
                        return false;
                    end;
                end);
                u558(l__ServersScrolling__25, "GeneratedModeServerRow");
                for v660, v661 in ipairs(v653) do
                    if type(v661) == "table" then
                        u46.__createServerRow(v661, v660);
                    end;
                end;
                u46.__createNewServerRow(#v653 + 1);
                u32.LastServerAt = os.clock();
                local v662 = tostring(v650.PlayerCount or 0) .. " players, " .. tostring(v650.ServerCount or 0) .. " servers";
                if l__ModeServersStatus__27 then
                    l__ModeServersStatus__27.Text = v662;
                    l__ModeServersStatus__27.TextColor3 = Color3.fromRGB(215, 221, 232);
                end;
            else
                if not p644 then
                    if u182 and type(u182.ShowNotification) == "function" then
                        u182.ShowNotification("Warning", "Could not load servers.");
                    else
                        u63("Could not load servers.", true, nil);
                    end;
                    if l__ModeServersStatus__27 then
                        l__ModeServersStatus__27.Text = "No server data.";
                        l__ModeServersStatus__27.TextColor3 = Color3.fromRGB(255, 170, 145);
                    end;
                    u46.__createNewServerRow(1);
                end;
            end;
        end;
    end;
    function u46.__createModeRow(u663, p664) --[[ Line: 3094 ]]
        -- upvalues: l__Mod__23 (copy), l__Mod__21 (copy), l__CustomModes__22 (copy), l__Modes__20 (copy), u46 (copy), l__Gameplay__9 (copy), u26 (copy), u605 (copy), l__UserInputService__5 (copy), u95 (copy), u94 (copy), u114 (copy), u115 (copy)
        local u665 = tostring(u663.Id or "");
        if u665 == "" then
            return nil;
        end;
        local v666 = tostring(u663.ModeType or "Official");
        u663.ModeType = v666;
        local v667 = v666 .. ":" .. u665;
        local u668 = tostring(u663.DisplayName or u665);
        local u669 = tostring(u663.Description or "");
        local v670;
        if v666 == "Custom" then
            v670 = l__Mod__23;
        else
            v670 = l__Mod__21;
        end;
        local v671;
        if v666 == "Custom" then
            v671 = l__CustomModes__22;
        else
            v671 = l__Modes__20;
        end;
        local v672 = u46[v667];
        local v673 = v672 == nil and true or v672.Parent == nil;
        if v673 then
            v672 = v670:Clone();
            v672.Name = "Mode_" .. v667:gsub("[^%w_]", "_");
            v672:SetAttribute("GeneratedModeRow", true);
            v672.Visible = true;
            v672.Parent = v671;
            u46[v667] = v672;
        end;
        v672.LayoutOrder = p664;
        v672:SetAttribute("ModeDescription", u669);
        local v674 = v672:FindFirstChild("ModName", true);
        if v674 and v674:IsA("TextLabel") then
            local v675;
            if v666 == "Custom" then
                v675 = u668 .. (u663.IsOwner and " *" or "") or u668;
            else
                v675 = u668;
            end;
            v674.Text = v675;
        end;
        local v676 = v672:FindFirstChild("PlayersValue", true);
        if v676 and v676:IsA("TextLabel") then
            v676.Text = tostring(u663.PlayerCount or 0);
        end;
        local v677 = l__Gameplay__9:GetAttribute("ModeId");
        local v678 = (type(v677) ~= "string" or v677 == "") and "Classic" or v677;
        local v679 = l__Gameplay__9:GetAttribute("ModeType") or "Official";
        local v680 = tostring(v679);
        local v681;
        if u665 == v678 and v666 == v680 then
            v681 = u26;
        else
            v681 = v670.BackgroundColor3;
        end;
        v672.BackgroundColor3 = v681;
        if v673 then
            local v682 = u605(v672, function() --[[ Line: 3136 ]]
                -- upvalues: u46 (ref), u665 (copy), u668 (copy), u663 (copy)
                u46.__loadServers(u665, u668, u663);
            end);
            v682.MouseEnter:Connect(function() --[[ Line: 3139 ]]
                -- upvalues: u668 (copy), u669 (copy), l__UserInputService__5 (ref), u95 (ref), u94 (ref), u114 (ref)
                local v683 = u668;
                local v684 = u669;
                if not l__UserInputService__5.TouchEnabled then
                    if v684 == "" then
                        return;
                    end;
                    u95.Text = v683 .. "\n" .. v684;
                    u94.CanvasPosition = Vector2.new(0, 0);
                    u114();
                    u94.Visible = true;
                end;
            end);
            v682.MouseLeave:Connect(u115);
        end;
        return v667;
    end;
    local function u750(p685) --[[ Line: 3148 ]]
        -- upvalues: u81 (ref), u35 (ref), u34 (ref), u32 (copy), l__ModeFeatureFlags__13 (copy), u119 (copy), l__OfficialModesButton__31 (copy), u26 (copy), u27 (copy), l__CustomModesButton__32 (copy), l__Modes__20 (copy), l__CustomModes__22 (copy), l__CustomModeSearchBox__34 (copy), l__CreateCustomModeButton__33 (copy), u181 (ref), u79 (copy), u7 (copy), u4 (copy), u750 (ref), u39 (ref), u46 (copy), u33 (copy), u36 (ref)
        u81 = u81 + 1;
        local v686 = u81;
        local u687 = u35;
        local v688 = u34;
        u32.LastModeAt[u687] = os.clock();
        local v689 = l__ModeFeatureFlags__13.CustomModesEnabled == true;
        u119();
        local v690 = l__OfficialModesButton__31;
        local v691;
        if u35 == "Official" then
            v691 = u26;
        else
            v691 = u27;
        end;
        v690.BackgroundColor3 = v691;
        local v692 = l__CustomModesButton__32;
        local v693;
        if u35 == "Custom" then
            v693 = u26;
        else
            v693 = u27;
        end;
        v692.BackgroundColor3 = v693;
        l__CustomModesButton__32.TextTransparency = v689 and 0 or 0.35;
        l__Modes__20.Visible = u35 == "Official";
        local v694 = l__CustomModes__22;
        local v695;
        if u35 == "Custom" then
            v695 = v689;
        else
            v695 = false;
        end;
        v694.Visible = v695;
        local v696 = l__CustomModeSearchBox__34;
        local v697;
        if u35 == "Custom" then
            v697 = v689;
        else
            v697 = false;
        end;
        v696.Visible = v697;
        local v698 = l__CreateCustomModeButton__33;
        if u35 ~= "Custom" then
            v689 = false;
        end;
        v698.Visible = v689;
        if not p685 then
            local v699 = u687 == "Custom" and "Loading custom modes..." or "Loading modes...";
            local v700 = u181;
            if v700 then
                v700.Text = v699;
                v700.Visible = v699 ~= "";
                v700.TextColor3 = Color3.fromRGB(215, 221, 232);
            end;
        end;
        local v701 = {};
        local v702;
        if u687 == "Custom" then
            local v703, v704;
            v703, v702, v704 = u79(u7, 7, v688);
            if v704 then
                local v705 = u181;
                if v705 then
                    v705.Text = "Custom modes are still loading. Try again in a moment.";
                    v705.Visible = true;
                    v705.TextColor3 = Color3.fromRGB(255, 170, 145);
                    return;
                else
                    return;
                end;
            end;
            if not v703 or type(v702) ~= "table" then
                local v706 = u181;
                if v706 then
                    v706.Text = "Could not load custom modes.";
                    v706.Visible = true;
                    v706.TextColor3 = Color3.fromRGB(255, 170, 145);
                    v702 = {};
                else
                    v702 = {};
                end;
            end;
        else
            local v707, v708;
            v707, v702, v708 = u79(u4, 7);
            if v708 then
                local v709 = u181;
                if v709 then
                    v709.Text = "Modes are still loading. Try again in a moment.";
                    v709.Visible = true;
                    v709.TextColor3 = Color3.fromRGB(255, 170, 145);
                    return;
                else
                    return;
                end;
            end;
            if not v707 or type(v702) ~= "table" then
                local v710 = u181;
                if v710 then
                    v710.Text = "Could not load modes.";
                    v710.Visible = true;
                    v710.TextColor3 = Color3.fromRGB(255, 170, 145);
                    v702 = {};
                else
                    v702 = {};
                end;
            end;
        end;
        if v686 == u81 and (u687 == u35 and v688 == u34) then
            local v711;
            if type(v702) == "table" then
                v711 = v702._Refreshing == true;
            else
                v711 = false;
            end;
            if v711 and #v702 == 0 then
                local v712 = u181;
                if v712 then
                    v712.Text = "Updating modes...";
                    v712.Visible = true;
                    v712.TextColor3 = Color3.fromRGB(215, 221, 232);
                end;
                local v713 = l__ModeFeatureFlags__13.CustomModesEnabled == true;
                u119();
                local v714 = l__OfficialModesButton__31;
                local v715;
                if u35 == "Official" then
                    v715 = u26;
                else
                    v715 = u27;
                end;
                v714.BackgroundColor3 = v715;
                local v716 = l__CustomModesButton__32;
                local v717;
                if u35 == "Custom" then
                    v717 = u26;
                else
                    v717 = u27;
                end;
                v716.BackgroundColor3 = v717;
                l__CustomModesButton__32.TextTransparency = v713 and 0 or 0.35;
                l__Modes__20.Visible = u35 == "Official";
                local v718 = l__CustomModes__22;
                local v719;
                if u35 == "Custom" then
                    v719 = v713;
                else
                    v719 = false;
                end;
                v718.Visible = v719;
                local v720 = l__CustomModeSearchBox__34;
                local v721;
                if u35 == "Custom" then
                    v721 = v713;
                else
                    v721 = false;
                end;
                v720.Visible = v721;
                local v722 = l__CreateCustomModeButton__33;
                if u35 ~= "Custom" then
                    v713 = false;
                end;
                v722.Visible = v713;
                local u723 = u81;
                task.delay(u687 == "Custom" and 1.5 or 2, function() --[[ Line: 3196 ]]
                    -- upvalues: u750 (ref), u35 (ref), u687 (copy), u81 (ref), u723 (copy)
                    if u750 and (u35 == u687 and u81 == u723) then
                        u750(true);
                    end;
                end);
            else
                if u687 == "Custom" and (v688 == "" and not v711) then
                    u39 = false;
                end;
                for _, v724 in ipairs(v702) do
                    if u687 == "Custom" and (type(v724) == "table" and v724.IsOwner == true) then
                        u39 = true;
                    end;
                end;
                table.sort(v702, function(p725, p726) --[[ Line: 3212 ]]
                    if type(p725) == "table" then
                        if type(p726) == "table" then
                            local v727 = tonumber(p725.PlayerCount) or 0;
                            local v728 = tonumber(p726.PlayerCount) or 0;
                            if v727 == v728 then
                                local v729 = tonumber(p725.ServerCount) or 0;
                                local v730 = tonumber(p726.ServerCount) or 0;
                                if v729 == v730 then
                                    return tostring(p725.DisplayName or (p725.Id or "")) < tostring(p726.DisplayName or (p726.Id or ""));
                                else
                                    return v730 < v729;
                                end;
                            else
                                return v728 < v727;
                            end;
                        else
                            return true;
                        end;
                    else
                        return false;
                    end;
                end);
                local v731 = 0;
                for _, v732 in ipairs(v702) do
                    if type(v732) == "table" then
                        v732.ModeType = u687;
                        v731 = v731 + 1;
                        local v733 = u46.__createModeRow(v732, v731);
                        if v733 then
                            v701[v733] = true;
                        end;
                    end;
                end;
                for v734, v735 in pairs(u46) do
                    if string.sub(v734, 1, #u687 + 1) == u687 .. ":" and not v701[v734] then
                        u46[v734] = nil;
                        if v735 and v735.Parent then
                            v735:Destroy();
                        end;
                    end;
                end;
                u33[u687] = true;
                u32.LastModeAt[u687] = os.clock();
                if u687 == "Custom" then
                    u36 = v688;
                end;
                local v736 = v711 and "Updating modes..." or (#v702 == 0 and "No modes found." or "");
                local v737 = u181;
                if v737 then
                    v737.Text = v736;
                    v737.Visible = v736 ~= "";
                    local v738;
                    if v711 then
                        v738 = Color3.fromRGB(255, 170, 145);
                    else
                        v738 = Color3.fromRGB(215, 221, 232);
                    end;
                    v737.TextColor3 = v738;
                end;
                local v739 = l__ModeFeatureFlags__13.CustomModesEnabled == true;
                u119();
                local v740 = l__OfficialModesButton__31;
                local v741;
                if u35 == "Official" then
                    v741 = u26;
                else
                    v741 = u27;
                end;
                v740.BackgroundColor3 = v741;
                local v742 = l__CustomModesButton__32;
                local v743;
                if u35 == "Custom" then
                    v743 = u26;
                else
                    v743 = u27;
                end;
                v742.BackgroundColor3 = v743;
                l__CustomModesButton__32.TextTransparency = v739 and 0 or 0.35;
                l__Modes__20.Visible = u35 == "Official";
                local v744 = l__CustomModes__22;
                local v745;
                if u35 == "Custom" then
                    v745 = v739;
                else
                    v745 = false;
                end;
                v744.Visible = v745;
                local v746 = l__CustomModeSearchBox__34;
                local v747;
                if u35 == "Custom" then
                    v747 = v739;
                else
                    v747 = false;
                end;
                v746.Visible = v747;
                local v748 = l__CreateCustomModeButton__33;
                if u35 ~= "Custom" then
                    v739 = false;
                end;
                v748.Visible = v739;
                if u687 == "Official" and not p685 or v711 then
                    local u749 = u81;
                    task.delay(u687 == "Custom" and 2.5 or 2, function() --[[ Line: 3261 ]]
                        -- upvalues: u750 (ref), u35 (ref), u687 (copy), u81 (ref), u749 (copy)
                        if u750 and (u35 == u687 and u81 == u749) then
                            u750(true);
                        end;
                    end);
                end;
            end;
        end;
    end;
    l__ModeServersClose__30.MouseButton1Click:Connect(function() --[[ Line: 3269 ]]
        -- upvalues: u82 (ref), l__Servers__24 (copy), l__EditCustomModeButton__40 (copy)
        u82 = u82 + 1;
        l__Servers__24.Visible = false;
        l__EditCustomModeButton__40.Visible = false;
    end);
    v18.OnClientEvent:Connect(function(p751) --[[ Line: 3275 ]]
        -- upvalues: u307 (copy), u182 (ref), u63 (copy)
        if type(p751) == "table" then
            if tostring(p751.Code or "") == "ModeInviteReceived" and type(p751.Invite) == "table" then
                if type(u307.ShowInvite) == "function" then
                    u307.ShowInvite(p751.Invite);
                end;
            else
                local v752 = tostring(p751.Message or (p751.Code or "Teleport result"));
                local v753 = p751.Ok ~= true;
                local v754 = p751.Ok == true and "Teleport" or nil;
                if u182 and type(u182.ShowNotification) == "function" then
                    u182.ShowNotification(v754 == "Teleport" and "Teleport" or (v753 and "Warning" or "Info"), v752);
                else
                    u63(v752, v753, v754);
                end;
            end;
        end;
    end);
    v19.OnClientEvent:Connect(function(p755) --[[ Line: 3289 ]]
        -- upvalues: u182 (ref), u63 (copy)
        if type(p755) == "table" then
            local v756 = tostring(p755.Message or (p755.Code or "Custom mode result"));
            local v757 = p755.Ok ~= true;
            if u182 and type(u182.ShowNotification) == "function" then
                u182.ShowNotification(v757 and "Warning" or "Info", v756);
            else
                u63(v756, v757, nil);
            end;
        end;
    end);
    task.spawn(function() --[[ Line: 3297 ]]
        -- upvalues: u32 (copy), l__Mods__19 (copy), u750 (ref), u35 (ref), l__Servers__24 (copy), u44 (ref), u38 (ref), u46 (copy), u40 (ref)
        while true do
            task.wait(u32.PollInterval);
            if l__Mods__19.Visible and (u750 and os.clock() - (u32.LastModeAt[u35] or 0) >= u32.ModeListInterval) then
                task.defer(u750);
            end;
            if l__Servers__24.Visible and (u44 and (u38 ~= "" and os.clock() - u32.LastServerAt >= u32.ServerListInterval)) then
                task.defer(u46.__loadServers, u44, u38, u40, true);
            end;
        end;
    end);
    l__Gameplay__9:GetAttributeChangedSignal("ModeId"):Connect(function() --[[ Line: 3309 ]]
        -- upvalues: u750 (ref)
        if u750 then
            u750();
        end;
    end);
    (function() --[[ Name: setupRightTabs, Line 2899 ]]
        -- upvalues: l__Right__18 (copy), u611 (copy)
        local v758 = l__Right__18:FindFirstChild("Select");
        if v758 then
            for _, u759 in ipairs(v758:GetChildren()) do
                if u759:IsA("GuiButton") then
                    u759.MouseButton1Click:Connect(function() --[[ Line: 2907 ]]
                        -- upvalues: u611 (ref), u759 (copy)
                        u611(u759.Name);
                    end);
                end;
            end;
        end;
    end)();
    u611("Mods");
    u133("Official");
end;