-- ClassName: LocalScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Gameplay.MinimapClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__UserInputService__3 = game:GetService("UserInputService");
local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
local l__PlayerGui__5 = l__LocalPlayer__4:WaitForChild("PlayerGui");
local l__Framework__6 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__ClientPlayerState__7 = require(l__Framework__6:WaitForChild("ClientPlayerState"));
local l__MinimapSnapshot__8 = l__ReplicatedStorage__2:WaitForChild("Gameplay"):WaitForChild("Network"):WaitForChild("MinimapSnapshot", 10);
local u1 = nil;
local u2 = nil;
local u3 = {};
local u4 = {};
local u5 = {};
local u6 = {};
local u7 = nil;
local u8 = false;
local u9 = Instance.new("ScreenGui");
u9.Name = "AgaricMinimapGui";
u9.ResetOnSpawn = false;
u9.IgnoreGuiInset = true;
u9.DisplayOrder = 9;
u9.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
u9.Enabled = false;
u9.Parent = l__PlayerGui__5;
local u10 = Instance.new("Frame");
u10.Name = "Minimap";
u10.AnchorPoint = Vector2.new(1, 1);
u10.Position = UDim2.new(1, -16, 1, -16);
u10.Size = UDim2.fromOffset(144, 144);
u10.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
u10.BackgroundTransparency = 0.48;
u10.BorderSizePixel = 0;
u10.Parent = u9;
u10.Visible = false;
u10.ZIndex = 820;
u10.Active = false;
Instance.new("UICorner", u10).CornerRadius = UDim.new(0, 10);
local u11 = Instance.new("TextLabel");
u11.Name = "Title";
u11.BackgroundTransparency = 1;
u11.Position = UDim2.fromOffset(8, 4);
u11.Size = UDim2.new(1, -16, 0, 18);
u11.Font = Enum.Font.GothamBold;
u11.Text = "Map";
u11.TextColor3 = Color3.fromRGB(235, 235, 235);
u11.TextTransparency = 0.12;
u11.TextSize = 11;
u11.TextXAlignment = Enum.TextXAlignment.Left;
u11.Parent = u10;
u11.ZIndex = 821;
local u12 = Instance.new("Frame");
u12.Name = "MapArea";
u12.Position = UDim2.fromOffset(8, 25);
u12.Size = UDim2.new(1, -16, 1, -33);
u12.BackgroundColor3 = Color3.fromRGB(32, 32, 32);
u12.BackgroundTransparency = 0.42;
u12.BorderSizePixel = 0;
u12.ClipsDescendants = true;
u12.Parent = u10;
u12.ZIndex = 821;
Instance.new("UICorner", u12).CornerRadius = UDim.new(0, 7);
local u13 = Instance.new("Frame");
u13.Name = "GridV";
u13.AnchorPoint = Vector2.new(0.5, 0);
u13.Position = UDim2.new(0.5, 0, 0, 0);
u13.Size = UDim2.new(0, 1, 1, 0);
u13.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
u13.BackgroundTransparency = 0.82;
u13.BorderSizePixel = 0;
u13.Parent = u12;
u13.ZIndex = 822;
local u14 = Instance.new("Frame");
u14.Name = "GridH";
u14.AnchorPoint = Vector2.new(0, 0.5);
u14.Position = UDim2.new(0, 0, 0.5, 0);
u14.Size = UDim2.new(1, 0, 0, 1);
u14.BackgroundColor3 = Color3.fromRGB(82, 82, 82);
u14.BackgroundTransparency = 0.82;
u14.BorderSizePixel = 0;
u14.Parent = u12;
u14.ZIndex = 822;
local u15 = Instance.new("TextButton");
u15.Name = "CollapseButton";
u15.Size = UDim2.fromOffset(22, 22);
u15.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
u15.BackgroundTransparency = 0.22;
u15.BorderSizePixel = 0;
u15.Text = "<";
u15.TextColor3 = Color3.fromRGB(245, 245, 245);
u15.TextSize = 16;
u15.Font = Enum.Font.GothamBold;
u15.AutoButtonColor = true;
u15.Parent = u10;
u15.ZIndex = 830;
Instance.new("UICorner", u15).CornerRadius = UDim.new(0, 6);
local function u22(p16, p17) --[[ Line: 129 ]]
    local u18;
    if type(p16) == "string" then
        local v19 = string.upper(string.gsub(p16, "#", ""));
        if string.match(v19, "^%x%x%x%x%x%x$") then
            u18 = "#" .. v19;
        else
            u18 = nil;
        end;
    else
        u18 = nil;
    end;
    if not u18 then
        return p17 or Color3.fromRGB(32, 32, 32);
    end;
    local v20, v21 = pcall(function() --[[ Line: 134 ]]
        -- upvalues: u18 (copy)
        return Color3.fromHex((string.sub(u18, 2)));
    end);
    return v20 and v21 and v21 or (p17 or Color3.fromRGB(32, 32, 32));
