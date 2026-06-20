-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.AudioController

-- Decompiled with Potassium's decompiler.

script:SetAttribute("SupersededByV2", true);
if script:GetAttribute("SupersededByV2") == true then
else
    local l__Players__1 = game:GetService("Players");
    local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
    local l__SoundService__3 = game:GetService("SoundService");
    local l__UserInputService__4 = game:GetService("UserInputService");
    local l__RunService__5 = game:GetService("RunService");
    local l__MarketplaceService__6 = game:GetService("MarketplaceService");
    local l__Workspace__7 = game:GetService("Workspace");
    local l__PlayerGui__8 = l__Players__1.LocalPlayer:WaitForChild("PlayerGui");
    local l__Framework__9 = l__ReplicatedStorage__2:WaitForChild("Framework", 15);
    if l__Framework__9 then
        l__Framework__9 = l__Framework__9:WaitForChild("Network", 15);
    end;
    if l__Framework__9 then
        l__Framework__9 = l__Framework__9:WaitForChild("MusicPreferences", 15);
    end;
    if l__Framework__9 and not l__Framework__9:IsA("RemoteFunction") then
        l__Framework__9 = nil;
    end;
    local u1 = l__SoundService__3:FindFirstChild("AgaricAudio");
    if not u1 then
        u1 = Instance.new("Folder");
        u1.Name = "AgaricAudio";
        u1.Parent = l__SoundService__3;
    end;
    local function v8(p2, p3, p4, p5) --[[ Line: 45 ]]
        -- upvalues: u1 (ref)
        local v6 = u1:FindFirstChild(p2);
        if not (v6 and v6:IsA("Sound")) then
            if v6 then
                v6:Destroy();
            end;
            v6 = Instance.new("Sound");
            v6.Name = p2;
            v6.Parent = u1;
        end;
        local v7 = tostring(p3 or "");
        if string.sub(v7, 1, 13) ~= "rbxassetid://" then
            v7 = "rbxassetid://" .. v7;
        end;
        v6.SoundId = v7;
        v6.Volume = p4;
        v6.PlaybackSpeed = p5 or 1;
        v6.Looped = false;
        return v6;
    end;
    local u9 = {
        Hover = v8("UI_Hover", "6895079853", 0.08, 1.05),
        Click = v8("UI_Click", "6895079853", 0.14, 1),
        Equip = v8("UI_Equip", "6895079853", 0.18, 1.18)
    };
    local u10 = {};
    local function u14(p11) --[[ Line: 69 ]]
        -- upvalues: u9 (copy), u10 (copy)
        local u12 = u9[p11] or u9.Click;
        local v13 = os.clock();
        if v13 < (u10[p11] or 0) + 0.04 then
        else
            u10[p11] = v13;
            pcall(function() --[[ Line: 76 ]]
                -- upvalues: u12 (copy)
                u12.TimePosition = 0;
                u12:Play();
            end);
        end;
    end;
    local function u18(p15) --[[ Line: 82 ]]
        local v16 = p15:IsA("TextButton") and (p15.Text or "") or "";
        local v17 = string.lower((p15.Name or "") .. " " .. v16);
        return string.find(v17, "equip", 1, true) or (string.find(v17, "wear", 1, true) or string.find(v17, "select", 1, true) or (string.find(v17, "use", 1, true) or string.find(v17, "activate", 1, true)));
    end;
    local u19 = setmetatable({}, {
        __mode = "k"
    });
    local function u21(p20) --[[ Line: 97 ]]
        -- upvalues: l__UserInputService__4 (copy)
        if not l__UserInputService__4.TouchEnabled then
            return false;
        end;
        while p20 do
            if p20.Name == "MobileAgaricControls" or (p20.Name == "WorldEventBoostBar" or p20.Name == "BotBoostHud") then
                return true;
            end;
            p20 = p20.Parent;
        end;
        return false;
    end;
    local function v23(u22) --[[ Line: 111 ]]
        -- upvalues: u19 (copy), l__UserInputService__4 (copy), u14 (copy), u21 (copy), u18 (copy)
        if u19[u22] or not u22:IsA("GuiButton") then
        else
            u19[u22] = true;
            u22.MouseEnter:Connect(function() --[[ Line: 117 ]]
                -- upvalues: l__UserInputService__4 (ref), u14 (ref)
                if not l__UserInputService__4.TouchEnabled then
                    u14("Hover");
                end;
            end);
            u22.Activated:Connect(function() --[[ Line: 123 ]]
                -- upvalues: u21 (ref), u22 (copy), u14 (ref), u18 (ref)
                if u21(u22) then
                else
                    u14(u18(u22) and "Equip" or "Click");
                end;
            end);
        end;
    end;
    for _, v24 in ipairs(l__PlayerGui__8:GetDescendants()) do
        v23(v24);
    end;
    l__PlayerGui__8.DescendantAdded:Connect(v23);
    local u25 = u1:FindFirstChild("AgaricMusicPlayer");
    if not (u25 and u25:IsA("Sound")) then
        if u25 then
            u25:Destroy();
        end;
        u25 = Instance.new("Sound");
        u25.Name = "AgaricMusicPlayer";
        u25.Parent = u1;
    end;
    local v26 = tostring("104185011771893");
    if string.sub(v26, 1, 13) ~= "rbxassetid://" then
        v26 = "rbxassetid://" .. v26;
    end;
    u25.SoundId = v26;
    u25.Volume = 0.35;
    u25.PlaybackSpeed = 1;
    u25.Looped = true;
    local u27 = {
        MusicEnabled = true,
        MusicVolume = 0.35,
        MusicSpeed = 1,
        MusicLoop = true,
        CurrentMusicId = "104185011771893",
        FavoriteMusic = {}
    };
    local u28 = {
        {
            Id = "104185011771893",
            Name = "Agaric Extra"
        },
        {
            Id = "9046272046",
            Name = "Bohemian Raspberry C"
        },
        {
            Id = "111018902835657",
            Name = "Grassroots Chant"
        },
        {
            Id = "9047105533",
            Name = "Arcade Chill"
        },
        {
            Id = "1840684529",
            Name = "Night Drive"
        }
    };
    local u29 = "Agaric Extra";
    local u30 = false;
    local function u37(p31) --[[ Line: 186 ]]
        local v32 = {};
        local v33 = {};
        if type(p31) == "table" then
            for _, v34 in ipairs(p31) do
                if type(v34) == "table" then
                    local v35 = string.match(tostring(v34.Id or (v34.ID or v34.id) or ""), "%d+");
                    if not v35 or (#v35 < 2 or #v35 > 20) then
                        v35 = nil;
                    end;
                    if v35 and not v33[v35] then
                        v33[v35] = true;
                        local v36 = {
                            Id = v35,
                            Name = tostring(v34.Name or (v34.name or "Audio " .. v35))
                        };
                        table.insert(v32, v36);
                    end;
                end;
            end;
        end;
        return v32;
    end;
    local function u41(p38) --[[ Line: 219 ]]
        -- upvalues: u27 (copy), u28 (ref)
        for _, v39 in ipairs(u27.FavoriteMusic or {}) do
            if v39.Id == p38 then
                return v39.Name;
            end;
        end;
        for _, v40 in ipairs(u28) do
            if v40.Id == p38 then
                return v40.Name;
            end;
        end;
        return "Audio " .. tostring(p38);
    end;
    local function u50(p42) --[[ Line: 233 ]]
        -- upvalues: u37 (copy), u28 (ref), u27 (copy), u29 (ref), u41 (copy)
        if type(p42) == "table" then
            if type(p42.Defaults) == "table" then
                local v43 = u37(p42.Defaults);
                if #v43 > 0 then
                    u28 = v43;
                end;
            end;
            local l__Preferences__10 = p42.Preferences;
            if type(l__Preferences__10) == "table" then
                u27.MusicEnabled = l__Preferences__10.MusicEnabled ~= false;
                local v44 = u27;
                local v45 = tonumber(l__Preferences__10.MusicVolume);
                v44.MusicVolume = (not v45 or v45 ~= v45) and 0.35 or math.clamp(v45, 0, 1);
                local v46 = u27;
                local v47 = tonumber(l__Preferences__10.MusicSpeed);
                v46.MusicSpeed = (not v47 or v47 ~= v47) and 1 or math.clamp(v47, 0.5, 2);
                u27.MusicLoop = l__Preferences__10.MusicLoop ~= false;
                local v48 = u27;
                local v49 = string.match(tostring(l__Preferences__10.CurrentMusicId or ""), "%d+");
                if not v49 or (#v49 < 2 or #v49 > 20) then
                    v49 = nil;
                end;
                v48.CurrentMusicId = v49 or "104185011771893";
                u27.FavoriteMusic = u37(l__Preferences__10.FavoriteMusic);
                u29 = u41(u27.CurrentMusicId);
            end;
        end;
    end;
    local function u56() --[[ Line: 257 ]]
        -- upvalues: u27 (copy), l__Framework__9 (ref), u50 (copy)
        local u51 = {
            MusicEnabled = u27.MusicEnabled,
            MusicVolume = u27.MusicVolume,
            MusicSpeed = u27.MusicSpeed,
            MusicLoop = u27.MusicLoop,
            CurrentMusicId = u27.CurrentMusicId
        };
        task.spawn(function() --[[ Line: 265 ]]
            -- upvalues: u51 (copy), l__Framework__9 (ref), u50 (ref)
            local u52 = u51;
            local v53;
            if l__Framework__9 then
                local u54 = "Save";
                local v55;
                v55, v53 = pcall(function() --[[ Line: 210 ]]
                    -- upvalues: l__Framework__9 (ref), u54 (copy), u52 (copy)
                    return l__Framework__9:InvokeServer(u54, u52);
                end);
                if not v55 or type(v53) ~= "table" then
                    v53 = nil;
                end;
            else
                v53 = nil;
            end;
            if v53 and v53.Ok then
                u50(v53);
            end;
        end);
    end;
    local function u61(p57) --[[ Line: 273 ]]
        -- upvalues: l__MarketplaceService__6 (copy)
        local u58 = tonumber(p57);
        if u58 then
            local v59, v60 = pcall(function() --[[ Line: 278 ]]
                -- upvalues: l__MarketplaceService__6 (ref), u58 (copy)
                return l__MarketplaceService__6:GetProductInfo(u58, Enum.InfoType.Asset);
            end);
            if v59 and (type(v60) == "table" and (type(v60.Name) == "string" and v60.Name ~= "")) then
                return string.sub(v60.Name, 1, 48);
            else
                return "Audio " .. tostring(p57);
            end;
        else
            return "Audio " .. tostring(p57);
        end;
    end;
    local function u68(p62, p63, p64) --[[ Line: 310 ]]
        local v65 = Instance.new("TextLabel");
        v65.BackgroundTransparency = 1;
        v65.BorderSizePixel = 0;
        local v66;
        if p64 then
            v66 = Enum.Font.GothamBold;
        else
            v66 = Enum.Font.Gotham;
        end;
        v65.Font = v66;
        v65.Text = p63;
        v65.TextColor3 = Color3.new(1, 1, 1);
        v65.TextScaled = true;
        v65.TextXAlignment = Enum.TextXAlignment.Left;
        v65.TextYAlignment = Enum.TextYAlignment.Center;
        v65.ZIndex = 522;
        v65.Parent = p62;
        local v67 = Instance.new("UITextSizeConstraint");
        v67.MinTextSize = 8;
        v67.MaxTextSize = p64 and 24 or 16;
        v67.Parent = v65;
        return v65;
    end;
    local function u75(p69, p70, p71) --[[ Line: 326 ]]
        local v72 = Instance.new("TextButton");
        v72.AutoButtonColor = true;
        v72.BackgroundColor3 = p71 or Color3.fromRGB(76, 76, 76);
        v72.BorderSizePixel = 0;
        v72.Font = Enum.Font.GothamBold;
        v72.Text = p70;
        v72.TextColor3 = Color3.new(1, 1, 1);
        v72.TextScaled = true;
        v72.TextWrapped = true;
        v72.ZIndex = 523;
        v72.Parent = p69;
        local v73 = Instance.new("UICorner");
        v73.CornerRadius = UDim.new(0, 6);
        v73.Parent = v72;
        local v74 = Instance.new("UITextSizeConstraint");
        v74.MinTextSize = 8;
        v74.MaxTextSize = 16;
        v74.Parent = v72;
        return v72;
    end;
    local v76 = Instance.new("ScreenGui");
    v76.Name = "AgaricAudioGui";
    v76.IgnoreGuiInset = true;
    v76.ResetOnSpawn = false;
    v76.DisplayOrder = 950;
    v76.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    v76.Parent = l__PlayerGui__8;
    local u77 = Instance.new("Frame");
    u77.Name = "AgaricMusicPanel";
    u77.AnchorPoint = Vector2.new(0, 0);
    u77.BackgroundColor3 = Color3.fromRGB(31, 31, 31);
    u77.BorderSizePixel = 0;
    u77.Position = UDim2.fromOffset(80, 80);
    u77.Size = UDim2.fromOffset(400, 360);
    u77.Visible = false;
    u77.ZIndex = 520;
    u77.Parent = v76;
    local v78 = Instance.new("UICorner");
    v78.CornerRadius = UDim.new(0, 8);
    v78.Parent = u77;
    local u79 = Instance.new("TextButton");
    u79.Name = "DragHandle";
    u79.BackgroundTransparency = 1;
    u79.BorderSizePixel = 0;
    u79.Text = "";
    u79.ZIndex = 522;
    u79.Parent = u77;
    local u80 = u68(u77, "Music", true);
    local u81 = u75(u77, "X", Color3.fromRGB(175, 48, 38));
    local u88 = (function(p82, p83) --[[ Name: makeBox, Line 343 ]]
        local v84 = Instance.new("TextBox");
        v84.BackgroundColor3 = Color3.fromRGB(32, 32, 32);
        v84.BorderSizePixel = 0;
        v84.ClearTextOnFocus = false;
        v84.Font = Enum.Font.Gotham;
        v84.PlaceholderText = p83;
        v84.PlaceholderColor3 = Color3.fromRGB(185, 185, 185);
        v84.Text = "";
        v84.TextColor3 = Color3.new(1, 1, 1);
        v84.TextScaled = true;
        v84.TextXAlignment = Enum.TextXAlignment.Left;
        v84.ZIndex = 523;
        v84.Parent = p82;
        local v85 = Instance.new("UICorner");
        v85.CornerRadius = UDim.new(0, 6);
        v85.Parent = v84;
        local v86 = Instance.new("UITextSizeConstraint");
        v86.MinTextSize = 9;
        v86.MaxTextSize = 15;
        v86.Parent = v84;
        local v87 = Instance.new("UIPadding");
        v87.PaddingLeft = UDim.new(0, 8);
        v87.PaddingRight = UDim.new(0, 8);
        v87.Parent = v84;
        return v84;
    end)(u77, "Audio ID or search");
    local u89 = u75(u77, "Play", Color3.fromRGB(255, 103, 15));
    local u90 = u75(u77, "Save", Color3.fromRGB(67, 125, 210));
    local u91 = u75(u77, "Stop", Color3.fromRGB(95, 95, 95));
    local u92 = u68(u77, "Now: Default", false);
    local u93 = u68(u77, "0:00 / 0:00", false);
    u93.TextXAlignment = Enum.TextXAlignment.Right;
    local u94 = u75(u77, "-10", Color3.fromRGB(74, 74, 74));
    local u95 = u75(u77, "+10", Color3.fromRGB(74, 74, 74));
    local u96 = u75(u77, "Vol -", Color3.fromRGB(74, 74, 74));
    local u97 = u75(u77, "Vol +", Color3.fromRGB(74, 74, 74));
    local u98 = u75(u77, "Slow", Color3.fromRGB(74, 74, 74));
    local u99 = u75(u77, "Fast", Color3.fromRGB(74, 74, 74));
    local u100 = u75(u77, "Loop", Color3.fromRGB(74, 74, 74));
    local u101 = u68(u77, "", false);
    u101.TextColor3 = Color3.fromRGB(255, 218, 120);
    local u102 = u68(u77, "Tracks", true);
    local u103 = Instance.new("ScrollingFrame");
    u103.Name = "TrackList";
    u103.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
    u103.BorderSizePixel = 0;
    u103.ScrollBarThickness = 6;
    u103.ScrollingDirection = Enum.ScrollingDirection.Y;
    u103.CanvasSize = UDim2.fromOffset(0, 0);
    u103.ZIndex = 521;
    u103.Parent = u77;
    local v104 = Instance.new("UICorner");
    v104.CornerRadius = UDim.new(0, 6);
    v104.Parent = u103;
    local v105 = Instance.new("UIPadding");
    v105.PaddingTop = UDim.new(0, 6);
    v105.PaddingBottom = UDim.new(0, 6);
    v105.PaddingLeft = UDim.new(0, 6);
    v105.PaddingRight = UDim.new(0, 6);
    v105.Parent = u103;
    local u106 = Instance.new("UIListLayout");
    u106.FillDirection = Enum.FillDirection.Vertical;
    u106.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    u106.SortOrder = Enum.SortOrder.LayoutOrder;
    u106.Padding = UDim.new(0, 6);
    u106.Parent = u103;
    u106:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 442 ]]
        -- upvalues: u103 (copy), u106 (copy)
        u103.CanvasSize = UDim2.fromOffset(0, u106.AbsoluteContentSize.Y + 14);
    end);
    local function u111() --[[ Line: 457 ]]
        -- upvalues: u25 (ref), u27 (copy), u100 (copy), u96 (copy), u98 (copy), u92 (copy), u29 (ref), u41 (copy), u91 (copy)
        u25.Volume = u27.MusicVolume;
        u25.PlaybackSpeed = u27.MusicSpeed;
        u25.Looped = u27.MusicLoop;
        u100.Text = u27.MusicLoop and "Loop ON" or "Loop OFF";
        local v107 = u96;
        local v108 = math.floor(u27.MusicVolume * 100 + 0.5);
        v107.Text = "Vol " .. tostring(v108) .. "%";
        u98.Text = string.format("%.1fx", u27.MusicSpeed);
        local v109 = u92;
        local v110 = u29 or u41(u27.CurrentMusicId);
        v109.Text = "Now: " .. tostring(v110);
        u91.Text = u27.MusicEnabled and "Stop" or "Off";
    end;
    local function u118(p112, p113, p114) --[[ Line: 468 ]]
        -- upvalues: u101 (copy), u27 (copy), u29 (ref), u41 (copy), u25 (ref), u111 (copy), u56 (copy)
        local v115 = string.match(tostring(p112 or ""), "%d+");
        if not v115 or (#v115 < 2 or #v115 > 20) then
            v115 = nil;
        end;
        if v115 then
            u27.CurrentMusicId = v115;
            u27.MusicEnabled = true;
            u29 = p113 or u41(v115);
            local v116 = u25;
            local v117 = tostring(v115 or "");
            if string.sub(v117, 1, 13) ~= "rbxassetid://" then
                v117 = "rbxassetid://" .. v117;
            end;
            v116.SoundId = v117;
            u111();
            pcall(function() --[[ Line: 479 ]]
                -- upvalues: u25 (ref)
                u25.TimePosition = 0;
                u25:Play();
            end);
            if p114 then
                u56();
            end;
            u101.Text = tostring("Playing " .. v115 or "");
        else
            u101.Text = tostring("Invalid audio ID.");
        end;
    end;
    local function u121(p119) --[[ Line: 501 ]]
        -- upvalues: u27 (copy)
        for _, v120 in ipairs(u27.FavoriteMusic or {}) do
            if v120.Id == p119 then
                return true;
            end;
        end;
        return false;
    end;
    local function u149() --[[ Line: 510 ]]
        -- upvalues: u103 (copy), u88 (copy), u27 (copy), u28 (ref), u68 (copy), u75 (copy), u118 (copy), l__Framework__9 (ref), u50 (copy), u101 (copy), u149 (copy)
        for _, v122 in ipairs(u103:GetChildren()) do
            if v122.Name == "TrackRow" and v122:IsA("GuiObject") then
                v122:Destroy();
            end;
        end;
        local v123 = string.lower(u88.Text or "");
        local v124 = {};
        for _, v125 in ipairs(u27.FavoriteMusic or {}) do
            table.insert(v124, {
                Favorite = true,
                Section = "Saved",
                Id = v125.Id,
                Name = v125.Name
            });
        end;
        for _, v126 in ipairs(u28) do
            table.insert(v124, {
                Favorite = false,
                Section = "Default",
                Id = v126.Id,
                Name = v126.Name
            });
        end;
        local v127 = 0;
        for _, u128 in ipairs(v124) do
            local v129 = string.lower((u128.Name or "") .. " " .. tostring(u128.Id));
            if v123 == "" or string.find(v129, v123, 1, true) then
                v127 = v127 + 1;
                local v130 = Instance.new("Frame");
                v130.Name = "TrackRow";
                v130.BackgroundColor3 = Color3.fromRGB(38, 38, 38);
                v130.BorderSizePixel = 0;
                v130.Size = UDim2.new(1, -4, 0, 48);
                v130.ZIndex = 522;
                v130.LayoutOrder = v127;
                v130.Parent = u103;
                local v131 = Instance.new("UICorner");
                v131.CornerRadius = UDim.new(0, 6);
                v131.Parent = v130;
                local v132 = u68(v130, (u128.Favorite and "Saved: " or "") .. tostring(u128.Name), true);
                v132.Position = UDim2.fromOffset(8, 4);
                v132.Size = UDim2.new(1, -132, 0, 20);
                v132.ZIndex = 524;
                local v133 = u68(v130, tostring(u128.Id), false);
                v133.Position = UDim2.fromOffset(8, 25);
                v133.Size = UDim2.new(1, -132, 0, 16);
                v133.TextColor3 = Color3.fromRGB(210, 210, 210);
                v133.ZIndex = 524;
                local v134 = u75(v130, "Play", Color3.fromRGB(255, 103, 15));
                v134.Position = UDim2.new(1, -120, 0, 8);
                v134.Size = UDim2.fromOffset(54, 32);
                v134.ZIndex = 525;
                v134.Activated:Connect(function() --[[ Line: 555 ]]
                    -- upvalues: u118 (ref), u128 (copy)
                    u118(u128.Id, u128.Name, true);
                end);
                local v135 = u75;
                local v136 = u128.Favorite and "X" or "Save";
                local v137;
                if u128.Favorite then
                    v137 = Color3.fromRGB(150, 62, 56);
                else
                    v137 = Color3.fromRGB(67, 125, 210);
                end;
                local v138 = v135(v130, v136, v137);
                v138.Position = UDim2.new(1, -60, 0, 8);
                v138.Size = UDim2.fromOffset(48, 32);
                v138.ZIndex = 525;
                v138.Activated:Connect(function() --[[ Line: 563 ]]
                    -- upvalues: u128 (copy), l__Framework__9 (ref), u50 (ref), u101 (ref), u149 (ref)
                    if u128.Favorite then
                        local u139 = {
                            Id = u128.Id
                        };
                        local v140;
                        if l__Framework__9 then
                            local u141 = "RemoveFavorite";
                            local v142;
                            v142, v140 = pcall(function() --[[ Line: 210 ]]
                                -- upvalues: l__Framework__9 (ref), u141 (copy), u139 (copy)
                                return l__Framework__9:InvokeServer(u141, u139);
                            end);
                            if not v142 or type(v140) ~= "table" then
                                v140 = nil;
                            end;
                        else
                            v140 = nil;
                        end;
                        if v140 and v140.Ok then
                            u50(v140);
                            u101.Text = tostring("Removed from favorites.");
                            u149();
                        else
                            u101.Text = tostring(v140 and v140.Message or "Could not remove favorite." or "");
                        end;
                    else
                        local u143 = {
                            Id = u128.Id,
                            Name = u128.Name
                        };
                        local v144;
                        if l__Framework__9 then
                            local u145 = "AddFavorite";
                            local v146;
                            v146, v144 = pcall(function() --[[ Line: 210 ]]
                                -- upvalues: l__Framework__9 (ref), u145 (copy), u143 (copy)
                                return l__Framework__9:InvokeServer(u145, u143);
                            end);
                            if not v146 or type(v144) ~= "table" then
                                v144 = nil;
                            end;
                        else
                            v144 = nil;
                        end;
                        if v144 and v144.Ok then
                            u50(v144);
                            u101.Text = tostring("Saved to favorites.");
                            u149();
                        else
                            u101.Text = tostring(v144 and v144.Message or "Could not save favorite." or "");
                        end;
                    end;
                end);
            end;
        end;
        if v127 == 0 then
            local v147 = u68(u103, "No saved tracks found.", false);
            v147.Name = "TrackRow";
            v147.BackgroundColor3 = Color3.fromRGB(38, 38, 38);
            v147.BackgroundTransparency = 0;
            v147.BorderSizePixel = 0;
            v147.Size = UDim2.new(1, -4, 0, 44);
            v147.ZIndex = 522;
            local v148 = Instance.new("UICorner");
            v148.CornerRadius = UDim.new(0, 6);
            v148.Parent = v147;
        end;
    end;
    local function u151() --[[ Line: 599 ]]
        -- upvalues: l__PlayerGui__8 (copy), u77 (copy)
        for _, v150 in ipairs(l__PlayerGui__8:GetDescendants()) do
            if v150 ~= u77 and (v150.Name == "MusicPanel" and v150:IsA("GuiObject")) then
                v150.Visible = false;
            end;
        end;
    end;
    local function u159() --[[ Line: 607 ]]
        -- upvalues: l__Workspace__7 (copy), u77 (copy)
        local l__CurrentCamera__11 = l__Workspace__7.CurrentCamera;
        local v152;
        if l__CurrentCamera__11 then
            v152 = l__CurrentCamera__11.ViewportSize;
        else
            v152 = Vector2.new(1280, 720);
        end;
        local l__AbsoluteSize__12 = u77.AbsoluteSize;
        local l__AbsolutePosition__13 = u77.AbsolutePosition;
        local v153 = math.max(6, v152.X - l__AbsoluteSize__12.X - 6);
        local v154 = math.max(6, v152.Y - l__AbsoluteSize__12.Y - 6);
        local v155 = math.clamp(l__AbsolutePosition__13.X, 6, v153) + 0.5;
        local v156 = math.floor(v155);
        local v157 = math.clamp(l__AbsolutePosition__13.Y, 6, v154) + 0.5;
        local v158 = math.floor(v157);
        u77.Position = UDim2.fromOffset(v156, v158);
    end;
    local function u173() --[[ Line: 618 ]]
        -- upvalues: l__Workspace__7 (copy), l__UserInputService__4 (copy), u77 (copy), u79 (copy), u80 (copy), u81 (copy), u88 (copy), u89 (copy), u90 (copy), u91 (copy), u92 (copy), u93 (copy), u94 (copy), u95 (copy), u96 (copy), u97 (copy), u98 (copy), u99 (copy), u100 (copy), u101 (copy), u102 (copy), u103 (copy), u30 (ref), u159 (copy)
        local l__CurrentCamera__14 = l__Workspace__7.CurrentCamera;
        local v160;
        if l__CurrentCamera__14 then
            v160 = l__CurrentCamera__14.ViewportSize;
        else
            v160 = Vector2.new(1280, 720);
        end;
        local v161 = math.clamp(v160.X - 18, 310, 430);
        local v162 = math.floor(v161);
        local v163 = math.clamp(v160.Y - 18, 300, 420);
        local v164 = math.floor(v163);
        if l__UserInputService__4.TouchEnabled then
            local v165 = math.clamp(v160.X - 14, 300, 380);
            v162 = math.floor(v165);
            local v166 = math.clamp(v160.Y - 14, 285, 390);
            v164 = math.floor(v166);
        end;
        u77.Size = UDim2.fromOffset(v162, v164);
        u79.Position = UDim2.fromOffset(0, 0);
        u79.Size = UDim2.new(1, -50, 0, 42);
        u80.Position = UDim2.fromOffset(12, 8);
        u80.Size = UDim2.new(1, -62, 0, 26);
        u81.Position = UDim2.new(1, -40, 0, 8);
        u81.Size = UDim2.fromOffset(30, 30);
        u88.Position = UDim2.fromOffset(12, 48);
        u88.Size = UDim2.new(1, -24, 0, 32);
        local v167 = math.floor((v162 - 24 - 12) / 3);
        u89.Position = UDim2.fromOffset(12, 86);
        u89.Size = UDim2.fromOffset(v167, 32);
        u90.Position = UDim2.fromOffset(v167 + 12 + 6, 86);
        u90.Size = UDim2.fromOffset(v167, 32);
        u91.Position = UDim2.fromOffset((v167 + 6) * 2 + 12, 86);
        u91.Size = UDim2.fromOffset(v162 - 24 - (v167 + 6) * 2, 32);
        u92.Position = UDim2.fromOffset(12, 124);
        u92.Size = UDim2.new(0.63, -12, 0, 22);
        u93.Position = UDim2.new(0.63, 0, 0, 124);
        u93.Size = UDim2.new(0.37, -12, 0, 22);
        local v168 = {
            u94,
            u95,
            u96,
            u97,
            u98,
            u99,
            u100
        };
        local v169 = math.floor((v162 - 24 - (#v168 - 1) * 6) / #v168);
        for v170, v171 in ipairs(v168) do
            v171.Position = UDim2.fromOffset(12 + (v169 + 6) * (v170 - 1), 152);
            local l__fromOffset__15 = UDim2.fromOffset;
            local v172;
            if v170 == #v168 then
                v172 = v162 - 24 - (v169 + 6) * (v170 - 1);
            else
                v172 = v169;
            end;
            v171.Size = l__fromOffset__15(v172, 30);
        end;
        u101.Position = UDim2.fromOffset(12, 188);
        u101.Size = UDim2.new(1, -24, 0, 20);
        u102.Position = UDim2.fromOffset(12, 212);
        u102.Size = UDim2.new(1, -24, 0, 22);
        u103.Position = UDim2.fromOffset(12, 238);
        u103.Size = UDim2.new(1, -24, 1, -250);
        if not u30 then
            u77.Position = UDim2.fromOffset(math.floor((v160.X - v162) / 2 + 0.5), (math.floor((v160.Y - v164) / 2 + 0.5)));
        end;
        u159();
    end;
    local u174 = false;
    local u175 = nil;
    local u176 = nil;
    u79.InputBegan:Connect(function(u177) --[[ Line: 690 ]]
        -- upvalues: u174 (ref), u30 (ref), u175 (ref), u176 (ref), u77 (copy)
        if u177.UserInputType == Enum.UserInputType.MouseButton1 or u177.UserInputType == Enum.UserInputType.Touch then
            u174 = true;
            u30 = true;
            u175 = u177.Position;
            u176 = u77.AbsolutePosition;
            u177.Changed:Connect(function() --[[ Line: 683 ]]
                -- upvalues: u177 (copy), u174 (ref)
                if u177.UserInputState == Enum.UserInputState.End then
                    u174 = false;
                end;
            end);
        end;
    end);
    l__UserInputService__4.InputChanged:Connect(function(p178) --[[ Line: 696 ]]
        -- upvalues: u174 (ref), u175 (ref), u176 (ref), u77 (copy), u159 (copy)
        if u174 and (u175 and u176) then
            if p178.UserInputType == Enum.UserInputType.MouseMovement or p178.UserInputType == Enum.UserInputType.Touch then
                local v179 = p178.Position - u175;
                u77.Position = UDim2.fromOffset(u176.X + v179.X, u176.Y + v179.Y);
                u159();
            end;
        end;
    end);
    u81.Activated:Connect(function() --[[ Line: 725 ]]
        -- upvalues: u77 (copy)
        u77.Visible = false;
    end);
    u89.Activated:Connect(function() --[[ Line: 729 ]]
        -- upvalues: u88 (copy), u27 (copy), u118 (copy), u41 (copy)
        local v180 = string.match(tostring(u88.Text or ""), "%d+");
        if not v180 or (#v180 < 2 or #v180 > 20) then
            v180 = nil;
        end;
        local v181 = v180 or u27.CurrentMusicId or "104185011771893";
        u118(v181, u41(v181), true);
    end);
    u90.Activated:Connect(function() --[[ Line: 734 ]]
        -- upvalues: u88 (copy), u27 (copy), u101 (copy), u121 (copy), u41 (copy), u61 (copy), l__Framework__9 (ref), u50 (copy), u149 (copy)
        local v182 = string.match(tostring(u88.Text or ""), "%d+");
        if not v182 or (#v182 < 2 or #v182 > 20) then
            v182 = nil;
        end;
        local v183 = v182 or u27.CurrentMusicId;
        if v183 then
            if u121(v183) then
                u101.Text = tostring("Already saved.");
            elseif #(u27.FavoriteMusic or {}) >= 24 then
                u101.Text = tostring("Favorite limit reached.");
            else
                local v184 = u41(v183);
                if v184 == "Audio " .. v183 then
                    v184 = u61(v183);
                end;
                local u185 = {
                    Id = v183,
                    Name = v184
                };
                local v186;
                if l__Framework__9 then
                    local u187 = "AddFavorite";
                    local v188;
                    v188, v186 = pcall(function() --[[ Line: 210 ]]
                        -- upvalues: l__Framework__9 (ref), u187 (copy), u185 (copy)
                        return l__Framework__9:InvokeServer(u187, u185);
                    end);
                    if not v188 or type(v186) ~= "table" then
                        v186 = nil;
                    end;
                else
                    v186 = nil;
                end;
                if v186 and v186.Ok then
                    u50(v186);
                    u101.Text = tostring("Saved to favorites.");
                    u149();
                else
                    u101.Text = tostring(v186 and v186.Message or "Could not save favorite." or "");
                end;
            end;
        else
            u101.Text = tostring("Invalid audio ID.");
        end;
    end);
    u91.Activated:Connect(function() --[[ Line: 762 ]]
        -- upvalues: u27 (copy), u25 (ref), u111 (copy), u56 (copy), u101 (copy), u118 (copy), u41 (copy)
        if u27.MusicEnabled then
            u27.MusicEnabled = false;
            pcall(function() --[[ Line: 491 ]]
                -- upvalues: u25 (ref)
                u25:Stop();
            end);
            u111();
            u56();
            u101.Text = tostring("Music stopped.");
        else
            u118(u27.CurrentMusicId or "104185011771893", u41(u27.CurrentMusicId or "104185011771893"), true);
        end;
    end);
    u94.Activated:Connect(function() --[[ Line: 770 ]]
        -- upvalues: u25 (ref)
        pcall(function() --[[ Line: 771 ]]
            -- upvalues: u25 (ref)
            u25.TimePosition = math.max(0, u25.TimePosition - 10);
        end);
    end);
    u95.Activated:Connect(function() --[[ Line: 776 ]]
        -- upvalues: u25 (ref)
        pcall(function() --[[ Line: 777 ]]
            -- upvalues: u25 (ref)
            local v189 = tonumber(u25.TimeLength) or 0;
            if v189 > 0 then
                u25.TimePosition = math.min(v189, u25.TimePosition + 10);
            else
                local v190 = u25;
                v190.TimePosition = v190.TimePosition + 10;
            end;
        end);
    end);
    u96.Activated:Connect(function() --[[ Line: 787 ]]
        -- upvalues: u27 (copy), u111 (copy), u56 (copy)
        u27.MusicVolume = math.clamp(u27.MusicVolume - 0.05, 0, 1);
        u111();
        u56();
    end);
    u97.Activated:Connect(function() --[[ Line: 793 ]]
        -- upvalues: u27 (copy), u111 (copy), u56 (copy)
        u27.MusicVolume = math.clamp(u27.MusicVolume + 0.05, 0, 1);
        u111();
        u56();
    end);
    u98.Activated:Connect(function() --[[ Line: 799 ]]
        -- upvalues: u27 (copy), u111 (copy), u56 (copy)
        u27.MusicSpeed = math.clamp(u27.MusicSpeed - 0.1, 0.5, 2);
        u111();
        u56();
    end);
    u99.Activated:Connect(function() --[[ Line: 805 ]]
        -- upvalues: u27 (copy), u111 (copy), u56 (copy)
        u27.MusicSpeed = math.clamp(u27.MusicSpeed + 0.1, 0.5, 2);
        u111();
        u56();
    end);
    u100.Activated:Connect(function() --[[ Line: 811 ]]
        -- upvalues: u27 (copy), u111 (copy), u56 (copy)
        u27.MusicLoop = not u27.MusicLoop;
        u111();
        u56();
    end);
    u88:GetPropertyChangedSignal("Text"):Connect(u149);
    u88.FocusLost:Connect(function(p191) --[[ Line: 818 ]]
        -- upvalues: u88 (copy), u118 (copy), u41 (copy)
        if p191 then
            local v192 = string.match(tostring(u88.Text or ""), "%d+");
            if not v192 or (#v192 < 2 or #v192 > 20) then
                v192 = nil;
            end;
            if v192 then
                u118(v192, u41(v192), true);
            end;
        end;
    end);
    task.spawn(function() --[[ Line: 830 ]]
        -- upvalues: l__PlayerGui__8 (copy)
        for _ = 1, 80 do
            for _, v193 in ipairs(l__PlayerGui__8:GetDescendants()) do
                hookMusicButton(v193);
            end;
            task.wait(0.25);
        end;
    end);
    if l__Workspace__7.CurrentCamera then
        l__Workspace__7.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 840 ]]
            -- upvalues: u77 (copy), u173 (copy)
            if u77.Visible then
                u173();
            end;
        end);
    end;
    l__RunService__5.Heartbeat:Connect(function() --[[ Line: 847 ]]
        -- upvalues: u77 (copy), u151 (copy), u25 (ref), u93 (copy)
        if u77.Visible then
            u151();
        end;
        local u194 = 0;
        local u195 = 0;
        pcall(function() --[[ Line: 853 ]]
            -- upvalues: u194 (ref), u25 (ref), u195 (ref)
            u194 = u25.TimePosition;
            u195 = u25.TimeLength;
        end);
        local v196 = u93;
        local v197 = tonumber(u194) or 0;
        local v198 = math.floor(v197);
        local v199 = math.max(0, v198);
        local v200 = math.floor(v199 / 60);
        local v201 = string.format("%d:%02d", v200, v199 % 60);
        local v202 = tonumber(u195) or 0;
        local v203 = math.floor(v202);
        local v204 = math.max(0, v203);
        local v205 = math.floor(v204 / 60);
        v196.Text = v201 .. " / " .. string.format("%d:%02d", v205, v204 % 60);
    end);
    local v206;
    if l__Framework__9 then
        local u207 = "Get";
        local u208 = nil;
        local v209;
        v209, v206 = pcall(function() --[[ Line: 210 ]]
            -- upvalues: l__Framework__9 (ref), u207 (copy), u208 (copy)
            return l__Framework__9:InvokeServer(u207, u208);
        end);
        if not v209 or type(v206) ~= "table" then
            v206 = nil;
        end;
    else
        v206 = nil;
    end;
    if v206 and v206.Ok then
        u50(v206);
    end;
    u29 = u41(u27.CurrentMusicId);
    local v210 = tostring(u27.CurrentMusicId or "");
    if string.sub(v210, 1, 13) ~= "rbxassetid://" then
        v210 = "rbxassetid://" .. v210;
    end;
    u25.SoundId = v210;
    u111();
    u149();
    if u27.MusicEnabled then
        pcall(function() --[[ Line: 870 ]]
            -- upvalues: u25 (ref)
            u25:Play();
        end);
    else
        u25:Stop();
    end;
end;