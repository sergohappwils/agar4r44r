-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.AudioControllerV2

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__SoundService__3 = game:GetService("SoundService");
local l__UserInputService__4 = game:GetService("UserInputService");
game:GetService("RunService");
local l__MarketplaceService__5 = game:GetService("MarketplaceService");
local l__Workspace__6 = game:GetService("Workspace");
local l__LocalPlayer__7 = l__Players__1.LocalPlayer;
local l__PlayerGui__8 = l__LocalPlayer__7:WaitForChild("PlayerGui");
local u1 = {
    ["1837468515"] = true
};
local l__Framework__9 = l__ReplicatedStorage__2:WaitForChild("Framework", 20);
local u2;
if l__Framework__9 then
    u2 = require(l__Framework__9:WaitForChild("ClientPlayerState"));
else
    u2 = l__Framework__9;
end;
if l__Framework__9 then
    l__Framework__9 = l__Framework__9:WaitForChild("Network", 20);
end;
local u3 = l__ReplicatedStorage__2:FindFirstChild("Gameplay");
if u3 then
    u3 = u3:FindFirstChild("Network");
end;
local v4;
if u3 then
    v4 = u3:FindFirstChild("MinimapSnapshot");
else
    v4 = u3;
end;
local u5;
if l__Framework__9 then
    u5 = l__Framework__9:WaitForChild("MusicPreferences", 20);
end;
if u5 and not u5:IsA("RemoteFunction") then
    u5 = nil;
end;
if l__Framework__9 then
    l__Framework__9 = l__Framework__9:WaitForChild("MusicPresence", 20);
end;
if l__Framework__9 and not l__Framework__9:IsA("RemoteEvent") then
    l__Framework__9 = nil;
end;
local u6 = l__SoundService__3:FindFirstChild("AgaricAudio");
if not u6 then
    u6 = Instance.new("Folder");
    u6.Name = "AgaricAudio";
    u6.Parent = l__SoundService__3;
end;
local function v9(p7) --[[ Line: 44 ]]
    local v8 = tostring(p7 or "");
    if string.sub(v8, 1, 13) == "rbxassetid://" then
        return v8;
    else
        return "rbxassetid://" .. v8;
    end;
end;
local function v16(p10, p11) --[[ Line: 52 ]]
    -- upvalues: l__SoundService__3 (copy), u6 (ref), u1 (copy)
    for _, v12 in ipairs(p10) do
        local v13 = string.lower(v12);
        for _, v14 in ipairs(l__SoundService__3:GetDescendants()) do
            if v14:IsA("Sound") and (not v14:IsDescendantOf(u6) and (string.lower(v14.Name) == v13 and v14.SoundId ~= "")) then
                local v15 = string.match(v14.SoundId, "%d+");
                if v15 and not u1[v15] then
                    return v15;
                end;
            end;
        end;
    end;
    return p11;
end;
local function v23(p17, p18, p19, p20) --[[ Line: 67 ]]
    -- upvalues: u6 (ref)
    local v21 = u6:FindFirstChild(p17);
    if not (v21 and v21:IsA("Sound")) then
        if v21 then
            v21:Destroy();
        end;
        v21 = Instance.new("Sound");
        v21.Name = p17;
        v21.Parent = u6;
    end;
    local v22 = tostring(p18 or "");
    if string.sub(v22, 1, 13) ~= "rbxassetid://" then
        v22 = "rbxassetid://" .. v22;
    end;
    v21.SoundId = v22;
    v21.Volume = p19;
    v21.PlaybackSpeed = p20 or 1;
    v21.Looped = false;
    return v21;
end;
local v24 = {
    Hover = v16({ "UI_hover", "UI_Hover" }, "127366656618533"),
    Click = v16({ "Buy2" }, "98007189797443"),
    Open = v16({ "SwooshUp" }, "9119740460"),
    Close = v16({ "SwooshDown" }, "9119738974"),
    Buy = v16({ "Buy2" }, "98007189797443"),
    Equip = v16({ "SwooshUp" }, "9119740460"),
    Unequip = v16({ "SwooshDown" }, "9119738974")
};
local u25 = {
    Hover = v23("UI_Hover", v24.Hover, 0.08, 1.05),
    Click = v23("UI_Click", v24.Click, 0.15, 1),
    Open = v23("UI_Open", v24.Open, 0.16, 1),
    Close = v23("UI_Close", v24.Close, 0.16, 1),
    Buy = v23("UI_Buy", v24.Buy, 0.2, 1),
    Equip = v23("UI_Equip", v24.Equip, 0.16, 1),
    Unequip = v23("UI_Unequip", v24.Unequip, 0.16, 1)
};
local u26 = {};
local u27 = true;
local u28 = nil;
local function u30() --[[ Line: 107 ]]
    -- upvalues: u28 (ref), u27 (ref)
    local v29 = u28;
    if v29 then
        v29 = u28:GetAttribute("SfxEnabled");
    end;
    u27 = v29 ~= false;
end;
local v31 = u28;
if v31 then
    v31 = u28:GetAttribute("SfxEnabled");
end;
if v31 == false then
    u27 = false;
else
    u27 = true;
end;
task.spawn(function() --[[ Line: 112 ]]
    -- upvalues: u2 (copy), u28 (ref), l__LocalPlayer__7 (copy), u27 (ref), u30 (copy)
    if u2 then
        u28 = u2.WaitForProxy("Settings", l__LocalPlayer__7, 10);
        local v32 = u28;
        if v32 then
            v32 = u28:GetAttribute("SfxEnabled");
        end;
        u27 = v32 ~= false;
        if u28 then
            u28:GetAttributeChangedSignal("SfxEnabled"):Connect(u30);
        end;
    end;
end);
local function u36(p33) --[[ Line: 123 ]]
    -- upvalues: u27 (ref), u25 (copy), u26 (copy)
    if u27 then
        local u34 = u25[p33] or u25.Click;
        local v35 = os.clock();
        if v35 < (u26[p33] or 0) + 0.045 then
        else
            u26[p33] = v35;
            pcall(function() --[[ Line: 133 ]]
                -- upvalues: u34 (copy)
                u34.TimePosition = 0;
                u34:Play();
            end);
        end;
    end;
end;
local function u41(p37) --[[ Line: 139 ]]
    local v38 = p37:GetAttribute("SfxKind");
    if v38 == "Hover" or (v38 == "Click" or (v38 == "Open" or (v38 == "Close" or (v38 == "Buy" or (v38 == "Equip" or v38 == "Unequip"))))) then
        return v38;
    end;
    local v39 = p37:IsA("TextButton") and (p37.Text or "") or "";
    local v40 = string.lower((p37.Name or "") .. " " .. v39);
    return (string.find(v40, "close", 1, true) or (string.find(v40, "cancel", 1, true) or v39 == "X")) and "Close" or ((string.find(v40, "unequip", 1, true) or (string.find(v40, "unwear", 1, true) or (string.find(v40, "take off", 1, true) or (string.find(v40, "remove", 1, true) or string.find(v40, "delete", 1, true))))) and "Unequip" or ((string.find(v40, "buy", 1, true) or (string.find(v40, "purchase", 1, true) or string.find(v40, "price", 1, true))) and "Buy" or ((string.find(v40, "equip", 1, true) or (string.find(v40, "wear", 1, true) or (string.find(v40, "select", 1, true) or (string.find(v40, "use", 1, true) or string.find(v40, "activate", 1, true))))) and "Equip" or ((string.find(v40, "open", 1, true) or (string.find(v40, "view", 1, true) or (string.find(v40, "shop", 1, true) or (string.find(v40, "menu", 1, true) or (string.find(v40, "music", 1, true) or (string.find(v40, "friends", 1, true) or (string.find(v40, "play", 1, true) or string.find(v40, "search", 1, true)))))))) and "Open" or "Click"))));
end;
local u42 = {};
local function u44(p43) --[[ Line: 181 ]]
    -- upvalues: l__UserInputService__4 (copy)
    if not l__UserInputService__4.TouchEnabled then
        return false;
    end;
    while p43 do
        if p43.Name == "MobileAgaricControls" or (p43.Name == "WorldEventBoostBar" or p43.Name == "BotBoostHud") then
            return true;
        end;
        p43 = p43.Parent;
    end;
    return false;
end;
local function v59(u45) --[[ Line: 195 ]]
    -- upvalues: u42 (copy), l__PlayerGui__8 (copy), l__UserInputService__4 (copy), u36 (copy), u44 (copy), u41 (copy)
    if u42[u45] or not u45:IsA("GuiButton") then
    else
        local v46 = {};
        u42[u45] = v46;
        v46[#v46 + 1] = u45.MouseEnter:Connect(function() --[[ Line: 202 ]]
            -- upvalues: u45 (copy), l__PlayerGui__8 (ref), u42 (ref), l__UserInputService__4 (ref), u36 (ref)
            if u45:IsDescendantOf(l__PlayerGui__8) then
                if not l__UserInputService__4.TouchEnabled then
                    u36("Hover");
                end;
            else
                local v47 = u45;
                local v48 = u42[v47];
                if v48 then
                    u42[v47] = nil;
                    for _, v49 in ipairs(v48) do
                        v49:Disconnect();
                    end;
                end;
            end;
        end);
        v46[#v46 + 1] = u45.Activated:Connect(function() --[[ Line: 211 ]]
            -- upvalues: u45 (copy), l__PlayerGui__8 (ref), u42 (ref), u44 (ref), u36 (ref), u41 (ref)
            if u45:IsDescendantOf(l__PlayerGui__8) then
                if u44(u45) then
                else
                    u36((u41(u45)));
                end;
            else
                local v50 = u45;
                local v51 = u42[v50];
                if v51 then
                    u42[v50] = nil;
                    for _, v52 in ipairs(v51) do
                        v52:Disconnect();
                    end;
                end;
            end;
        end);
        v46[#v46 + 1] = u45.AncestryChanged:Connect(function() --[[ Line: 221 ]]
            -- upvalues: u45 (copy), l__PlayerGui__8 (ref), u42 (ref)
            if not u45:IsDescendantOf(l__PlayerGui__8) then
                local v53 = u45;
                local v54 = u42[v53];
                if not v54 then
                    return;
                end;
                u42[v53] = nil;
                for _, v55 in ipairs(v54) do
                    v55:Disconnect();
                end;
            end;
        end);
        v46[#v46 + 1] = u45.Destroying:Connect(function() --[[ Line: 226 ]]
            -- upvalues: u45 (copy), u42 (ref)
            local v56 = u45;
            local v57 = u42[v56];
            if v57 then
                u42[v56] = nil;
                for _, v58 in ipairs(v57) do
                    v58:Disconnect();
                end;
            end;
        end);
    end;
end;
for _, v60 in ipairs(l__PlayerGui__8:GetDescendants()) do
    v59(v60);
end;
l__PlayerGui__8.DescendantAdded:Connect(v59);
local u61 = u6:FindFirstChild("AgaricMusicPlayer");
if not (u61 and u61:IsA("Sound")) then
    if u61 then
        u61:Destroy();
    end;
    u61 = Instance.new("Sound");
    u61.Name = "AgaricMusicPlayer";
    u61.Parent = u6;
end;
local v62 = u6:FindFirstChild("NearbyMusic");
if not (v62 and v62:IsA("Folder")) then
    if v62 then
        v62:Destroy();
    end;
    local v63 = Instance.new("Folder");
    v63.Name = "NearbyMusic";
    v63.Parent = u6;
end;
local u64 = l__Workspace__6:FindFirstChild("AgaricLocalAudioWorld");
if not (u64 and u64:IsA("Folder")) then
    if u64 then
        u64:Destroy();
    end;
    u64 = Instance.new("Folder");
    u64.Name = "AgaricLocalAudioWorld";
    u64.Parent = l__Workspace__6;