end;
local function u33(p23, p24) --[[ Line: 163 ]]
    -- upvalues: l__PlayerGui__5 (copy), u1 (ref)
    local v25 = p23 and 150 or 180;
    local v26 = l__PlayerGui__5:GetAttribute("MinimapSizeOverride");
    if v26 == nil then
        if u1 then
            v26 = u1:GetAttribute("MinimapSize");
            if v26 == nil or v26 == "" then
                v26 = v25;
            end;
        else
            v26 = v25;
        end;
    end;
    local v27 = tonumber(v26) or v25;
    local v28 = math.min(p24.X, p24.Y) * 0.32;
    local v29 = math.floor(v28);
    local v30 = math.min(170, v29);
    local v31 = math.max(120, v30);
    local v32 = math.clamp(v27, 56, p23 and v31 and v31 or 180) + 0.5;
    return math.floor(v32);
end;
local function u51() --[[ Line: 188 ]]
    -- upvalues: l__UserInputService__3 (copy), l__PlayerGui__5 (copy), u1 (ref), u33 (copy), u10 (copy), u22 (copy), u12 (copy), u13 (copy), u14 (copy), u15 (copy), u11 (copy), u8 (ref)
    local l__CurrentCamera__9 = workspace.CurrentCamera;
    local v34 = l__CurrentCamera__9 and l__CurrentCamera__9.ViewportSize or Vector2.new(1280, 720);
    local v35 = l__UserInputService__3.TouchEnabled or (v34.X < 860 and true or v34.Y < 560);
    local v36 = l__PlayerGui__5:GetAttribute("MinimapSideOverride");
    if v36 == nil then
        if u1 then
            local v37 = u1:GetAttribute("MinimapSide");
            v36 = (v37 == nil or v37 == "") and "Left" or v37;
        else
            v36 = "Left";
        end;
    end;
    local v38 = tostring(v36) == "Right" and "Right" or "Left";
    local v39 = u33(v35, v34);
    local v40 = v35 and 8 or 16;
    local v41 = v38 == "Right" and 1 or 0;
    local v42;
    if v38 == "Right" then
        v42 = -v40 or v40;
    else
        v42 = v40;
    end;
    if v35 then
        u10.AnchorPoint = Vector2.new(v38 == "Right" and 1 or 0, 1);
        u10.Position = UDim2.new(v41, v42, 1, -v40);
    else
        u10.AnchorPoint = Vector2.new(v38 == "Right" and 1 or 0, 1);
        u10.Position = UDim2.new(v41, v42, 1, -16);
    end;
    local v43 = l__PlayerGui__5:GetAttribute("MinimapTransparencyOverride");
    if v43 == nil then
        if u1 then
            local v44 = u1:GetAttribute("MinimapTransparency");
            v43 = (v44 == nil or v44 == "") and 0.56 or v44;
        else
            v43 = 0.56;
        end;
    end;
    local v45 = tonumber(v43) or 0.56;
    local v46 = math.clamp(v45, 0, 0.95);
    local v47 = u22;
    local v48 = l__PlayerGui__5:GetAttribute("MinimapColorOverride");
    if v48 == nil then
        if u1 then
            local v49 = u1:GetAttribute("MinimapColor");
            v48 = (v49 == nil or v49 == "") and "#202020" or v49;
        else
            v48 = "#202020";
        end;
    end;
    local v50 = v47(v48, Color3.fromRGB(32, 32, 32));
    u10.BackgroundColor3 = v50;
    u10.BackgroundTransparency = v46;
    u12.BackgroundColor3 = v50:Lerp(Color3.fromRGB(255, 255, 255), 0.08);
    u12.BackgroundTransparency = math.clamp(v46 + 0.08, 0, 0.96);
    u13.BackgroundTransparency = math.clamp(v46 + 0.34, 0.82, 0.98);
    u14.BackgroundTransparency = u13.BackgroundTransparency;
    u15.BackgroundColor3 = v50;
    u15.BackgroundTransparency = math.clamp(v46 - 0.12, 0.12, 0.8);
    u11.Visible = false;
    if u8 then
        u10.Size = UDim2.fromOffset(28, 28);
        u12.Visible = false;
        u15.Position = UDim2.fromOffset(3, 3);
        u15.Text = v38 == "Right" and "<" or ">";
    else
        u10.Size = UDim2.fromOffset(v39, v39);
        u12.Visible = true;
        u12.Position = UDim2.fromOffset(6, 6);
        u12.Size = UDim2.new(1, -12, 1, -12);
        u15.Position = v38 == "Right" and UDim2.fromOffset(4, 4) or UDim2.new(1, -26, 0, 4);
        u15.Text = v38 == "Right" and ">" or "<";
    end;
end;
local function u58() --[[ Line: 233 ]]
    -- upvalues: l__Players__1 (copy), l__LocalPlayer__4 (copy), u3 (ref)
    local v52 = {};
    for _, u53 in ipairs(l__Players__1:GetPlayers()) do
        if u53 ~= l__LocalPlayer__4 then
            local v54, v55 = pcall(function() --[[ Line: 237 ]]
                -- upvalues: l__LocalPlayer__4 (ref), u53 (copy)
                return l__LocalPlayer__4:IsFriendsWith(u53.UserId);
            end);
            if v54 and v55 == true then
                local v56 = tostring(u53.DisplayName or "");
                local v57 = tostring(u53.UserId);
                if v56 == "" or not v56 then
                    v56 = u53.Name;
                end;
                v52[v57] = v56;
            end;
        end;
    end;
    u3 = v52;
end;
local function u64(p59) --[[ Line: 249 ]]
    -- upvalues: u4 (copy), u12 (copy)
    local v60 = u4[p59];
    if v60 and v60.Parent then
        return v60;
    end;
    local v61 = Instance.new("Frame");
    v61.Name = "Dot_" .. tostring(p59);
    v61.AnchorPoint = Vector2.new(0.5, 0.5);
    v61.Size = UDim2.fromOffset(8, 8);
    v61.BackgroundColor3 = Color3.fromRGB(78, 220, 130);
    v61.BorderSizePixel = 0;
    v61.Parent = u12;
    v61.ZIndex = 825;
    Instance.new("UICorner", v61).CornerRadius = UDim.new(1, 0);
    local v62 = Instance.new("UIStroke");
    v62.Name = "Ring";
    v62.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
    v62.Color = Color3.fromRGB(255, 255, 255);
    v62.Thickness = 1;
    v62.Transparency = 0.45;
    v62.Parent = v61;
    local v63 = Instance.new("TextLabel");
    v63.Name = "NameLabel";
    v63.BackgroundTransparency = 1;
    v63.AnchorPoint = Vector2.new(0, 0.5);
    v63.Position = UDim2.fromOffset(8, 0);
    v63.Size = UDim2.fromOffset(76, 16);
    v63.Font = Enum.Font.GothamBold;
    v63.Text = "";
    v63.TextColor3 = Color3.fromRGB(225, 255, 235);
    v63.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    v63.TextStrokeTransparency = 0.35;
    v63.TextSize = 10;
    v63.TextTruncate = Enum.TextTruncate.AtEnd;
    v63.TextXAlignment = Enum.TextXAlignment.Left;
    v63.Visible = false;
    v63.Parent = v61;
    v63.ZIndex = 826;
    u4[p59] = v61;
    return v61;