end;
local u65 = {
    MusicEnabled = false,
    MusicVolume = 0.35,
    PublicMusicVolume = 0.35,
    OtherMusicVolume = 0.35,
    MusicSpeed = 1,
    MusicLoop = true,
    PublicMusicEnabled = false,
    MuteOtherMusic = false,
    CurrentMusicId = "104185011771893",
    FavoriteMusic = {}
};
local u66 = {
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
local u67 = {};
local u68 = "";
local u69 = true;
local u70 = {};
local u71 = {};
local u72 = {};
local u73 = {};
local u74 = nil;
local u75 = nil;
local u76 = nil;
local u77 = nil;
local u78 = "Agaric Extra";
local u79 = "Default";
local u80 = 1;
local u81 = 0;
local u82 = false;
local u83 = false;
local u84 = false;
local u85 = 0;
local u86 = 0;
local u87 = 0;
local u88 = 0;
local u89 = 0;
local function u96(p90) --[[ Line: 341 ]]
    -- upvalues: u1 (copy)
    local v91 = {};
    local v92 = {};
    if type(p90) == "table" then
        for _, v93 in ipairs(p90) do
            if type(v93) == "table" then
                local v94 = string.match(tostring(v93.Id or (v93.ID or v93.id) or ""), "%d+");
                if not v94 or (#v94 < 2 or (#v94 > 20 or u1[v94])) then
                    v94 = nil;
                end;
                if v94 and not v92[v94] then
                    v92[v94] = true;
                    local v95 = {
                        Id = v94,
                        Name = tostring(v93.Name or v93.Title or (v93.name or "Audio " .. v94)),
                        Artist = tostring(v93.Artist or ""),
                        Duration = tonumber(v93.Duration) or 0,
                        IsEndorsed = v93.IsEndorsed == true
                    };
                    table.insert(v91, v95);
                end;
            end;
        end;
    end;
    return v91;
end;
local function v101(u97, u98) --[[ Line: 364 ]]
    -- upvalues: u5 (ref)
    if u5 then
        local v99, v100 = pcall(function() --[[ Line: 368 ]]
            -- upvalues: u5 (ref), u97 (copy), u98 (copy)
            return u5:InvokeServer(u97, u98);
        end);
        if v99 and type(v100) == "table" then
            return v100;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function u106(p102) --[[ Line: 377 ]]
    -- upvalues: u65 (copy), u66 (ref), u67 (ref)
    for _, v103 in ipairs(u65.FavoriteMusic or {}) do
        if v103.Id == p102 then
            return v103.Name;
        end;
    end;
    for _, v104 in ipairs(u66) do
        if v104.Id == p102 then
            return v104.Name;
        end;
    end;
    for _, v105 in ipairs(u67) do
        if v105.Id == p102 then
            return v105.Name;
        end;
    end;
    return "Audio " .. tostring(p102);
end;
local function u111(p107, p108) --[[ Line: 396 ]]
    local v109 = tostring(p107 or "");
    local v110 = string.gsub(v109, "%s", "");
    if v109 == "" or v110 ~= "" and (string.find(v110, "#", 1, true) and not string.find(v110, "[^#]")) then
        return "Audio " .. tostring(p108 or "104185011771893");
    else
        return v109;
    end;
end;
local function u124(p112) --[[ Line: 405 ]]
    -- upvalues: u96 (copy), u66 (ref), u65 (copy), u1 (copy), u78 (ref), u106 (copy)
    if type(p112) == "table" then
        if type(p112.Defaults) == "table" then
            local v113 = u96(p112.Defaults);
            if #v113 > 0 then
                u66 = v113;
            end;
        end;
        local l__Preferences__10 = p112.Preferences;
        if type(l__Preferences__10) == "table" then
            u65.MusicEnabled = l__Preferences__10.MusicEnabled == true;
            local v114 = u65;
            local v115 = tonumber(l__Preferences__10.MusicVolume);
            v114.MusicVolume = (not v115 or v115 ~= v115) and 0.35 or math.clamp(v115, 0, 1);
            local v116 = u65;
            local v117 = tonumber(l__Preferences__10.PublicMusicVolume);
            v116.PublicMusicVolume = (not v117 or v117 ~= v117) and 0.35 or math.clamp(v117, 0, 1);
            local v118 = u65;
            local v119 = tonumber(l__Preferences__10.OtherMusicVolume);
            v118.OtherMusicVolume = (not v119 or v119 ~= v119) and 0.35 or math.clamp(v119, 0, 1);
            local v120 = u65;
            local v121 = tonumber(l__Preferences__10.MusicSpeed);
            v120.MusicSpeed = (not v121 or v121 ~= v121) and 1 or math.clamp(v121, 0.5, 2);
            u65.MusicLoop = l__Preferences__10.MusicLoop ~= false;
            u65.PublicMusicEnabled = l__Preferences__10.PublicMusicEnabled == true;
            u65.MuteOtherMusic = l__Preferences__10.MuteOtherMusic == true;
            local v122 = u65;
            local v123 = string.match(tostring(l__Preferences__10.CurrentMusicId or ""), "%d+");
            if not v123 or (#v123 < 2 or (#v123 > 20 or u1[v123])) then
                v123 = nil;
            end;
            v122.CurrentMusicId = v123 or "104185011771893";
            u65.FavoriteMusic = u96(l__Preferences__10.FavoriteMusic);
            u78 = u106(u65.CurrentMusicId);
        end;
    end;
end;
local function u131() --[[ Line: 432 ]]
    -- upvalues: u81 (ref), u65 (copy), u5 (ref), u124 (copy)
    u81 = u81 + 1;
    local u125 = u81;
    local u126 = {
        MusicEnabled = u65.MusicEnabled,
        MusicVolume = u65.MusicVolume,
        PublicMusicVolume = u65.PublicMusicVolume,
        OtherMusicVolume = u65.OtherMusicVolume,
        MusicSpeed = u65.MusicSpeed,
        MusicLoop = u65.MusicLoop,
        PublicMusicEnabled = u65.PublicMusicEnabled,
        MuteOtherMusic = u65.MuteOtherMusic,
        CurrentMusicId = u65.CurrentMusicId
    };
    task.spawn(function() --[[ Line: 446 ]]
        -- upvalues: u126 (copy), u5 (ref), u125 (copy), u81 (ref), u124 (ref)
        local u127 = u126;
        local v128;
        if u5 then
            local u129 = "Save";
            local v130;
            v130, v128 = pcall(function() --[[ Line: 368 ]]
                -- upvalues: u5 (ref), u129 (copy), u127 (copy)
                return u5:InvokeServer(u129, u127);
            end);
            if not v130 or type(v128) ~= "table" then
                v128 = nil;
            end;
        else
            v128 = nil;
        end;
        if v128 and (v128.Ok and u125 == u81) then
            u124(v128);
        end;
    end);
end;
local function u136(p132) --[[ Line: 454 ]]
    -- upvalues: l__MarketplaceService__5 (copy)
    local u133 = tonumber(p132);
    if u133 then
        local v134, v135 = pcall(function() --[[ Line: 459 ]]
            -- upvalues: l__MarketplaceService__5 (ref), u133 (copy)
            return l__MarketplaceService__5:GetProductInfo(u133, Enum.InfoType.Asset);
        end);
        if v134 and (type(v135) == "table" and (type(v135.Name) == "string" and v135.Name ~= "")) then
            return string.sub(v135.Name, 1, 48);
        else
            return "Audio " .. tostring(p132);
        end;
    else
        return "Audio " .. tostring(p132);
    end;
end;
local function u143(p137, p138, p139) --[[ Line: 504 ]]
    local v140 = Instance.new("TextLabel");
    v140.BackgroundTransparency = 1;
    v140.BorderSizePixel = 0;
    local v141;
    if p139 then
        v141 = Enum.Font.GothamBold;
    else
        v141 = Enum.Font.Gotham;
    end;
    v140.Font = v141;
    v140.Text = p138;
    v140.TextColor3 = Color3.fromRGB(242, 245, 248);
    v140.TextScaled = true;
    v140.TextXAlignment = Enum.TextXAlignment.Left;
    v140.TextYAlignment = Enum.TextYAlignment.Center;
    v140.ZIndex = 622;
    v140.Parent = p137;
    local v142 = Instance.new("UITextSizeConstraint");
    v142.MinTextSize = 8;
    v142.MaxTextSize = p139 and 22 or 15;
    v142.Parent = v140;
    return v140;
end;
local function u150(p144, p145, p146) --[[ Line: 520 ]]
    local v147 = Instance.new("TextButton");
    v147.AutoButtonColor = true;
    v147.BackgroundColor3 = p146 or Color3.fromRGB(55, 58, 64);
    v147.BorderSizePixel = 0;
    v147.Font = Enum.Font.GothamBold;
    v147.Text = p145;
    v147.TextColor3 = Color3.fromRGB(255, 255, 255);
    v147.TextScaled = true;
    v147.TextWrapped = true;
    v147.ZIndex = 623;
    v147.Parent = p144;
    local v148 = Instance.new("UICorner");
    v148.CornerRadius = UDim.new(0, 6);
    v148.Parent = v147;
    local v149 = Instance.new("UITextSizeConstraint");
    v149.MinTextSize = 8;
    v149.MaxTextSize = 16;
    v149.Parent = v147;
    return v147;
end;
local v151 = Instance.new("ScreenGui");
v151.Name = "AgaricAudioGuiV2";
v151.IgnoreGuiInset = true;
v151.ResetOnSpawn = false;
v151.DisplayOrder = 980;
v151.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v151.Parent = l__PlayerGui__8;
local u152 = Instance.new("Frame");
u152.Name = "AgaricMusicPanel";
u152.AnchorPoint = Vector2.new(0, 0);
u152.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
u152.BorderSizePixel = 0;
u152.Position = UDim2.fromOffset(90, 80);
u152.Size = UDim2.fromOffset(500, 560);
u152.Visible = false;
u152.ZIndex = 620;
u152.Parent = v151;
local v153 = Instance.new("UICorner");
v153.CornerRadius = UDim.new(0, 9);
v153.Parent = u152;
local u154 = Instance.new("TextButton");
u154.Name = "DragHandle";
u154.BackgroundColor3 = Color3.fromRGB(13, 14, 17);
u154.BorderSizePixel = 0;
u154.Text = "";
u154.ZIndex = 621;
u154.Parent = u152;
local v155 = Instance.new("UICorner");
v155.CornerRadius = UDim.new(0, 9);
v155.Parent = u154;
local u156 = Instance.new("Frame");
u156.BackgroundColor3 = Color3.fromRGB(255, 103, 15);
u156.BorderSizePixel = 0;
u156.ZIndex = 622;
u156.Parent = u154;
local v157 = Instance.new("UICorner");
v157.CornerRadius = UDim.new(0, 3);
v157.Parent = u156;
local u158 = u143(u154, "Music Player", true);
local u159 = u150(u154, "X", Color3.fromRGB(176, 46, 40));
local u160 = Instance.new("ScrollingFrame");
u160.Name = "MusicContentScroll";
u160.BackgroundTransparency = 1;
u160.BorderSizePixel = 0;
u160.ScrollBarThickness = 6;
u160.ScrollingDirection = Enum.ScrollingDirection.Y;
u160.CanvasSize = UDim2.fromOffset(0, 0);
u160.ZIndex = 621;
u160.Parent = u152;
local u169 = (function(p161, p162) --[[ Name: makeBox, Line 537 ]]
    local v163 = Instance.new("TextBox");
    v163.BackgroundColor3 = Color3.fromRGB(16, 18, 22);
    v163.BorderSizePixel = 0;
    v163.ClearTextOnFocus = false;
    v163.Font = Enum.Font.Gotham;
    v163.PlaceholderText = p162;
    v163.PlaceholderColor3 = Color3.fromRGB(150, 160, 170);
    v163.Text = "";
    v163.TextColor3 = Color3.fromRGB(245, 245, 245);
    v163.TextScaled = true;
    v163.TextXAlignment = Enum.TextXAlignment.Left;
    v163.ZIndex = 623;
    v163.Parent = p161;
    local v164 = Instance.new("UICorner");
    v164.CornerRadius = UDim.new(0, 6);
    v164.Parent = v163;
    local v165 = Color3.fromRGB(67, 74, 84);
    local v166 = Instance.new("UIStroke");
    v166.Color = v165;
    v166.Transparency = 0.35;
    v166.Thickness = 1;
    v166.Parent = v163;
    local v167 = Instance.new("UITextSizeConstraint");
    v167.MinTextSize = 9;
    v167.MaxTextSize = 15;
    v167.Parent = v163;
    local v168 = Instance.new("UIPadding");
    v168.PaddingLeft = UDim.new(0, 10);
    v168.PaddingRight = UDim.new(0, 10);
    v168.Parent = v163;
    return v163;
end)(u160, "Audio ID or search, Enter to play/search");
local u170 = u150(u160, "Play", Color3.fromRGB(255, 103, 15));
u170.Visible = false;
local u171 = u150(u160, "Save", Color3.fromRGB(36, 126, 214));
local u172 = u150(u160, "Find", Color3.fromRGB(49, 160, 145));
local u173 = Instance.new("Frame");
u173.BackgroundTransparency = 1;
u173.BorderSizePixel = 0;
u173.ZIndex = 621;
u173.Parent = u160;
local u174 = {
    Default = u150(u173, "Default", Color3.fromRGB(255, 103, 15)),
    Favorites = u150(u173, "Favorites", Color3.fromRGB(45, 48, 54)),
    Roblox = u150(u173, "Roblox", Color3.fromRGB(45, 48, 54))
};
local u175 = u143(u160, "Now: Default", false);
u175.TextTruncate = Enum.TextTruncate.AtEnd;
local u176 = u143(u160, "0:00 / 0:00", false);
u176.TextXAlignment = Enum.TextXAlignment.Right;
local u177 = u150(u160, "Pause", Color3.fromRGB(86, 90, 98));
local u178 = u150(u160, "Loop ON", Color3.fromRGB(86, 90, 98));
local u179 = u150(u160, "Public OFF", Color3.fromRGB(86, 90, 98));
u179.Name = "PublicMusicButton";
local u180 = u150(u160, "Others ON", Color3.fromRGB(86, 90, 98));
u180.Name = "MuteOtherMusicButton";
local u181 = u143(u160, "", false);
u181.TextColor3 = Color3.fromRGB(255, 220, 135);
u181.TextWrapped = true;
local u182 = u143(u160, "Settings", true);
u182.TextColor3 = Color3.fromRGB(210, 218, 225);
local u183 = Instance.new("Frame");
u183.BackgroundTransparency = 1;
u183.BorderSizePixel = 0;
u183.ZIndex = 621;
u183.Parent = u160;
local u184 = Instance.new("ScrollingFrame");
u184.Name = "TrackList";
u184.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
u184.BorderSizePixel = 0;
u184.ScrollBarThickness = 6;
u184.ScrollingDirection = Enum.ScrollingDirection.Y;
u184.CanvasSize = UDim2.fromOffset(0, 0);
u184.ZIndex = 621;
u184.Parent = u160;
local v185 = Instance.new("UICorner");
v185.CornerRadius = UDim.new(0, 7);
v185.Parent = u184;
local v186 = Instance.new("UIPadding");
v186.PaddingTop = UDim.new(0, 7);
v186.PaddingBottom = UDim.new(0, 7);
v186.PaddingLeft = UDim.new(0, 7);
v186.PaddingRight = UDim.new(0, 7);
v186.Parent = u184;
local u187 = Instance.new("UIListLayout");
u187.FillDirection = Enum.FillDirection.Vertical;
u187.HorizontalAlignment = Enum.HorizontalAlignment.Center;
u187.SortOrder = Enum.SortOrder.LayoutOrder;
u187.Padding = UDim.new(0, 7);
u187.Parent = u184;
u187:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 674 ]]
    -- upvalues: u184 (copy), u187 (copy)
    u184.CanvasSize = UDim2.fromOffset(0, u187.AbsoluteContentSize.Y + 16);
end);
local function v189(p188) --[[ Line: 678 ]]
    -- upvalues: u181 (copy)
    u181.Text = tostring(p188 or "");
end;
local function v241(p190, p191, p192, p193, p194, u195, u196, u197) --[[ Line: 682 ]]
    -- upvalues: u143 (copy), l__UserInputService__4 (copy)
    local u198 = {
        Min = p192,
        Max = p193,
        Value = p194,
        Dragging = false,
        Enabled = true,
        DisabledText = nil
    };
    local u199 = Instance.new("Frame");
    u199.BackgroundTransparency = 1;
    u199.BorderSizePixel = 0;
    u199.ZIndex = 621;
    u199.Parent = p190;
    u198.Frame = u199;
    local u200 = u143(u199, p191, true);
    u200.TextColor3 = Color3.fromRGB(210, 218, 225);
    local u201 = u143(u199, "", false);
    u201.TextXAlignment = Enum.TextXAlignment.Right;
    u201.TextColor3 = Color3.fromRGB(255, 220, 135);
    local u202 = Instance.new("TextButton");
    u202.AutoButtonColor = false;
    u202.BackgroundColor3 = Color3.fromRGB(44, 48, 55);
    u202.BorderSizePixel = 0;
    u202.Text = "";
    u202.ZIndex = 622;
    u202.Parent = u199;
    local v203 = Instance.new("UICorner");
    v203.CornerRadius = UDim.new(0, 5);
    v203.Parent = u202;
    local u204 = Instance.new("Frame");
    u204.BackgroundColor3 = Color3.fromRGB(255, 103, 15);
    u204.BorderSizePixel = 0;
    u204.ZIndex = 623;
    u204.Parent = u202;
    local v205 = Instance.new("UICorner");
    v205.CornerRadius = UDim.new(0, 5);
    v205.Parent = u204;
    local u206 = Instance.new("Frame");
    u206.BackgroundColor3 = Color3.fromRGB(245, 248, 250);
    u206.BorderSizePixel = 0;
    u206.ZIndex = 624;
    u206.Parent = u202;
    local v207 = Instance.new("UICorner");
    v207.CornerRadius = UDim.new(0, 10);
    v207.Parent = u206;
    local v208 = Color3.fromRGB(255, 103, 15);
    local v209 = Instance.new("UIStroke");
    v209.Color = v208;
    v209.Transparency = 0.1;
    v209.Thickness = 2;
    v209.Parent = u206;
    function u198.SetLayout(p210, p211) --[[ Line: 728 ]]
        -- upvalues: u199 (copy), u200 (copy), u201 (copy), u202 (copy), u206 (copy)
        u199.Size = UDim2.fromOffset(p211, 32);
        u200.Position = UDim2.fromOffset(0, 0);
        u200.Size = UDim2.fromOffset(86, 16);
        u201.Position = UDim2.new(1, -90, 0, 0);
        u201.Size = UDim2.fromOffset(90, 16);
        u202.Position = UDim2.fromOffset(0, 20);
        u202.Size = UDim2.new(1, 0, 0, 9);
        u206.Size = UDim2.fromOffset(18, 18);
        p210:SetValue(p210.Value, true);
    end;
    function u198.SetRange(p212, p213, p214) --[[ Line: 740 ]]
        p212.Min = p213;
        p212.Max = math.max(p213 + 0.001, p214);
        p212:SetValue(math.clamp(p212.Value, p212.Min, p212.Max), true);
    end;
    function u198.SetValue(p215, p216, p217) --[[ Line: 746 ]]
        -- upvalues: u204 (copy), u206 (copy), u201 (copy), u195 (copy), u196 (copy)
        local v218 = tonumber(p216) or p215.Min;
        p215.Value = math.clamp(v218, p215.Min, p215.Max);
        local v219 = p215.Max <= p215.Min and 0 or (p215.Value - p215.Min) / (p215.Max - p215.Min);
        u204.Size = UDim2.new(v219, 0, 1, 0);
        u206.Position = UDim2.new(v219, -9, 0.5, -9);
        u201.Text = p215.DisabledText or u195(p215.Value, p215.Min, p215.Max);
        if not p217 and (p215.Enabled and u196) then
            u196(p215.Value);
        end;
    end;
    function u198.SetEnabled(p220, p221, p222) --[[ Line: 760 ]]
        -- upvalues: u202 (copy), u204 (copy), u206 (copy), u200 (copy), u201 (copy)
        p220.Enabled = p221 ~= false;
        p220.DisabledText = not p220.Enabled and (p222 or "Locked") or nil;
        u202.Active = p220.Enabled;
        local v223 = u202;
        local v224;
        if p220.Enabled then
            v224 = Color3.fromRGB(44, 48, 55);
        else
            v224 = Color3.fromRGB(30, 32, 37);
        end;
        v223.BackgroundColor3 = v224;
        local v225 = u204;
        local v226;
        if p220.Enabled then
            v226 = Color3.fromRGB(255, 103, 15);
        else
            v226 = Color3.fromRGB(105, 110, 118);
        end;
        v225.BackgroundColor3 = v226;
        u206.BackgroundTransparency = p220.Enabled and 0 or 0.35;
        local v227 = u200;
        local v228;
        if p220.Enabled then
            v228 = Color3.fromRGB(210, 218, 225);
        else
            v228 = Color3.fromRGB(135, 142, 150);
        end;
        v227.TextColor3 = v228;
        local v229 = u201;
        local v230;
        if p220.Enabled then
            v230 = Color3.fromRGB(255, 220, 135);
        else
            v230 = Color3.fromRGB(170, 176, 184);
        end;
        v229.TextColor3 = v230;
        p220:SetValue(p220.Value, true);
    end;
    u202.InputBegan:Connect(function(p231) --[[ Line: 792 ]]
        -- upvalues: u198 (copy), u202 (copy)
        if p231.UserInputType == Enum.UserInputType.MouseButton1 or p231.UserInputType == Enum.UserInputType.Touch then
            if not u198.Enabled then
                return;
            end;
            u198.Dragging = true;
            local l__X__11 = p231.Position.X;
            if not u198.Enabled then
                return;
            end;
            local v232 = math.max(1, u202.AbsoluteSize.X);
            local v233 = math.clamp((l__X__11 - u202.AbsolutePosition.X) / v232, 0, 1);
            u198:SetValue(u198.Min + (u198.Max - u198.Min) * v233, false);
        end;
    end);
    u206.InputBegan:Connect(function(p234) --[[ Line: 797 ]]
        -- upvalues: u198 (copy), u202 (copy)
        if p234.UserInputType == Enum.UserInputType.MouseButton1 or p234.UserInputType == Enum.UserInputType.Touch then
            if not u198.Enabled then
                return;
            end;
            u198.Dragging = true;
            local l__X__12 = p234.Position.X;
            if not u198.Enabled then
                return;
            end;
            local v235 = math.max(1, u202.AbsoluteSize.X);
            local v236 = math.clamp((l__X__12 - u202.AbsolutePosition.X) / v235, 0, 1);
            u198:SetValue(u198.Min + (u198.Max - u198.Min) * v236, false);
        end;
    end);
    l__UserInputService__4.InputChanged:Connect(function(p237) --[[ Line: 802 ]]
        -- upvalues: u198 (copy), u202 (copy)
        if u198.Dragging then
            if p237.UserInputType == Enum.UserInputType.MouseMovement or p237.UserInputType == Enum.UserInputType.Touch then
                local l__X__13 = p237.Position.X;
                if not u198.Enabled then
                    return;
                end;
                local v238 = math.max(1, u202.AbsoluteSize.X);
                local v239 = math.clamp((l__X__13 - u202.AbsolutePosition.X) / v238, 0, 1);
                u198:SetValue(u198.Min + (u198.Max - u198.Min) * v239, false);
            end;
        end;
    end);
    l__UserInputService__4.InputEnded:Connect(function(p240) --[[ Line: 810 ]]
        -- upvalues: u198 (copy), u197 (copy)
        if u198.Dragging then
            if p240.UserInputType == Enum.UserInputType.MouseButton1 or p240.UserInputType == Enum.UserInputType.Touch then
                u198.Dragging = false;
                if u198.Enabled and u197 then
                    u197(u198.Value);
                end;
            end;
        end;
    end);
    u198:SetValue(p194, true);
    return u198;
end;
local u242 = nil;
local u243 = nil;
local u244 = nil;
local u245 = nil;
local function u248() --[[ Line: 837 ]]
    -- upvalues: u177 (copy), u65 (copy), u83 (ref)
    u177.Text = u65.MusicEnabled and not u83 and "Pause" or "Resume";
    local v246 = u177;
    local v247;
    if u65.MusicEnabled and not u83 then
        v247 = Color3.fromRGB(86, 90, 98);
    else
        v247 = Color3.fromRGB(49, 160, 145);
    end;
    v246.BackgroundColor3 = v247;
end;
local function u253() --[[ Line: 842 ]]
    -- upvalues: u179 (copy), u65 (copy), u180 (copy), u242 (ref), u244 (ref)
    u179.Text = u65.PublicMusicEnabled and "Public ON" or "Public OFF";
    local v249 = u179;
    local v250;
    if u65.PublicMusicEnabled then
        v250 = Color3.fromRGB(255, 103, 15);
    else
        v250 = Color3.fromRGB(86, 90, 98);
    end;
    v249.BackgroundColor3 = v250;
    u180.Text = u65.MuteOtherMusic and "Others OFF" or "Others ON";
    local v251 = u180;
    local v252;
    if u65.MuteOtherMusic then
        v252 = Color3.fromRGB(176, 46, 40);
    else
        v252 = Color3.fromRGB(49, 160, 145);
    end;
    v251.BackgroundColor3 = v252;
    if u242 then
        u242:SetEnabled(true);
    end;
    if u244 then
        u244:SetEnabled(not u65.MuteOtherMusic, "Muted");
    end;