end;
local function u68() --[[ Line: 293 ]]
    -- upvalues: l__PlayerGui__5 (copy)
    local u65 = l__PlayerGui__5:FindFirstChild("AgaricGameplayPositionQuery");
    if u65 and u65:IsA("BindableFunction") then
        local v66, v67 = pcall(function() --[[ Line: 298 ]]
            -- upvalues: u65 (copy)
            return u65:Invoke();
        end);
        if v66 and type(v67) == "table" then
            return v67;
        else
            return nil;
        end;
    else
        return nil;
    end;
end;
local function u86(p69) --[[ Line: 315 ]]
    -- upvalues: u6 (ref)
    local v70 = 0;
    local l__Self__10 = p69.Self;
    local v71;
    if type(l__Self__10) == "table" then
        local v72 = tonumber(l__Self__10.X);
        if not v72 or v72 ~= v72 then
            v72 = nil;
        end;
        local v73 = tonumber(l__Self__10.Y);
        if not v73 or v73 ~= v73 then
            v73 = nil;
        end;
        if v72 and v73 then
            local v74 = math.abs(v72);
            local v75 = math.abs(v73);
            v70 = math.max(v70, v74, v75);
            v71 = v70;
        else
            v71 = v70;
        end;
    else
        v71 = v70;
    end;
    local l__Players__11 = p69.Players;
    if type(l__Players__11) == "table" then
        for _, v76 in pairs(l__Players__11) do
            if type(v76) == "table" then
                local v77 = tonumber(v76.X);
                if not v77 or v77 ~= v77 then
                    v77 = nil;
                end;
                local v78 = tonumber(v76.Y);
                if not v78 or v78 ~= v78 then
                    v78 = nil;
                end;
                if v77 and v78 then
                    local v79 = math.abs(v77);
                    local v80 = math.abs(v78);
                    v70 = math.max(v71, v79, v80);
                    v71 = v70;
                end;
            end;
        end;
    end;
    for _, v81 in ipairs(u6) do
        if type(v81) == "table" then
            local v82 = tonumber(v81.X);
            if not v82 or v82 ~= v82 then
                v82 = nil;
            end;
            local v83 = tonumber(v81.Y);
            if not v83 or v83 ~= v83 then
                v83 = nil;
            end;
            if v82 and v83 then
                local v84 = math.abs(v82);
                local v85 = math.abs(v83);
                v70 = math.max(v71, v84, v85);
                v71 = v70;
            end;
        end;
    end;
    return v71;
end;
local function u99(p87) --[[ Line: 340 ]]
    -- upvalues: u86 (copy)
    local v88 = tonumber(p87.MapMinX);
    if not v88 or v88 ~= v88 then
        v88 = nil;
    end;
    local v89 = tonumber(p87.MapMaxX);
    if not v89 or v89 ~= v89 then
        v89 = nil;
    end;
    local v90 = tonumber(p87.MapMinY);
    if not v90 or v90 ~= v90 then
        v90 = nil;
    end;
    local v91 = tonumber(p87.MapMaxY);
    if not v91 or v91 ~= v91 then
        v91 = nil;
    end;
    if v88 and (v89 and (v90 and (v91 and (v88 < v89 and v90 < v91)))) then
        return {
            MinX = v88,
            MaxX = v89,
            MinY = v90,
            MaxY = v91
        };
    end;
    local v92 = 1;
    local v93 = tonumber(p87.MapSize);
    if not v93 or v93 ~= v93 then
        v93 = nil;
    end;
    local v94 = math.max(v92, v93 or 4000);
    local v95 = tonumber(p87.MapHalfSize);
    if not v95 or v95 ~= v95 then
        v95 = nil;
    end;
    local v96 = v95 or v94 * 0.5;
    local v97 = u86(p87) + 20;
    local v98 = math.max(1, v96, v97);
    return {
        MinX = -v98,
        MaxX = v98,
        MinY = -v98,
        MaxY = v98
    };
end;
local function u118(p100, p101, p102, p103, p104, p105, p106, p107) --[[ Line: 355 ]]
    -- upvalues: u12 (copy), u64 (copy)
    local v108 = math.max(1, u12.AbsoluteSize.X);
    local v109 = math.max(1, u12.AbsoluteSize.Y);
    local v110 = math.min(v108, v109);
    local v111 = math.max(1, p103.MaxX - p103.MinX);
    local v112 = math.max(1, p103.MaxY - p103.MinY);
    local v113 = math.clamp((p101 - p103.MinX) / v111, 0, 1) * v108;
    local v114 = math.clamp((p102 - p103.MinY) / v112, 0, 1) * v109;
    local v115 = u64(p100);
    v115.Position = UDim2.fromOffset(v113, v114);
    v115.Size = UDim2.fromOffset(p105, p105);
    v115.BackgroundColor3 = p104;
    v115.Visible = true;
    local v116 = v115:FindFirstChild("NameLabel");
    if v116 and v116:IsA("TextLabel") then
        if p106 and p106 ~= "" then
            local v117 = v110 < 96;
            v116.Text = tostring(p106);
            v116.TextColor3 = p107 or Color3.fromRGB(225, 255, 235);
            v116.TextSize = v117 and 9 or 10;
            v116.Size = UDim2.fromOffset(v117 and 50 or 76, 16);
            v116.Visible = true;
            if v108 * 0.62 < v113 then
                v116.AnchorPoint = Vector2.new(1, 0.5);
                v116.Position = UDim2.fromOffset(-7, 0);
                v116.TextXAlignment = Enum.TextXAlignment.Right;
                return;
            else
                v116.AnchorPoint = Vector2.new(0, 0.5);
                v116.Position = UDim2.fromOffset(7, 0);
                v116.TextXAlignment = Enum.TextXAlignment.Left;
                return;
            end;
        end;
        v116.Visible = false;
    end;
end;
local function u142() --[[ Line: 393 ]]
    -- upvalues: u10 (copy), u8 (ref), u68 (copy), u7 (ref), u51 (copy), u99 (copy), u118 (copy), u5 (ref), l__LocalPlayer__4 (copy), u3 (ref), u6 (ref), u4 (copy)
    if u10.Visible and not u8 then
        local v119 = u68();
        if v119 then
            if u7 then
                local v120 = u7 / 2;
                v119.MapSize = u7;
                v119.MapHalfSize = v120;
                v119.MapMinX = -v120;
                v119.MapMaxX = v120;
                v119.MapMinY = -v120;
                v119.MapMaxY = v120;
            end;
            u51();
            local v121 = u99(v119);
            local v122 = {};
            local l__Self__12 = v119.Self;
            if type(l__Self__12) == "table" and (type(l__Self__12.X) == "number" and type(l__Self__12.Y) == "number") then
                u118("self", l__Self__12.X, l__Self__12.Y, v121, Color3.fromRGB(255, 120, 45), 8, nil);
                v122.self = true;
            end;
            local v123 = u5;
            if next(v123) == nil then
                v123 = v119.Players;
            end;
            if type(v123) == "table" then
                for v124, v125 in pairs(v123) do
                    local v126 = tostring(v124);
                    if v126 ~= tostring(l__LocalPlayer__4.UserId) and (type(v125) == "table" and (type(v125.X) == "number" and type(v125.Y) == "number")) then
                        local v127 = u3[v126];
                        local v128 = tonumber(v125.Radius) or 1;
                        local v129 = math.max(v128, 1) / 100;
                        local v130 = math.clamp(v129, 4, 9);
                        local v131 = v127 and Color3.fromRGB(78, 220, 130) or Color3.fromRGB(150, 150, 150);
                        u118(v126, v125.X, v125.Y, v121, v131, v130, v127);
                        v122[v126] = true;
                    end;
                end;
            end;
            for v132, v133 in ipairs(u6) do
                if type(v133) == "table" and (type(v133.X) == "number" and type(v133.Y) == "number") then
                    local v134 = tostring(v133.Kind or "Event");
                    local v135 = "event_" .. v134 .. "_" .. tostring(v132);
                    local v136 = Color3.fromRGB(255, 210, 78);
                    local v137 = "EVENT";
                    local v138 = 11;
                    local v139 = Color3.fromRGB(255, 235, 160);
                    if v134 == "LeaderBounty" then
                        v136 = Color3.fromRGB(255, 76, 76);
                        v139 = Color3.fromRGB(255, 180, 180);
                        v138 = 12;
                        v137 = "BOUNTY";
                    elseif v134 == "KingHill" then
                        v136 = Color3.fromRGB(255, 170, 40);
                        v139 = Color3.fromRGB(255, 215, 150);
                        v138 = 13;
                        v137 = "KING";
                    elseif v134 == "GoldenCrate" then
                        v136 = Color3.fromRGB(255, 220, 70);
                        v137 = tostring(v133.Phase or "") == "Warning" and "DROP" or "CRATE";
                        v139 = Color3.fromRGB(255, 245, 175);
                        v138 = 12;
                    end;
                    u118(v135, v133.X, v133.Y, v121, v136, v138, v137, v139);
                    v122[v135] = true;
                end;
            end;
            for v140, v141 in pairs(u4) do
                if not v122[v140] then
                    v141.Visible = false;
                end;
            end;
        end;
    end;