end;
local function u265(p254) --[[ Line: 876 ]]
    -- upvalues: u1 (copy), u70 (copy), u73 (ref), u71 (copy), u72 (copy)
    if type(p254) ~= "table" then
        return;
    end;
    for v257, v256 in pairs(p254) do
        if type(v256) == "table" then
            local v257 = v256.UserId or v257;
        end;
        local v258 = tostring(v257 or "");
        local v259 = string.match(v258, "%d+") or v258;
        local v260, v261, v262, v263;
        if type(v256) == "table" then
            local v264 = string.match(tostring(v256.AudioId or v256.CurrentMusicId or ""), "%d+");
            if not v264 or (#v264 < 2 or (#v264 > 20 or u1[v264])) then
                v264 = nil;
            end;
            if not v264 then
                u70[v259] = nil;
                v260 = tostring(v259 or "");
                v261 = string.match(v260, "%d+") or v260;
                u73[v261] = nil;
                v262 = u71[v261];
                if v262 then
                    u71[v261] = nil;
                    v262:Destroy();
                end;
                v263 = u72[v261];
                if v263 then
                    u72[v261] = nil;
                    v263:Destroy();
                end;
            end;
            u70[v259] = v256;
        else
            u70[v259] = nil;
            v260 = tostring(v259 or "");
            v261 = string.match(v260, "%d+") or v260;
            u73[v261] = nil;
            v262 = u71[v261];
            if v262 then
                u71[v261] = nil;
                v262:Destroy();
            end;
            v263 = u72[v261];
            if v263 then
                u72[v261] = nil;
                v263:Destroy();
            end;
        end;
    end;
end;
local function u273(p266) --[[ Line: 891 ]]
    -- upvalues: u73 (ref)
    if type(p266) == "table" then
        local v267 = {};
        local l__Players__14 = p266.Players;
        if type(l__Players__14) == "table" then
            for _, v268 in ipairs(l__Players__14) do
                if type(v268) == "table" then
                    local v269 = tostring(v268.UserId or "");
                    local v270 = string.match(v269, "%d+") or v269;
                    local v271 = tonumber(v268.X);
                    local v272 = tonumber(v268.Y);
                    if v270 ~= "" and (v271 and v272) then
                        v267[v270] = {
                            X = v271,
                            Y = v272,
                            Radius = tonumber(v268.Radius) or 1
                        };
                    end;
                end;
            end;
        end;
        u73 = v267;
    end;
end;
local u274 = false;
if not u274 and (v4 and v4:IsA("RemoteEvent")) then
    u274 = true;
    v4.OnClientEvent:Connect(u273);
end;
if not u274 and u3 then
    task.spawn(function() --[[ Line: 927 ]]
        -- upvalues: u3 (copy), u274 (ref), u273 (copy)
        local l__MinimapSnapshot__15 = u3:WaitForChild("MinimapSnapshot", 15);
        if not u274 and l__MinimapSnapshot__15 then
            if not l__MinimapSnapshot__15:IsA("RemoteEvent") then
                return;
            end;
            u274 = true;
            l__MinimapSnapshot__15.OnClientEvent:Connect(u273);
        end;
    end);
end;
local function u277(p275) --[[ Line: 932 ]]
    -- upvalues: u61 (ref), u65 (copy), u78 (ref), u106 (copy)
    local u276 = 0;
    pcall(function() --[[ Line: 934 ]]
        -- upvalues: u276 (ref), u61 (ref)
        u276 = tonumber(u61.TimePosition) or 0;
    end);
    return {
        Enabled = p275 == true,
        PublicMusicEnabled = u65.PublicMusicEnabled == true,
        AudioId = u65.CurrentMusicId or "104185011771893",
        TrackName = u78 or u106(u65.CurrentMusicId or "104185011771893"),
        Volume = u65.PublicMusicVolume,
        Speed = u65.MusicSpeed,
        Loop = u65.MusicLoop,
        TimePosition = u276
    };
end;
local function u295(p278) --[[ Line: 949 ]]
    -- upvalues: u5 (ref), u65 (copy), u88 (ref), u295 (copy), u83 (ref), u1 (copy), u277 (copy), u70 (copy), l__LocalPlayer__7 (copy), u73 (ref), u71 (copy), u72 (copy)
    if u5 then
        if p278 or u65.PublicMusicEnabled then
            local v279 = os.clock();
            local v280 = p278 and 0.48 or 3;
            if v279 - u88 < v280 then
                if p278 then
                    task.delay(v280, function() --[[ Line: 960 ]]
                        -- upvalues: u295 (ref)
                        u295(true);
                    end);
                end;
            else
                u88 = v279;
                local u281;
                if u65.PublicMusicEnabled == true and u65.MusicEnabled == true then
                    u281 = not u83;
                    if u281 then
                        local v282 = string.match(tostring(u65.CurrentMusicId or ""), "%d+");
                        if not v282 or (#v282 < 2 or (#v282 > 20 or u1[v282])) then
                            v282 = nil;
                        end;
                        u281 = v282 ~= nil;
                    end;
                else
                    u281 = false;
                end;
                task.spawn(function() --[[ Line: 968 ]]
                    -- upvalues: u277 (ref), u281 (copy), u5 (ref), u70 (ref), l__LocalPlayer__7 (ref), u65 (ref), u73 (ref), u71 (ref), u72 (ref)
                    local u283 = u277(u281);
                    local v284;
                    if u5 then
                        local u285 = "SetPublicMusic";
                        local v286;
                        v286, v284 = pcall(function() --[[ Line: 368 ]]
                            -- upvalues: u5 (ref), u285 (copy), u283 (copy)
                            return u5:InvokeServer(u285, u283);
                        end);
                        if not v286 or type(v284) ~= "table" then
                            v284 = nil;
                        end;
                    else
                        v284 = nil;
                    end;
                    if v284 and v284.Ok then
                        if type(v284.State) == "table" then
                            local v287 = u70;
                            local v288 = tostring(v284.State.UserId or l__LocalPlayer__7.UserId or "");
                            v287[string.match(v288, "%d+") or v288] = v284.State;
                            return;
                        end;
                        if not u65.PublicMusicEnabled then
                            local v289 = u70;
                            local v290 = tostring(l__LocalPlayer__7.UserId or "");
                            v289[string.match(v290, "%d+") or v290] = nil;
                            local v291 = tostring(l__LocalPlayer__7.UserId or "");
                            local v292 = string.match(v291, "%d+") or v291;
                            u73[v292] = nil;
                            local v293 = u71[v292];
                            if v293 then
                                u71[v292] = nil;
                                v293:Destroy();
                            end;
                            local v294 = u72[v292];
                            if v294 then
                                u72[v292] = nil;
                                v294:Destroy();
                            end;
                        end;
                    end;
                end);
            end;
        end;
    end;
end;
local function u299() --[[ Line: 981 ]]
    -- upvalues: l__PlayerGui__8 (copy)
    local u296 = l__PlayerGui__8:FindFirstChild("AgaricGameplayPositionQuery");
    if u296 and u296:IsA("BindableFunction") then
        local v297, v298 = pcall(function() --[[ Line: 986 ]]
            -- upvalues: u296 (copy)
            return u296:Invoke();
        end);
        if v297 and type(v298) == "table" then
            return v298;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function u301() --[[ Line: 999 ]]
    -- upvalues: u74 (ref), u64 (ref)
    if u74 and u74.Parent then
        return u74;
    end;
    local u300 = Instance.new("Part");
    u300.Name = "LocalAudioListener";
    u300.Anchored = true;
    u300.CanCollide = false;
    pcall(function() --[[ Line: 1007 ]]
        -- upvalues: u300 (copy)
        u300.CanQuery = false;
    end);
    pcall(function() --[[ Line: 1010 ]]
        -- upvalues: u300 (copy)
        u300.CanTouch = false;
    end);
    pcall(function() --[[ Line: 1013 ]]
        -- upvalues: u300 (copy)
        u300.CastShadow = false;
    end);
    u300.Transparency = 1;
    u300.Size = Vector3.new(1, 1, 1);
    u300.Parent = u64;
    u74 = u300;
    return u300;
end;
local function u307(p302) --[[ Line: 1023 ]]
    -- upvalues: u301 (copy), u75 (ref), u76 (ref), l__LocalPlayer__7 (copy), u77 (ref), l__SoundService__3 (copy), l__Workspace__6 (copy)
    if type(p302) == "table" and type(p302.Self) == "table" then
        local u303 = u301();
        local l__new__16 = CFrame.new;
        local l__Self__17 = p302.Self;
        local v304 = (tonumber(l__Self__17.X) or 0) * 0.04;
        local v305 = (tonumber(l__Self__17.Y) or 0) * 0.04;
        u303.CFrame = l__new__16((Vector3.new(v304, 32, v305)));
        if not (u75 and u75.Parent) then
            u75 = Instance.new("AudioListener");
            u75.Name = "AgaricAudioListener";
            u75.Parent = u303;
        end;
        pcall(function() --[[ Line: 1034 ]]
            -- upvalues: u75 (ref)
            u75.AudioInteractionGroup = "Default";
        end);
        if not (u76 and u76.Parent) then
            u76 = Instance.new("AudioDeviceOutput");
            u76.Name = "AgaricAudioOutput";
            pcall(function() --[[ Line: 1040 ]]
                -- upvalues: u76 (ref), l__LocalPlayer__7 (ref)
                u76.Player = l__LocalPlayer__7;
            end);
            u76.Parent = u303;
        end;
        if not (u77 and u77.Parent) then
            u77 = Instance.new("Wire");
            u77.Name = "AgaricListenerOutputWire";
            u77.SourceInstance = u75;
            u77.TargetInstance = u76;
            u77.Parent = u303;
        end;
        pcall(function() --[[ Line: 1052 ]]
            -- upvalues: l__SoundService__3 (ref), u303 (copy)
            l__SoundService__3:SetListener(Enum.ListenerType.ObjectCFrame, u303);
        end);
        local l__CurrentCamera__18 = l__Workspace__6.CurrentCamera;
        if l__CurrentCamera__18 then
            for _, v306 in ipairs(l__CurrentCamera__18:GetChildren()) do
                if v306:IsA("AudioListener") then
                    v306.Parent = u303;
                end;
            end;
        end;
    end;
end;
local function u316(p308) --[[ Line: 1065 ]]
    -- upvalues: u89 (ref), u5 (ref)
    if type(p308) == "table" then
        local l__Self__19 = p308.Self;
        if type(l__Self__19) == "table" then
            local v309 = os.clock();
            if v309 - u89 < 0.75 then
            else
                u89 = v309;
                local u310 = tonumber(l__Self__19.X);
                local u311 = tonumber(l__Self__19.Y);
                if u310 and u311 then
                    task.spawn(function() --[[ Line: 1083 ]]
                        -- upvalues: u310 (copy), u311 (copy), u5 (ref)
                        local u312 = {
                            X = u310,
                            Y = u311
                        };
                        if u5 then
                            local u313 = "SetVoicePosition";
                            local v314, v315 = pcall(function() --[[ Line: 368 ]]
                                -- upvalues: u5 (ref), u313 (copy), u312 (copy)
                                return u5:InvokeServer(u313, u312);
                            end);
                            if v314 and type(v315) == "table" then
                            end;
                        end;
                    end);
                end;
            end;
        end;
    end;
end;
local function u331(p317, p318) --[[ Line: 1101 ]]
    if type(p317) ~= "table" or type(p318) ~= "table" then
        return 0;
    end;
    local v319 = (tonumber(p317.X) or 0) - (tonumber(p318.X) or 0);
    local v320 = (tonumber(p317.Y) or 0) - (tonumber(p318.Y) or 0);
    local v321 = math.sqrt(v319 * v319 + v320 * v320);
    local v322;
    if p318 then
        v322 = p318.Radius;
    else
        v322 = p318;
    end;
    local v323 = tonumber(v322) or 0;
    local v324 = math.clamp(v323, 0, 1400) * 1.05;
    local v325 = math.clamp(v324, 0, 1800) + 2800;
    if p318 then
        p318 = p318.Radius;
    end;
    local v326 = tonumber(p318) or 0;
    local v327 = math.clamp(v326, 0, 1400) * 0.14;
    local v328 = math.clamp(v327, 0, 260) + 320;
    local v329 = math.min(v328, v325 * 0.35);
    if v325 <= v321 then
        return 0;
    end;
    if v321 <= v329 then
        return 1;
    end;
    local v330 = 1 - (v321 - v329) / math.max(1, v325 - v329);
    return math.clamp(v330 * v330, 0, 1);
end;
local function u335() --[[ Line: 1135 ]]
    -- upvalues: l__Workspace__6 (copy), l__LocalPlayer__7 (copy)
    local v332 = l__Workspace__6:FindFirstChild("AgaricVoiceAnchors");
    if v332 then
        local v333 = v332:FindFirstChild("VoiceAnchor_" .. tostring(l__LocalPlayer__7.UserId));
        if v333 then
            for _, u334 in ipairs(v333:GetDescendants()) do
                if u334:IsA("AudioEmitter") then
                    pcall(function() --[[ Line: 1146 ]]
                        -- upvalues: u334 (copy)
                        u334.AudioInteractionGroup = "AgaricMutedSelfVoice";
                    end);
                    pcall(function() --[[ Line: 1149 ]]
                        -- upvalues: u334 (copy)
                        u334:SetDistanceAttenuation({
                            [0] = 0,
                            [1] = 0
                        });
                    end);
                end;
            end;
        end;
    end;
end;
local function u348(u336, u337) --[[ Line: 1159 ]]
    -- upvalues: l__Workspace__6 (copy)
    local v338 = tonumber(u337.Speed);
    local v339 = (not v338 or v338 ~= v338) and 1 or math.clamp(v338, 0.5, 2);
    local v340 = tonumber(u337.ServerTime) or l__Workspace__6:GetServerTimeNow();
    local v341 = tonumber(u337.TimePosition);
    local v342 = (not v341 or v341 ~= v341) and 0 or math.clamp(v341, 0, 86400);
    local v343 = l__Workspace__6:GetServerTimeNow() - v340;
    local u344 = v342 + math.max(0, v343) * v339;
    pcall(function() --[[ Line: 1164 ]]
        -- upvalues: u336 (copy), u337 (copy), u344 (ref)
        local v345 = tonumber(u336.TimeLength) or 0;
        if v345 > 0 then
            if u337.Loop == false then
                local v346 = u344;
                local v347 = math.max(0, v345 - 0.05);
                u344 = math.min(v346, v347);
            else
                u344 = u344 % v345;
            end;
        end;
        u336.TimePosition = u344;
    end);
end;
local function u352(p349) --[[ Line: 1177 ]]
    -- upvalues: u72 (copy), u64 (ref)
    local v350 = u72[p349];
    if v350 and v350.Parent then
        return v350;
    end;
    local u351 = Instance.new("Part");
    u351.Name = "NearbyMusicSource_" .. p349;
    u351.Anchored = true;
    u351.CanCollide = false;
    pcall(function() --[[ Line: 1186 ]]
        -- upvalues: u351 (copy)
        u351.CanQuery = false;
    end);
    pcall(function() --[[ Line: 1189 ]]
        -- upvalues: u351 (copy)
        u351.CanTouch = false;
    end);
    pcall(function() --[[ Line: 1192 ]]
        -- upvalues: u351 (copy)
        u351.CastShadow = false;
    end);
    u351.Transparency = 1;
    u351.Size = Vector3.new(1, 1, 1);
    u351.Parent = u64;
    u72[p349] = u351;
    return u351;
end;
local function u354(u353) --[[ Line: 1202 ]]
    pcall(function() --[[ Line: 1203 ]]
        -- upvalues: u353 (copy)
        u353.RollOffMode = Enum.RollOffMode.InverseTapered;
    end);
    pcall(function() --[[ Line: 1206 ]]
        -- upvalues: u353 (copy)
        u353.RollOffMinDistance = 12.8;
    end);
    pcall(function() --[[ Line: 1209 ]]
        -- upvalues: u353 (copy)
        u353.RollOffMaxDistance = 112;
    end);
    pcall(function() --[[ Line: 1212 ]]
        -- upvalues: u353 (copy)
        u353.EmitterSize = 6;
    end);
end;
local function u362(p355, p356) --[[ Line: 1217 ]]
    -- upvalues: u352 (copy), u71 (copy), u354 (copy), u1 (copy), u348 (copy)
    local v357 = u352(p355);
    local v358 = u71[p355];
    if v358 and v358.Parent then
        if v358.Parent ~= v357 then
            v358.Parent = v357;
        end;
    else
        v358 = Instance.new("Sound");
        v358.Name = "NearbyMusic_" .. p355;
        v358.Volume = 0;
        u354(v358);
        v358.Parent = v357;
        u71[p355] = v358;
    end;
    local v359 = string.match(tostring(p356.AudioId or p356.CurrentMusicId or ""), "%d+");
    if not v359 or (#v359 < 2 or (#v359 > 20 or u1[v359])) then
        v359 = nil;
    end;
    local v360 = tostring(v359 or "104185011771893" or "");
    if string.sub(v360, 1, 13) ~= "rbxassetid://" then
        v360 = "rbxassetid://" .. v360;
    end;
    if v358.SoundId ~= v360 then
        v358.SoundId = v360;
        v358:SetAttribute("LastPublicSync", 0);
        u348(v358, p356);
    end;
    v358.Looped = p356.Loop ~= false;
    local v361 = tonumber(p356.Speed);
    v358.PlaybackSpeed = (not v361 or v361 ~= v361) and 1 or math.clamp(v361, 0.5, 2);
    return v358;
end;
local function u412(p363) --[[ Line: 1244 ]]
    -- upvalues: u86 (ref), u295 (copy), u85 (ref), u299 (copy), u80 (ref), u307 (copy), u316 (copy), u87 (ref), u335 (copy), u65 (copy), u61 (ref), u70 (copy), u71 (copy), l__LocalPlayer__7 (copy), u73 (ref), u331 (copy), u352 (copy), u362 (copy), u348 (copy), u72 (copy)
    u86 = u86 + p363;
    if u86 >= 3 then
        u86 = 0;
        u295(false);
    end;
    u85 = u85 + p363;
    if u85 < 0.5 then
        return;
    end;
    u85 = 0;
    local v364 = u299();
    local v365;
    if v364 then
        v365 = v364.Zoom;
    else
        v365 = v364;
    end;
    local v366 = tonumber(v365);
    u80 = not v366 and 1 or math.clamp(v366 * 0.28 + 0.72, 0.68, 1.15);
    u307(v364);
    u316(v364);
    u87 = u87 + 0.5;
    if u87 >= 2 then
        u87 = 0;
        u335();
    end;
    if u65.PublicMusicEnabled then
        local v367;
        if u65.PublicMusicEnabled then
            v367 = math.clamp(u65.MusicVolume * 0.34 * u80, 0, 0.42);
        else
            v367 = u65.MusicVolume;
        end;
        local v368 = u61;
        v368.Volume = v368.Volume + (v367 - u61.Volume) * 0.45;
    end;
    local v369 = u65.PublicMusicEnabled == true and true or u65.MuteOtherMusic == true;
    if not v369 then
        for _, v370 in pairs(u70) do
            if type(v370) == "table" then
                v369 = true;
                break;
            end;
        end;
    end;
    if not v369 then
        return;
    end;
    if u65.MuteOtherMusic then
        for _, v371 in pairs(u71) do
            v371.Volume = v371.Volume * 0.45;
            if v371.Volume < 0.01 then
                v371:Pause();
            end;
        end;
        return;
    end;
    local v372;
    if v364 then
        v372 = v364.Self;
    else
        v372 = v364;
    end;
    if v364 then
        v364 = v364.Players;
    end;
    if type(v372) ~= "table" then
        for _, v373 in pairs(u71) do
            v373.Volume = v373.Volume * 0.65;
        end;
        return;
    end;
    local v374 = {};
    for v375, v376 in pairs(u70) do
        local v377 = tostring(v375 or "");
        local v378 = string.match(v377, "%d+") or v377;
        if tonumber(v378) ~= l__LocalPlayer__7.UserId and type(v376) == "table" then
            local v379;
            if type(v364) == "table" then
                v379 = v364[v378] or nil;
            else
                v379 = nil;
            end;
            if type(v379) ~= "table" then
                v379 = u73[v378];
            end;
            local v380 = u331(v372, v379);
            if v380 > 0.01 then
                table.insert(v374, {
                    Key = v378,
                    State = v376,
                    Alpha = v380,
                    OtherPos = v379
                });
            end;
        end;
    end;
    table.sort(v374, function(p381, p382) --[[ Line: 1321 ]]
        return p381.Alpha > p382.Alpha;
    end);
    local v383 = {};
    for v384, u385 in ipairs(v374) do
        if v384 > 8 then
            break;
        end;
        v383[u385.Key] = true;
        local v386 = u352(u385.Key);
        if type(u385.OtherPos) == "table" then
            local l__OtherPos__20 = u385.OtherPos;
            local v387 = (tonumber(l__OtherPos__20.X) or 0) * 0.04;
            local v388 = (tonumber(l__OtherPos__20.Y) or 0) * 0.04;
            v386.Position = Vector3.new(v387, 32, v388);
        end;
        local u389 = u362(u385.Key, u385.State);
        pcall(function() --[[ Line: 1336 ]]
            -- upvalues: u389 (copy), u385 (copy)
            local v390 = u389;
            local v391 = 6;
            local l__OtherPos__21 = u385.OtherPos;
            if l__OtherPos__21 then
                l__OtherPos__21 = l__OtherPos__21.Radius;
            end;
            local v392 = tonumber(l__OtherPos__21) or 0;
            local v393 = math.clamp(v392, 0, 1400) * 0.14;
            local v394 = (math.clamp(v393, 0, 260) + 320) * 0.04;
            v390.RollOffMinDistance = math.max(v391, v394);
            local v395 = u389;
            local v396 = 45;
            local l__OtherPos__22 = u385.OtherPos;
            if l__OtherPos__22 then
                l__OtherPos__22 = l__OtherPos__22.Radius;
            end;
            local v397 = tonumber(l__OtherPos__22) or 0;
            local v398 = math.clamp(v397, 0, 1400) * 1.05;
            local v399 = (math.clamp(v398, 0, 1800) + 2800) * 0.04;
            v395.RollOffMaxDistance = math.max(v396, v399);
        end);
        local v400 = tonumber(u385.State.Volume);
        local v401 = ((not v400 or v400 ~= v400) and 0.35 or math.clamp(v400, 0, 1)) / 0.35;
        local v402 = tonumber(u65.OtherMusicVolume);
        local v403 = (not v402 or v402 ~= v402) and 0.35 or math.clamp(v402, 0, 1);
        local v404 = math.clamp(1.38 * v401 * v403 * u80 * u385.Alpha, 0, 0.42);
        u389.Volume = u389.Volume + (v404 - u389.Volume) * 0.45;
        if not u389.IsPlaying then
            pcall(function() --[[ Line: 1345 ]]
                -- upvalues: u389 (copy)
                u389:Play();
            end);
        end;
        local v405 = tonumber(u389:GetAttribute("LastPublicSync")) or 0;
        if os.clock() - v405 >= 3 then
            u389:SetAttribute("LastPublicSync", os.clock());
            u348(u389, u385.State);
        end;
    end;
    for v406, v407 in pairs(u71) do
        if not v383[v406] then
            v407.Volume = v407.Volume * 0.5;
            if v407.Volume < 0.01 then
                v407:Pause();
            end;
        end;
        if not u70[v406] then
            local v408 = tostring(v406 or "");
            local v409 = string.match(v408, "%d+") or v408;
            u73[v409] = nil;
            local v410 = u71[v409];
            if v410 then
                u71[v409] = nil;
                v410:Destroy();
            end;
            local v411 = u72[v409];
            if v411 then
                u72[v409] = nil;
                v411:Destroy();
            end;
        end;
    end;
end;
if l__Framework__9 then
    l__Framework__9.OnClientEvent:Connect(function(p413) --[[ Line: 1370 ]]
        -- upvalues: u1 (copy), u70 (copy), u73 (ref), u71 (copy), u72 (copy)
        if type(p413) == "table" and p413.Kind == "PublicMusicUpdate" then
            local l__UserId__23 = p413.UserId;
            if not l__UserId__23 then
                if type(p413.State) == "table" then
                    l__UserId__23 = p413.State.UserId;
                else
                    l__UserId__23 = false;
                end;
            end;
            local v414 = tostring(l__UserId__23 or "");
            local v415 = string.match(v414, "%d+") or v414;
            if v415 == "" then
            else
                if type(p413.State) == "table" then
                    local v416 = string.match(tostring(p413.State.AudioId or p413.State.CurrentMusicId or ""), "%d+");
                    if not v416 or (#v416 < 2 or (#v416 > 20 or u1[v416])) then
                        v416 = nil;
                    end;
                    if v416 then
                        u70[v415] = p413.State;
                        return;
                    end;
                end;
                u70[v415] = nil;
                local v417 = tostring(v415 or "");
                local v418 = string.match(v417, "%d+") or v417;
                u73[v418] = nil;
                local v419 = u71[v418];
                if v419 then
                    u71[v418] = nil;
                    v419:Destroy();
                end;
                local v420 = u72[v418];
                if v420 then
                    u72[v418] = nil;
                    v420:Destroy();
                end;
            end;
        end;
    end);
end;
local function u427() --[[ Line: 1387 ]]
    -- upvalues: u61 (ref), u65 (copy), u80 (ref), u78 (ref), u106 (copy), u175 (copy), u111 (copy), u242 (ref), u243 (ref), u244 (ref), u245 (ref), u178 (copy), u248 (copy), u253 (copy)
    local v421 = u61;
    local v422;
    if u65.PublicMusicEnabled then
        v422 = math.clamp(u65.MusicVolume * 0.34 * u80, 0, 0.42);
    else
        v422 = u65.MusicVolume;
    end;
    v421.Volume = v422;
    u61.PlaybackSpeed = u65.MusicSpeed;
    u61.Looped = u65.MusicLoop;
    local v423 = u61;
    local v424 = tostring(u65.CurrentMusicId or "104185011771893" or "");
    if string.sub(v424, 1, 13) ~= "rbxassetid://" then
        v424 = "rbxassetid://" .. v424;
    end;
    v423.SoundId = v424;
    u78 = u106(u65.CurrentMusicId or "104185011771893");
    u175.Text = "Now: " .. u111(u78, u65.CurrentMusicId or "104185011771893");
    if u242 then
        u242:SetValue(u65.MusicVolume, true);
    end;
    if u243 then
        u243:SetValue(u65.PublicMusicVolume, true);
    end;
    if u244 then
        u244:SetValue(u65.OtherMusicVolume, true);
    end;
    if u245 then
        u245:SetValue(u65.MusicSpeed, true);
    end;
    u178.Text = u65.MusicLoop and "Loop ON" or "Loop OFF";
    local v425 = u178;
    local v426;
    if u65.MusicLoop then
        v426 = Color3.fromRGB(255, 103, 15);
    else
        v426 = Color3.fromRGB(86, 90, 98);
    end;
    v425.BackgroundColor3 = v426;
    u248();
    u253();
end;
local function u434(p428, p429, p430) --[[ Line: 1411 ]]
    -- upvalues: u1 (copy), u181 (copy), u65 (copy), u83 (ref), u78 (ref), u106 (copy), u61 (ref), u427 (copy), u131 (copy), u295 (copy)
    local v431 = string.match(tostring(p428 or ""), "%d+");
    if not v431 or (#v431 < 2 or (#v431 > 20 or u1[v431])) then
        v431 = nil;
    end;
    if v431 then
        u65.CurrentMusicId = v431;
        u65.MusicEnabled = true;
        u83 = false;
        u78 = p429 or u106(v431);
        local v432 = u61;
        local v433 = tostring(v431 or "");
        if string.sub(v433, 1, 13) ~= "rbxassetid://" then
            v433 = "rbxassetid://" .. v433;
        end;
        v432.SoundId = v433;
        u427();
        pcall(function() --[[ Line: 1423 ]]
            -- upvalues: u61 (ref)
            u61.TimePosition = 0;
            u61:Play();
        end);
        if p430 then
            u131();
        end;
        u295(true);
        u181.Text = tostring("Playing " .. v431 or "");
    else
        u181.Text = tostring("Invalid audio ID.");
    end;
end;
local function u436(p435) --[[ Line: 1434 ]]
    -- upvalues: u65 (copy), u83 (ref), u61 (ref), u248 (copy), u131 (copy), u295 (copy), u181 (copy)
    u65.MusicEnabled = false;
    u83 = true;
    pcall(function() --[[ Line: 1437 ]]
        -- upvalues: u61 (ref)
        u61:Pause();
    end);
    u248();
    if p435 then
        u131();
    end;
    u295(true);
    u181.Text = tostring("Music paused.");
end;
local function u438(p437) --[[ Line: 1448 ]]
    -- upvalues: u65 (copy), u83 (ref), u427 (copy), u61 (ref), u131 (copy), u295 (copy), u181 (copy)
    u65.MusicEnabled = true;
    u83 = false;
    u427();
    pcall(function() --[[ Line: 1452 ]]
        -- upvalues: u61 (ref)
        if u61.TimePosition > 0 then
            u61:Resume();
        else
            u61:Play();
        end;
    end);
    if p437 then
        u131();
    end;
    u295(true);
    u181.Text = tostring("Music resumed.");
end;
local function u441(p439) --[[ Line: 1466 ]]
    -- upvalues: u65 (copy)
    for _, v440 in ipairs(u65.FavoriteMusic or {}) do
        if v440.Id == p439 then
            return true;
        end;
    end;
    return false;
end;
local u442 = nil;
local u443 = nil;
local function u450(p444, p445) --[[ Line: 1490 ]]
    local v446 = {};
    for _, v447 in ipairs(p444) do
        v446[tostring(v447.Id or "")] = true;
    end;
    for _, v448 in ipairs(p445) do
        local v449 = tostring(v448.Id or "");
        if v449 ~= "" and not v446[v449] then
            v446[v449] = true;
            table.insert(p444, v448);
            if #p444 >= 200 then
                break;
            end;
        end;
    end;
end;
local u451 = {};
local function u504() --[[ Line: 1528 ]]
    -- upvalues: u184 (copy), u451 (copy), u174 (copy), u79 (ref), u65 (copy), u84 (ref), u67 (ref), u66 (ref), u169 (copy), u143 (copy), u150 (copy), u434 (copy), u504 (copy), u441 (copy), u5 (ref), u124 (copy), u181 (copy), u69 (ref), u443 (ref)
    for _, v452 in ipairs(u184:GetChildren()) do
        if v452.Name == "TrackRow" and v452:IsA("GuiObject") then
            local v453 = u451[v452];
            if v453 then
                u451[v452] = nil;
                for _, v454 in ipairs(v453) do
                    v454:Disconnect();
                end;
            end;
            v452:Destroy();
        end;
    end;
    for v455, v456 in pairs(u174) do
        local v457;
        if v455 == u79 then
            v457 = Color3.fromRGB(255, 103, 15);
        else
            v457 = Color3.fromRGB(45, 48, 54);
        end;
        v456.BackgroundColor3 = v457;
    end;
    local v458, v459;
    if u79 == "Favorites" then
        v458 = u65.FavoriteMusic or {};
        v459 = "No favorites yet. Save an audio ID first.";
    elseif u79 == "Roblox" then
        if u84 then
            v458 = u67;
            v459 = "Loading Roblox music...";
        else
            v458 = u67;
            v459 = "Open Roblox recommendations or press Find.";
        end;
    else
        v458 = u66;
        v459 = "No default tracks configured.";
    end;
    local v460 = string.lower(u169.Text or "");
    local v461 = 0;
    for _, u462 in ipairs(v458) do
        local v463 = string.lower(tostring(u462.Name or "") .. " " .. tostring(u462.Id or "") .. " " .. tostring(u462.Artist or ""));
        if u79 == "Roblox" or (v460 == "" or string.find(v463, v460, 1, true)) then
            v461 = v461 + 1;
            local v464;
            if tostring(u462.Id or "") == tostring(u65.CurrentMusicId or "") then
                v464 = u65.MusicEnabled == true;
            else
                v464 = false;
            end;
            local v465 = Instance.new("Frame");
            v465.Name = "TrackRow";
            local v466;
            if v464 then
                v466 = Color3.fromRGB(58, 56, 48);
            else
                v466 = Color3.fromRGB(31, 34, 40);
            end;
            v465.BackgroundColor3 = v466;
            v465.BorderSizePixel = 0;
            v465.Size = UDim2.new(1, -4, 0, 58);
            v465.ZIndex = 622;
            v465.LayoutOrder = v461;
            v465.Parent = u184;
            local v467 = Instance.new("UICorner");
            v467.CornerRadius = UDim.new(0, 7);
            v467.Parent = v465;
            if v464 then
                local v468 = Instance.new("UIStroke");
                v468.Color = Color3.fromRGB(255, 103, 15);
                v468.Transparency = 0.12;
                v468.Thickness = 1.5;
                v468.Parent = v465;
            end;
            local v469 = u462.Name or "Audio " .. tostring(u462.Id);
            local v470 = tostring(v469);
            if u462.IsEndorsed then
                v470 = v470 .. "  *";
            end;
            local v471 = u143(v465, v470, true);
            v471.Position = UDim2.fromOffset(10, 5);
            v471.Size = UDim2.new(1, -152, 0, 22);
            v471.ZIndex = 624;
            local v472 = tostring(u462.Id or "");
            if u462.Artist and u462.Artist ~= "" then
                v472 = v472 .. "  |  " .. tostring(u462.Artist);
            end;
            if tonumber(u462.Duration) and tonumber(u462.Duration) > 0 then
                local v473 = tonumber(u462.Duration) or 0;
                local v474 = math.floor(v473);
                local v475 = math.max(0, v474);
                local v476 = math.floor(v475 / 60);
                v472 = v472 .. "  |  " .. string.format("%d:%02d", v476, v475 % 60);
            end;
            local v477 = u143(v465, v472, false);
            v477.Position = UDim2.fromOffset(10, 29);
            v477.Size = UDim2.new(1, -152, 0, 18);
            v477.TextColor3 = Color3.fromRGB(180, 190, 200);
            v477.ZIndex = 624;
            local v478 = u150(v465, "Play", Color3.fromRGB(255, 103, 15));
            v478.Position = UDim2.new(1, -136, 0, 11);
            v478.Size = UDim2.fromOffset(58, 36);
            v478.ZIndex = 625;
            local v479 = v478.Activated:Connect(function() --[[ Line: 1590 ]]
                -- upvalues: u434 (ref), u462 (copy), u504 (ref)
                u434(u462.Id, u462.Name, true);
                u504();
            end);
            local v480 = u451[v465];
            if not v480 then
                v480 = {};
                u451[v465] = v480;
            end;
            v480[#v480 + 1] = v479;
            local u481 = u441(u462.Id);
            local u482 = u79 == "Favorites";
            local v483 = u150;
            local v484 = u482 and "X" or (u481 and "Saved" or "Save");
            local v485;
            if u482 then
                v485 = Color3.fromRGB(157, 60, 54);
            else
                v485 = Color3.fromRGB(36, 126, 214);
            end;
            local v486 = v483(v465, v484, v485);
            v486.Position = UDim2.new(1, -72, 0, 11);
            v486.Size = UDim2.fromOffset(60, 36);
            v486.ZIndex = 625;
            local v495 = v486.Activated:Connect(function() --[[ Line: 1601 ]]
                -- upvalues: u482 (copy), u462 (copy), u5 (ref), u124 (ref), u181 (ref), u504 (ref), u481 (copy)
                if u482 then
                    local u487 = {
                        Id = u462.Id
                    };
                    local v488;
                    if u5 then
                        local u489 = "RemoveFavorite";
                        local v490;
                        v490, v488 = pcall(function() --[[ Line: 368 ]]
                            -- upvalues: u5 (ref), u489 (copy), u487 (copy)
                            return u5:InvokeServer(u489, u487);
                        end);
                        if not v490 or type(v488) ~= "table" then
                            v488 = nil;
                        end;
                    else
                        v488 = nil;
                    end;
                    if v488 and v488.Ok then
                        u124(v488);
                        u181.Text = tostring("Removed from favorites.");
                        u504();
                    else
                        u181.Text = tostring(v488 and v488.Message or "Could not remove favorite." or "");
                    end;
                elseif u481 then
                    u181.Text = tostring("Already saved.");
                else
                    local u491 = {
                        Id = u462.Id,
                        Name = u462.Name
                    };
                    local v492;
                    if u5 then
                        local u493 = "AddFavorite";
                        local v494;
                        v494, v492 = pcall(function() --[[ Line: 368 ]]
                            -- upvalues: u5 (ref), u493 (copy), u491 (copy)
                            return u5:InvokeServer(u493, u491);
                        end);
                        if not v494 or type(v492) ~= "table" then
                            v492 = nil;
                        end;
                    else
                        v492 = nil;
                    end;
                    if v492 and v492.Ok then
                        u124(v492);
                        u181.Text = tostring("Saved to favorites.");
                        u504();
                    else
                        u181.Text = tostring(v492 and v492.Message or "Could not save favorite." or "");
                    end;
                end;
            end);
            local v496 = u451[v465];
            if not v496 then
                v496 = {};
                u451[v465] = v496;
            end;
            v496[#v496 + 1] = v495;
        end;
    end;
    if u79 == "Roblox" and (v461 > 0 and (u69 and #u67 < 200)) then
        v461 = v461 + 1;
        local v497 = Instance.new("Frame");
        v497.Name = "TrackRow";
        v497.BackgroundColor3 = Color3.fromRGB(31, 34, 40);
        v497.BorderSizePixel = 0;
        v497.Size = UDim2.new(1, -4, 0, 48);
        v497.ZIndex = 622;
        v497.LayoutOrder = v461;
        v497.Parent = u184;
        local v498 = Instance.new("UICorner");
        v498.CornerRadius = UDim.new(0, 7);
        v498.Parent = v497;
        local v499 = u150(v497, u84 and "Loading..." or "Load more", Color3.fromRGB(86, 90, 98));
        v499.Position = UDim2.fromOffset(10, 8);
        v499.Size = UDim2.new(1, -20, 0, 32);
        v499.ZIndex = 625;
        v499.Active = not u84;
        local v500 = v499.Activated:Connect(function() --[[ Line: 1644 ]]
            -- upvalues: u443 (ref)
            if u443 then
                u443();
            end;
        end);
        local v501 = u451[v497];
        if not v501 then
            v501 = {};
            u451[v497] = v501;
        end;
        v501[#v501 + 1] = v500;
    end;
    if v461 == 0 then
        local v502 = u143(u184, v459, false);
        v502.Name = "TrackRow";
        v502.BackgroundColor3 = Color3.fromRGB(31, 34, 40);
        v502.BackgroundTransparency = 0;
        v502.BorderSizePixel = 0;
        v502.Size = UDim2.new(1, -4, 0, 54);
        v502.TextXAlignment = Enum.TextXAlignment.Center;
        v502.ZIndex = 622;
        local v503 = Instance.new("UICorner");
        v503.CornerRadius = UDim.new(0, 7);
        v503.Parent = v502;
    end;
end;
u242 = v241(u183, "Volume", 0, 1, u65.MusicVolume, function(p505) --[[ Line: 1664 ]]
    local v506 = math.floor(p505 * 100 + 0.5);
    return tostring(v506) .. "%";
end, function(p507) --[[ Line: 1666 ]]
    -- upvalues: u65 (copy), u61 (ref), u80 (ref)
    u65.MusicVolume = p507;
    local v508 = u61;
    local v509;
    if u65.PublicMusicEnabled then
        v509 = math.clamp(u65.MusicVolume * 0.34 * u80, 0, 0.42);
    else
        v509 = u65.MusicVolume;
    end;
    v508.Volume = v509;
end, function(p510) --[[ Line: 1669 ]]
    -- upvalues: u65 (copy), u61 (ref), u80 (ref), u131 (copy)
    u65.MusicVolume = p510;
    local v511 = u61;
    local v512;
    if u65.PublicMusicEnabled then
        v512 = math.clamp(u65.MusicVolume * 0.34 * u80, 0, 0.42);
    else
        v512 = u65.MusicVolume;
    end;
    v511.Volume = v512;
    u131();
end);
local u517 = v241(u183, "Public", 0, 1, u65.PublicMusicVolume, function(p513) --[[ Line: 1675 ]]
    local v514 = math.floor(p513 * 100 + 0.5);
    return tostring(v514) .. "%";
end, function(p515) --[[ Line: 1677 ]]
    -- upvalues: u65 (copy)
    u65.PublicMusicVolume = p515;
end, function(p516) --[[ Line: 1679 ]]
    -- upvalues: u65 (copy), u131 (copy), u295 (copy)
    u65.PublicMusicVolume = p516;
    u131();
    u295(true);
end);
u244 = v241(u183, "Others", 0, 1, u65.OtherMusicVolume, function(p518) --[[ Line: 1685 ]]
    local v519 = math.floor(p518 * 100 + 0.5);
    return tostring(v519) .. "%";
end, function(p520) --[[ Line: 1687 ]]
    -- upvalues: u65 (copy)
    u65.OtherMusicVolume = p520;
end, function(p521) --[[ Line: 1689 ]]
    -- upvalues: u65 (copy), u131 (copy)
    u65.OtherMusicVolume = p521;
    u131();
end);
local u535 = v241(u183, "Seek", 0, 1, 0, function(p522, _, p523) --[[ Line: 1694 ]]
    local v524 = tonumber(p522) or 0;
    local v525 = math.floor(v524);
    local v526 = math.max(0, v525);
    local v527 = math.floor(v526 / 60);
    local v528 = string.format("%d:%02d", v527, v526 % 60);
    local v529 = tonumber(p523) or 0;
    local v530 = math.floor(v529);
    local v531 = math.max(0, v530);
    local v532 = math.floor(v531 / 60);
    return v528 .. " / " .. string.format("%d:%02d", v532, v531 % 60);
end, function(u533) --[[ Line: 1696 ]]
    -- upvalues: u61 (ref)
    pcall(function() --[[ Line: 1697 ]]
        -- upvalues: u61 (ref), u533 (copy)
        u61.TimePosition = u533;
    end);
end, function(u534) --[[ Line: 1700 ]]
    -- upvalues: u61 (ref), u295 (copy)
    pcall(function() --[[ Line: 1701 ]]
        -- upvalues: u61 (ref), u534 (copy)
        u61.TimePosition = u534;
    end);
    u295(true);
end);
local u539 = v241(u183, "Speed", 0.5, 2, u65.MusicSpeed, function(p536) --[[ Line: 1707 ]]
    return string.format("%.2fx", p536);
end, function(p537) --[[ Line: 1709 ]]
    -- upvalues: u65 (copy), u61 (ref)
    u65.MusicSpeed = p537;
    u61.PlaybackSpeed = p537;
end, function(p538) --[[ Line: 1712 ]]
    -- upvalues: u65 (copy), u61 (ref), u131 (copy), u295 (copy)
    u65.MusicSpeed = p538;
    u61.PlaybackSpeed = p538;
    u131();
    u295(true);
end);
local function u541() --[[ Line: 1719 ]]
    -- upvalues: l__PlayerGui__8 (copy), u152 (copy)
    for _, v540 in ipairs(l__PlayerGui__8:GetDescendants()) do
        if v540.Name == "MusicPanel" and (v540:IsA("GuiObject") and v540 ~= u152) then
            v540.Visible = false;
        end;
    end;
end;
local function u547() --[[ Line: 1727 ]]
    -- upvalues: l__Workspace__6 (copy), u152 (copy)
    local l__CurrentCamera__24 = l__Workspace__6.CurrentCamera;
    local v542;
    if l__CurrentCamera__24 then
        v542 = l__CurrentCamera__24.ViewportSize;
    else
        v542 = Vector2.new(1280, 720);
    end;
    local l__X__25 = u152.AbsoluteSize.X;
    local l__Y__26 = u152.AbsoluteSize.Y;
    local l__Offset__27 = u152.Position.X.Offset;
    local v543 = math.max(6, v542.X - l__X__25 - 6);
    local v544 = math.clamp(l__Offset__27, 6, v543);
    local l__Offset__28 = u152.Position.Y.Offset;
    local v545 = math.max(6, v542.Y - l__Y__26 - 6);
    local v546 = math.clamp(l__Offset__28, 6, v545);
    u152.Position = UDim2.fromOffset(math.floor(v544 + 0.5), (math.floor(v546 + 0.5)));
end;
local function u602() --[[ Line: 1736 ]]
    -- upvalues: l__Workspace__6 (copy), l__UserInputService__4 (copy), u152 (copy), u154 (copy), u156 (copy), u158 (copy), u159 (copy), u160 (copy), u169 (copy), u170 (copy), u171 (copy), u172 (copy), u182 (copy), u175 (copy), u176 (copy), u177 (copy), u178 (copy), u179 (copy), u180 (copy), u183 (copy), u242 (ref), u517 (ref), u244 (ref), u535 (ref), u539 (ref), u181 (copy), u173 (copy), u184 (copy), u174 (copy), u82 (ref), u547 (copy)
    local l__CurrentCamera__29 = l__Workspace__6.CurrentCamera;
    local v548;
    if l__CurrentCamera__29 then
        v548 = l__CurrentCamera__29.ViewportSize;
    else
        v548 = Vector2.new(1280, 720);
    end;
    local v549 = math.clamp(v548.X - 18, 640, 760);
    local v550 = math.floor(v549);
    local v551 = math.clamp(v548.Y - 18, 520, 620);
    local v552 = math.floor(v551);
    if l__UserInputService__4.TouchEnabled then
        local v553 = math.clamp(v548.X * 0.9, 300, 460);
        v550 = math.floor(v553);
        local v554 = math.clamp(v548.Y * 0.72, 320, 440);
        v552 = math.floor(v554);
    end;
    if v548.X - 12 < v550 then
        local v555 = math.max(260, v548.X - 12);
        v550 = math.floor(v555);
    end;
    if v548.Y - 12 < v552 then
        local v556 = math.max(l__UserInputService__4.TouchEnabled and 260 or 430, v548.Y - 12);
        v552 = math.floor(v556);
    end;
    u152.Size = UDim2.fromOffset(v550, v552);
    u154.Position = UDim2.fromOffset(0, 0);
    local v557 = l__UserInputService__4.TouchEnabled and 38 or 46;
    u154.Size = UDim2.new(1, 0, 0, v557);
    u156.Position = UDim2.fromOffset(12, l__UserInputService__4.TouchEnabled and 11 or 14);
    u156.Size = UDim2.fromOffset(5, l__UserInputService__4.TouchEnabled and 16 or 20);
    u158.Position = UDim2.fromOffset(26, l__UserInputService__4.TouchEnabled and 7 or 8);
    u158.Size = UDim2.new(1, -70, 0, l__UserInputService__4.TouchEnabled and 24 or 30);
    u159.Position = UDim2.new(1, l__UserInputService__4.TouchEnabled and -35 or -40, 0, l__UserInputService__4.TouchEnabled and 7 or 8);
    u159.Size = UDim2.fromOffset(l__UserInputService__4.TouchEnabled and 24 or 30, l__UserInputService__4.TouchEnabled and 24 or 30);
    local v558 = math.max(140, v552 - v557);
    u160.Position = UDim2.fromOffset(0, v557);
    u160.Size = UDim2.fromOffset(v550, v558);
    local v559 = l__UserInputService__4.TouchEnabled or v550 < 620;
    local v560 = v559 and 28 or 32;
    local v561 = v559 and 28 or 32;
    local v562 = v560 + 10 + 12;
    local v563 = v559 and 52 or 58;
    local v564 = math.max(150, v550 - 24 - 12 - v563 - (v559 and 76 or 92));
    local v565 = v564 + 12 + 6;
    u169.Position = UDim2.fromOffset(12, 10);
    u169.Size = UDim2.fromOffset(v564, v560);
    u170.Position = UDim2.fromOffset(v565, 10);
    u170.Size = UDim2.fromOffset(0, 0);
    u171.Position = UDim2.fromOffset(v565, 10);
    u171.Size = UDim2.fromOffset(v563, v560);
    u172.Position = UDim2.fromOffset(v565 + v563 + 6, 10);
    u172.Size = UDim2.fromOffset(v550 - 12 - (v565 + v563 + 6), v560);
    local v566 = { "Default", "Favorites", "Roblox" };
    local v567 = not v559;
    if v567 then
        v567 = v552 >= 500;
    end;
    local v568;
    if v567 then
        local v569 = math.clamp(v550 * 0.31, 208, 236);
        local v570 = math.floor(v569);
        local v571 = v550 - 36 - v570;
        local v572 = v571 + 12 + 12;
        u182.Visible = true;
        u182.Position = UDim2.fromOffset(v572, v562);
        u182.Size = UDim2.fromOffset(v570, 22);
        u175.Position = UDim2.fromOffset(v572, v562 + 28);
        u175.Size = UDim2.fromOffset(v570, 20);
        u176.Position = UDim2.fromOffset(v572, v562 + 50);
        u176.Size = UDim2.fromOffset(v570, 18);
        local v573 = math.floor((v570 - 6) / 2);
        local v574 = v562 + 76;
        local v575 = v574 + v560 + 6;
        u177.Position = UDim2.fromOffset(v572, v574);
        u177.Size = UDim2.fromOffset(v573, v560);
        u178.Position = UDim2.fromOffset(v572 + v573 + 6, v574);
        u178.Size = UDim2.fromOffset(v570 - v573 - 6, v560);
        u179.Position = UDim2.fromOffset(v572, v575);
        u179.Size = UDim2.fromOffset(v573, v560);
        u180.Position = UDim2.fromOffset(v572 + v573 + 6, v575);
        u180.Size = UDim2.fromOffset(v570 - v573 - 6, v560);
        local v576 = v575 + v560 + 14;
        u183.Position = UDim2.fromOffset(v572, v576);
        u183.Size = UDim2.fromOffset(v570, 166);
        u242.Frame.Position = UDim2.fromOffset(0, 0);
        u242:SetLayout(v570);
        u517.Frame.Position = UDim2.fromOffset(0, 34);
        u517:SetLayout(v570);
        u244.Frame.Position = UDim2.fromOffset(0, 68);
        u244:SetLayout(v570);
        u535.Frame.Position = UDim2.fromOffset(0, 102);
        u535:SetLayout(v570);
        u539.Frame.Position = UDim2.fromOffset(0, 136);
        u539:SetLayout(v570);
        u181.Visible = true;
        local v577 = math.min(v558 - 58, v576 + 166 + 8);
        u181.Position = UDim2.fromOffset(v572, v577);
        u181.Size = UDim2.fromOffset(v570, 46);
        u173.Visible = true;
        u184.Visible = true;
        u173.Position = UDim2.fromOffset(12, v562);
        u173.Size = UDim2.fromOffset(v571, v561);
        local v578 = math.floor((v571 - 12) / 3);
        local v579 = v558;
        for v580, v581 in ipairs(v566) do
            local v582 = u174[v581];
            v582.Position = UDim2.fromOffset((v578 + 6) * (v580 - 1), 0);
            local l__fromOffset__30 = UDim2.fromOffset;
            local v583;
            if v580 == 3 then
                v583 = v571 - (v578 + 6) * 2;
            else
                v583 = v578;
            end;
            v582.Size = l__fromOffset__30(v583, v561);
        end;
        local v584 = v562 + v561 + 7;
        local v585 = math.max(180, v558 - v584 - 12);
        u184.Position = UDim2.fromOffset(12, v584);
        u184.Size = UDim2.fromOffset(v571, v585);
        v568 = math.max(v579, v584 + v585 + 12, v577 + 46 + 12);
    else
        u182.Visible = false;
        local v586 = v562 + 26;
        local v587 = v586 + v560 + 6;
        local v588 = v587 + v560 + 12;
        local v589 = v559 and 24 or 32;
        local v590 = v589 * 4 + 30;
        local v591 = v550 - 24;
        u175.Position = UDim2.fromOffset(12, v562);
        u175.Size = UDim2.new(0.62, -12, 0, 20);
        u176.Position = UDim2.new(0.62, 0, 0, v562);
        u176.Size = UDim2.new(0.38, -12, 0, 20);
        u177.Position = UDim2.fromOffset(12, v586);
        u177.Size = UDim2.new(0.5, -15, 0, v560);
        u178.Position = UDim2.new(0.5, 3, 0, v586);
        u178.Size = UDim2.new(0.5, -15, 0, v560);
        u179.Position = UDim2.fromOffset(12, v587);
        u179.Size = UDim2.new(0.5, -15, 0, v560);
        u180.Position = UDim2.new(0.5, 3, 0, v587);
        u180.Size = UDim2.new(0.5, -15, 0, v560);
        u183.Position = UDim2.fromOffset(12, v588);
        u183.Size = UDim2.fromOffset(v591, v590);
        u242.Frame.Position = UDim2.fromOffset(0, 0);
        u242:SetLayout(v591);
        u517.Frame.Position = UDim2.fromOffset(0, v589);
        u517:SetLayout(v591);
        u244.Frame.Position = UDim2.fromOffset(0, v589 * 2);
        u244:SetLayout(v591);
        u535.Frame.Position = UDim2.fromOffset(0, v589 * 3);
        u535:SetLayout(v591);
        u539.Frame.Position = UDim2.fromOffset(0, v589 * 4);
        u539:SetLayout(v591);
        u181.Visible = true;
        u181.Position = UDim2.fromOffset(12, v588 + v590 + 4);
        u181.Size = UDim2.new(1, -24, 0, 22);
        u173.Visible = true;
        u184.Visible = true;
        local v592 = v588 + v590 + 32;
        u173.Position = UDim2.fromOffset(12, v592);
        u173.Size = UDim2.new(1, -24, 0, v561);
        local v593 = math.floor((v550 - 24 - 12) / 3);
        local v594 = v558;
        for v595, v596 in ipairs(v566) do
            local v597 = u174[v596];
            v597.Position = UDim2.fromOffset((v593 + 6) * (v595 - 1), 0);
            local l__fromOffset__31 = UDim2.fromOffset;
            local v598;
            if v595 == 3 then
                v598 = v550 - 24 - (v593 + 6) * 2;
            else
                v598 = v593;
            end;
            v597.Size = l__fromOffset__31(v598, v561);
        end;
        local v599 = v592 + v561 + 7;
        local v600 = math.max(80, v558 - v599 - 12);
        u184.Position = UDim2.fromOffset(12, v599);
        u184.Size = UDim2.new(1, -24, 0, v600);
        v568 = math.max(v594, v599 + v600 + 12);
    end;
    u160.CanvasSize = UDim2.fromOffset(0, v568);
    u160.ScrollBarThickness = v558 + 2 < v568 and (l__UserInputService__4.TouchEnabled and 8 or 6) or 0;
    local v601 = math.max(0, v568 - v558);
    if v601 < u160.CanvasPosition.Y then
        u160.CanvasPosition = Vector2.new(0, v601);
    end;
    if not u82 then
        u152.Position = UDim2.fromOffset(math.floor((v548.X - v550) / 2 + 0.5), (math.floor((v548.Y - v552) / 2 + 0.5)));
    end;
    u547();
end;
local u603 = false;
local u604 = nil;
local u605 = nil;
local function u607(u606) --[[ Line: 1925 ]]
    -- upvalues: u603 (ref), u82 (ref), u604 (ref), u605 (ref), u152 (copy)
    u603 = true;
    u82 = true;
    u604 = u606.Position;
    u605 = Vector2.new(u152.Position.X.Offset, u152.Position.Y.Offset);
    u606.Changed:Connect(function() --[[ Line: 1930 ]]
        -- upvalues: u606 (copy), u603 (ref)
        if u606.UserInputState == Enum.UserInputState.End then
            u603 = false;
        end;
    end);
end;
u154.InputBegan:Connect(function(p608) --[[ Line: 1937 ]]
    -- upvalues: u607 (copy)
    if p608.UserInputType == Enum.UserInputType.MouseButton1 or p608.UserInputType == Enum.UserInputType.Touch then
        u607(p608);
    end;
end);
l__UserInputService__4.InputChanged:Connect(function(p609) --[[ Line: 1943 ]]
    -- upvalues: u603 (ref), u604 (ref), u605 (ref), u152 (copy), u547 (copy)
    if u603 and (u604 and u605) then
        if p609.UserInputType == Enum.UserInputType.MouseMovement or p609.UserInputType == Enum.UserInputType.Touch then
            local v610 = p609.Position - u604;
            u152.Position = UDim2.fromOffset(u605.X + v610.X, u605.Y + v610.Y);
            u547();
        end;
    end;
end);
u159.Activated:Connect(function() --[[ Line: 1972 ]]
    -- upvalues: u152 (copy)
    u152.Visible = false;
end);
local u611 = u535;
local u612 = u83;
local u613 = u67;
local function u614() --[[ Line: 1964 ]]
    -- upvalues: u152 (copy), u602 (copy), u504 (copy), u541 (copy)
    if u152.Visible then
        u152.Visible = false;
    else
        u602();
        u504();
        u152.Visible = true;
        u541();
        task.defer(u541);
        task.delay(0.08, u541);
    end;
end;
for u615, v616 in pairs(u174) do
    v616.Activated:Connect(function() --[[ Line: 1977 ]]
        -- upvalues: u79 (ref), u615 (copy), u504 (copy), u442 (ref), u613 (ref)
        u79 = u615;
        u504();
        if u615 == "Roblox" then
            task.defer(function() --[[ Line: 1981 ]]
                -- upvalues: u442 (ref), u613 (ref)
                if u442 and #u613 == 0 then
                    u442(true);
                end;
            end);
        end;
    end);
end;
u170.Activated:Connect(function() --[[ Line: 1990 ]]
    -- upvalues: u169 (copy), u1 (copy), u65 (copy), u434 (copy), u106 (copy), u504 (copy)
    local v617 = string.match(tostring(u169.Text or ""), "%d+");
    if not v617 or (#v617 < 2 or (#v617 > 20 or u1[v617])) then
        v617 = nil;
    end;
    local v618 = v617 or u65.CurrentMusicId or "104185011771893";
    u434(v618, u106(v618), true);
    u504();
end);
u171.Activated:Connect(function() --[[ Line: 1996 ]]
    -- upvalues: u169 (copy), u1 (copy), u65 (copy), u181 (copy), u441 (copy), u106 (copy), u136 (copy), u5 (ref), u124 (copy), u79 (ref), u504 (copy)
    local v619 = string.match(tostring(u169.Text or ""), "%d+");
    if not v619 or (#v619 < 2 or (#v619 > 20 or u1[v619])) then
        v619 = nil;
    end;
    local v620 = v619 or u65.CurrentMusicId;
    if v620 then
        if u441(v620) then
            u181.Text = tostring("Already saved.");
        elseif #(u65.FavoriteMusic or {}) >= 24 then
            u181.Text = tostring("Favorite limit reached.");
        else
            local v621 = u106(v620);
            if v621 == "Audio " .. v620 then
                v621 = u136(v620);
            end;
            local u622 = {
                Id = v620,
                Name = v621
            };
            local v623;
            if u5 then
                local u624 = "AddFavorite";
                local v625;
                v625, v623 = pcall(function() --[[ Line: 368 ]]
                    -- upvalues: u5 (ref), u624 (copy), u622 (copy)
                    return u5:InvokeServer(u624, u622);
                end);
                if not v625 or type(v623) ~= "table" then
                    v623 = nil;
                end;
            else
                v623 = nil;
            end;
            if v623 and v623.Ok then
                u124(v623);
                u181.Text = tostring("Saved to favorites.");
                u79 = "Favorites";
                u504();
            else
                u181.Text = tostring(v623 and v623.Message or "Could not save favorite." or "");
            end;
        end;
    else
        u181.Text = tostring("Invalid audio ID.");
    end;
end);
local function u638(p626) --[[ Line: 2025 ]]
    -- upvalues: u84 (ref), u169 (copy), u79 (ref), u172 (copy), u613 (ref), u69 (ref), u68 (ref), u181 (copy), u504 (copy), u5 (ref), u96 (copy), u450 (copy)
    if u84 then
    else
        local u627 = p626 ~= false;
        local v628 = u169.Text or "";
        local u629 = #v628 < 2 and "music" or v628;
        u79 = "Roblox";
        u84 = true;
        u172.Text = "Finding";
        if u627 then
            u613 = {};
            u69 = true;
            u68 = u629;
        end;
        u181.Text = tostring(u629 == "music" and "Loading Roblox recommendations..." or "Finding Roblox music..." or "");
        u504();
        task.spawn(function() --[[ Line: 2044 ]]
            -- upvalues: u629 (ref), u627 (ref), u5 (ref), u84 (ref), u172 (ref), u96 (ref), u613 (ref), u450 (ref), u69 (ref), u68 (ref), u181 (ref), u504 (ref)
            local u630 = {
                PageSize = 20,
                Query = u629,
                Reset = u627,
                Append = not u627
            };
            local v631;
            if u5 then
                local u632 = "SearchRoblox";
                local v633;
                v633, v631 = pcall(function() --[[ Line: 368 ]]
                    -- upvalues: u5 (ref), u632 (copy), u630 (copy)
                    return u5:InvokeServer(u632, u630);
                end);
                if not v633 or type(v631) ~= "table" then
                    v631 = nil;
                end;
            else
                v631 = nil;
            end;
            u84 = false;
            u172.Text = "Find";
            if v631 and v631.Ok then
                local v634 = u96(v631.Results);
                if u627 then
                    u613 = v634;
                else
                    u450(u613, v634);
                end;
                local v635;
                if v631.HasMore == true then
                    v635 = #u613 < 200;
                else
                    v635 = false;
                end;
                u69 = v635;
                u68 = tostring(v631.Query or u629);
                local v636 = u68 == "music" and "recommendations" or "tracks";
                local v637 = tostring(#u613);
                u181.Text = tostring("Loaded " .. v637 .. " Roblox " .. v636 .. (u69 and ". Scroll for more." or ".") or "");
            else
                if u627 then
                    u613 = {};
                end;
                u69 = false;
                u181.Text = tostring(v631 and v631.Message or "Roblox search failed." or "");
            end;
            u504();
        end);
    end;
end;
u443 = function() --[[ Line: 2075 ]]
    -- upvalues: u79 (ref), u84 (ref), u69 (ref), u613 (ref), u638 (ref)
    if u79 == "Roblox" and (not u84 and (u69 and #u613 < 200)) then
        u638(false);
    end;
end;
u172.Activated:Connect(function() --[[ Line: 2082 ]]
    -- upvalues: u638 (ref)
    u638(true);
end);
u169.FocusLost:Connect(function(p639) --[[ Line: 2086 ]]
    -- upvalues: u169 (copy), u1 (copy), u434 (copy), u106 (copy), u504 (copy), u638 (ref)
    if p639 then
        local v640 = string.match(tostring(u169.Text or ""), "%d+");
        if not v640 or (#v640 < 2 or (#v640 > 20 or u1[v640])) then
            v640 = nil;
        end;
        if v640 then
            u434(v640, u106(v640), true);
            u504();
            return;
        end;
        u638();
    end;
end);
u169:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 2097 ]]
    -- upvalues: u79 (ref), u504 (copy)
    if u79 ~= "Roblox" then
        u504();
    end;
end);
u184:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 2103 ]]
    -- upvalues: u79 (ref), u84 (ref), u69 (ref), u184 (copy), u443 (ref)
    if u79 == "Roblox" and (not u84 and u69) then
        if u184.AbsoluteCanvasSize.Y - (u184.CanvasPosition.Y + u184.AbsoluteWindowSize.Y) <= 96 and u443 then
            u443();
        end;
    end;
end);
u177.Activated:Connect(function() --[[ Line: 2113 ]]
    -- upvalues: u65 (copy), u612 (ref), u436 (copy), u438 (copy)
    if u65.MusicEnabled and not u612 then
        u436(true);
    else
        u438(true);
    end;
end);
u178.Activated:Connect(function() --[[ Line: 2121 ]]
    -- upvalues: u65 (copy), u61 (ref), u178 (copy), u131 (copy), u295 (copy), u181 (copy)
    u65.MusicLoop = not u65.MusicLoop;
    u61.Looped = u65.MusicLoop;
    u178.Text = u65.MusicLoop and "Loop ON" or "Loop OFF";
    local v641 = u178;
    local v642;
    if u65.MusicLoop then
        v642 = Color3.fromRGB(255, 103, 15);
    else
        v642 = Color3.fromRGB(86, 90, 98);
    end;
    v641.BackgroundColor3 = v642;
    u131();
    u295(true);
    u181.Text = tostring(u65.MusicLoop and "Loop enabled." or "Loop disabled." or "");
end);
u179.Activated:Connect(function() --[[ Line: 2130 ]]
    -- upvalues: u65 (copy), u612 (ref), u427 (copy), u61 (ref), u295 (copy), u181 (copy), u253 (copy), u131 (copy)
    u65.PublicMusicEnabled = not u65.PublicMusicEnabled;
    if u65.PublicMusicEnabled and (not u65.MusicEnabled or u612) then
        u65.MusicEnabled = true;
        u612 = false;
        u427();
        pcall(function() --[[ Line: 1452 ]]
            -- upvalues: u61 (ref)
            if u61.TimePosition > 0 then
                u61:Resume();
            else
                u61:Play();
            end;
        end);
        u295(true);
        u181.Text = tostring("Music resumed.");
    end;
    u253();
    u427();
    u131();
    u295(true);
    u181.Text = tostring(u65.PublicMusicEnabled and "Public music is on." or "Public music is off." or "");
end);
u180.Activated:Connect(function() --[[ Line: 2142 ]]
    -- upvalues: u65 (copy), u253 (copy), u131 (copy), u181 (copy)
    u65.MuteOtherMusic = not u65.MuteOtherMusic;
    u253();
    u131();
    u181.Text = tostring(u65.MuteOtherMusic and "Other players\' music muted." or "Other players\' music enabled." or "");
end);
local u643 = {};
local function v652(u644) --[[ Line: 2161 ]]
    -- upvalues: u643 (copy), u614 (copy), l__PlayerGui__8 (copy)
    if u643[u644] or not u644:IsA("GuiButton") then
    elseif u644.Name == "ModeMusicButton" or u644.Name == "ModeMusicScreenButton" then
        local v645 = {};
        u643[u644] = v645;
        v645[#v645 + 1] = u644.Activated:Connect(u614);
        v645[#v645 + 1] = u644.AncestryChanged:Connect(function() --[[ Line: 2172 ]]
            -- upvalues: u644 (copy), l__PlayerGui__8 (ref), u643 (ref)
            if not u644:IsDescendantOf(l__PlayerGui__8) then
                local v646 = u644;
                local v647 = u643[v646];
                if not v647 then
                    return;
                end;
                u643[v646] = nil;
                for _, v648 in ipairs(v647) do
                    v648:Disconnect();
                end;
            end;
        end);
        v645[#v645 + 1] = u644.Destroying:Connect(function() --[[ Line: 2177 ]]
            -- upvalues: u644 (copy), u643 (ref)
            local v649 = u644;
            local v650 = u643[v649];
            if v650 then
                u643[v649] = nil;
                for _, v651 in ipairs(v650) do
                    v651:Disconnect();
                end;
            end;
        end);
    end;
end;
for _, v653 in ipairs(l__PlayerGui__8:GetDescendants()) do
    v652(v653);
end;
l__PlayerGui__8.DescendantAdded:Connect(v652);
if l__Workspace__6.CurrentCamera then
    l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 2188 ]]
        -- upvalues: u152 (copy), u602 (copy)
        if u152.Visible then
            u602();
        end;
    end);
end;
task.spawn(function() --[[ Line: 2195 ]]
    -- upvalues: u412 (copy), u152 (copy), u541 (copy), u61 (ref), u611 (ref), u176 (copy)
    while true do
        repeat
            u412((task.wait(0.25)));
        until u152.Visible;
        u541();
        local u654 = 0;
        local u655 = 0;
        pcall(function() --[[ Line: 2203 ]]
            -- upvalues: u654 (ref), u61 (ref), u655 (ref)
            u654 = tonumber(u61.TimeLength) or 0;
            u655 = tonumber(u61.TimePosition) or 0;
        end);
        local v656 = math.max(1, u654);
        u611:SetRange(0, v656);
        if not u611.Dragging then
            u611:SetValue(math.clamp(u655, 0, v656), true);
        end;
        local v657 = u176;
        local v658 = tonumber(u655) or 0;
        local v659 = math.floor(v658);
        local v660 = math.max(0, v659);
        local v661 = math.floor(v660 / 60);
        local v662 = string.format("%d:%02d", v661, v660 % 60);
        local v663 = tonumber(u654) or 0;
        local v664 = math.floor(v663);
        local v665 = math.max(0, v664);
        local v666 = math.floor(v665 / 60);
        v657.Text = v662 .. " / " .. string.format("%d:%02d", v666, v665 % 60);
    end;
end);
local v667 = v101("Get");
local u668;
if v667 and v667.Ok then
    u124(v667);
    u265(v667.PublicMusic);
    u668 = true;
else
    u668 = false;
end;
u61.SoundId = v9(u65.CurrentMusicId or "104185011771893");
u427();
u504();
if u668 and u65.MusicEnabled then
    u83 = false;
    pcall(function() --[[ Line: 2230 ]]
        -- upvalues: u61 (ref)
        u61:Play();
    end);
else
    u83 = true;
    pcall(function() --[[ Line: 2235 ]]
        -- upvalues: u61 (ref)
        u61:Pause();
    end);
    if not u668 then
        v189("Music loading...");
        task.spawn(function() --[[ Line: 2240 ]]
            -- upvalues: u5 (ref), u668 (ref), u124 (copy), u265 (copy), u427 (copy), u504 (copy), u65 (copy), u83 (ref), u61 (ref), u248 (copy)
            for _ = 1, 6 do
                task.wait(2);
                local v669;
                if u5 then
                    local u670 = "Get";
                    local u671 = nil;
                    local v672;
                    v672, v669 = pcall(function() --[[ Line: 368 ]]
                        -- upvalues: u5 (ref), u670 (copy), u671 (copy)
                        return u5:InvokeServer(u670, u671);
                    end);
                    if not v672 or type(v669) ~= "table" then
                        v669 = nil;
                    end;
                else
                    v669 = nil;
                end;
                if v669 and v669.Ok then
                    u668 = true;
                    u124(v669);
                    u265(v669.PublicMusic);
                    u427();
                    u504();
                    if u65.MusicEnabled then
                        u83 = false;
                        pcall(function() --[[ Line: 2252 ]]
                            -- upvalues: u61 (ref)
                            u61:Play();
                        end);
                    end;
                    u248();
                    return;
                end;
            end;
        end);
    end;
end;
u248();
u253();
u295(true);