end;
if l__MinimapSnapshot__8 and l__MinimapSnapshot__8:IsA("RemoteEvent") then
    l__MinimapSnapshot__8.OnClientEvent:Connect(function(p143) --[[ Line: 471 ]]
        -- upvalues: u7 (ref), u5 (ref), u6 (ref)
        if type(p143) == "table" then
            u7 = tonumber(p143.MapSize) or u7;
            local v144 = {};
            local l__Players__13 = p143.Players;
            if type(l__Players__13) == "table" then
                for _, v145 in ipairs(l__Players__13) do
                    if type(v145) == "table" then
                        local v146 = tostring(v145.UserId or "");
                        local v147 = tonumber(v145.X);
                        local v148 = tonumber(v145.Y);
                        if v146 ~= "" and (v147 and v148) then
                            v144[v146] = {
                                X = v147,
                                Y = v148,
                                Radius = tonumber(v145.Radius) or 1
                            };
                        end;
                    end;
                end;
            end;
            u5 = v144;
            local v149 = {};
            local l__EventMarkers__14 = p143.EventMarkers;
            if type(l__EventMarkers__14) == "table" then
                for _, v150 in ipairs(l__EventMarkers__14) do
                    if type(v150) == "table" then
                        local v151 = tostring(v150.Kind or "");
                        local v152 = tonumber(v150.X);
                        local v153 = tonumber(v150.Y);
                        if v151 ~= "" and (v152 and v153) then
                            v149[#v149 + 1] = {
                                Kind = v151,
                                Phase = tostring(v150.Phase or ""),
                                Name = tostring(v150.Name or ""),
                                UserId = tonumber(v150.UserId),
                                X = v152,
                                Y = v153,
                                Radius = tonumber(v150.Radius) or 1,
                                Reward = tonumber(v150.Reward) or 0,
                                EndsAt = tonumber(v150.EndsAt) or 0
                            };
                        end;
                    end;
                end;
            end;
            u6 = v149;
        end;
    end);
end;
u15.MouseButton1Click:Connect(function() --[[ Line: 524 ]]
    -- upvalues: u8 (ref), u51 (copy)
    u8 = not u8;
    u51();
end);
local function v157() --[[ Line: 529 ]]
    -- upvalues: l__PlayerGui__5 (copy), u1 (ref), u9 (copy), u10 (copy), u51 (copy)
    local v154 = l__PlayerGui__5:GetAttribute("MinimapEnabledOverride");
    local v155 = v154 == nil and true or v154 ~= false;
    if v154 == nil then
        v155 = false;
        if u1 then
            local v156 = u1:GetAttribute("MinimapEnabled");
            if v156 ~= nil and v156 ~= "" then
                v155 = v156 ~= false;
            end;
        end;
    end;
    u9.Enabled = v155;
    u10.Visible = v155;
    u51();
end;
l__PlayerGui__5:GetAttributeChangedSignal("MinimapEnabledOverride"):Connect(v157);
l__PlayerGui__5:GetAttributeChangedSignal("MinimapSideOverride"):Connect(v157);
l__PlayerGui__5:GetAttributeChangedSignal("MinimapSizeOverride"):Connect(v157);
l__PlayerGui__5:GetAttributeChangedSignal("MinimapTransparencyOverride"):Connect(v157);
l__PlayerGui__5:GetAttributeChangedSignal("MinimapColorOverride"):Connect(v157);
l__Players__1.PlayerAdded:Connect(function() --[[ Line: 540 ]]
    -- upvalues: u58 (copy)
    task.defer(u58);
end);
l__Players__1.PlayerRemoving:Connect(function() --[[ Line: 543 ]]
    -- upvalues: u58 (copy)
    task.defer(u58);
end);
task.spawn(function() --[[ Line: 547 ]]
    -- upvalues: u9 (copy), u1 (ref), l__ClientPlayerState__7 (copy), l__LocalPlayer__4 (copy), l__PlayerGui__5 (copy), u10 (copy), u2 (ref), u51 (copy)
    while u9.Parent do
        if u1 then
            local v158 = l__PlayerGui__5:GetAttribute("MinimapEnabledOverride");
            local v159 = v158 == nil and true or v158 ~= false;
            if v158 == nil then
                v159 = false;
                if u1 then
                    local v160 = u1:GetAttribute("MinimapEnabled");
                    if v160 ~= nil and v160 ~= "" then
                        v159 = v160 ~= false;
                    end;
                end;
            end;
            u9.Enabled = v159;
            u10.Visible = v159;
            return;
        end;
        u1 = l__ClientPlayerState__7.WaitForProxy("Settings", l__LocalPlayer__4, 2);
        if u1 then
            local v161 = l__PlayerGui__5:GetAttribute("MinimapEnabledOverride");
            local v162 = v161 == nil and true or v161 ~= false;
            if v161 == nil then
                v162 = false;
                if u1 then
                    local v163 = u1:GetAttribute("MinimapEnabled");
                    if v163 ~= nil and v163 ~= "" then
                        v162 = v163 ~= false;
                    end;
                end;
            end;
            u9.Enabled = v162;
            u10.Visible = v162;
            if u2 then
                u2:Disconnect();
            end;
            u2 = u1.AttributeChanged:Connect(function(p164) --[[ Line: 556 ]]
                -- upvalues: l__PlayerGui__5 (ref), u1 (ref), u9 (ref), u10 (ref), u51 (ref)
                if p164 ~= nil then
                    local v165 = tostring(p164);
                    if string.sub(v165, 1, 7) ~= "Minimap" then
                        return;
                    end;
                end;
                local v166 = l__PlayerGui__5:GetAttribute("MinimapEnabledOverride");
                local v167 = v166 == nil and true or v166 ~= false;
                if v166 == nil then
                    v167 = false;
                    if u1 then
                        local v168 = u1:GetAttribute("MinimapEnabled");
                        if v168 ~= nil and v168 ~= "" then
                            v167 = v168 ~= false;
                        end;
                    end;
                end;
                u9.Enabled = v167;
                u10.Visible = v167;
                u51();
            end);
            return;
        end;
        task.wait(0.5);
    end;
end);
task.spawn(function() --[[ Line: 572 ]]
    -- upvalues: u9 (copy), u58 (copy)
    while u9.Parent do
        u58();
        task.wait(12);
    end;
end);
task.spawn(function() --[[ Line: 579 ]]
    -- upvalues: u9 (copy), u142 (copy)
    while u9.Parent do
        u142();
        task.wait(0.35);
    end;
end);
local v169 = l__PlayerGui__5:GetAttribute("MinimapEnabledOverride");
local v170 = v169 == nil and true or v169 ~= false;
if v169 == nil then
    v170 = false;
    if u1 then
        local v171 = u1:GetAttribute("MinimapEnabled");
        if v171 ~= nil and v171 ~= "" then
            v170 = v171 ~= false;
        end;
    end;
end;
u9.Enabled = v170;
u10.Visible = v170;
u51();