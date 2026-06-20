-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.LobbyController

-- Decompiled with Potassium's decompiler.

local u1 = {};
local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
game:GetService("Teams");
local l__UserInputService__3 = game:GetService("UserInputService");
local l__TweenService__4 = game:GetService("TweenService");
local l__Lighting__5 = game:GetService("Lighting");
local l__Network__6 = l__ReplicatedStorage__2:WaitForChild("Gameplay"):WaitForChild("Network");
local l__SpawnPlayer__7 = l__Network__6:WaitForChild("SpawnPlayer");
local l__SpectatePlayer__8 = l__Network__6:WaitForChild("SpectatePlayer");
local l__BuyItemEvent__9 = l__Network__6:WaitForChild("BuyItemEvent", 10);
local l__EquipItemEvent__10 = l__Network__6:WaitForChild("EquipItemEvent", 10);
local l__OpenCaseFunction__11 = l__Network__6:WaitForChild("OpenCaseFunction", 10);
local l__UpdateNicknameEvent__12 = l__Network__6:WaitForChild("UpdateNicknameEvent", 10);
local l__UpdateColorEvent__13 = l__Network__6:WaitForChild("UpdateColorEvent", 10);
local l__ToggleRandomColorEvent__14 = l__Network__6:WaitForChild("ToggleRandomColorEvent", 10);
local l__BuyBotPack__15 = l__Network__6:WaitForChild("BuyBotPack", 10);
local l__ActivateBotPack__16 = l__Network__6:WaitForChild("ActivateBotPack", 10);
local l__StopBotPack__17 = l__Network__6:WaitForChild("StopBotPack", 10);
local l__Framework__18 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__GameDatabase__19 = require(l__Framework__18:WaitForChild("GameDatabase"));
local l__LevelService__20 = require(l__Framework__18:WaitForChild("LevelService"));
local l__ClientPlayerState__21 = require(l__Framework__18:WaitForChild("ClientPlayerState"));
local v2 = nil;
local u3 = l__Framework__18:FindFirstChild("TotalStatsCalculator");
local u4;
if u3 then
    local v5;
    v5, u4 = pcall(function() --[[ Line: 41 ]]
        -- upvalues: u3 (copy)
        return require(u3);
    end);
    if not v5 then
        u4 = v2;
    end;
else
    u4 = v2;
end;
u1.IsMenuActive = true;
local u6 = {
    Skin = {},
    Accessory = {}
};
local u7 = {
    Skin = {},
    Accessory = {}
};
local u8 = Color3.fromRGB(83, 83, 83);
local u9 = Color3.fromRGB(52, 52, 52);
local u10 = Color3.fromRGB(255, 230, 110);
local u11 = Color3.fromRGB(95, 220, 115);
local u12 = Font.fromName("Montserrat", Enum.FontWeight.Bold);
local u13 = {};
local u14 = {};
local u15 = nil;
local u16 = setmetatable({}, {
    __mode = "k"
});
local u17 = nil;
local function u20(p18) --[[ Line: 85 ]]
    local v19 = tonumber(p18);
    if v19 then
        return tostring(v19):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
    else
        return tostring(p18 or "");
    end;
end;
local function u32(p21) --[[ Line: 138 ]]
    -- upvalues: l__ClientPlayerState__21 (copy), l__LevelService__20 (copy)
    local u22 = l__ClientPlayerState__21.GetProxy("Gameplay", p21);
    if u22 then
        u22 = tonumber(u22:GetAttribute("XP"));
    end;
    if u22 then
        local v23, v24 = pcall(function() --[[ Line: 143 ]]
            -- upvalues: l__LevelService__20 (ref), u22 (copy)
            return l__LevelService__20.CalculateLevelInfo(u22);
        end);
        if v23 and (v24 and tonumber(v24.Level)) then
            return tonumber(v24.Level);
        end;
    end;
    local v25 = { l__ClientPlayerState__21.GetProxy("Stats", p21), l__ClientPlayerState__21.GetProxy("Gameplay", p21) };
    for _, v26 in ipairs(v25) do
        if v26 then
            for _, v27 in ipairs({ "Level", "Lvl" }) do
                local v28 = tonumber(v26:GetAttribute(v27));
                if v28 then
                    return v28;
                end;
                local u29 = v26:FindFirstChild(v27);
                if u29 then
                    local v30, v31 = pcall(function() --[[ Line: 167 ]]
                        -- upvalues: u29 (copy)
                        return u29.Value;
                    end);
                    if v30 and tonumber(v31) then
                        return tonumber(v31);
                    end;
                end;
            end;
        end;
    end;
    return 0;
end;
local function u36(p33, p34) --[[ Line: 203 ]]
    for v35 = #p33, 1, -1 do
        if p33[v35] == p34 then
            table.remove(p33, v35);
        end;
    end;
end;
local function u43(p37, p38) --[[ Line: 232 ]]
    -- upvalues: u6 (ref), u36 (copy), u7 (ref)
    local v39 = u6[p38];
    if not v39 then
        v39 = {};
        u6[p38] = v39;
    end;
    for v40 = #v39, 1, -1 do
        if v39[v40] == p37 then
            table.remove(v39, v40);
        end;
    end;
    local v41 = u36;
    local v42 = u7[p38];
    if not v42 then
        v42 = {};
        u7[p38] = v42;
    end;
    v41(v42, p37);
end;
local function u57(p44, p45) --[[ Line: 244 ]]
    -- upvalues: u6 (ref), u43 (copy), l__GameDatabase__19 (copy), u7 (ref), u36 (copy)
    if p45 ~= "Skin" and p45 ~= "Accessory" then
        return;
    end;
    local v46 = ipairs;
    local v47 = u6[p45];
    if not v47 then
        v47 = {};
        u6[p45] = v47;
    end;
    local v48, v49, v50, v51, v52, v53, v54, v55;
    for _, v56 in v46(v47) do
        if v56 == p44 then
            v48 = true;
            if v48 then
                u43(p44, p45);
                return;
            else
                v49 = u6[p45];
                if not v49 then
                    v49 = {};
                    u6[p45] = v49;
                end;
                v50 = l__GameDatabase__19.TypeLimits;
                v51 = v50 and (v50[p45] or 5) or 5;
                table.insert(v49, p44);
                if p45 == "Skin" or p45 == "Accessory" then
                    v52 = u7[p45];
                    if not v52 then
                        v52 = {};
                        u7[p45] = v52;
                    end;
                    u36(v52, p44);
                    table.insert(v52, p44);
                end;
                while v51 < #v49 do
                    v53 = table.remove(v49, 1);
                    v54 = u36;
                    v55 = u7[p45];
                    if not v55 then
                        v55 = {};
                        u7[p45] = v55;
                    end;
                    v54(v55, v53);
                end;
                return;
            end;
        end;
    end;
    v48 = false;
    if v48 then
        u43(p44, p45);
    else
        v49 = u6[p45];
        if not v49 then
            v49 = {};
            u6[p45] = v49;
        end;
        v50 = l__GameDatabase__19.TypeLimits;
        v51 = v50 and (v50[p45] or 5) or 5;
        table.insert(v49, p44);
        if p45 == "Skin" or p45 == "Accessory" then
            v52 = u7[p45];
            if not v52 then
                v52 = {};
                u7[p45] = v52;
            end;
            u36(v52, p44);
            table.insert(v52, p44);
        end;
        while v51 < #v49 do
            v53 = table.remove(v49, 1);
            v54 = u36;
            v55 = u7[p45];
            if not v55 then
                v55 = {};
                u7[p45] = v55;
            end;
            v54(v55, v53);
        end;
    end;
end;
local function u58() --[[ Line: 266 ]]
    -- upvalues: u6 (ref), u7 (ref)
    u6 = {
        Skin = {},
        Accessory = {}
    };
    u7 = {
        Skin = {},
        Accessory = {}
    };
end;
local function u104(p59, p60) --[[ Line: 288 ]]
    -- upvalues: l__GameDatabase__19 (copy), u6 (ref), u7 (ref)
    local v61, v62, v63, v64, v65, v66, v67, v68, v69, v70, v71, v72, v73, v74;
    local v75 = 0;
    while true do
        if v75 == 0 then
            v75 = -1;
            -- block 59
            local l__TypeLimits__22 = l__GameDatabase__19.TypeLimits;
            local v76 = l__TypeLimits__22 and (l__TypeLimits__22[p60] or 5) or 5;
            local v77 = {};
            v61 = {};
            if p59 then
                for v78 = 1, v76 do
                    local v79 = p59:GetAttribute("Slot" .. v78);
                    if v79 and (v79 ~= "" and v79 ~= "None") then
                        table.insert(v77, v79);
                        v61[v79] = true;
                    end;
                end;
            end;
            local v80 = ipairs;
            local v81 = u6[p60];
            if not v81 then
                v81 = {};
                u6[p60] = v81;
            end;
            for _, v82 in v80(v81) do
                if v82 and (v82 ~= "" and v82 ~= "None") then
                    v61[v82] = true;
                end;
            end;
            v62 = u7[p60];
            if not v62 then
                v62 = {};
                u7[p60] = v62;
            end;
            for v83 = #v62, 1, -1 do
                if not v61[v62[v83]] then
                    table.remove(v62, v83);
                end;
            end;
            v63, v64, v65 = ipairs(v77);
            v75 = 1;
            continue;
        elseif v75 == 1 then
            v75 = -1;
            local v84;
            if type(v63) == "function" then
                v84, v66 = v63(v64, v65);
            else
                v84, v66 = next(v63, v65);
            end;
            if v84 ~= nil then
                v65 = v84;
                -- block 0
                v75 = 2;
                continue;
            else
                break;
            end;
        elseif v75 == 2 then
            v75 = -1;
            v67 = false;
            v75 = 4;
            continue;
        elseif v75 == 3 then
            v75 = -1;
            local v85, v86, v87;
            v85, v86, v87 = ipairs(v62);
            local v88, v89;
            if type(v85) == "function" then
                v88, v89 = v85(v86, v87);
            else
                v88, v89 = next(v85, v87);
            end;
            if v88 ~= nil then
                v87 = v88;
                -- block 26
                v75 = 6;
                continue;
            else
                break;
            end;
        elseif v75 == 4 then
            v75 = -1;
            if not v67 then
                table.insert(v62, v66);
            end;
            v75 = 1;
            continue;
        elseif v75 == 5 then
            v75 = -1;
            local v90, v91, v92;
            if type(v90) == "function" then
                local v93;
                v91, v68 = v90(v93, v92);
            else
                v91, v68 = next(v90, v92);
            end;
            if v91 ~= nil then
                v92 = v91;
                v75 = 3;
                continue;
            else
                break;
            end;
        elseif v75 == 6 then
            v75 = -1;
            if v61[v68] then
                v75 = 7;
                continue;
            end;
            v75 = 5;
            continue;
        elseif v75 == 7 then
            v75 = -1;
            v69, v70, v71 = ipairs(v62);
            v75 = 8;
            continue;
        elseif v75 == 8 then
            v75 = -1;
            local v94, v95;
            if type(v69) == "function" then
                v94, v95 = v69(v70, v71);
            else
                v94, v95 = next(v69, v71);
            end;
            if v94 ~= nil then
                v71 = v94;
                v75 = 9;
                continue;
            else
                break;
            end;
        elseif v75 == 9 then
            v75 = -1;
            local v96;
            if v61[v96] then
                v75 = 10;
                continue;
            end;
            local v97, v98, v99;
            if type(v97) == "function" then
                local v100;
                v98, v96 = v97(v100, v99);
            else
                v98, v96 = next(v97, v99);
            end;
            if v98 ~= nil then
                v99 = v98;
                v75 = 9;
                continue;
            else
                break;
            end;
        elseif v75 == 10 then
            v75 = -1;
            local v101;
            v72, v73, v74 = ipairs(v101);
            v75 = 11;
            continue;
        elseif v75 == 11 then
            v75 = -1;
            local v102, v103;
            if type(v72) == "function" then
                v102, v103 = v72(v73, v74);
            else
                v102, v103 = next(v72, v74);
            end;
            if v102 ~= nil then
                v74 = v102;
                v75 = 9;
                continue;
            else
                break;
            end;
        else
            break;
        end;
    end;
end;
local function u108(p105) --[[ Line: 395 ]]
    for _, v106 in ipairs({
        "Level",
        "Levels",
        "Lvl",
        "LevelSkins",
        "LvlSkins",
        "LevelRewards"
    }) do
        local v107 = p105:FindFirstChild(v106);
        if v107 then
            return v107;
        end;
    end;
    return nil;
end;
function u1.EnsureBotsShopTab(p109) --[[ Line: 434 ]]
    -- upvalues: u9 (copy)
    if p109 then
        local function v119(p110, p111, p112, p113, p114) --[[ Line: 439 ]]
            -- upvalues: u9 (ref)
            local v115 = p110:FindFirstChild(p111);
            if v115 and v115:IsA("GuiObject") then
                v115.Visible = true;
                if v115:IsA("GuiButton") then
                    v115.Active = true;
                end;
                return v115;
            end;
            local v116 = Instance.new("TextButton");
            v116.Name = p111;
            v116.LayoutOrder = p113 or 1;
            v116.Size = p114 and UDim2.new(0.188103601, 0, 1, 0) or UDim2.new(0.164941341, 0, 1, 0);
            v116.BackgroundColor3 = u9;
            v116.BackgroundTransparency = 0.2;
            v116.BorderSizePixel = 0;
            v116.AutoButtonColor = false;
            v116.Active = true;
            v116.Selectable = false;
            v116.Text = "";
            v116.Parent = p110;
            Instance.new("UICorner", v116);
            local v117 = Instance.new("TextLabel");
            v117.Name = "Menu";
            v117.AnchorPoint = Vector2.new(0.5, 0.5);
            v117.Position = UDim2.new(0.5, 0, 0.5, 0);
            v117.Size = UDim2.new(1, -4, 0.62, 0);
            v117.BackgroundTransparency = 1;
            v117.Text = p112;
            v117.TextColor3 = Color3.new(1, 1, 1);
            v117.TextScaled = true;
            v117.TextWrapped = true;
            v117.Font = Enum.Font.GothamSemibold;
            v117.ZIndex = v116.ZIndex + 1;
            v117.Parent = v116;
            local v118 = Instance.new("UITextSizeConstraint");
            v118.MinTextSize = 8;
            v118.MaxTextSize = 20;
            v118.Parent = v117;
            return v116;
        end;
        local v120 = p109:FindFirstChild("Select");
        if v120 then
            v119(v120, "Bots", "Bots", 6, false);
        end;
        local v121 = p109:FindFirstChild("Bots");
        if not v121 then
            local v122 = p109:FindFirstChild("Cases") or (p109:FindFirstChild("Abilities") or p109:FindFirstChild("Skins"));
            v121 = Instance.new("Frame");
            v121.Name = "Bots";
            v121.AnchorPoint = v122 and v122.AnchorPoint or Vector2.new(1, 0.5);
            v121.Position = v122 and v122.Position or UDim2.new(0.788063347, 0, 0.576163054, 0);
            v121.Size = v122 and v122.Size or UDim2.new(0.773510516, 0, 0.815101027, 0);
            v121.BackgroundColor3 = Color3.new(0, 0, 0);
            v121.BackgroundTransparency = 0.5;
            v121.BorderSizePixel = 0;
            v121.ClipsDescendants = true;
            v121.Visible = false;
            v121.Parent = p109;
            Instance.new("UICorner", v121);
        end;
        local v123 = v121:FindFirstChild("Select");
        if not v123 then
            v123 = Instance.new("Frame");
            v123.Name = "Select";
            v123.AnchorPoint = Vector2.new(1, 0.5);
            v123.Position = UDim2.new(0.989524305, 0, 0.0707493052, 0);
            v123.Size = UDim2.new(0.972242475, 0, 0.117126115, 0);
            v123.BackgroundColor3 = Color3.new(0, 0, 0);
            v123.BackgroundTransparency = 0.65;
            v123.BorderSizePixel = 0;
            v123.ClipsDescendants = true;
            v123.Parent = v121;
            Instance.new("UICorner", v123);
            local v124 = Instance.new("UIListLayout");
            v124.FillDirection = Enum.FillDirection.Horizontal;
            v124.Padding = UDim.new(0, 2);
            v124.SortOrder = Enum.SortOrder.LayoutOrder;
            v124.Parent = v123;
        end;
        v119(v123, "Buy", "Buy", 1, true);
        v119(v123, "Owned", "Owned", 2, true);
        for v125, v126 in ipairs({ "Buy", "Owned" }) do
            if not v121:FindFirstChild(v126) then
                local v127 = Instance.new("ScrollingFrame");
                v127.Name = v126;
                v127.AnchorPoint = Vector2.new(1, 0.5);
                v127.Position = UDim2.new(1.00285208, 0, 0.563223243, 0);
                v127.Size = UDim2.new(0.999324322, 0, 0.840980768, 0);
                v127.BackgroundColor3 = Color3.new(0, 0, 0);
                v127.BackgroundTransparency = 0.5;
                v127.BorderSizePixel = 0;
                v127.ScrollBarThickness = 8;
                v127.AutomaticCanvasSize = Enum.AutomaticSize.Y;
                v127.CanvasSize = UDim2.new(0, 0, 0, 0);
                v127.Visible = v126 == "Buy";
                v127.LayoutOrder = v125;
                v127.Parent = v121;
                Instance.new("UICorner", v127);
                local v128 = Instance.new("UIGridLayout");
                v128.CellSize = UDim2.new(0.189999998, 0, 0.449999988, 0);
                v128.CellPadding = UDim2.new(0.00999999978, 0, 0.00999999978, 0);
                v128.SortOrder = Enum.SortOrder.LayoutOrder;
                v128.Parent = v127;
                local v129 = Instance.new("UIPadding");
                v129.PaddingLeft = UDim.new(0, 4);
                v129.PaddingTop = UDim.new(0, 4);
                v129.Parent = v127;
            end;
        end;
    end;
end;
local function u138(u130, u131, u132) --[[ Line: 563 ]]
    -- upvalues: u13 (copy), u8 (copy), u9 (copy)
    if u131 and u132 then
        local u133 = {};
        u13[u130] = function(p134) --[[ Line: 568 ]]
            -- upvalues: u133 (copy), u8 (ref), u9 (ref), u132 (copy), u131 (copy)
            for _, v135 in ipairs(u133) do
                v135.BackgroundColor3 = v135.Name == p134 and u8 or u9;
            end;
            for _, v136 in ipairs(u132:GetChildren()) do
                if (v136:IsA("Frame") or v136:IsA("ScrollingFrame")) and (v136 ~= u131 and (v136.Name ~= "Close" and (v136.Name ~= "title" and v136.Name ~= "GoldValue"))) then
                    v136.Visible = v136.Name == p134;
                end;
            end;
        end;
        for _, u137 in ipairs(u131:GetChildren()) do
            if u137:IsA("TextButton") or u137:IsA("ImageButton") then
                table.insert(u133, u137);
                u137.MouseButton1Click:Connect(function() --[[ Line: 590 ]]
                    -- upvalues: u13 (ref), u130 (copy), u137 (copy)
                    u13[u130](u137.Name);
                end);
            end;
        end;
    end;
end;
local function u189(p139) --[[ Line: 597 ]]
    -- upvalues: l__UserInputService__3 (copy), l__UpdateColorEvent__13 (copy), l__ClientPlayerState__21 (copy), l__Players__1 (copy), l__ToggleRandomColorEvent__14 (copy)
    if p139:FindFirstChild("ColorMenuBlocker") then
        p139.ColorMenuBlocker:Destroy();
    end;
    local u140 = Instance.new("TextButton");
    u140.Name = "ColorMenuBlocker";
    u140.Size = UDim2.new(1, 0, 1, 0);
    u140.BackgroundColor3 = Color3.new(0, 0, 0);
    u140.BackgroundTransparency = 0.6;
    u140.Text = "";
    u140.ZIndex = 100;
    u140.Parent = p139;
    local v141 = Instance.new("Frame");
    v141.Name = "ColorMenu";
    v141.Size = UDim2.new(0.9, 0, 0.8, 0);
    v141.Position = UDim2.new(0.5, 0, 0.5, 0);
    v141.AnchorPoint = Vector2.new(0.5, 0.5);
    v141.BackgroundColor3 = Color3.fromRGB(30, 35, 40);
    v141.ZIndex = 101;
    v141.Parent = u140;
    Instance.new("UISizeConstraint", v141).MaxSize = Vector2.new(360, 500);
    Instance.new("UICorner", v141).CornerRadius = UDim.new(0, 8);
    local v142 = Instance.new("TextLabel");
    v142.Size = UDim2.new(1, 0, 0.08, 0);
    v142.Position = UDim2.new(0, 0, 0, 5);
    v142.BackgroundTransparency = 1;
    v142.Text = "Select Blob Color";
    v142.TextColor3 = Color3.new(1, 1, 1);
    v142.Font = Enum.Font.GothamBold;
    v142.ZIndex = 102;
    v142.Parent = v141;
    v142.TextScaled = true;
    local v143 = Instance.new("UITextSizeConstraint", v142);
    v143.MaxTextSize = 22;
    v143.MinTextSize = 10;
    local v144 = Instance.new("TextButton");
    v144.Size = UDim2.new(0.1, 0, 0.08, 0);
    v144.Position = UDim2.new(1, -5, 0, 5);
    v144.AnchorPoint = Vector2.new(1, 0);
    v144.BackgroundTransparency = 1;
    v144.Text = "X";
    v144.TextColor3 = Color3.fromRGB(255, 100, 100);
    v144.Font = Enum.Font.GothamBold;
    v144.ZIndex = 103;
    v144.Parent = v141;
    v144.TextScaled = true;
    local v145 = Instance.new("UITextSizeConstraint", v144);
    v145.MaxTextSize = 20;
    v145.MinTextSize = 10;
    v144.MouseButton1Click:Connect(function() --[[ Line: 656 ]]
        -- upvalues: u140 (copy)
        u140:Destroy();
    end);
    local u146 = Instance.new("TextButton");
    u146.Size = UDim2.new(0.8, 0, 0.08, 0);
    u146.Position = UDim2.new(0.1, 0, 0.1, 0);
    u146.BackgroundColor3 = Color3.fromRGB(45, 50, 60);
    u146.TextColor3 = Color3.new(1, 1, 1);
    u146.Font = Enum.Font.GothamSemibold;
    u146.ZIndex = 102;
    u146.Parent = v141;
    Instance.new("UICorner", u146).CornerRadius = UDim.new(0, 6);
    u146.TextScaled = true;
    local v147 = Instance.new("UITextSizeConstraint", u146);
    v147.MaxTextSize = 18;
    v147.MinTextSize = 10;
    local v148 = Instance.new("Frame");
    v148.Size = UDim2.new(0.9, 0, 0.55, 0);
    v148.Position = UDim2.new(0.05, 0, 0.22, 0);
    v148.BackgroundTransparency = 1;
    v148.ZIndex = 102;
    v148.Parent = v141;
    local u149 = Instance.new("TextButton");
    u149.Size = UDim2.new(0.8, -10, 1, 0);
    u149.Position = UDim2.new(0, 0, 0, 0);
    u149.AutoButtonColor = false;
    u149.Text = "";
    u149.ZIndex = 102;
    u149.Parent = v148;
    local v150 = Instance.new("Frame", u149);
    v150.Size = UDim2.new(1, 0, 1, 0);
    v150.BackgroundColor3 = Color3.new(1, 1, 1);
    v150.BorderSizePixel = 0;
    v150.ZIndex = 103;
    Instance.new("UIGradient", v150).Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) });
    local v151 = Instance.new("Frame", u149);
    v151.Size = UDim2.new(1, 0, 1, 0);
    v151.BackgroundColor3 = Color3.new(0, 0, 0);
    v151.BorderSizePixel = 0;
    v151.ZIndex = 104;
    local v152 = Instance.new("UIGradient", v151);
    v152.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) });
    v152.Rotation = 90;
    local u153 = Instance.new("Frame", u149);
    u153.Size = UDim2.new(0.05, 0, 0.05, 0);
    u153.AnchorPoint = Vector2.new(0.5, 0.5);
    u153.BackgroundColor3 = Color3.new(1, 1, 1);
    u153.ZIndex = 105;
    Instance.new("UIAspectRatioConstraint", u153).AspectRatio = 1;
    Instance.new("UICorner", u153).CornerRadius = UDim.new(1, 0);
    Instance.new("UIStroke", u153).Color = Color3.new(0, 0, 0);
    local u154 = Instance.new("TextButton");
    u154.Size = UDim2.new(0.2, 0, 1, 0);
    u154.Position = UDim2.new(0.8, 10, 0, 0);
    u154.BackgroundColor3 = Color3.new(1, 1, 1);
    u154.AutoButtonColor = false;
    u154.Text = "";
    u154.ZIndex = 102;
    u154.Parent = v148;
    local v155 = Instance.new("UIGradient", u154);
    v155.Rotation = 90;
    local v156 = {};
    for v157 = 0, 10 do
        table.insert(v156, ColorSequenceKeypoint.new(v157 / 10, Color3.fromHSV(v157 / 10, 1, 1)));
    end;
    v155.Color = ColorSequence.new(v156);
    local u158 = Instance.new("Frame", u154);
    u158.Size = UDim2.new(1, 6, 0.02, 5);
    u158.Position = UDim2.new(0.5, 0, 0, 0);
    u158.AnchorPoint = Vector2.new(0.5, 0.5);
    u158.BackgroundColor3 = Color3.new(1, 1, 1);
    u158.ZIndex = 105;
    u158.Parent = u154;
    local v159 = Instance.new("UIStroke", u158);
    v159.Color = Color3.new(0, 0, 0);
    v159.Thickness = 2;
    local u160 = Instance.new("TextButton");
    u160.Size = UDim2.new(0.9, 0, 0.1, 0);
    u160.Position = UDim2.new(0.05, 0, 0.85, 0);
    u160.Text = "Apply Selected Color";
    u160.Font = Enum.Font.GothamBold;
    u160.ZIndex = 102;
    u160.Parent = v141;
    Instance.new("UICorner", u160).CornerRadius = UDim.new(0, 8);
    u160.TextScaled = true;
    local v161 = Instance.new("UITextSizeConstraint", u160);
    v161.MaxTextSize = 20;
    v161.MinTextSize = 10;
    local u162 = Instance.new("UIStroke", u160);
    u162.Thickness = 2;
    local u163 = Instance.new("Frame");
    u163.Size = UDim2.new(1, 0, 0.75, 0);
    u163.Position = UDim2.new(0, 0, 0.2, 0);
    u163.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
    u163.BackgroundTransparency = 0.3;
    u163.ZIndex = 110;
    u163.Parent = v141;
    local v164 = Instance.new("TextLabel");
    v164.Size = UDim2.new(1, 0, 1, 0);
    v164.BackgroundTransparency = 1;
    v164.Text = "Random Color Enabled\n\n(Uncheck to pick manually)";
    v164.TextColor3 = Color3.new(1, 1, 1);
    v164.Font = Enum.Font.GothamBold;
    v164.ZIndex = 111;
    v164.Parent = u163;
    v164.TextScaled = true;
    local v165 = Instance.new("UITextSizeConstraint", v164);
    v165.MaxTextSize = 20;
    v165.MinTextSize = 10;
    local u166 = 0;
    local u167 = 1;
    local u168 = 1;
    local u169 = false;
    local u170 = false;
    local function u171() --[[ Line: 788 ]]
        -- upvalues: u149 (copy), u166 (ref), u158 (copy), u153 (copy), u167 (ref), u168 (ref), u160 (copy), u162 (copy)
        u149.BackgroundColor3 = Color3.fromHSV(u166, 1, 1);
        u158.Position = UDim2.new(0.5, 0, u166, 0);
        u153.Position = UDim2.new(u167, 0, 1 - u168, 0);
        u160.BackgroundColor3 = Color3.fromHSV(u166, u167, u168);
        if u168 > 0.6 and u167 < 0.6 then
            u160.TextColor3 = Color3.new(0, 0, 0);
            u162.Color = Color3.new(0, 0, 0);
        else
            u160.TextColor3 = Color3.new(1, 1, 1);
            u162.Color = Color3.new(1, 1, 1);
        end;
    end;
    local function u176(p172) --[[ Line: 805 ]]
        -- upvalues: u149 (copy), u167 (ref), u168 (ref), u171 (copy)
        local v173 = math.clamp((p172.X - u149.AbsolutePosition.X) / u149.AbsoluteSize.X, 0, 1);
        local v174 = 1 - math.clamp((p172.Y - u149.AbsolutePosition.Y) / u149.AbsoluteSize.Y, 0, 1);
        local v175 = v174 < 0.2 and 0.2 or v174;
        u167 = v175 > 0.9 and v173 < 0.1 and 0.1 or v173;
        u168 = v175;
        u171();
    end;
    u149.InputBegan:Connect(function(p177) --[[ Line: 832 ]]
        -- upvalues: u169 (ref), u176 (copy)
        if p177.UserInputType == Enum.UserInputType.MouseButton1 or p177.UserInputType == Enum.UserInputType.Touch then
            u169 = true;
            u176(p177.Position);
        end;
    end);
    u154.InputBegan:Connect(function(p178) --[[ Line: 839 ]]
        -- upvalues: u170 (ref), u154 (copy), u166 (ref), u171 (copy)
        if p178.UserInputType == Enum.UserInputType.MouseButton1 or p178.UserInputType == Enum.UserInputType.Touch then
            u170 = true;
            u166 = math.clamp((p178.Position.Y - u154.AbsolutePosition.Y) / u154.AbsoluteSize.Y, 0, 1);
            u171();
        end;
    end);
    local u180 = l__UserInputService__3.InputChanged:Connect(function(p179) --[[ Line: 846 ]]
        -- upvalues: u169 (ref), u176 (copy), u170 (ref), u154 (copy), u166 (ref), u171 (copy)
        if p179.UserInputType == Enum.UserInputType.MouseMovement or p179.UserInputType == Enum.UserInputType.Touch then
            if u169 then
                u176(p179.Position);
            end;
            if u170 then
                u166 = math.clamp((p179.Position.Y - u154.AbsolutePosition.Y) / u154.AbsoluteSize.Y, 0, 1);
                u171();
            end;
        end;
    end);
    local u182 = l__UserInputService__3.InputEnded:Connect(function(p181) --[[ Line: 858 ]]
        -- upvalues: u169 (ref), u170 (ref)
        if p181.UserInputType == Enum.UserInputType.MouseButton1 or p181.UserInputType == Enum.UserInputType.Touch then
            u169 = false;
            u170 = false;
        end;
    end);
    v141.Destroying:Connect(function() --[[ Line: 865 ]]
        -- upvalues: u180 (copy), u182 (copy)
        u180:Disconnect();
        u182:Disconnect();
    end);
    u160.MouseButton1Click:Connect(function() --[[ Line: 870 ]]
        -- upvalues: u166 (ref), u167 (ref), u168 (ref), l__UpdateColorEvent__13 (ref), u140 (copy)
        local v183 = Color3.fromHSV(u166, u167, u168);
        if l__UpdateColorEvent__13 then
            l__UpdateColorEvent__13:FireServer(v183);
        end;
        u140:Destroy();
    end);
    local u184 = l__ClientPlayerState__21.WaitForProxy("Settings", l__Players__1.LocalPlayer, 10);
    if u184 then
        local function v186() --[[ Line: 883 ]]
            -- upvalues: u184 (copy), u146 (copy), u163 (copy)
            local v185 = u184:GetAttribute("RandomBlobColor");
            u146.Text = v185 and "☑ Random Blob Color" or "☐ Random Blob Color";
            u146.BackgroundColor3 = v185 and Color3.fromRGB(60, 160, 100) or Color3.fromRGB(45, 50, 60);
            u163.Visible = v185;
        end;
        v186();
        local u187 = u184:GetAttributeChangedSignal("RandomBlobColor"):Connect(v186);
        v141.Destroying:Connect(function() --[[ Line: 895 ]]
            -- upvalues: u187 (copy)
            u187:Disconnect();
        end);
        u146.MouseButton1Click:Connect(function() --[[ Line: 899 ]]
            -- upvalues: u184 (copy), l__ToggleRandomColorEvent__14 (ref)
            local v188 = not u184:GetAttribute("RandomBlobColor");
            if l__ToggleRandomColorEvent__14 then
                l__ToggleRandomColorEvent__14:FireServer(v188);
            end;
        end);
        u171();
    end;
end;
local function u221(u190, p191, u192) --[[ Line: 910 ]]
    -- upvalues: u20 (copy), l__BuyBotPack__15 (copy), l__BuyItemEvent__9 (copy), u17 (ref)
    local u193 = tonumber(p191.Price);
    local v194;
    if p191 then
        v194 = p191.Type;
    else
        v194 = p191;
    end;
    local v195 = v194 == "Skins" and "Skin" or ((v194 == "Accessory" or (v194 == "Accessories" or (v194 == "Hat" or v194 == "Hats"))) and "Accessory" or (v194 == "Abilities" and "Ability" or (v194 == "Cases" and "Case" or v194)));
    local u196 = v195 == "Case";
    local u197 = v195 == "BotPack";
    if u193 then
        if u192:FindFirstChild("ShopConfirmBlocker") then
            u192.ShopConfirmBlocker:Destroy();
        end;
        local u198 = Instance.new("TextButton", u192);
        u198.Name = "ShopConfirmBlocker";
        u198.Size = UDim2.new(1, 0, 1, 0);
        u198.BackgroundColor3 = Color3.new(0, 0, 0);
        u198.BackgroundTransparency = 0.6;
        u198.AutoButtonColor = false;
        u198.Text = "";
        u198.ZIndex = 100;
        local v199 = (u196 or u197) and 310 or 260;
        local v200 = Instance.new("Frame", u198);
        v200.Size = UDim2.new(0, 420, 0, v199);
        v200.Position = UDim2.new(0.5, -210, 0.5, -v199 / 2);
        v200.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
        v200.ZIndex = 101;
        Instance.new("UICorner", v200).CornerRadius = UDim.new(0, 8);
        local v201 = Instance.new("Frame", v200);
        v201.Size = UDim2.new(0, 60, 0, 60);
        v201.Position = UDim2.new(0.5, -30, 0, 15);
        v201.BackgroundTransparency = 1;
        v201.ZIndex = 101;
        local v202 = Instance.new("UIStroke", v201);
        v202.Color = Color3.fromRGB(255, 200, 100);
        v202.Thickness = 3;
        Instance.new("UICorner", v201).CornerRadius = UDim.new(1, 0);
        local v203 = Instance.new("TextLabel", v201);
        v203.Size = UDim2.new(1, 0, 1, 0);
        v203.BackgroundTransparency = 1;
        v203.Text = "!";
        v203.TextColor3 = Color3.fromRGB(255, 200, 100);
        v203.TextSize = 40;
        v203.Font = Enum.Font.GothamBold;
        v203.ZIndex = 101;
        local v204 = Instance.new("TextLabel", v200);
        v204.Size = UDim2.new(1, 0, 0, 30);
        v204.Position = UDim2.new(0, 0, 0, 85);
        v204.BackgroundTransparency = 1;
        v204.Text = "Confirm";
        v204.TextColor3 = Color3.fromRGB(180, 180, 180);
        v204.TextSize = 22;
        v204.Font = Enum.Font.GothamBold;
        v204.ZIndex = 101;
        local u205 = 1;
        local v206 = (v195 == "Ability" or v195 == "Case") and true or v195 == "BotPack";
        local u207 = Instance.new("TextLabel", v200);
        u207.Size = UDim2.new(0.9, 0, 0, 40);
        u207.Position = UDim2.new(0.05, 0, 0, 115);
        u207.BackgroundTransparency = 1;
        u207.TextColor3 = Color3.fromRGB(150, 150, 150);
        u207.TextSize = 14;
        u207.TextWrapped = true;
        u207.Font = Enum.Font.Gotham;
        u207.ZIndex = 101;
        local function u209() --[[ Line: 985 ]]
            -- upvalues: u193 (copy), u205 (ref), u196 (copy), u207 (copy), u20 (ref), u197 (copy)
            local v208 = u193 * u205;
            if u196 then
                u207.Text = string.format("Buy %s case(s) for %s total, or buy and open one now for %s.", tostring(u205), u20(v208), u20(u193));
            elseif u197 then
                u207.Text = string.format("Buy %s bot pack(s) for %s total.", tostring(u205), u20(v208));
            else
                u207.Text = string.format("If you click \"Buy\", you will purchase this item. It costs %s total.", u20(v208));
            end;
        end;
        u209();
        local u210 = Instance.new("Frame", v200);
        u210.Size = UDim2.new(0, 50, 0, 100);
        u210.Position = UDim2.new(0.5, 75, 0, 180);
        u210.BackgroundColor3 = Color3.fromRGB(40, 200, 80);
        u210.Visible = false;
        u210.ZIndex = 110;
        Instance.new("UICorner", u210).CornerRadius = UDim.new(0, 4);
        Instance.new("UIListLayout", u210).SortOrder = Enum.SortOrder.LayoutOrder;
        if v206 then
            local v211 = Instance.new("Frame", v200);
            v211.Size = UDim2.new(1, 0, 0, 30);
            v211.Position = UDim2.new(0, 0, 0, 155);
            v211.BackgroundTransparency = 1;
            v211.ZIndex = 101;
            local v212 = Instance.new("TextLabel", v211);
            v212.Size = UDim2.new(0, 200, 1, 0);
            v212.Position = UDim2.new(0.5, -130, 0, 0);
            v212.BackgroundTransparency = 1;
            v212.Text = "Choose how many to purchase:";
            v212.TextColor3 = Color3.fromRGB(150, 150, 150);
            v212.TextSize = 14;
            v212.Font = Enum.Font.Gotham;
            v212.TextXAlignment = Enum.TextXAlignment.Right;
            v212.ZIndex = 101;
            local u213 = Instance.new("TextButton", v211);
            u213.Size = UDim2.new(0, 50, 0, 24);
            u213.Position = UDim2.new(0.5, 75, 0.5, -12);
            u213.BackgroundColor3 = Color3.fromRGB(60, 200, 60);
            u213.Text = "1 ∨";
            u213.TextColor3 = Color3.new(0, 0, 0);
            u213.Font = Enum.Font.GothamBold;
            u213.ZIndex = 105;
            Instance.new("UICorner", u213).CornerRadius = UDim.new(0, 4);
            for v214, u215 in ipairs({
                1,
                2,
                5,
                10,
                100
            }) do
                local v216 = Instance.new("TextButton", u210);
                v216.Size = UDim2.new(1, 0, 0, 25);
                v216.BackgroundColor3 = v214 % 2 == 0 and Color3.fromRGB(60, 220, 60) or Color3.fromRGB(40, 200, 80);
                v216.BorderSizePixel = 0;
                v216.Text = tostring(u215);
                v216.TextColor3 = Color3.new(0, 0, 0);
                v216.Font = Enum.Font.GothamBold;
                v216.ZIndex = 111;
                v216.MouseButton1Click:Connect(function() --[[ Line: 1059 ]]
                    -- upvalues: u205 (ref), u215 (copy), u213 (copy), u210 (copy), u209 (copy)
                    u205 = u215;
                    u213.Text = tostring(u215) .. " ∨";
                    u210.Visible = false;
                    u209();
                end);
            end;
            u213.MouseButton1Click:Connect(function() --[[ Line: 1067 ]]
                -- upvalues: u210 (copy)
                u210.Visible = not u210.Visible;
            end);
        end;
        local v217 = (u196 or u197) and 250 or 200;
        local v218 = Instance.new("TextButton", v200);
        v218.Size = u196 and UDim2.new(0, 120, 0, 45) or UDim2.new(0, 180, 0, 45);
        v218.Position = u196 and UDim2.new(0.05, 0, 0, v217) or UDim2.new(0.05, 0, 0, v217);
        v218.BackgroundColor3 = Color3.fromRGB(70, 170, 80);
        v218.Text = u196 and "Buy to\ninventory" or "Yes, confirm\npurchase";
        v218.TextColor3 = Color3.new(1, 1, 1);
        v218.Font = Enum.Font.GothamSemibold;
        v218.TextSize = 14;
        v218.ZIndex = 101;
        v218:SetAttribute("SfxKind", "Buy");
        Instance.new("UICorner", v218).CornerRadius = UDim.new(0, 6);
        local v219;
        if u196 then
            v219 = Instance.new("TextButton", v200);
            v219.Size = UDim2.new(0, 120, 0, 45);
            v219.Position = UDim2.new(0.5, -60, 0, v217);
            v219.BackgroundColor3 = Color3.fromRGB(55, 135, 220);
            v219.Text = "Buy &\nopen";
            v219.TextColor3 = Color3.new(1, 1, 1);
            v219.Font = Enum.Font.GothamSemibold;
            v219.TextSize = 14;
            v219.ZIndex = 101;
            v219:SetAttribute("SfxKind", "Buy");
            Instance.new("UICorner", v219).CornerRadius = UDim.new(0, 6);
        else
            v219 = nil;
        end;
        local v220 = Instance.new("TextButton", v200);
        v220.Size = u196 and UDim2.new(0, 120, 0, 45) or UDim2.new(0, 180, 0, 45);
        v220.Position = u196 and UDim2.new(0.95, -120, 0, v217) or UDim2.new(0.5, 5, 0, v217);
        v220.BackgroundColor3 = Color3.fromRGB(180, 60, 60);
        v220.Text = u196 and "Cancel" or "No, cancel\npurchase";
        v220.TextColor3 = Color3.new(1, 1, 1);
        v220.Font = Enum.Font.GothamSemibold;
        v220.TextSize = 14;
        v220.ZIndex = 101;
        Instance.new("UICorner", v220).CornerRadius = UDim.new(0, 6);
        v218.MouseButton1Click:Connect(function() --[[ Line: 1112 ]]
            -- upvalues: u205 (ref), u197 (copy), l__BuyBotPack__15 (ref), u190 (copy), l__BuyItemEvent__9 (ref), u198 (copy)
            if u205 > 0 then
                if u197 then
                    pcall(function() --[[ Line: 1115 ]]
                        -- upvalues: l__BuyBotPack__15 (ref), u190 (ref), u205 (ref)
                        if l__BuyBotPack__15 then
                            l__BuyBotPack__15:InvokeServer(u190, u205);
                        end;
                    end);
                elseif l__BuyItemEvent__9 then
                    l__BuyItemEvent__9:FireServer(u190, u205);
                end;
            end;
            u198:Destroy();
        end);
        if v219 then
            v219.MouseButton1Click:Connect(function() --[[ Line: 1129 ]]
                -- upvalues: u198 (copy), u17 (ref), u190 (copy), u192 (copy)
                u198:Destroy();
                if u17 then
                    u17(u190, "BuyAndOpen", u192);
                end;
            end);
        end;
        v220.MouseButton1Click:Connect(function() --[[ Line: 1138 ]]
            -- upvalues: u198 (copy)
            u198:Destroy();
        end);
        u198.MouseButton1Click:Connect(function() --[[ Line: 1142 ]]
            -- upvalues: u210 (copy)
            u210.Visible = false;
        end);
    else
        warn("Cannot open purchase prompt. Invalid price:", u190, p191.Price);
    end;
end;
local function u250(p222, p223, p224) --[[ Line: 1147 ]]
    -- upvalues: l__Players__1 (copy), u4 (ref), u20 (copy), u11 (copy)
    local v225 = Instance.new("Frame");
    v225.Name = p222;
    v225.Size = UDim2.new(0, 110, 0, 140);
    v225.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
    v225.BorderSizePixel = 0;
    v225.ClipsDescendants = true;
    Instance.new("UICorner", v225).CornerRadius = UDim.new(0, 8);
    local v226 = Instance.new("UIStroke", v225);
    v226.Name = "EquipStroke";
    v226.Color = Color3.new(0, 0, 0);
    v226.Thickness = 2;
    v226.Enabled = false;
    local u227 = Instance.new("ImageLabel", v225);
    u227.Name = "Image";
    u227.SizeConstraint = Enum.SizeConstraint.RelativeXX;
    u227.Size = UDim2.new(0.62, 0, 0.62, 0);
    u227.Position = UDim2.new(0.5, 0, 0.155, 0);
    u227.AnchorPoint = Vector2.new(0.5, 0);
    u227.BackgroundTransparency = 1;
    u227.ScaleType = Enum.ScaleType.Fit;
    if p222 == "BetaCase" then
        local v228 = Instance.new("TextLabel", v225);
        v228.Name = "OffSaleNotice";
        v228.Size = UDim2.new(0.5, 0, 0, 30);
        v228.Position = UDim2.new(0.46, 0, 0.035, 0);
        v228.BackgroundColor3 = Color3.fromRGB(210, 85, 55);
        v228.BorderSizePixel = 0;
        v228.Text = "OFF-SALE\nNEXT UPDATE";
        v228.TextColor3 = Color3.new(1, 1, 1);
        v228.TextScaled = true;
        v228.TextWrapped = true;
        v228.Font = Enum.Font.GothamBlack;
        v228.ZIndex = 4;
        Instance.new("UICorner", v228).CornerRadius = UDim.new(0, 5);
        local v229 = Instance.new("UITextSizeConstraint", v228);
        v229.MaxTextSize = 9;
        v229.MinTextSize = 5;
    end;
    if p223.TypeSkin == "Async" and p223.Fetch then
        p223.Fetch(l__Players__1.LocalPlayer.UserId, function(p230) --[[ Line: 1192 ]]
            -- upvalues: u227 (copy)
            if u227 then
                u227.Image = p230;
            end;
        end);
    elseif p223.ImageId then
        u227.Image = p223.ImageId;
    end;
    local v231 = Instance.new("TextLabel", v225);
    v231.Name = "Label";
    v231.Size = UDim2.new(0.92, 0, 0.085, 0);
    v231.Position = UDim2.new(0.04, 0, 0.72, 0);
    v231.BackgroundTransparency = 1;
    v231.Text = p223.Name;
    v231.TextColor3 = Color3.new(1, 1, 1);
    v231.TextScaled = true;
    v231.TextWrapped = true;
    v231.TextTruncate = Enum.TextTruncate.AtEnd;
    v231.Font = Enum.Font.Gotham;
    v231.ZIndex = 2;
    local v232 = Instance.new("UITextSizeConstraint", v231);
    v232.MaxTextSize = 13;
    v232.MinTextSize = 7;
    if p223.TotalStats == true then
        local v233 = Instance.new("TextLabel", v225);
        v233.Name = "ItemValue";
        v233.Size = UDim2.new(0.66, 0, 0.088, 0);
        v233.Position = UDim2.new(0.17, 0, 0.635, 0);
        v233.BackgroundColor3 = Color3.fromRGB(28, 28, 28);
        v233.BackgroundTransparency = 0.16;
        v233.BorderSizePixel = 0;
        local v234;
        if u4 then
            local v235 = u4.GetItemValue(p222);
            v234 = not v235 and "N/A" or u20((math.floor(v235 + 0.5)));
        else
            v234 = "N/A";
        end;
        v233.Text = v234;
        v233.TextColor3 = u11;
        v233.TextScaled = true;
        v233.Font = Enum.Font.GothamBold;
        v233.ZIndex = 4;
        Instance.new("UICorner", v233).CornerRadius = UDim.new(0, 5);
        local v236 = Instance.new("UITextSizeConstraint", v233);
        v236.MaxTextSize = 12;
        v236.MinTextSize = 7;
    end;
    local v237 = Instance.new("Frame", v225);
    v237.Name = "BottomRow";
    v237.Size = UDim2.new(0.96, 0, 0.17, 0);
    v237.Position = UDim2.new(0.02, 0, 0.81, 0);
    v237.BackgroundTransparency = 1;
    v237.ZIndex = 2;
    local v238 = Instance.new("UIListLayout", v237);
    v238.FillDirection = Enum.FillDirection.Horizontal;
    v238.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v238.VerticalAlignment = Enum.VerticalAlignment.Center;
    v238.Padding = UDim.new(0, 4);
    v238.SortOrder = Enum.SortOrder.LayoutOrder;
    local v239 = Instance.new("TextButton", v225);
    v239.Name = "TryBtn";
    v239.LayoutOrder = 1;
    v239.Size = UDim2.new(0.38, 0, 0.135, 0);
    v239.Position = UDim2.new(0.055, 0, 0.035, 0);
    v239.BackgroundColor3 = Color3.fromRGB(50, 150, 255);
    v239.Text = "";
    v239.TextColor3 = Color3.new(1, 1, 1);
    v239.Font = Enum.Font.GothamSemibold;
    v239.TextScaled = true;
    v239.ClipsDescendants = true;
    v239.ZIndex = 3;
    Instance.new("UICorner", v239).CornerRadius = UDim.new(0, 6);
    local v240 = Instance.new("UITextSizeConstraint", v239);
    v240.MaxTextSize = 11;
    v240.MinTextSize = 7;
    local v241 = Instance.new("TextButton", v237);
    v241.Name = "Button";
    v241.LayoutOrder = 2;
    v241.Size = UDim2.new(1, 0, 1, 0);
    v241.Text = "";
    v241.AutoButtonColor = true;
    v241.ClipsDescendants = true;
    v241.ZIndex = 2;
    Instance.new("UICorner", v241).CornerRadius = UDim.new(0, 6);
    local v242 = Instance.new("UIPadding", v241);
    v242.PaddingRight = UDim.new(0, 5);
    v242.PaddingLeft = UDim.new(0, 5);
    local v243 = Instance.new("UIListLayout", v241);
    v243.FillDirection = Enum.FillDirection.Horizontal;
    v243.HorizontalAlignment = Enum.HorizontalAlignment.Right;
    v243.VerticalAlignment = Enum.VerticalAlignment.Center;
    v243.Padding = UDim.new(0, 1);
    v243.SortOrder = Enum.SortOrder.LayoutOrder;
    local v244 = Instance.new("TextLabel", v241);
    v244.Name = "Amount";
    v244.BackgroundTransparency = 1;
    v244.Size = UDim2.new(1, -26, 0.86, 0);
    v244.AutomaticSize = Enum.AutomaticSize.None;
    v244.TextScaled = true;
    v244.TextXAlignment = Enum.TextXAlignment.Right;
    v244.TextStrokeTransparency = 1;
    v244.LayoutOrder = 1;
    v244.ZIndex = v241.ZIndex + 1;
    local v245 = Instance.new("UIStroke", v244);
    v245.Name = "TextStroke";
    v245.Color = Color3.new(0, 0, 0);
    v245.Thickness = 1;
    v245.Transparency = 1;
    v245.Enabled = false;
    local v246 = Instance.new("UITextSizeConstraint", v244);
    v246.MaxTextSize = 18;
    v246.MinTextSize = 8;
    local v247 = Instance.new("ImageLabel", v241);
    v247.Name = "Icon";
    v247.BackgroundTransparency = 1;
    v247.Size = UDim2.new(1, 0, 0.8, 0);
    v247.Image = "rbxassetid://11713337390";
    v247.ImageColor3 = Color3.new(0, 0, 0);
    v247.LayoutOrder = 2;
    v247.ZIndex = v241.ZIndex + 1;
    local v248 = Instance.new("UIAspectRatioConstraint", v247);
    v248.AspectRatio = 1;
    v248.AspectType = Enum.AspectType.FitWithinMaxSize;
    v248.DominantAxis = Enum.DominantAxis.Height;
    v225.Parent = p224;
    local v249 = p224:FindFirstChildOfClass("UIGridLayout") or p224:FindFirstChildOfClass("UIListLayout");
    if v249 then
        v249.SortOrder = Enum.SortOrder.LayoutOrder;
    end;
    return v225;
end;
local function u294(p251, p252, p253) --[[ Line: 1337 ]]
    -- upvalues: l__Players__1 (copy), l__ClientPlayerState__21 (copy), l__GameDatabase__19 (copy), u32 (copy), u20 (copy), u4 (ref), u11 (copy), u6 (ref), u12 (copy), u10 (copy)
    local l__LocalPlayer__23 = l__Players__1.LocalPlayer;
    local v254 = l__ClientPlayerState__21.WaitForProxy("Inventory", l__Players__1.LocalPlayer, 10);
    local v255 = l__ClientPlayerState__21.WaitForProxy("Equipped.Skins", l__Players__1.LocalPlayer, 10);
    local v256 = l__ClientPlayerState__21.WaitForProxy("Equipped.Hats", l__Players__1.LocalPlayer, 10);
    local v257 = l__ClientPlayerState__21.GetProxy("Equipped.Abilities", l__Players__1.LocalPlayer);
    local v258;
    if p253 then
        v258 = p253.Type;
    else
        v258 = p253;
    end;
    local v259 = v258 == "Skins" and "Skin" or ((v258 == "Accessory" or (v258 == "Accessories" or (v258 == "Hat" or v258 == "Hats"))) and "Accessory" or (v258 == "Abilities" and "Ability" or (v258 == "Cases" and "Case" or v258)));
    if not v254 then
        p251.Visible = false;
        return;
    end;
    local v260 = false;
    local v261;
    if v259 == "Skin" then
        local l__TypeLimits__24 = l__GameDatabase__19.TypeLimits;
        if l__TypeLimits__24 then
            v261 = l__TypeLimits__24.Skin or 5;
        else
            v261 = 5;
        end;
    else
        v255 = nil;
        v261 = 5;
    end;
    if v259 == "Accessory" then
        local l__TypeLimits__25 = l__GameDatabase__19.TypeLimits;
        if l__TypeLimits__25 then
            v261 = l__TypeLimits__25.Accessory or 5;
        else
            v261 = 5;
        end;
    else
        v256 = v255;
    end;
    if v259 == "Ability" then
        local l__TypeLimits__26 = l__GameDatabase__19.TypeLimits;
        if l__TypeLimits__26 then
            v261 = l__TypeLimits__26.Ability or 10;
        else
            v261 = 10;
        end;
    else
        v257 = v256;
    end;
    if v257 then
        for v262 = 1, v261 do
            if v257:GetAttribute("Slot" .. v262) == p252 then
                v260 = true;
                break;
            end;
        end;
    end;
    local v263 = v254:FindFirstChild(p252);
    local v264;
    if v263 then
        local v265 = v263:GetAttribute("Amount");
        v264 = v265 == nil and 1 or (tonumber(v265) or 0);
    else
        v264 = 0;
    end;
    local v266 = v264 > 0;
    local v267;
    if p253 then
        v267 = p253.SubscriptionBound;
    else
        v267 = p253;
    end;
    local v268;
    if type(v267) == "string" and v267 ~= "" then
        local v269 = l__ClientPlayerState__21.GetProxy("Gamepasses", l__Players__1.LocalPlayer);
        if v269 == nil then
            v268 = false;
        else
            v268 = v269:GetAttribute(v267) == true;
        end;
    else
        v268 = false;
    end;
    local v270;
    if p253.Price == "Owned" then
        v270 = not v266;
        if v270 then
            v270 = not v268;
        end;
    else
        v270 = false;
    end;
    if v266 then
        v268 = v266;
    elseif not v268 then
        if p253.Price == "Free" then
            v268 = true;
        elseif p253.Price == "Lvl" then
            v268 = (tonumber(p253.Lvl) or 0) <= u32(l__LocalPlayer__23);
        else
            v268 = false;
        end;
    end;
    local v271 = p251:FindFirstChild("OwnedAmount");
    if not v271 then
        v271 = Instance.new("TextLabel", p251);
        v271.Name = "OwnedAmount";
        v271.Size = UDim2.new(0, 46, 0, 18);
        v271.Position = UDim2.new(1, -51, 0, 5);
        v271.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
        v271.TextColor3 = Color3.new(1, 1, 1);
        v271.TextScaled = true;
        v271.Font = Enum.Font.GothamBold;
        v271.ZIndex = 3;
        Instance.new("UICorner", v271).CornerRadius = UDim.new(0, 4);
        local v272 = Instance.new("UITextSizeConstraint", v271);
        v272.MaxTextSize = 11;
        v272.MinTextSize = 7;
    end;
    v271.Visible = v264 > 1;
    v271.Text = "x" .. u20(v264);
    if v259 == "Ability" then
        if p251.Parent and p251.Parent.Name == "Buy" then
            p251.Visible = true;
            v268 = false;
        elseif p251.Parent and p251.Parent.Name == "Owned" then
            local v273 = v254:FindFirstChild(p252);
            if (v273 and tonumber(v273:GetAttribute("Amount")) or 0) <= 0 then
                p251.Visible = false;
                return;
            end;
            p251.Visible = true;
            v268 = true;
        end;
    elseif v259 == "Case" then
        if p251.Parent and p251.Parent.Name == "Owned" then
            if v264 > 0 then
                p251.Visible = true;
                v268 = true;
            else
                if p253.Price ~= "Owned" then
                    p251.Visible = false;
                    return;
                end;
                p251.Visible = true;
                v268 = false;
            end;
        else
            p251.Visible = true;
            v268 = false;
        end;
    else
        if p251.Parent and (p251.Parent.Name == "Owned" and (not v268 and p253.Price ~= "Owned")) then
            p251.Visible = false;
            return;
        end;
        p251.Visible = true;
    end;
    local v274 = p251:FindFirstChild("BottomRow");
    if not v274 then
        return;
    end;
    local v275 = v274:FindFirstChild("Button");
    local v276 = p251:FindFirstChild("TryBtn") or v274:FindFirstChild("TryBtn");
    local v277 = p251:FindFirstChild("EquipStroke");
    if not (v275 and v276) then
        return;
    end;
    local v278 = v275:FindFirstChild("Amount");
    local v279 = v275:FindFirstChild("Icon");
    local v280 = v275:FindFirstChildOfClass("UIListLayout");
    local v281 = v275:FindFirstChildOfClass("UIPadding");
    local v282;
    if v278 then
        v282 = v278:FindFirstChild("TextStroke");
    else
        v282 = v278;
    end;
    local v283 = p251:FindFirstChild("ItemValue");
    if v283 and v283:IsA("TextLabel") then
        local v284;
        if u4 then
            local v285 = u4.GetItemValue(p252);
            v284 = not v285 and "N/A" or u20((math.floor(v285 + 0.5)));
        else
            v284 = "N/A";
        end;
        v283.Text = v284;
        v283.TextColor3 = u11;
    end;
    local v286, v287, v288, v289;
    if v259 == "Case" then
        v276.Visible = true;
        v276.Text = "View";
        v276.BackgroundColor3 = Color3.fromRGB(50, 150, 255);
    else
        if not v268 then
            if v259 ~= "Skin" and v259 ~= "Accessory" then
                v276.Visible = false;
                v276.Size = UDim2.new(0.38, 0, 0.135, 0);
                v276.Position = UDim2.new(0.055, 0, 0.035, 0);
                v275.Size = UDim2.new(1, 0, 1, 0);
                if v259 == "Case" and (p251.Parent and (p251.Parent.Name == "Owned" or p253.Price == "Owned")) then
                    v286 = v264 > 0;
                    p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                    v275.BackgroundColor3 = v286 and Color3.fromRGB(55, 135, 220) or Color3.fromRGB(92, 92, 92);
                    v275.AutoButtonColor = v286;
                    v275.Active = v286;
                    if v277 then
                        v277.Enabled = false;
                    end;
                    if v279 then
                        v279.Visible = false;
                    end;
                    if v280 then
                        v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                    end;
                    if v281 then
                        v281.PaddingRight = UDim.new(0, 0);
                        v281.PaddingLeft = UDim.new(0, 0);
                    end;
                    if v278 then
                        v278.Size = UDim2.new(1, 0, 0.8, 0);
                        v278.AutomaticSize = Enum.AutomaticSize.None;
                        v278.FontFace = u12;
                        v278.TextXAlignment = Enum.TextXAlignment.Center;
                        v278.Text = v286 and (v264 > 1 and "OPEN x" .. tostring(v264) or "OPEN") or "TRADE ONLY";
                        v278.TextColor3 = Color3.new(1, 1, 1);
                        if v282 then
                            v282.Enabled = false;
                            return;
                        end;
                    end;
                elseif v270 then
                    p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                    v275.BackgroundColor3 = Color3.fromRGB(92, 92, 92);
                    v275.AutoButtonColor = false;
                    v275.Active = false;
                    if v277 then
                        v277.Enabled = false;
                    end;
                    if v279 then
                        v279.Visible = false;
                    end;
                    if v280 then
                        v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                    end;
                    if v281 then
                        v281.PaddingRight = UDim.new(0, 0);
                        v281.PaddingLeft = UDim.new(0, 0);
                    end;
                    if v278 then
                        v278.Size = UDim2.new(1, 0, 0.8, 0);
                        v278.AutomaticSize = Enum.AutomaticSize.None;
                        v278.FontFace = u12;
                        v278.TextXAlignment = Enum.TextXAlignment.Center;
                        v278.Text = "TRADE ONLY";
                        v278.TextColor3 = Color3.fromRGB(230, 230, 230);
                        if v282 then
                            v282.Enabled = false;
                            return;
                        end;
                    end;
                elseif v268 and (v259 == "Skin" or (v259 == "Accessory" or v259 == "Ability")) then
                    v275.AutoButtonColor = true;
                    v275.Active = true;
                    v275.BackgroundColor3 = Color3.fromRGB(70, 160, 255);
                    if v279 then
                        v279.Visible = false;
                    end;
                    if v280 then
                        v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                    end;
                    if v281 then
                        v281.PaddingRight = UDim.new(0, 0);
                        v281.PaddingLeft = UDim.new(0, 0);
                    end;
                    if v278 then
                        v278.Size = UDim2.new(1, 0, 0.8, 0);
                        v278.AutomaticSize = Enum.AutomaticSize.None;
                        v278.FontFace = u12;
                        v278.TextXAlignment = Enum.TextXAlignment.Center;
                        if v282 then
                            v282.Enabled = false;
                        end;
                        if v260 then
                            v278.Text = "UNEQUIP";
                            p251.BackgroundColor3 = Color3.fromRGB(60, 160, 255);
                            if v277 then
                                v277.Enabled = true;
                            end;
                            v275.BackgroundColor3 = Color3.fromRGB(220, 220, 220);
                            v278.TextColor3 = Color3.new(0, 0, 0);
                            return;
                        else
                            v278.Text = "EQUIP";
                            p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                            if v277 then
                                v277.Enabled = false;
                            end;
                            v275.BackgroundColor3 = Color3.fromRGB(40, 120, 200);
                            v278.TextColor3 = Color3.new(1, 1, 1);
                            return;
                        end;
                    end;
                else
                    v275.AutoButtonColor = true;
                    v275.Active = true;
                    p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                    if v277 then
                        v277.Enabled = false;
                    end;
                    v275.BackgroundColor3 = Color3.fromRGB(180, 140, 40);
                    if v279 then
                        v279.Visible = p253.Price ~= "Lvl";
                    end;
                    if v280 then
                        v280.HorizontalAlignment = p253.Price == "Lvl" and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Right;
                    end;
                    if v281 then
                        v281.PaddingRight = UDim.new(0, 5);
                        v281.PaddingLeft = UDim.new(0, 5);
                    end;
                    if v278 then
                        v278.Size = p253.Price == "Lvl" and UDim2.new(1, 0, 0.86, 0) or UDim2.new(1, -26, 0.86, 0);
                        v278.AutomaticSize = Enum.AutomaticSize.None;
                        v278.FontFace = u12;
                        v278.TextXAlignment = p253.Price == "Lvl" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Right;
                        if p253.Price == "Lvl" then
                            v278.Text = "LVL " .. tostring(p253.Lvl or "?");
                        else
                            v287 = p253.Price;
                            v288 = tonumber(v287);
                            if v288 then
                                v289 = u20(v288);
                            else
                                v289 = tostring(v287 or "");
                            end;
                            v278.Text = v289;
                        end;
                        v278.TextColor3 = u10;
                        v278.TextStrokeTransparency = 1;
                        if v282 then
                            v282.Enabled = false;
                        end;
                    end;
                end;
            end;
            v276.Visible = true;
            local v290 = ipairs;
            local v291 = u6[v259];
            if not v291 then
                v291 = {};
                u6[v259] = v291;
            end;
            local v292;
            for _, v293 in v290(v291) do
                if v293 == p252 then
                    v292 = true;
                    if v292 then
                        v276.Text = "Cancel";
                        v276.BackgroundColor3 = Color3.fromRGB(220, 60, 60);
                    else
                        v276.Text = "Try";
                        v276.BackgroundColor3 = Color3.fromRGB(50, 150, 255);
                    end;
                    v276.Size = UDim2.new(0.38, 0, 0.135, 0);
                    v276.Position = UDim2.new(0.055, 0, 0.035, 0);
                    v275.Size = UDim2.new(1, 0, 1, 0);
                    if v259 == "Case" and (p251.Parent and (p251.Parent.Name == "Owned" or p253.Price == "Owned")) then
                        v286 = v264 > 0;
                        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                        v275.BackgroundColor3 = v286 and Color3.fromRGB(55, 135, 220) or Color3.fromRGB(92, 92, 92);
                        v275.AutoButtonColor = v286;
                        v275.Active = v286;
                        if v277 then
                            v277.Enabled = false;
                        end;
                        if v279 then
                            v279.Visible = false;
                        end;
                        if v280 then
                            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                        end;
                        if v281 then
                            v281.PaddingRight = UDim.new(0, 0);
                            v281.PaddingLeft = UDim.new(0, 0);
                        end;
                        if v278 then
                            v278.Size = UDim2.new(1, 0, 0.8, 0);
                            v278.AutomaticSize = Enum.AutomaticSize.None;
                            v278.FontFace = u12;
                            v278.TextXAlignment = Enum.TextXAlignment.Center;
                            v278.Text = v286 and (v264 > 1 and "OPEN x" .. tostring(v264) or "OPEN") or "TRADE ONLY";
                            v278.TextColor3 = Color3.new(1, 1, 1);
                            if v282 then
                                v282.Enabled = false;
                                return;
                            end;
                        end;
                    elseif v270 then
                        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                        v275.BackgroundColor3 = Color3.fromRGB(92, 92, 92);
                        v275.AutoButtonColor = false;
                        v275.Active = false;
                        if v277 then
                            v277.Enabled = false;
                        end;
                        if v279 then
                            v279.Visible = false;
                        end;
                        if v280 then
                            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                        end;
                        if v281 then
                            v281.PaddingRight = UDim.new(0, 0);
                            v281.PaddingLeft = UDim.new(0, 0);
                        end;
                        if v278 then
                            v278.Size = UDim2.new(1, 0, 0.8, 0);
                            v278.AutomaticSize = Enum.AutomaticSize.None;
                            v278.FontFace = u12;
                            v278.TextXAlignment = Enum.TextXAlignment.Center;
                            v278.Text = "TRADE ONLY";
                            v278.TextColor3 = Color3.fromRGB(230, 230, 230);
                            if v282 then
                                v282.Enabled = false;
                                return;
                            end;
                        end;
                    elseif v268 and (v259 == "Skin" or (v259 == "Accessory" or v259 == "Ability")) then
                        v275.AutoButtonColor = true;
                        v275.Active = true;
                        v275.BackgroundColor3 = Color3.fromRGB(70, 160, 255);
                        if v279 then
                            v279.Visible = false;
                        end;
                        if v280 then
                            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                        end;
                        if v281 then
                            v281.PaddingRight = UDim.new(0, 0);
                            v281.PaddingLeft = UDim.new(0, 0);
                        end;
                        if v278 then
                            v278.Size = UDim2.new(1, 0, 0.8, 0);
                            v278.AutomaticSize = Enum.AutomaticSize.None;
                            v278.FontFace = u12;
                            v278.TextXAlignment = Enum.TextXAlignment.Center;
                            if v282 then
                                v282.Enabled = false;
                            end;
                            if v260 then
                                v278.Text = "UNEQUIP";
                                p251.BackgroundColor3 = Color3.fromRGB(60, 160, 255);
                                if v277 then
                                    v277.Enabled = true;
                                end;
                                v275.BackgroundColor3 = Color3.fromRGB(220, 220, 220);
                                v278.TextColor3 = Color3.new(0, 0, 0);
                                return;
                            else
                                v278.Text = "EQUIP";
                                p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                                if v277 then
                                    v277.Enabled = false;
                                end;
                                v275.BackgroundColor3 = Color3.fromRGB(40, 120, 200);
                                v278.TextColor3 = Color3.new(1, 1, 1);
                                return;
                            end;
                        end;
                    else
                        v275.AutoButtonColor = true;
                        v275.Active = true;
                        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                        if v277 then
                            v277.Enabled = false;
                        end;
                        v275.BackgroundColor3 = Color3.fromRGB(180, 140, 40);
                        if v279 then
                            v279.Visible = p253.Price ~= "Lvl";
                        end;
                        if v280 then
                            v280.HorizontalAlignment = p253.Price == "Lvl" and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Right;
                        end;
                        if v281 then
                            v281.PaddingRight = UDim.new(0, 5);
                            v281.PaddingLeft = UDim.new(0, 5);
                        end;
                        if v278 then
                            v278.Size = p253.Price == "Lvl" and UDim2.new(1, 0, 0.86, 0) or UDim2.new(1, -26, 0.86, 0);
                            v278.AutomaticSize = Enum.AutomaticSize.None;
                            v278.FontFace = u12;
                            v278.TextXAlignment = p253.Price == "Lvl" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Right;
                            if p253.Price == "Lvl" then
                                v278.Text = "LVL " .. tostring(p253.Lvl or "?");
                            else
                                v287 = p253.Price;
                                v288 = tonumber(v287);
                                if v288 then
                                    v289 = u20(v288);
                                else
                                    v289 = tostring(v287 or "");
                                end;
                                v278.Text = v289;
                            end;
                            v278.TextColor3 = u10;
                            v278.TextStrokeTransparency = 1;
                            if v282 then
                                v282.Enabled = false;
                            end;
                        end;
                    end;
                end;
            end;
            v292 = false;
            if v292 then
                v276.Text = "Cancel";
                v276.BackgroundColor3 = Color3.fromRGB(220, 60, 60);
            else
                v276.Text = "Try";
                v276.BackgroundColor3 = Color3.fromRGB(50, 150, 255);
            end;
            v276.Size = UDim2.new(0.38, 0, 0.135, 0);
            v276.Position = UDim2.new(0.055, 0, 0.035, 0);
            v275.Size = UDim2.new(1, 0, 1, 0);
            if v259 == "Case" and (p251.Parent and (p251.Parent.Name == "Owned" or p253.Price == "Owned")) then
                v286 = v264 > 0;
                p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                v275.BackgroundColor3 = v286 and Color3.fromRGB(55, 135, 220) or Color3.fromRGB(92, 92, 92);
                v275.AutoButtonColor = v286;
                v275.Active = v286;
                if v277 then
                    v277.Enabled = false;
                end;
                if v279 then
                    v279.Visible = false;
                end;
                if v280 then
                    v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                end;
                if v281 then
                    v281.PaddingRight = UDim.new(0, 0);
                    v281.PaddingLeft = UDim.new(0, 0);
                end;
                if v278 then
                    v278.Size = UDim2.new(1, 0, 0.8, 0);
                    v278.AutomaticSize = Enum.AutomaticSize.None;
                    v278.FontFace = u12;
                    v278.TextXAlignment = Enum.TextXAlignment.Center;
                    v278.Text = v286 and (v264 > 1 and "OPEN x" .. tostring(v264) or "OPEN") or "TRADE ONLY";
                    v278.TextColor3 = Color3.new(1, 1, 1);
                    if v282 then
                        v282.Enabled = false;
                        return;
                    end;
                end;
            elseif v270 then
                p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                v275.BackgroundColor3 = Color3.fromRGB(92, 92, 92);
                v275.AutoButtonColor = false;
                v275.Active = false;
                if v277 then
                    v277.Enabled = false;
                end;
                if v279 then
                    v279.Visible = false;
                end;
                if v280 then
                    v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                end;
                if v281 then
                    v281.PaddingRight = UDim.new(0, 0);
                    v281.PaddingLeft = UDim.new(0, 0);
                end;
                if v278 then
                    v278.Size = UDim2.new(1, 0, 0.8, 0);
                    v278.AutomaticSize = Enum.AutomaticSize.None;
                    v278.FontFace = u12;
                    v278.TextXAlignment = Enum.TextXAlignment.Center;
                    v278.Text = "TRADE ONLY";
                    v278.TextColor3 = Color3.fromRGB(230, 230, 230);
                    if v282 then
                        v282.Enabled = false;
                        return;
                    end;
                end;
            elseif v268 and (v259 == "Skin" or (v259 == "Accessory" or v259 == "Ability")) then
                v275.AutoButtonColor = true;
                v275.Active = true;
                v275.BackgroundColor3 = Color3.fromRGB(70, 160, 255);
                if v279 then
                    v279.Visible = false;
                end;
                if v280 then
                    v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
                end;
                if v281 then
                    v281.PaddingRight = UDim.new(0, 0);
                    v281.PaddingLeft = UDim.new(0, 0);
                end;
                if v278 then
                    v278.Size = UDim2.new(1, 0, 0.8, 0);
                    v278.AutomaticSize = Enum.AutomaticSize.None;
                    v278.FontFace = u12;
                    v278.TextXAlignment = Enum.TextXAlignment.Center;
                    if v282 then
                        v282.Enabled = false;
                    end;
                    if v260 then
                        v278.Text = "UNEQUIP";
                        p251.BackgroundColor3 = Color3.fromRGB(60, 160, 255);
                        if v277 then
                            v277.Enabled = true;
                        end;
                        v275.BackgroundColor3 = Color3.fromRGB(220, 220, 220);
                        v278.TextColor3 = Color3.new(0, 0, 0);
                        return;
                    else
                        v278.Text = "EQUIP";
                        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                        if v277 then
                            v277.Enabled = false;
                        end;
                        v275.BackgroundColor3 = Color3.fromRGB(40, 120, 200);
                        v278.TextColor3 = Color3.new(1, 1, 1);
                        return;
                    end;
                end;
            else
                v275.AutoButtonColor = true;
                v275.Active = true;
                p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                if v277 then
                    v277.Enabled = false;
                end;
                v275.BackgroundColor3 = Color3.fromRGB(180, 140, 40);
                if v279 then
                    v279.Visible = p253.Price ~= "Lvl";
                end;
                if v280 then
                    v280.HorizontalAlignment = p253.Price == "Lvl" and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Right;
                end;
                if v281 then
                    v281.PaddingRight = UDim.new(0, 5);
                    v281.PaddingLeft = UDim.new(0, 5);
                end;
                if v278 then
                    v278.Size = p253.Price == "Lvl" and UDim2.new(1, 0, 0.86, 0) or UDim2.new(1, -26, 0.86, 0);
                    v278.AutomaticSize = Enum.AutomaticSize.None;
                    v278.FontFace = u12;
                    v278.TextXAlignment = p253.Price == "Lvl" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Right;
                    if p253.Price == "Lvl" then
                        v278.Text = "LVL " .. tostring(p253.Lvl or "?");
                    else
                        v287 = p253.Price;
                        v288 = tonumber(v287);
                        if v288 then
                            v289 = u20(v288);
                        else
                            v289 = tostring(v287 or "");
                        end;
                        v278.Text = v289;
                    end;
                    v278.TextColor3 = u10;
                    v278.TextStrokeTransparency = 1;
                    if v282 then
                        v282.Enabled = false;
                    end;
                end;
            end;
        end;
        v276.Visible = false;
    end;
    v276.Size = UDim2.new(0.38, 0, 0.135, 0);
    v276.Position = UDim2.new(0.055, 0, 0.035, 0);
    v275.Size = UDim2.new(1, 0, 1, 0);
    if v259 == "Case" and (p251.Parent and (p251.Parent.Name == "Owned" or p253.Price == "Owned")) then
        v286 = v264 > 0;
        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
        v275.BackgroundColor3 = v286 and Color3.fromRGB(55, 135, 220) or Color3.fromRGB(92, 92, 92);
        v275.AutoButtonColor = v286;
        v275.Active = v286;
        if v277 then
            v277.Enabled = false;
        end;
        if v279 then
            v279.Visible = false;
        end;
        if v280 then
            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        end;
        if v281 then
            v281.PaddingRight = UDim.new(0, 0);
            v281.PaddingLeft = UDim.new(0, 0);
        end;
        if v278 then
            v278.Size = UDim2.new(1, 0, 0.8, 0);
            v278.AutomaticSize = Enum.AutomaticSize.None;
            v278.FontFace = u12;
            v278.TextXAlignment = Enum.TextXAlignment.Center;
            v278.Text = v286 and (v264 > 1 and "OPEN x" .. tostring(v264) or "OPEN") or "TRADE ONLY";
            v278.TextColor3 = Color3.new(1, 1, 1);
            if v282 then
                v282.Enabled = false;
            end;
        end;
    elseif v270 then
        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
        v275.BackgroundColor3 = Color3.fromRGB(92, 92, 92);
        v275.AutoButtonColor = false;
        v275.Active = false;
        if v277 then
            v277.Enabled = false;
        end;
        if v279 then
            v279.Visible = false;
        end;
        if v280 then
            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        end;
        if v281 then
            v281.PaddingRight = UDim.new(0, 0);
            v281.PaddingLeft = UDim.new(0, 0);
        end;
        if v278 then
            v278.Size = UDim2.new(1, 0, 0.8, 0);
            v278.AutomaticSize = Enum.AutomaticSize.None;
            v278.FontFace = u12;
            v278.TextXAlignment = Enum.TextXAlignment.Center;
            v278.Text = "TRADE ONLY";
            v278.TextColor3 = Color3.fromRGB(230, 230, 230);
            if v282 then
                v282.Enabled = false;
            end;
        end;
    elseif v268 and (v259 == "Skin" or (v259 == "Accessory" or v259 == "Ability")) then
        v275.AutoButtonColor = true;
        v275.Active = true;
        v275.BackgroundColor3 = Color3.fromRGB(70, 160, 255);
        if v279 then
            v279.Visible = false;
        end;
        if v280 then
            v280.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        end;
        if v281 then
            v281.PaddingRight = UDim.new(0, 0);
            v281.PaddingLeft = UDim.new(0, 0);
        end;
        if v278 then
            v278.Size = UDim2.new(1, 0, 0.8, 0);
            v278.AutomaticSize = Enum.AutomaticSize.None;
            v278.FontFace = u12;
            v278.TextXAlignment = Enum.TextXAlignment.Center;
            if v282 then
                v282.Enabled = false;
            end;
            if v260 then
                v278.Text = "UNEQUIP";
                p251.BackgroundColor3 = Color3.fromRGB(60, 160, 255);
                if v277 then
                    v277.Enabled = true;
                end;
                v275.BackgroundColor3 = Color3.fromRGB(220, 220, 220);
                v278.TextColor3 = Color3.new(0, 0, 0);
            else
                v278.Text = "EQUIP";
                p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
                if v277 then
                    v277.Enabled = false;
                end;
                v275.BackgroundColor3 = Color3.fromRGB(40, 120, 200);
                v278.TextColor3 = Color3.new(1, 1, 1);
            end;
        end;
    else
        v275.AutoButtonColor = true;
        v275.Active = true;
        p251.BackgroundColor3 = Color3.fromRGB(80, 80, 80);
        if v277 then
            v277.Enabled = false;
        end;
        v275.BackgroundColor3 = Color3.fromRGB(180, 140, 40);
        if v279 then
            v279.Visible = p253.Price ~= "Lvl";
        end;
        if v280 then
            v280.HorizontalAlignment = p253.Price == "Lvl" and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Right;
        end;
        if v281 then
            v281.PaddingRight = UDim.new(0, 5);
            v281.PaddingLeft = UDim.new(0, 5);
        end;
        if v278 then
            v278.Size = p253.Price == "Lvl" and UDim2.new(1, 0, 0.86, 0) or UDim2.new(1, -26, 0.86, 0);
            v278.AutomaticSize = Enum.AutomaticSize.None;
            v278.FontFace = u12;
            v278.TextXAlignment = p253.Price == "Lvl" and Enum.TextXAlignment.Center or Enum.TextXAlignment.Right;
            if p253.Price == "Lvl" then
                v278.Text = "LVL " .. tostring(p253.Lvl or "?");
            else
                v287 = p253.Price;
                v288 = tonumber(v287);
                if v288 then
                    v289 = u20(v288);
                else
                    v289 = tostring(v287 or "");
                end;
                v278.Text = v289;
            end;
            v278.TextColor3 = u10;
            v278.TextStrokeTransparency = 1;
            if v282 then
                v282.Enabled = false;
            end;
        end;
    end;
end;
local u295 = setmetatable({}, {
    __mode = "k"
});
local function u303(p296) --[[ Line: 1673 ]]
    local v297 = tonumber(p296) or 0;
    local v298 = math.floor(v297);
    local v299 = math.max(0, v298);
    local v300 = math.floor(v299 / 3600);
    local v301 = math.floor(v299 % 3600 / 60);
    local v302 = v299 % 60;
    if v300 > 0 then
        return string.format("%d:%02d:%02d", v300, v301, v302);
    else
        return string.format("%d:%02d", v301, v302);
    end;
end;
local function u309(p304, p305, p306) --[[ Line: 1684 ]]
    local v307 = p304:FindFirstChild(p305);
    if not v307 then
        v307 = Instance.new("ScrollingFrame");
        v307.Name = p305;
        v307.Size = UDim2.new(1, 0, 1, 0);
        v307.BackgroundTransparency = 1;
        v307.BorderSizePixel = 0;
        v307.ScrollBarThickness = 6;
        v307.AutomaticCanvasSize = Enum.AutomaticSize.Y;
        v307.CanvasSize = UDim2.new(0, 0, 0, 0);
        v307.LayoutOrder = p306 or 1;
        v307.Parent = p304;
    end;
    if v307:IsA("ScrollingFrame") then
        v307.AutomaticCanvasSize = Enum.AutomaticSize.Y;
        v307.CanvasSize = UDim2.new(0, 0, 0, 0);
        v307.ScrollBarThickness = math.max(v307.ScrollBarThickness, 5);
    end;
    if not (v307:FindFirstChildOfClass("UIGridLayout") or v307:FindFirstChildOfClass("UIListLayout")) then
        local v308 = Instance.new("UIGridLayout");
        v308.CellSize = UDim2.new(0, 132, 0, 152);
        v308.CellPadding = UDim2.new(0, 8, 0, 8);
        v308.SortOrder = Enum.SortOrder.LayoutOrder;
        v308.Parent = v307;
    end;
    return v307;
end;
local function u312(p310) --[[ Line: 1716 ]]
    for _, v311 in ipairs(p310:GetChildren()) do
        if v311:GetAttribute("GeneratedBotShop") == true then
            v311:Destroy();
        end;
    end;
end;
local function u316(u313, ...) --[[ Line: 1724 ]]
    if not (u313 and u313:IsA("RemoteFunction")) then
        return {
            Ok = false,
            Message = "Bot shop is not ready."
        };
    end;
    local v314, v315 = pcall(function(...) --[[ Line: 1729 ]]
        -- upvalues: u313 (copy)
        return u313:InvokeServer(...);
    end, ...);
    return (not v314 or type(v315) ~= "table") and {
        Ok = false,
        Message = "Request failed."
    } or v315;
end;
local function u341(p317, p318, p319, p320, p321, p322, p323, u324) --[[ Line: 1740 ]]
    -- upvalues: u10 (copy), u12 (copy)
    local v325 = Instance.new("Frame");
    v325.Name = "BotPackCard";
    v325:SetAttribute("GeneratedBotShop", true);
    v325.Size = UDim2.new(0, 132, 0, 152);
    v325.BackgroundColor3 = Color3.fromRGB(66, 66, 66);
    v325.BorderSizePixel = 0;
    v325.LayoutOrder = p318 or 1;
    v325.Parent = p317;
    Instance.new("UICorner", v325).CornerRadius = UDim.new(0, 8);
    local v326 = Instance.new("TextLabel");
    v326.Size = UDim2.new(1, -12, 0, 26);
    v326.Position = UDim2.new(0, 6, 0, 5);
    v326.BackgroundTransparency = 1;
    v326.Text = p319;
    v326.TextColor3 = Color3.new(1, 1, 1);
    v326.Font = Enum.Font.GothamBold;
    v326.TextScaled = true;
    v326.TextTruncate = Enum.TextTruncate.AtEnd;
    v326.Parent = v325;
    Instance.new("UITextSizeConstraint", v326).MaxTextSize = 15;
    local v327 = Instance.new("TextLabel");
    v327.Size = UDim2.new(1, -12, 0, 58);
    v327.Position = UDim2.new(0, 6, 0, 34);
    v327.BackgroundTransparency = 1;
    v327.Text = table.concat(p320, "\n");
    v327.TextColor3 = Color3.fromRGB(230, 230, 230);
    v327.Font = Enum.Font.Gotham;
    v327.TextScaled = true;
    v327.TextWrapped = true;
    v327.TextTruncate = Enum.TextTruncate.AtEnd;
    v327.LineHeight = 0.9;
    v327.TextXAlignment = Enum.TextXAlignment.Left;
    v327.TextYAlignment = Enum.TextYAlignment.Top;
    v327.ClipsDescendants = true;
    v327.Parent = v325;
    local v328 = Instance.new("UITextSizeConstraint", v327);
    v328.MaxTextSize = 10;
    v328.MinTextSize = 6;
    if p323 and p323 ~= "" then
        local v329 = Instance.new("TextLabel");
        v329.Size = UDim2.new(0, 38, 0, 18);
        v329.Position = UDim2.new(1, -43, 0, 6);
        v329.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
        v329.TextColor3 = Color3.new(1, 1, 1);
        v329.Font = Enum.Font.GothamBold;
        v329.TextScaled = true;
        v329.Text = p323;
        v329.Parent = v325;
        Instance.new("UICorner", v329).CornerRadius = UDim.new(0, 4);
        Instance.new("UITextSizeConstraint", v329).MaxTextSize = 11;
    end;
    local v330 = Instance.new("Frame");
    v330.Name = "BottomRow";
    v330.Size = UDim2.new(0.9, 0, 0.16, 0);
    v330.Position = UDim2.new(0.05, 0, 0.8, 0);
    v330.BackgroundTransparency = 1;
    v330.Parent = v325;
    local v331 = Instance.new("UIListLayout", v330);
    v331.FillDirection = Enum.FillDirection.Horizontal;
    v331.HorizontalAlignment = Enum.HorizontalAlignment.Center;
    v331.VerticalAlignment = Enum.VerticalAlignment.Center;
    v331.Padding = UDim.new(0, 4);
    v331.SortOrder = Enum.SortOrder.LayoutOrder;
    local u332 = Instance.new("TextButton");
    u332.Name = "Action";
    u332.LayoutOrder = 2;
    u332.Size = UDim2.new(1, 0, 1, 0);
    u332.BackgroundColor3 = p322 or Color3.fromRGB(180, 140, 40);
    u332.TextColor3 = Color3.new(1, 1, 1);
    u332.Font = Enum.Font.GothamBold;
    u332.TextScaled = true;
    u332.Text = p321;
    u332.AutoButtonColor = true;
    u332.ClipsDescendants = true;
    u332.Parent = v330;
    Instance.new("UICorner", u332).CornerRadius = UDim.new(0, 6);
    local v333 = Instance.new("UITextSizeConstraint", u332);
    v333.MaxTextSize = 14;
    v333.MinTextSize = 8;
    if type(p321) == "string" and string.match(p321, "^[%d,]+$") then
        u332:SetAttribute("SfxKind", "Buy");
        u332.Text = "";
        local v334 = Instance.new("UIPadding", u332);
        v334.PaddingRight = UDim.new(0, 5);
        v334.PaddingLeft = UDim.new(0, 5);
        local v335 = Instance.new("UIListLayout", u332);
        v335.FillDirection = Enum.FillDirection.Horizontal;
        v335.HorizontalAlignment = Enum.HorizontalAlignment.Right;
        v335.VerticalAlignment = Enum.VerticalAlignment.Center;
        v335.Padding = UDim.new(0, 1);
        v335.SortOrder = Enum.SortOrder.LayoutOrder;
        local v336 = Instance.new("TextLabel", u332);
        v336.Name = "Amount";
        v336.BackgroundTransparency = 1;
        v336.Size = UDim2.new(1, -26, 0.86, 0);
        v336.AutomaticSize = Enum.AutomaticSize.None;
        v336.Text = p321;
        v336.TextColor3 = u10;
        v336.FontFace = u12;
        v336.TextScaled = true;
        v336.TextXAlignment = Enum.TextXAlignment.Right;
        v336.TextStrokeTransparency = 1;
        v336.LayoutOrder = 1;
        local v337 = Instance.new("UIStroke", v336);
        v337.Name = "TextStroke";
        v337.Color = Color3.new(0, 0, 0);
        v337.Thickness = 1;
        v337.Transparency = 1;
        v337.Enabled = false;
        local v338 = Instance.new("UITextSizeConstraint", v336);
        v338.MaxTextSize = 18;
        v338.MinTextSize = 8;
        local v339 = Instance.new("ImageLabel", u332);
        v339.Name = "Icon";
        v339.BackgroundTransparency = 1;
        v339.Size = UDim2.new(1, 0, 0.8, 0);
        v339.Image = "rbxassetid://11713337390";
        v339.ImageColor3 = Color3.new(0, 0, 0);
        v339.LayoutOrder = 2;
        v339.ZIndex = u332.ZIndex + 1;
        local v340 = Instance.new("UIAspectRatioConstraint", v339);
        v340.AspectRatio = 1;
        v340.AspectType = Enum.AspectType.FitWithinMaxSize;
        v340.DominantAxis = Enum.DominantAxis.Height;
    end;
    if u324 then
        u332.MouseButton1Click:Connect(function() --[[ Line: 1879 ]]
            -- upvalues: u324 (copy), u332 (copy)
            u324(u332);
        end);
    end;
    return v325;
end;
local function u402(u342) --[[ Line: 1887 ]]
    -- upvalues: u309 (copy), u312 (copy), l__GameDatabase__19 (copy), u341 (copy), u303 (copy), u20 (copy), u221 (copy), l__ClientPlayerState__21 (copy), l__Players__1 (copy), u316 (copy), l__StopBotPack__17 (copy), l__ActivateBotPack__16 (copy), u295 (copy)
    local u343;
    if u342 then
        u343 = u342:FindFirstChild("Bots");
    else
        u343 = u342;
    end;
    if u343 then
        local u344 = u309(u343, "Buy", 1);
        local u345 = u309(u343, "Owned", 2);
        local u346 = false;
        local function u399() --[[ Line: 1899 ]]
            -- upvalues: u346 (ref), u312 (ref), u344 (copy), u345 (copy), l__GameDatabase__19 (ref), u341 (ref), u303 (ref), u20 (ref), u221 (ref), u342 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u316 (ref), l__StopBotPack__17 (ref), u399 (ref), l__ActivateBotPack__16 (ref)
            if u346 then
            else
                u346 = true;
                u312(u344);
                u312(u345);
                local v347 = {};
                for v348, v349 in pairs(l__GameDatabase__19.BotPacks or {}) do
                    v347[#v347 + 1] = {
                        Id = v348,
                        Data = v349
                    };
                end;
                table.sort(v347, function(p350, p351) --[[ Line: 1912 ]]
                    local v352 = tonumber(p350.Data.Price) or 0;
                    local v353 = tonumber(p351.Data.Price) or 0;
                    if v352 == v353 then
                        return tostring(p350.Id) < tostring(p351.Id);
                    else
                        return v352 < v353;
                    end;
                end);
                for v354, u355 in ipairs(v347) do
                    local l__Data__27 = u355.Data;
                    local v356 = u341;
                    local v357 = u344;
                    local v358 = tostring(l__Data__27.Name or u355.Id);
                    local v359 = { "Bots: " .. tostring(l__Data__27.BotCount or 0), "Mass: " .. tostring(l__Data__27.BotMass or 0), "Time: " .. u303(l__Data__27.DurationSeconds) };
                    local l__Price__28 = l__Data__27.Price;
                    local v360 = tonumber(l__Price__28);
                    local v361;
                    if v360 then
                        v361 = u20(v360);
                    else
                        v361 = tostring(l__Price__28 or "");
                    end;
                    v356(v357, v354, v358, v359, v361, Color3.fromRGB(180, 140, 40), nil, function(_) --[[ Line: 1927 ]]
                        -- upvalues: u221 (ref), u355 (copy), l__Data__27 (copy), u342 (ref)
                        u221(u355.Id, l__Data__27, u342);
                    end);
                end;
                local v362 = l__ClientPlayerState__21.GetProxy("ActiveBoosts", l__Players__1.LocalPlayer);
                if v362 then
                    v362 = v362:FindFirstChild("BotActive");
                end;
                if v362 then
                    local v363 = v362:GetAttribute("PackId") or "";
                    local v364 = tostring(v363);
                    local v365 = u341;
                    local v366 = u345;
                    local v367 = "Active: " .. tostring(((l__GameDatabase__19.BotPacks or {})[v364] or {}).Name or v364);
                    local v368 = {};
                    local v369 = v362:GetAttribute("BotCount") or 0;
                    local v370 = "Bots: " .. tostring(v369);
                    local v371 = v362:GetAttribute("BotMass") or 0;
                    v368[1], v368[2], v368[3] = v370, "Mass: " .. tostring(v371), "Left: " .. u303(v362:GetAttribute("RemainingSeconds"));
                    v365(v366, 0, v367, v368, "STOP", Color3.fromRGB(190, 70, 55), "ON", function(p372) --[[ Line: 1941 ]]
                        -- upvalues: u316 (ref), l__StopBotPack__17 (ref), u399 (ref)
                        p372.Text = "Stopping...";
                        local v373 = u316(l__StopBotPack__17);
                        p372.Text = v373.Message or (v373.Ok and "Stopped" or "Failed");
                        task.delay(0.55, u399);
                    end);
                end;
                local v374 = l__ClientPlayerState__21.GetProxy("ActiveBoosts.BotPacks", l__Players__1.LocalPlayer);
                local v375 = v374 and v374:GetChildren() or {};
                table.sort(v375, function(p376, p377) --[[ Line: 1951 ]]
                    local v378 = p376:GetAttribute("PackId") or "";
                    local v379 = tostring(v378);
                    local v380 = p377:GetAttribute("PackId") or "";
                    local v381 = tostring(v380);
                    if v379 == v381 then
                        return tostring(p376.Name) < tostring(p377.Name);
                    else
                        return v379 < v381;
                    end;
                end);
                local v382 = 10;
                for _, u383 in ipairs(v375) do
                    local v384 = u383:GetAttribute("PackId") or "";
                    local v385 = tostring(v384);
                    local v386 = (l__GameDatabase__19.BotPacks or {})[v385] or {};
                    local v387 = tonumber(u383:GetAttribute("Amount")) or 0;
                    local v388 = math.floor(v387);
                    local v389 = math.max(0, v388);
                    if v389 > 0 then
                        local v390 = u341;
                        local v391 = u345;
                        local v392 = tostring(v386.Name or v385);
                        local v393 = {};
                        local v394 = u383:GetAttribute("BotCount") or (v386.BotCount or 0);
                        local v395 = "Bots: " .. tostring(v394);
                        local v396 = u383:GetAttribute("BotMass") or (v386.BotMass or 0);
                        v393[1], v393[2], v393[3] = v395, "Mass: " .. tostring(v396), "Left: " .. u303(u383:GetAttribute("RemainingSeconds"));
                        v390(v391, v382, v392, v393, "USE", Color3.fromRGB(60, 150, 80), v389 > 1 and "x" .. u20(v389) or nil, function(p397) --[[ Line: 1970 ]]
                            -- upvalues: u316 (ref), l__ActivateBotPack__16 (ref), u383 (copy), u399 (ref)
                            p397.Text = "Starting...";
                            local v398 = u316(l__ActivateBotPack__16, u383.Name);
                            p397.Text = v398.Message or (v398.Ok and "Active" or "Failed");
                            task.delay(0.55, u399);
                        end);
                        v382 = v382 + 1;
                    end;
                end;
                if v382 == 10 and not v362 then
                    u341(u345, 9999, "No Bot Packs", { "Buy a pack first.", "Only one pack can be active." }, "EMPTY", Color3.fromRGB(90, 90, 90), nil, nil);
                end;
                u346 = false;
            end;
        end;
        u399();
        if u295[u343] then
        else
            u295[u343] = true;
            local v400 = l__ClientPlayerState__21.GetProxy("ActiveBoosts", l__Players__1.LocalPlayer);
            local v401 = l__ClientPlayerState__21.GetProxy("ActiveBoosts.BotPacks", l__Players__1.LocalPlayer);
            if v400 then
                v400.ChildAdded:Connect(u399);
                v400.ChildRemoved:Connect(u399);
            end;
            if v401 then
                v401.ChildAdded:Connect(u399);
                v401.ChildRemoved:Connect(u399);
            end;
            l__ClientPlayerState__21.OnChanged("ActiveBoosts", u399, l__Players__1.LocalPlayer);
            l__ClientPlayerState__21.OnChanged("ActiveBoosts.BotPacks", u399, l__Players__1.LocalPlayer);
            task.spawn(function() --[[ Line: 2010 ]]
                -- upvalues: u343 (copy), u342 (copy), u399 (ref)
                while u343.Parent do
                    task.wait(1);
                    if u342.Visible then
                        u399();
                    end;
                end;
            end);
        end;
    end;
end;
local function u438(p403, p404) --[[ Line: 2020 ]]
    -- upvalues: l__ClientPlayerState__21 (copy), l__Players__1 (copy), u104 (copy), u16 (copy), l__GameDatabase__19 (copy)
    local v405 = l__ClientPlayerState__21.GetProxy("Settings", l__Players__1.LocalPlayer);
    local u406 = l__ClientPlayerState__21.GetProxy("Equipped.Skins", l__Players__1.LocalPlayer);
    local u407 = l__ClientPlayerState__21.GetProxy("Equipped.Hats", l__Players__1.LocalPlayer);
    if v405 and u406 then
        local v408 = v405:GetAttribute("BlobColor") or "";
        local u409 = tostring(v408);
        local u410 = { u409 };
        local function v418(p411, p412) --[[ Line: 2029 ]]
            -- upvalues: u104 (ref), u410 (copy)
            if p411 then
                local v413, v414 = u104(p411, p412);
                table.insert(u410, p411.Name);
                for v415 = 1, v414 do
                    local v416 = u410;
                    local v417 = tostring(v413[v415] or "None");
                    table.insert(v416, v417);
                end;
            end;
        end;
        v418(u406, "Skin");
        v418(u407, "Accessory");
        local u419 = table.concat(u410, "|");
        local function v435(p420) --[[ Line: 2041 ]]
            -- upvalues: u16 (ref), u419 (copy), u104 (ref), l__GameDatabase__19 (ref), l__Players__1 (ref), u406 (copy), u407 (copy)
            if p420 then
                if u16[p420] == u419 then
                else
                    u16[p420] = u419;
                    for _, v421 in ipairs(p420:GetChildren()) do
                        if v421.Name == "Layer_Clip" or v421.Name == "Layer_Hats" then
                            v421:Destroy();
                        end;
                    end;
                    if p420:IsA("ImageLabel") or p420:IsA("ImageButton") then
                        p420.Image = "";
                    end;
                    local v422 = Instance.new("Frame", p420);
                    v422.Name = "Layer_Clip";
                    v422.Size = UDim2.new(1, 0, 1, 0);
                    v422.BackgroundTransparency = 1;
                    v422.ClipsDescendants = true;
                    Instance.new("UICorner", v422).CornerRadius = UDim.new(1, 0);
                    local v423 = Instance.new("Frame", p420);
                    v423.Name = "Layer_Hats";
                    v423.Size = UDim2.new(1.5, 0, 1.5, 0);
                    v423.Position = UDim2.new(0.5, 0, 0.5, 0);
                    v423.AnchorPoint = Vector2.new(0.5, 0.5);
                    v423.BackgroundTransparency = 1;
                    local function v434(p424, p425, p426) --[[ Line: 2070 ]]
                        -- upvalues: u104 (ref), l__GameDatabase__19 (ref), l__Players__1 (ref)
                        if p424 then
                            local v427, v428 = u104(p424, p424.Name == "Hats" and "Accessory" or "Skin");
                            for v429 = 1, v428 do
                                local v430 = v427[v429];
                                if v430 and (v430 ~= "" and v430 ~= "None") then
                                    local v431 = l__GameDatabase__19.Items[v430];
                                    if v431 then
                                        local u432 = Instance.new("ImageLabel", p425);
                                        u432.Size = UDim2.new(1, 0, 1, 0);
                                        u432.BackgroundTransparency = 1;
                                        u432.ScaleType = p426;
                                        u432.ZIndex = v429;
                                        if p424.Name == "Skins" then
                                            Instance.new("UICorner", u432).CornerRadius = UDim.new(1, 0);
                                        end;
                                        if v431.TypeSkin == "Async" and v431.Fetch then
                                            v431.Fetch(l__Players__1.LocalPlayer.UserId, function(p433) --[[ Line: 2095 ]]
                                                -- upvalues: u432 (copy)
                                                if u432 and u432.Parent then
                                                    u432.Image = p433;
                                                end;
                                            end);
                                        elseif v431.ImageId then
                                            u432.Image = v431.ImageId;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    v434(u406, v422, Enum.ScaleType.Crop);
                    v434(u407, v423, Enum.ScaleType.Fit);
                end;
            end;
        end;
        v435(p403);
        v435(p404);
        if u409 ~= "" then
            local v436, v437 = pcall(function() --[[ Line: 2116 ]]
                -- upvalues: u409 (copy)
                return Color3.fromHex(u409);
            end);
            if v436 then
                if p403 then
                    p403.BackgroundColor3 = v437;
                end;
                if p404 then
                    p404.BackgroundColor3 = v437;
                end;
            end;
        end;
    end;
end;
local function u442(u439, p440) --[[ Line: 2147 ]]
    -- upvalues: l__Players__1 (copy)
    if u439 and p440 then
        if p440.TypeSkin == "Async" and p440.Fetch then
            p440.Fetch(l__Players__1.LocalPlayer.UserId, function(p441) --[[ Line: 2153 ]]
                -- upvalues: u439 (copy)
                if u439 and u439.Parent then
                    u439.Image = p441;
                end;
            end);
        elseif p440.ImageId then
            u439.Image = p440.ImageId;
        else
            u439.Image = "";
        end;
    end;
end;
local function u452(p443) --[[ Line: 2165 ]]
    -- upvalues: u20 (copy)
    local v444;
    if p443 then
        v444 = p443.EffectiveChance;
    else
        v444 = p443;
    end;
    local v445 = tonumber(v444);
    if not v445 then
        local v446;
        if p443 then
            v446 = p443.Probability;
        else
            v446 = p443;
        end;
        v445 = tonumber(v446);
    end;
    local v447;
    if v445 then
        v447 = v445;
    else
        local v448;
        if p443 then
            v448 = p443.Chance;
        else
            v448 = p443;
        end;
        v447 = tonumber(v448);
        if v447 then
            if v447 <= 0 then
                v447 = v445;
            end;
        else
            v447 = v445;
        end;
    end;
    if not v447 or v447 <= 0 then
        if p443 then
            p443 = p443.Weight;
        end;
        local v449 = tonumber(p443);
        return (not v449 or v449 <= 0) and "" or tostring(v449) .. "%";
    end;
    if v447 <= 0.1 then
        return "1 in " .. u20((math.floor(1 / v447 + 0.5)));
    end;
    local v450 = v447 * 100;
    if v450 % 1 ~= 0 then
        return string.format("%.1f%%", v450);
    end;
    local v451 = math.floor(v450);
    return tostring(v451) .. "%";
end;
local function u459(p453) --[[ Line: 2197 ]]
    -- upvalues: l__GameDatabase__19 (copy)
    local l__Cases__29 = l__GameDatabase__19.Cases;
    if l__Cases__29 then
        l__Cases__29 = l__GameDatabase__19.Cases[p453];
    end;
    if type(l__Cases__29) ~= "table" or #l__Cases__29 <= 0 then
        return {};
    end;
    local v454 = 0;
    local v455 = {};
    for v456, v457 in ipairs(l__Cases__29) do
        if type(v457) == "table" and (type(v457.ItemId) == "string" and l__GameDatabase__19.Items[v457.ItemId]) then
            local v458 = tonumber(v457.Chance);
            if v458 and v458 > 0 then
                v454 = v454 + v458;
                table.insert(v455, {
                    Entry = v457,
                    OriginalIndex = v456,
                    Probability = v458
                });
            end;
        end;
    end;
    return (#v455 <= 0 or math.abs(v454 - 1) > 1e-6) and {} or v455;
end;
local function u466(p460, p461) --[[ Line: 2237 ]]
    if p460 then
        if p460:FindFirstChild("CaseNoticeBlocker") then
            p460.CaseNoticeBlocker:Destroy();
        end;
        local u462 = Instance.new("TextButton", p460);
        u462.Name = "CaseNoticeBlocker";
        u462.Size = UDim2.new(1, 0, 1, 0);
        u462.BackgroundColor3 = Color3.new(0, 0, 0);
        u462.BackgroundTransparency = 0.65;
        u462.Text = "";
        u462.ZIndex = 250;
        local v463 = Instance.new("Frame", u462);
        v463.Size = UDim2.new(0, 360, 0, 150);
        v463.Position = UDim2.new(0.5, -180, 0.5, -75);
        v463.BackgroundColor3 = Color3.fromRGB(24, 29, 36);
        v463.ZIndex = 251;
        Instance.new("UICorner", v463).CornerRadius = UDim.new(0, 8);
        local v464 = Instance.new("TextLabel", v463);
        v464.Size = UDim2.new(1, -32, 0, 70);
        v464.Position = UDim2.new(0, 16, 0, 20);
        v464.BackgroundTransparency = 1;
        v464.Text = p461;
        v464.TextColor3 = Color3.new(1, 1, 1);
        v464.TextWrapped = true;
        v464.Font = Enum.Font.GothamSemibold;
        v464.TextSize = 16;
        v464.ZIndex = 252;
        local v465 = Instance.new("TextButton", v463);
        v465.Size = UDim2.new(0, 140, 0, 36);
        v465.Position = UDim2.new(0.5, -70, 1, -50);
        v465.BackgroundColor3 = Color3.fromRGB(55, 135, 220);
        v465.Text = "OK";
        v465.TextColor3 = Color3.new(1, 1, 1);
        v465.Font = Enum.Font.GothamBold;
        v465.TextSize = 14;
        v465.ZIndex = 252;
        Instance.new("UICorner", v465).CornerRadius = UDim.new(0, 6);
        v465.MouseButton1Click:Connect(function() --[[ Line: 2283 ]]
            -- upvalues: u462 (copy)
            u462:Destroy();
        end);
    end;
end;
local function u475(p467) --[[ Line: 2288 ]]
    -- upvalues: u459 (copy), l__GameDatabase__19 (copy)
    local v468 = u459(p467);
    if #v468 <= 0 then
        return nil;
    end;
    for _ = 1, 8 do
        local v469 = math.random();
        local v470 = v468[#v468];
        local v471 = 0;
        for _, v472 in ipairs(v468) do
            v471 = v471 + (tonumber(v472.Probability) or 0);
            if v469 <= v471 then
                v470 = v472;
                break;
            end;
        end;
        local v473;
        if v470 then
            v473 = v470.Entry;
        else
            v473 = v470;
        end;
        if v473 and (v473.ItemId and l__GameDatabase__19.Items[v473.ItemId]) then
            v473.EffectiveChance = v470.Probability;
            return v473;
        end;
    end;
    local v474 = v468[1];
    if not (v474 and v474.Entry) then
        return nil;
    end;
    v474.Entry.EffectiveChance = v474.Probability;
    return v474.Entry;
end;
local function u502(p476, _, p477, p478, p479, p480) --[[ Line: 2327 ]]
    -- upvalues: l__GameDatabase__19 (copy), u442 (copy), u4 (ref), u20 (copy), u11 (copy), u452 (copy)
    local v481;
    if p477 then
        v481 = p477.ItemId;
    else
        v481 = p477;
    end;
    local v482 = l__GameDatabase__19.Items[v481] or {};
    local v483 = p479 + 0.008;
    local v484;
    if p477 then
        v484 = p477.Amount;
    else
        v484 = p477;
    end;
    local v485 = tonumber(v484) or 1;
    local v486 = math.floor(v485);
    local v487 = math.max(v486, 1);
    local v488 = Instance.new("Frame", p476);
    v488.Name = "RollItem_" .. tostring(p478);
    v488.Size = UDim2.fromScale(p479, 0.84);
    v488.Position = UDim2.fromScale((p478 - 1) * v483, 0.5);
    v488.AnchorPoint = Vector2.new(0, 0.5);
    v488.BackgroundColor3 = Color3.fromRGB(66, 72, 82);
    v488.BorderSizePixel = 0;
    v488.ZIndex = p480;
    Instance.new("UICorner", v488).CornerRadius = UDim.new(0.035, 0);
    local v489 = Instance.new("UISizeConstraint", v488);
    v489.MinSize = Vector2.new(108, 130);
    v489.MaxSize = Vector2.new(260, 300);
    local v490 = Instance.new("ImageLabel", v488);
    v490.Size = UDim2.fromScale(1, 0.6);
    v490.Position = UDim2.fromScale(0.5, 0);
    v490.AnchorPoint = Vector2.new(0.5, 0);
    v490.BackgroundTransparency = 1;
    v490.ScaleType = Enum.ScaleType.Fit;
    v490.ZIndex = p480 + 1;
    u442(v490, v482);
    local v491 = Instance.new("TextLabel", v488);
    v491.Size = UDim2.fromScale(0.92, 0.08);
    v491.Position = UDim2.fromScale(0.04, 0.6);
    v491.BackgroundTransparency = 1;
    v491.Text = v482.Name or (v481 or "Unknown");
    v491.TextColor3 = Color3.new(1, 1, 1);
    v491.TextScaled = true;
    v491.TextWrapped = false;
    v491.Font = Enum.Font.GothamSemibold;
    v491.ZIndex = p480 + 1;
    local v492 = Instance.new("UITextSizeConstraint", v491);
    v492.MaxTextSize = 15;
    v492.MinTextSize = 8;
    local v493 = Instance.new("TextLabel", v488);
    v493.Size = UDim2.fromScale(0.92, 0.09);
    v493.Position = UDim2.fromScale(0.04, 0.67);
    v493.BackgroundTransparency = 1;
    local v494;
    if u4 then
        local v495 = u4.GetItemValue(v481);
        v494 = not v495 and "N/A" or u20((math.floor(v495 + 0.5)));
    else
        v494 = "N/A";
    end;
    v493.Text = v494;
    v493.TextColor3 = u11;
    v493.TextScaled = true;
    v493.Font = Enum.Font.GothamBold;
    v493.ZIndex = p480 + 1;
    local v496 = Instance.new("UITextSizeConstraint", v493);
    v496.MaxTextSize = 14;
    v496.MinTextSize = 8;
    local v497;
    if v487 > 1 then
        local v498 = Instance.new("TextLabel", v488);
        v498.Size = UDim2.fromScale(0.92, 0.07);
        v498.Position = UDim2.fromScale(0.04, 0.76);
        v498.BackgroundTransparency = 1;
        v498.Text = "x" .. u20(v487);
        v498.TextColor3 = Color3.fromRGB(230, 235, 245);
        v498.TextScaled = true;
        v498.Font = Enum.Font.GothamSemibold;
        v498.ZIndex = p480 + 1;
        local v499 = Instance.new("UITextSizeConstraint", v498);
        v499.MaxTextSize = 14;
        v499.MinTextSize = 8;
        v497 = 0.84;
    else
        v497 = 0.78;
    end;
    local v500 = Instance.new("TextLabel", v488);
    v500.Size = UDim2.fromScale(0.92, 0.075);
    v500.Position = UDim2.fromScale(0.04, v497);
    v500.BackgroundTransparency = 1;
    v500.Text = u452(p477);
    v500.TextColor3 = Color3.fromRGB(230, 235, 245);
    v500.TextScaled = true;
    v500.Font = Enum.Font.GothamSemibold;
    v500.ZIndex = p480 + 1;
    local v501 = Instance.new("UITextSizeConstraint", v500);
    v501.MaxTextSize = 14;
    v501.MinTextSize = 8;
    return v488;
end;
local function u541(p503, p504, u505) --[[ Line: 2422 ]]
    -- upvalues: l__Players__1 (copy), l__Lighting__5 (copy), l__GameDatabase__19 (copy), u475 (copy), u502 (copy), l__TweenService__4 (copy), u4 (ref), u20 (copy), u452 (copy)
    local l__LocalPlayer__30 = l__Players__1.LocalPlayer;
    if l__LocalPlayer__30 then
        l__LocalPlayer__30 = l__LocalPlayer__30:FindFirstChildOfClass("PlayerGui");
    end;
    if not l__LocalPlayer__30 and p503 then
        l__LocalPlayer__30 = p503:FindFirstAncestorOfClass("PlayerGui");
    end;
    if l__LocalPlayer__30 then
        local v506 = l__LocalPlayer__30:FindFirstChild("CaseOpeningScreenGui");
        if v506 then
            v506:Destroy();
        end;
        if p503 and p503:FindFirstChild("CaseOpeningBlocker") then
            p503.CaseOpeningBlocker:Destroy();
        end;
        local v507 = l__Lighting__5:FindFirstChild("CaseOpeningBlur");
        if v507 then
            v507:Destroy();
        end;
        local u508 = Instance.new("BlurEffect");
        u508.Name = "CaseOpeningBlur";
        u508.Size = 18;
        u508.Parent = l__Lighting__5;
        local u509 = Instance.new("ScreenGui");
        u509.Name = "CaseOpeningScreenGui";
        u509.ResetOnSpawn = false;
        u509.IgnoreGuiInset = true;
        u509.DisplayOrder = 10000;
        pcall(function() --[[ Line: 2458 ]]
            -- upvalues: u509 (copy)
            u509.ScreenInsets = Enum.ScreenInsets.None;
        end);
        u509.Parent = l__LocalPlayer__30;
        local v510 = Instance.new("TextButton", u509);
        v510.Name = "CaseOpeningBlocker";
        v510.Size = UDim2.fromScale(1, 1);
        v510.BackgroundColor3 = Color3.new(0, 0, 0);
        v510.BackgroundTransparency = 0.5;
        v510.AutoButtonColor = false;
        v510.Text = "";
        v510.ZIndex = 200;
        u509.Destroying:Connect(function() --[[ Line: 2472 ]]
            -- upvalues: u508 (copy)
            if u508 and u508.Parent then
                u508:Destroy();
            end;
        end);
        local v511 = Instance.new("Frame", v510);
        v511.Size = UDim2.fromScale(1, 1);
        v511.Position = UDim2.fromScale(0.5, 0.5);
        v511.AnchorPoint = Vector2.new(0.5, 0.5);
        v511.BackgroundColor3 = Color3.fromRGB(14, 17, 22);
        v511.BackgroundTransparency = 0.42;
        v511.ZIndex = 201;
        local v512 = Instance.new("TextLabel", v511);
        v512.Size = UDim2.fromScale(0.9, 0.08);
        v512.Position = UDim2.fromScale(0.05, 0.055);
        v512.BackgroundTransparency = 1;
        local v513 = "Opening ";
        local v514;
        if l__GameDatabase__19.Items[p504] then
            v514 = l__GameDatabase__19.Items[p504].Name or p504;
        else
            v514 = p504;
        end;
        v512.Text = v513 .. tostring(v514);
        v512.TextColor3 = Color3.new(1, 1, 1);
        v512.Font = Enum.Font.GothamBold;
        v512.TextScaled = true;
        v512.ZIndex = 202;
        local v515 = Instance.new("UITextSizeConstraint", v512);
        v515.MaxTextSize = 34;
        v515.MinTextSize = 16;
        local v516 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720);
        local v517 = v516.X < 900 and true or v516.Y < 520;
        local v518 = Instance.new("Frame", v511);
        v518.Name = "ReelWindow";
        v518.Size = v517 and UDim2.fromScale(0.94, 0.46) or UDim2.fromScale(0.92, 0.36);
        v518.Position = v517 and UDim2.fromScale(0.03, 0.23) or UDim2.fromScale(0.04, 0.3);
        v518.BackgroundColor3 = Color3.fromRGB(24, 28, 35);
        v518.BackgroundTransparency = 0.2;
        v518.BorderSizePixel = 0;
        v518.ClipsDescendants = true;
        v518.ZIndex = 202;
        Instance.new("UICorner", v518).CornerRadius = UDim.new(0.035, 0);
        local v519 = Instance.new("Frame", v518);
        v519.Name = "CenterMarker";
        v519.Size = UDim2.fromScale(0.003, 1);
        v519.Position = UDim2.fromScale(0.5, 0);
        v519.AnchorPoint = Vector2.new(0.5, 0);
        v519.BackgroundColor3 = Color3.fromRGB(255, 216, 90);
        v519.BorderSizePixel = 0;
        v519.ZIndex = 230;
        local u520 = v517 and 0.215 or 0.115;
        local u521 = u520 + 0.008;
        local u522 = Instance.new("Frame", v518);
        u522.Name = "ReelStrip";
        u522.Size = UDim2.fromScale(1, 1);
        u522.Position = UDim2.fromScale(0, 0);
        u522.BackgroundTransparency = 1;
        u522.ZIndex = 203;
        local u523 = nil;
        for v524 = 1, 60 do
            local v525 = u475(p504);
            local v526 = v524 == 49 and {
                ItemId = u505.RewardItemId,
                Amount = u505.RewardAmount,
                EffectiveChance = u505.RewardChance
            } or v525;
            if v526 then
                local v527 = u502(u522, p504, v526, v524, u520, v524 == 49 and 211 or 204);
                if v524 == 49 then
                    u523 = v527;
                end;
            end;
        end;
        local u528 = Instance.new("TextLabel", v511);
        u528.Size = v517 and UDim2.fromScale(0.86, 0.105) or UDim2.fromScale(0.86, 0.14);
        u528.Position = v517 and UDim2.fromScale(0.07, 0.7) or UDim2.fromScale(0.07, 0.67);
        u528.BackgroundTransparency = 1;
        u528.Text = "";
        u528.TextColor3 = Color3.fromRGB(255, 235, 150);
        u528.Font = Enum.Font.GothamBold;
        u528.TextScaled = true;
        u528.TextWrapped = true;
        u528.Visible = false;
        u528.ZIndex = 202;
        local v529 = Instance.new("UITextSizeConstraint", u528);
        v529.MaxTextSize = 28;
        v529.MinTextSize = 10;
        local u530 = Instance.new("TextButton", v511);
        u530.Size = UDim2.fromScale(0.18, 0.065);
        u530.Position = v517 and UDim2.fromScale(0.5, 0.865) or UDim2.fromScale(0.5, 0.84);
        u530.AnchorPoint = Vector2.new(0.5, 0.5);
        u530.BackgroundColor3 = Color3.fromRGB(55, 135, 220);
        u530.Text = "Done";
        u530.TextColor3 = Color3.new(1, 1, 1);
        u530.Font = Enum.Font.GothamBold;
        u530.TextScaled = true;
        u530.Visible = false;
        u530.ZIndex = 202;
        Instance.new("UICorner", u530).CornerRadius = UDim.new(0.2, 0);
        local v531 = Instance.new("UISizeConstraint", u530);
        v531.MinSize = Vector2.new(92, 34);
        v531.MaxSize = Vector2.new(220, 54);
        local v532 = Instance.new("UITextSizeConstraint", u530);
        v532.MaxTextSize = 18;
        v532.MinTextSize = 10;
        u530.MouseButton1Click:Connect(function() --[[ Line: 2591 ]]
            -- upvalues: u509 (copy)
            u509:Destroy();
        end);
        task.defer(function() --[[ Line: 2595 ]]
            -- upvalues: u522 (copy), u521 (copy), u520 (copy), l__TweenService__4 (ref), u523 (ref), u505 (copy), u4 (ref), u20 (ref), u452 (ref), u528 (copy), u530 (copy)
            task.wait();
            if u522.Parent then
                local v533 = 0.5 - (48 * u521 + u520 / 2);
                local v534 = l__TweenService__4:Create(u522, TweenInfo.new(5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                    Position = UDim2.fromScale(v533, 0)
                });
                v534.Completed:Connect(function() --[[ Line: 2610 ]]
                    -- upvalues: u523 (ref), u505 (ref), u4 (ref), u20 (ref), u452 (ref), u528 (ref), u530 (ref)
                    if u523 and u523.Parent then
                        u523.BackgroundColor3 = Color3.fromRGB(86, 76, 40);
                        local v535 = Instance.new("UIStroke", u523);
                        v535.Name = "WinnerStroke";
                        v535.Color = Color3.fromRGB(255, 220, 85);
                        v535.Thickness = 4;
                    end;
                    local v536 = tonumber(u505.RewardAmount) and (tonumber(u505.RewardAmount) > 1 and " x" .. tostring(u505.RewardAmount)) or "";
                    local l__RewardValueText__31 = u505.RewardValueText;
                    if not l__RewardValueText__31 then
                        local l__RewardItemId__32 = u505.RewardItemId;
                        if u4 then
                            local v537 = u4.GetItemValue(l__RewardItemId__32);
                            l__RewardValueText__31 = not v537 and "N/A" or u20((math.floor(v537 + 0.5)));
                        else
                            l__RewardValueText__31 = "N/A";
                        end;
                    end;
                    local v538 = tostring(l__RewardValueText__31);
                    local v539 = u505.RewardChanceText or u452({
                        EffectiveChance = u505.RewardChance
                    });
                    local v540 = tostring(v539);
                    u528.Text = string.format("You got\n%s%s\n%s  %s", tostring(u505.RewardName or u505.RewardItemId), v536, v538, v540);
                    u528.Visible = true;
                    u530.Visible = true;
                end);
                v534:Play();
            end;
        end);
    end;
end;
local function u614(p542, p543, p544) --[[ Line: 2643 ]]
    -- upvalues: l__Players__1 (copy), l__GameDatabase__19 (copy), u20 (copy), u4 (ref), u442 (copy), u11 (copy)
    local l__LocalPlayer__33 = l__Players__1.LocalPlayer;
    if l__LocalPlayer__33 then
        l__LocalPlayer__33 = l__Players__1.LocalPlayer:FindFirstChildOfClass("PlayerGui");
    end;
    local v545 = p542 or l__LocalPlayer__33;
    if v545 then
        local v546 = v545:FindFirstChild("BulkCaseResultBlocker");
        if v546 then
            v546:Destroy();
        end;
        local v547 = l__GameDatabase__19.Items[p543];
        local v548;
        if p544 then
            v548 = p544.Rewards;
        else
            v548 = p544;
        end;
        local v549 = type(v548) == "table" and (p544.Rewards or {}) or {};
        local v550;
        if p544 then
            v550 = p544.OpenedCount;
        else
            v550 = p544;
        end;
        local v551 = tonumber(v550) or 0;
        local v552 = math.floor(v551);
        local v553 = math.max(v552, 0);
        if p544 then
            p544 = p544.FailedCount;
        end;
        local v554 = tonumber(p544) or 0;
        local v555 = math.floor(v554);
        local v556 = math.max(v555, 0);
        local v557 = table.clone(v549);
        table.sort(v557, function(p558, p559) --[[ Line: 2660 ]]
            local v560 = tonumber(p558.RewardChance) or (1 / 0);
            local v561 = tonumber(p559.RewardChance) or (1 / 0);
            if v560 == v561 then
                return tostring(p558.RewardName or (p558.ItemId or "")) < tostring(p559.RewardName or (p559.ItemId or ""));
            else
                return v560 < v561;
            end;
        end);
        local v562 = math.min(#v557, 6);
        local v563 = math.clamp(v562, 1, 6);
        local v564 = math.max(#v557, 1) / 6;
        local v565 = math.ceil(v564);
        local v566 = math.max(v565, 1);
        local v567 = math.clamp(v566, 1, 3);
        local v568 = math.clamp(v563 * 0.075 + 0.18, 0.34, 0.66);
        local v569 = v567 == 1 and 0.34 or (v567 == 2 and 0.54 or 0.74);
        local v570 = math.clamp(v563 * 96 + 140, 280, 760);
        local v571 = math.clamp(v570 + 24, 300, 820);
        local v572 = v567 == 1 and 270 or (v567 == 2 and 410 or 540);
        local v573 = v567 == 1 and 285 or (v567 == 2 and 430 or 580);
        local u574 = Instance.new("TextButton", v545);
        u574.Name = "BulkCaseResultBlocker";
        u574.Size = UDim2.fromScale(1, 1);
        u574.BackgroundColor3 = Color3.new(0, 0, 0);
        u574.BackgroundTransparency = 0.45;
        u574.Text = "";
        u574.AutoButtonColor = false;
        u574.ZIndex = 260;
        local v575 = Instance.new("Frame", u574);
        v575.Size = UDim2.fromScale(v568, v569);
        v575.Position = UDim2.fromScale(0.5, 0.5);
        v575.AnchorPoint = Vector2.new(0.5, 0.5);
        v575.BackgroundColor3 = Color3.fromRGB(58, 58, 58);
        v575.ZIndex = 261;
        Instance.new("UICorner", v575).CornerRadius = UDim.new(0, 8);
        local v576 = Instance.new("UISizeConstraint", v575);
        v576.MinSize = Vector2.new(v570, v572);
        v576.MaxSize = Vector2.new(v571, v573);
        local v577 = Instance.new("TextLabel", v575);
        v577.Size = UDim2.new(1, -40, 0, 24);
        v577.Position = UDim2.new(0, 20, 0, 8);
        v577.BackgroundTransparency = 1;
        local l__format__34 = string.format;
        local v578 = "Opened %s x%s";
        if v547 then
            p543 = v547.Name or p543;
        end;
        v577.Text = l__format__34(v578, tostring(p543), u20(v553));
        v577.TextColor3 = Color3.new(1, 1, 1);
        v577.Font = Enum.Font.GothamBold;
        v577.TextScaled = true;
        v577.TextWrapped = false;
        v577.TextTruncate = Enum.TextTruncate.AtEnd;
        v577.TextYAlignment = Enum.TextYAlignment.Center;
        v577.ZIndex = 264;
        local v579 = Instance.new("UITextSizeConstraint", v577);
        v579.MaxTextSize = 22;
        v579.MinTextSize = 12;
        local v580 = Instance.new("TextLabel", v575);
        v580.Size = UDim2.new(1, -40, 0, 18);
        v580.Position = UDim2.new(0, 20, 0, 36);
        v580.BackgroundTransparency = 1;
        v580.Text = v556 > 0 and "Restored failed rolls: x" .. u20(v556) or "All selected owned cases were opened.";
        v580.TextColor3 = Color3.fromRGB(220, 225, 235);
        v580.Font = Enum.Font.GothamSemibold;
        v580.TextScaled = true;
        v580.TextWrapped = false;
        v580.TextTruncate = Enum.TextTruncate.AtEnd;
        v580.TextYAlignment = Enum.TextYAlignment.Center;
        v580.ZIndex = 264;
        local v581 = Instance.new("UITextSizeConstraint", v580);
        v581.MaxTextSize = 13;
        v581.MinTextSize = 9;
        local v582 = Instance.new("ScrollingFrame", v575);
        v582.Size = UDim2.new(0.92, 0, 1, -126);
        v582.Position = UDim2.new(0.04, 0, 0, 66);
        v582.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
        v582.BorderSizePixel = 0;
        v582.ScrollBarThickness = 5;
        v582.CanvasSize = UDim2.fromScale(0, 0);
        v582.AutomaticCanvasSize = Enum.AutomaticSize.Y;
        v582.ZIndex = 262;
        Instance.new("UICorner", v582).CornerRadius = UDim.new(0, 7);
        local v583 = Instance.new("UIPadding", v582);
        v583.PaddingTop = UDim.new(0, 8);
        v583.PaddingBottom = UDim.new(0, 8);
        v583.PaddingLeft = UDim.new(0, 8);
        v583.PaddingRight = UDim.new(0, 8);
        local v584 = Instance.new("UIGridLayout", v582);
        v584.SortOrder = Enum.SortOrder.LayoutOrder;
        v584.CellPadding = UDim2.new(0, 7, 0, 7);
        v584.CellSize = UDim2.new(0, 108, 0, 132);
        v584.HorizontalAlignment = Enum.HorizontalAlignment.Center;
        local function v595(p585, p586, p587, p588, p589, p590, p591, p592) --[[ Line: 2757 ]]
            local v593 = Instance.new("TextLabel", p585);
            v593.Name = p586;
            v593.Position = p588;
            v593.Size = p589;
            v593.BackgroundTransparency = 1;
            v593.Text = p587;
            v593.TextColor3 = p590;
            v593.Font = p592 or Enum.Font.GothamSemibold;
            v593.TextScaled = true;
            v593.TextWrapped = true;
            v593.TextTruncate = Enum.TextTruncate.AtEnd;
            v593.ZIndex = p585.ZIndex + 1;
            local v594 = Instance.new("UITextSizeConstraint", v593);
            v594.MaxTextSize = p591;
            v594.MinTextSize = 7;
            return v593;
        end;
        for v596, v597 in ipairs(v557) do
            local l__ItemId__35 = v597.ItemId;
            local v598;
            if l__ItemId__35 then
                v598 = l__GameDatabase__19.Items[l__ItemId__35];
            else
                v598 = l__ItemId__35;
            end;
            local v599 = tonumber(v597.Amount) or 0;
            local v600 = math.floor(v599);
            local v601 = math.max(v600, 0);
            local v602 = tostring(v597.RewardChanceText or "");
            local l__RewardValueText__36 = v597.RewardValueText;
            if not l__RewardValueText__36 then
                if l__ItemId__35 then
                    local v603;
                    if u4 then
                        local v604 = u4.GetItemValue(l__ItemId__35);
                        v603 = not v604 and "N/A" or u20((math.floor(v604 + 0.5)));
                    else
                        v603 = "N/A";
                    end;
                    l__RewardValueText__36 = v603 or "";
                else
                    l__RewardValueText__36 = "";
                end;
            end;
            local v605 = tostring(l__RewardValueText__36);
            local v606 = tostring(v597.RewardName or (v598 and v598.Name or (l__ItemId__35 or "Reward")));
            local v607 = Instance.new("Frame", v582);
            v607.Name = "RewardCard";
            v607.LayoutOrder = v596;
            v607.BackgroundColor3 = Color3.fromRGB(68, 68, 68);
            v607.BorderSizePixel = 0;
            v607.ClipsDescendants = true;
            v607.ZIndex = 263;
            Instance.new("UICorner", v607).CornerRadius = UDim.new(0, 8);
            local v608 = Instance.new("ImageLabel", v607);
            v608.Name = "Image";
            v608.Size = UDim2.fromScale(0.68, 0.44);
            v608.Position = UDim2.fromScale(0.5, 0.055);
            v608.AnchorPoint = Vector2.new(0.5, 0);
            v608.BackgroundTransparency = 1;
            v608.ScaleType = Enum.ScaleType.Fit;
            v608.ZIndex = 264;
            if v598 then
                u442(v608, v598);
            elseif v597.RewardImageId then
                v608.Image = v597.RewardImageId;
            end;
            if v601 > 1 then
                local v609 = Instance.new("TextLabel", v607);
                v609.Name = "AmountBadge";
                v609.Size = UDim2.fromScale(0.34, 0.15);
                v609.Position = UDim2.fromScale(0.95, 0.05);
                v609.AnchorPoint = Vector2.new(1, 0);
                v609.BackgroundColor3 = Color3.fromRGB(35, 145, 220);
                v609.Text = "x" .. u20(v601);
                v609.TextColor3 = Color3.new(1, 1, 1);
                v609.Font = Enum.Font.GothamBold;
                v609.TextScaled = true;
                v609.ZIndex = 265;
                Instance.new("UICorner", v609).CornerRadius = UDim.new(0, 5);
                local v610 = Instance.new("UITextSizeConstraint", v609);
                v610.MaxTextSize = 12;
                v610.MinTextSize = 7;
            end;
            v595(v607, "Name", v606, UDim2.fromScale(0.06, 0.51), UDim2.fromScale(0.88, 0.15), Color3.new(1, 1, 1), 11, Enum.Font.GothamBold);
            v595(v607, "Chance", v602 == "" and "Chance: ?" or ("Chance: " .. v602 or "Chance: ?"), UDim2.fromScale(0.06, 0.66), UDim2.fromScale(0.88, 0.13), Color3.fromRGB(255, 230, 120), 10, Enum.Font.GothamSemibold);
            v595(v607, "Value", (v605 == "" or not v605) and "N/A" or v605, UDim2.fromScale(0.06, 0.81), UDim2.fromScale(0.88, 0.12), u11, 10, Enum.Font.GothamSemibold);
        end;
        if #v557 <= 0 then
            local v611 = Instance.new("TextLabel", v582);
            v611.Size = UDim2.new(1, -4, 0, 44);
            v611.BackgroundTransparency = 1;
            v611.Text = "No rewards returned.";
            v611.TextColor3 = Color3.fromRGB(235, 235, 235);
            v611.Font = Enum.Font.GothamSemibold;
            v611.TextScaled = true;
            v611.ZIndex = 263;
        end;
        local v612 = Instance.new("TextButton", v575);
        v612.Size = UDim2.new(0, 154, 0, 32);
        v612.Position = UDim2.new(0.5, 0, 1, -16);
        v612.AnchorPoint = Vector2.new(0.5, 1);
        v612.BackgroundColor3 = Color3.fromRGB(55, 135, 220);
        v612.Text = "Done";
        v612.TextColor3 = Color3.new(1, 1, 1);
        v612.Font = Enum.Font.GothamBold;
        v612.TextScaled = true;
        v612.ZIndex = 262;
        Instance.new("UICorner", v612).CornerRadius = UDim.new(0, 6);
        local v613 = Instance.new("UITextSizeConstraint", v612);
        v613.MaxTextSize = 20;
        v613.MinTextSize = 10;
        v612.MouseButton1Click:Connect(function() --[[ Line: 2859 ]]
            -- upvalues: u574 (copy)
            u574:Destroy();
        end);
    end;
end;
u17 = function(u615, u616, p617) --[[ Line: 2864 ]]
    -- upvalues: l__OpenCaseFunction__11 (copy), u466 (copy), u614 (copy), u541 (copy)
    if l__OpenCaseFunction__11 then
        local v618, v619 = pcall(function() --[[ Line: 2869 ]]
            -- upvalues: l__OpenCaseFunction__11 (ref), u615 (copy), u616 (copy)
            return l__OpenCaseFunction__11:InvokeServer(u615, u616);
        end);
        if v618 then
            if v619 and v619.Success then
                if v619.Bulk == true then
                    u614(p617, u615, v619);
                    return v619;
                else
                    u541(p617, u615, v619);
                    return v619;
                end;
            else
                if v619 and v619.Error == "CaseBusy" then
                    return v619;
                end;
                if u616 == "Open3Owned" or u616 == "OpenAllOwned" then
                    u466(p617, "Could not open cases: " .. tostring(v619 and (v619.Error or "Unknown") or "Unknown"));
                end;
                return v619;
            end;
        else
            return nil;
        end;
    end;
end;
local function u812(u620, p621, u622, u623, u624, p625) --[[ Line: 2897 ]]
    -- upvalues: l__GameDatabase__19 (copy), u466 (copy), u6 (ref), u459 (copy), u442 (copy), u452 (copy), u20 (copy), u4 (ref), u11 (copy), u57 (copy), u438 (copy), l__ClientPlayerState__21 (copy), l__Players__1 (copy), u17 (ref), u221 (copy)
    local u626 = l__GameDatabase__19.Items[u620];
    local l__Cases__37 = l__GameDatabase__19.Cases;
    if l__Cases__37 then
        l__Cases__37 = l__GameDatabase__19.Cases[u620];
    end;
    if u626 and type(l__Cases__37) == "table" then
        local v627 = p621 or u622;
        if v627 then
            local v628 = v627:FindFirstChild("CaseContentsView");
            if v628 then
                v628:Destroy();
            end;
            local v629;
            if p621 then
                v629 = p621:FindFirstChild((tostring(p625 or ""))) or (p621:FindFirstChild("Buy") or p621:FindFirstChild("Owned"));
            else
                v629 = nil;
            end;
            local u630 = {};
            for _, v631 in ipairs(v627:GetChildren()) do
                if v631:IsA("GuiObject") then
                    table.insert(u630, {
                        Object = v631,
                        Visible = v631.Visible
                    });
                    v631.Visible = false;
                end;
            end;
            local u632 = Instance.new("Frame", v627);
            u632.Name = "CaseContentsView";
            u632.Size = UDim2.fromScale(1, 1);
            u632.Position = UDim2.fromScale(1, 0.5);
            u632.AnchorPoint = v629 and v629.AnchorPoint or Vector2.new(0, 0);
            u632.BackgroundColor3 = v629 and v629.BackgroundColor3 or Color3.fromRGB(54, 54, 54);
            u632.BackgroundTransparency = v629 and v629.BackgroundTransparency or 0;
            u632.BorderSizePixel = 0;
            u632.Visible = true;
            u632.ZIndex = 151;
            local v633 = Instance.new("UIStroke", u632);
            v633.Color = Color3.fromRGB(88, 88, 88);
            v633.Thickness = 2;
            local v634 = Instance.new("UIPadding", u632);
            v634.PaddingTop = UDim.new(0.018, 0);
            v634.PaddingBottom = UDim.new(0.018, 0);
            v634.PaddingLeft = UDim.new(0.018, 0);
            v634.PaddingRight = UDim.new(0.018, 0);
            local v635 = Instance.new("TextLabel", u632);
            v635.Size = UDim2.fromScale(0.56, 0.1);
            v635.Position = UDim2.fromScale(0.035, 0);
            v635.BackgroundTransparency = 1;
            v635.Text = tostring(u626.Name or u620);
            v635.TextColor3 = Color3.new(1, 1, 1);
            v635.TextXAlignment = Enum.TextXAlignment.Left;
            v635.Font = Enum.Font.GothamBold;
            v635.TextScaled = true;
            v635.ZIndex = 152;
            local v636 = Instance.new("UITextSizeConstraint", v635);
            v636.MaxTextSize = 26;
            v636.MinTextSize = 12;
            local v637 = Instance.new("TextLabel", u632);
            v637.Size = UDim2.fromScale(0.17, 0.075);
            v637.Position = UDim2.fromScale(0.715, 0);
            v637.BackgroundColor3 = Color3.fromRGB(205, 160, 20);
            v637.Text = tostring(u626.TimerText or (u626.TimeLeftText or "LIMITED"));
            v637.TextColor3 = Color3.new(1, 1, 1);
            v637.TextScaled = true;
            v637.Font = Enum.Font.GothamBold;
            v637.ZIndex = 152;
            Instance.new("UICorner", v637).CornerRadius = UDim.new(0.18, 0);
            local v638 = Instance.new("UITextSizeConstraint", v637);
            v638.MaxTextSize = 13;
            v638.MinTextSize = 8;
            local v639 = Instance.new("TextButton", u632);
            v639.Size = UDim2.fromScale(0.06, 0.09);
            v639.Position = UDim2.fromScale(0.91, 0);
            v639.BackgroundColor3 = Color3.fromRGB(180, 60, 60);
            v639.Text = "X";
            v639.TextColor3 = Color3.new(1, 1, 1);
            v639.Font = Enum.Font.GothamBold;
            v639.TextScaled = true;
            v639.ZIndex = 152;
            Instance.new("UICorner", v639).CornerRadius = UDim.new(0.18, 0);
            local v640 = Instance.new("UISizeConstraint", v639);
            v640.MinSize = Vector2.new(26, 26);
            v640.MaxSize = Vector2.new(48, 48);
            local v641 = Instance.new("ScrollingFrame", u632);
            v641.Name = "Rewards";
            v641.Size = UDim2.fromScale(0.94, 0.78);
            v641.Position = UDim2.fromScale(0.03, 0.11);
            v641.BackgroundColor3 = Color3.fromRGB(58, 58, 58);
            v641.BackgroundTransparency = 0;
            v641.BorderSizePixel = 0;
            v641.ScrollBarThickness = 0;
            v641.CanvasSize = UDim2.fromScale(0, 0);
            v641.AutomaticCanvasSize = Enum.AutomaticSize.Y;
            v641.ScrollingDirection = Enum.ScrollingDirection.Y;
            v641.ZIndex = 152;
            Instance.new("UICorner", v641).CornerRadius = UDim.new(0.025, 0);
            local v642 = Instance.new("UIGridLayout", v641);
            local v643 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720);
            local v644 = v643.X < 900 and true or v643.Y < 520;
            v642.CellSize = v644 and UDim2.fromScale(0.31, 0.76) or UDim2.fromScale(0.19, 0.65);
            v642.CellPadding = v644 and UDim2.fromScale(0.02, 0.04) or UDim2.fromScale(0.01, 0.01);
            v642.FillDirection = Enum.FillDirection.Horizontal;
            v642.FillDirectionMaxCells = 0;
            v642.HorizontalAlignment = Enum.HorizontalAlignment.Left;
            v642.SortOrder = Enum.SortOrder.LayoutOrder;
            local v645 = Instance.new("UIPadding", v641);
            v645.PaddingTop = UDim.new(0, 0);
            v645.PaddingLeft = UDim.new(0, 4);
            v645.PaddingRight = UDim.new(0, 0);
            v645.PaddingBottom = UDim.new(0, 4);
            local u646 = {};
            local function u662() --[[ Line: 3032 ]]
                -- upvalues: u646 (copy), u6 (ref)
                local v647, v648, v649, v650, v651, v652, v653, v654, v655, v656;
                local v657 = 0;
                while true do
                    if v657 == 0 then
                        v657 = -1;
                        -- block 13
                        v650, v651, v652 = ipairs(u646);
                        -- block 2
                        v653 = v647.ItemKey;
                        local l__ItemType__38 = v647.ItemType;
                        local v658 = ipairs;
                        local v659 = u6[l__ItemType__38];
                        if not v659 then
                            v659 = {};
                            u6[l__ItemType__38] = v659;
                        end;
                        v654, v648, v649 = v658(v659);
                        v657 = 1;
                        continue;
                    elseif v657 == 1 then
                        v657 = -1;
                        local v660;
                        if type(v654) == "function" then
                            v660, v655 = v654(v648, v649);
                        else
                            v660, v655 = next(v654, v649);
                        end;
                        if v660 ~= nil then
                            v649 = v660;
                            v656 = false;
                            v657 = 3;
                            continue;
                        else
                            break;
                        end;
                    elseif v657 == 2 then
                        v657 = -1;
                        if v655 ~= v653 then
                            v657 = 1;
                            continue;
                        end;
                        v656 = true;
                        v657 = 3;
                        continue;
                    elseif v657 == 3 then
                        v657 = -1;
                        if v656 then
                            v647.Button.Text = "Cancel";
                            v647.Button.BackgroundColor3 = Color3.fromRGB(220, 60, 60);
                        else
                            v647.Button.Text = "Try";
                            v647.Button.BackgroundColor3 = Color3.fromRGB(50, 150, 255);
                        end;
                        local v661;
                        if type(v650) == "function" then
                            v661, v647 = v650(v651, v652);
                        else
                            v661, v647 = next(v650, v652);
                        end;
                        if v661 ~= nil then
                            v652 = v661;
                            v657 = 2;
                            continue;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
            end;
            local v663 = {};
            for _, v664 in ipairs((u459(u620))) do
                local l__Entry__39 = v664.Entry;
                if type(l__Entry__39) == "table" then
                    l__Entry__39.EffectiveChance = v664.Probability;
                    table.insert(v663, {
                        Entry = l__Entry__39,
                        OriginalIndex = v664.OriginalIndex or 0,
                        Probability = v664.Probability
                    });
                end;
            end;
            table.sort(v663, function(p665, p666) --[[ Line: 3057 ]]
                local v667 = tonumber(p665.Probability);
                if not v667 then
                    local l__Entry__40 = p665.Entry;
                    local v668;
                    if l__Entry__40 then
                        v668 = l__Entry__40.EffectiveChance;
                    else
                        v668 = l__Entry__40;
                    end;
                    v667 = tonumber(v668);
                    if not v667 then
                        local v669;
                        if l__Entry__40 then
                            v669 = l__Entry__40.Probability;
                        else
                            v669 = l__Entry__40;
                        end;
                        v667 = tonumber(v669);
                        if not v667 then
                            if l__Entry__40 then
                                l__Entry__40 = l__Entry__40.Chance;
                            end;
                            v667 = tonumber(l__Entry__40) or 0;
                        end;
                    end;
                end;
                local v670 = tonumber(p666.Probability);
                if not v670 then
                    local l__Entry__41 = p666.Entry;
                    local v671;
                    if l__Entry__41 then
                        v671 = l__Entry__41.EffectiveChance;
                    else
                        v671 = l__Entry__41;
                    end;
                    v670 = tonumber(v671);
                    if not v670 then
                        local v672;
                        if l__Entry__41 then
                            v672 = l__Entry__41.Probability;
                        else
                            v672 = l__Entry__41;
                        end;
                        v670 = tonumber(v672);
                        if not v670 then
                            if l__Entry__41 then
                                l__Entry__41 = l__Entry__41.Chance;
                            end;
                            v670 = tonumber(l__Entry__41) or 0;
                        end;
                    end;
                end;
                if v667 == v670 then
                    return p665.OriginalIndex < p666.OriginalIndex;
                else
                    return v670 < v667;
                end;
            end);
            for v673, v674 in ipairs(v663) do
                local l__Entry__42 = v674.Entry;
                local l__ItemId__43 = l__Entry__42.ItemId;
                local v675;
                if l__ItemId__43 then
                    v675 = l__GameDatabase__19.Items[l__ItemId__43];
                else
                    v675 = l__ItemId__43;
                end;
                if v675 then
                    local v676;
                    if v675 then
                        v676 = v675.Type;
                    else
                        v676 = v675;
                    end;
                    local u677 = v676 == "Skins" and "Skin" or ((v676 == "Accessory" or (v676 == "Accessories" or (v676 == "Hat" or v676 == "Hats"))) and "Accessory" or (v676 == "Abilities" and "Ability" or (v676 == "Cases" and "Case" or v676)));
                    local v678 = Instance.new("Frame", v641);
                    v678.Name = tostring(l__ItemId__43);
                    v678.LayoutOrder = v673;
                    v678.BackgroundColor3 = Color3.fromRGB(70, 70, 70);
                    v678.BorderSizePixel = 0;
                    v678.ClipsDescendants = true;
                    v678.ZIndex = 153;
                    Instance.new("UICorner", v678).CornerRadius = UDim.new(0.045, 0);
                    local v679 = Instance.new("UISizeConstraint", v678);
                    v679.MinSize = Vector2.new(70, 92);
                    v679.MaxSize = Vector2.new(180, 220);
                    local v680 = Instance.new("ImageLabel", v678);
                    v680.Size = UDim2.fromScale(1, 0.6);
                    v680.Position = UDim2.fromScale(0.5, 0);
                    v680.AnchorPoint = Vector2.new(0.5, 0);
                    v680.BackgroundTransparency = 1;
                    v680.ScaleType = Enum.ScaleType.Fit;
                    v680.ZIndex = 154;
                    u442(v680, v675);
                    local v681 = Instance.new("TextLabel", v678);
                    v681.Size = UDim2.fromScale(0.94, 0.105);
                    v681.Position = UDim2.fromScale(0.03, 0.58);
                    v681.BackgroundTransparency = 1;
                    v681.Text = tostring(v675.Name or l__ItemId__43);
                    v681.TextColor3 = Color3.new(1, 1, 1);
                    v681.Font = Enum.Font.GothamBold;
                    v681.TextScaled = true;
                    v681.TextWrapped = false;
                    v681.TextTruncate = Enum.TextTruncate.AtEnd;
                    v681.ZIndex = 154;
                    local v682 = Instance.new("UITextSizeConstraint", v681);
                    v682.MaxTextSize = 16;
                    v682.MinTextSize = 8;
                    local v683 = Instance.new("TextLabel", v678);
                    v683.Size = UDim2.fromScale(0.94, 0.072);
                    v683.Position = UDim2.fromScale(0.03, 0.65);
                    v683.BackgroundTransparency = 1;
                    v683.Text = u452(l__Entry__42);
                    v683.TextColor3 = Color3.fromRGB(205, 210, 220);
                    v683.Font = Enum.Font.GothamSemibold;
                    v683.TextScaled = true;
                    v683.ZIndex = 154;
                    local v684 = Instance.new("UITextSizeConstraint", v683);
                    v684.MaxTextSize = 15;
                    v684.MinTextSize = 8;
                    local v685 = tonumber(l__Entry__42.Amount) or 1;
                    local v686 = math.floor(v685);
                    local v687 = math.max(v686, 1);
                    local v688;
                    if v687 > 1 then
                        local v689 = Instance.new("TextLabel", v678);
                        v689.Size = UDim2.fromScale(0.94, 0.06);
                        v689.Position = UDim2.fromScale(0.03, 0.685);
                        v689.BackgroundTransparency = 1;
                        v689.Text = "x" .. u20(v687);
                        v689.TextColor3 = Color3.fromRGB(220, 225, 235);
                        v689.Font = Enum.Font.GothamSemibold;
                        v689.TextScaled = true;
                        v689.ZIndex = 154;
                        local v690 = Instance.new("UITextSizeConstraint", v689);
                        v690.MaxTextSize = 14;
                        v690.MinTextSize = 8;
                        v688 = 0.75;
                    else
                        v688 = 0.72;
                    end;
                    if v675.TotalStats == true then
                        local v691 = Instance.new("TextLabel", v678);
                        v691.Size = UDim2.fromScale(0.94, 0.075);
                        v691.Position = UDim2.fromScale(0.03, v688);
                        v691.BackgroundTransparency = 1;
                        local v692;
                        if u4 then
                            local v693 = u4.GetItemValue(l__ItemId__43);
                            v692 = not v693 and "N/A" or u20((math.floor(v693 + 0.5)));
                        else
                            v692 = "N/A";
                        end;
                        v691.Text = v692;
                        v691.TextColor3 = u11;
                        v691.Font = Enum.Font.GothamBold;
                        v691.TextScaled = true;
                        v691.ZIndex = 154;
                        local v694 = Instance.new("UITextSizeConstraint", v691);
                        v694.MaxTextSize = 14;
                        v694.MinTextSize = 8;
                    end;
                    local v695 = Instance.new("TextButton", v678);
                    v695.Size = UDim2.fromScale(0.88, 0.11);
                    v695.Position = UDim2.fromScale(0.06, 0.875);
                    v695.TextColor3 = Color3.new(1, 1, 1);
                    v695.Font = Enum.Font.GothamBold;
                    v695.TextScaled = true;
                    v695.ZIndex = 154;
                    Instance.new("UICorner", v695).CornerRadius = UDim.new(0.18, 0);
                    local v696 = Instance.new("UITextSizeConstraint", v695);
                    v696.MaxTextSize = 14;
                    v696.MinTextSize = 8;
                    if u677 == "Skin" or u677 == "Accessory" then
                        table.insert(u646, {
                            Button = v695,
                            ItemKey = l__ItemId__43,
                            ItemType = u677
                        });
                        v695.MouseButton1Click:Connect(function() --[[ Line: 3183 ]]
                            -- upvalues: u57 (ref), l__ItemId__43 (copy), u677 (copy), u438 (ref), u623 (copy), u624 (copy), u662 (copy)
                            u57(l__ItemId__43, u677);
                            u438(u623, u624);
                            u662();
                        end);
                    else
                        v695.AutoButtonColor = false;
                        v695.BackgroundColor3 = Color3.fromRGB(95, 95, 95);
                        v695.Text = u677 == "Ability" and "Ability" or "No Try";
                    end;
                end;
            end;
            u662();
            local u697 = Instance.new("Frame", u632);
            u697.Size = UDim2.fromScale(0.94, 0.115);
            u697.Position = UDim2.fromScale(0.03, 0.9);
            u697.BackgroundTransparency = 1;
            u697.ZIndex = 152;
            local v698 = Instance.new("UIListLayout", u697);
            v698.FillDirection = Enum.FillDirection.Horizontal;
            v698.HorizontalAlignment = Enum.HorizontalAlignment.Center;
            v698.VerticalAlignment = Enum.VerticalAlignment.Center;
            v698.Padding = UDim.new(0.015, 0);
            v698.SortOrder = Enum.SortOrder.LayoutOrder;
            local v699;
            if p625 == "Owned" then
                v699 = false;
            else
                v699 = type(u626.Price) == "number" and true or tonumber(u626.Price);
            end;
            local v700 = l__ClientPlayerState__21.GetProxy("Gamepasses", l__Players__1.LocalPlayer) or l__ClientPlayerState__21.WaitForProxy("Gamepasses", l__Players__1.LocalPlayer, 2);
            local v701, v702;
            if v700 then
                v701 = v700:GetAttribute("Pro") == true;
                v702 = v701 or v700:GetAttribute("Plus") == true;
            else
                v702 = false;
                v701 = false;
            end;
            local v703 = 1;
            if v702 then
                v703 = v703 + 1;
            end;
            if v701 then
                v703 = v703 + 1;
            end;
            if v699 then
                v703 = v703 + 2;
            end;
            local u704 = v703 >= 5 and 0.18 or (v703 >= 4 and 0.23 or 0.32);
            local function v709(p705, p706) --[[ Line: 3225 ]]
                -- upvalues: u697 (copy), u704 (copy)
                local v707 = Instance.new("TextButton", u697);
                v707.Size = UDim2.fromScale(u704, 0.86);
                v707.BackgroundColor3 = p706;
                v707.Text = p705;
                v707.TextColor3 = Color3.new(1, 1, 1);
                v707.Font = Enum.Font.GothamBold;
                v707.TextScaled = true;
                v707.ZIndex = 153;
                Instance.new("UICorner", v707).CornerRadius = UDim.new(0.15, 0);
                local v708 = Instance.new("UITextSizeConstraint", v707);
                v708.MaxTextSize = 14;
                v708.MinTextSize = 8;
                return v707;
            end;
            local u710 = v709("Open 1", Color3.fromRGB(55, 135, 220));
            local u711;
            if v702 then
                u711 = v709("Open 3", Color3.fromRGB(120, 90, 220)) or nil;
            else
                u711 = nil;
            end;
            local u712;
            if v701 then
                u712 = v709("Open all", Color3.fromRGB(130, 90, 220)) or nil;
            else
                u712 = nil;
            end;
            local u713;
            if v699 then
                u713 = v709("Buy & open", Color3.fromRGB(70, 170, 80)) or nil;
            else
                u713 = nil;
            end;
            local v714 = v699 and v709("Buy case", Color3.fromRGB(180, 140, 40)) or nil;
            local u715 = 0;
            local u716 = 0;
            local u717 = nil;
            u717 = function() --[[ Line: 3309 ]]
                -- upvalues: u620 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u715 (ref), u710 (copy), u711 (copy), u712 (copy), u713 (copy)
                local v718 = u620;
                local v719 = l__ClientPlayerState__21.GetProxy("Inventory", l__Players__1.LocalPlayer);
                if v719 then
                    v719 = v719:FindFirstChild(v718);
                end;
                local v720;
                if v719 then
                    local v721 = v719:GetAttribute("Amount");
                    v720 = v721 == nil and 1 or (tonumber(v721) or 0);
                else
                    v720 = 0;
                end;
                local v722 = v720 > 0;
                local v723 = u715 - time();
                local v724 = math.max(v723, 0);
                local v725 = v724 > 0;
                local v726 = math.ceil(v724);
                local v727 = "Wait " .. tostring(v726) .. "s";
                local v728 = u710;
                local v729;
                if v722 then
                    v729 = not v725;
                else
                    v729 = v722;
                end;
                local v730 = v725 and v727 and v727 or (v722 and "Open 1" or "No cases");
                local v731 = Color3.fromRGB(55, 135, 220);
                if v728 then
                    v728.Text = v730;
                    v728.BackgroundColor3 = v729 and v731 and v731 or Color3.fromRGB(95, 95, 95);
                    v728.AutoButtonColor = v729;
                    v728.Active = v729;
                end;
                local v732 = u711;
                local v733;
                if v722 then
                    v733 = not v725;
                else
                    v733 = v722;
                end;
                local v734 = v725 and v727 and v727 or (v722 and "Open 3" or "No cases");
                local v735 = Color3.fromRGB(120, 90, 220);
                if v732 then
                    v732.Text = v734;
                    v732.BackgroundColor3 = v733 and v735 and v735 or Color3.fromRGB(95, 95, 95);
                    v732.AutoButtonColor = v733;
                    v732.Active = v733;
                end;
                local v736 = u712;
                local v737;
                if v722 then
                    v737 = not v725;
                else
                    v737 = v722;
                end;
                local v738 = v725 and v727 and v727 or (v722 and "Open all" or "No cases");
                local v739 = Color3.fromRGB(130, 90, 220);
                if v736 then
                    v736.Text = v738;
                    v736.BackgroundColor3 = v737 and v739 and v739 or Color3.fromRGB(95, 95, 95);
                    v736.AutoButtonColor = v737;
                    v736.Active = v737;
                end;
                if u713 then
                    local v740 = u713;
                    local v741 = not v725;
                    local v742 = v725 and v727 and v727 or "Buy & open";
                    local v743 = Color3.fromRGB(70, 170, 80);
                    if not v740 then
                        return;
                    end;
                    v740.Text = v742;
                    v740.BackgroundColor3 = v741 and v743 and v743 or Color3.fromRGB(95, 95, 95);
                    v740.AutoButtonColor = v741;
                    v740.Active = v741;
                end;
            end;
            u717();
            local u744 = l__ClientPlayerState__21.WaitForProxy("Inventory", l__Players__1.LocalPlayer, 10);
            if u744 then
                local u745 = nil;
                local u746 = false;
                local function u748() --[[ Line: 3332 ]]
                    -- upvalues: u746 (ref), u630 (copy)
                    if u746 then
                    else
                        u746 = true;
                        for _, v747 in ipairs(u630) do
                            if v747.Object and v747.Object.Parent then
                                v747.Object.Visible = v747.Visible;
                            end;
                        end;
                    end;
                end;
                if u745 then
                    u745:Disconnect();
                    u745 = nil;
                end;
                local v749 = u744:FindFirstChild(u620);
                if v749 then
                    u745 = v749:GetAttributeChangedSignal("Amount"):Connect(u717);
                end;
                u717();
                local u752 = u744.ChildAdded:Connect(function(p750) --[[ Line: 3361 ]]
                    -- upvalues: u620 (copy), u745 (ref), u744 (copy), u717 (ref)
                    if p750.Name == u620 then
                        if u745 then
                            u745:Disconnect();
                            u745 = nil;
                        end;
                        local v751 = u744:FindFirstChild(u620);
                        if v751 then
                            u745 = v751:GetAttributeChangedSignal("Amount"):Connect(u717);
                        end;
                        u717();
                    end;
                end);
                local u755 = u744.ChildRemoved:Connect(function(p753) --[[ Line: 3367 ]]
                    -- upvalues: u620 (copy), u745 (ref), u744 (copy), u717 (ref)
                    if p753.Name == u620 then
                        if u745 then
                            u745:Disconnect();
                            u745 = nil;
                        end;
                        local v754 = u744:FindFirstChild(u620);
                        if v754 then
                            u745 = v754:GetAttributeChangedSignal("Amount"):Connect(u717);
                        end;
                        u717();
                    end;
                end);
                u632.Destroying:Connect(function() --[[ Line: 3373 ]]
                    -- upvalues: u748 (copy), u745 (ref), u752 (copy), u755 (copy)
                    u748();
                    if u745 then
                        u745:Disconnect();
                    end;
                    u752:Disconnect();
                    u755:Disconnect();
                end);
                u710.MouseButton1Click:Connect(function() --[[ Line: 3384 ]]
                    -- upvalues: u620 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u710 (copy), u17 (ref), u622 (copy), u715 (ref), u716 (ref), u632 (copy), u717 (ref)
                    local v756 = u620;
                    local v757 = l__ClientPlayerState__21.GetProxy("Inventory", l__Players__1.LocalPlayer);
                    if v757 then
                        v757 = v757:FindFirstChild(v756);
                    end;
                    local v758;
                    if v757 then
                        local v759 = v757:GetAttribute("Amount");
                        v758 = v759 == nil and 1 or (tonumber(v759) or 0);
                    else
                        v758 = 0;
                    end;
                    if v758 <= 0 then
                    else
                        u710.Text = "Opening...";
                        u710.Active = false;
                        u710.AutoButtonColor = false;
                        local v760 = u17 and u17(u620, "Inventory", u622);
                        if v760 then
                            if v760.Error == "CaseBusy" then
                                local v761 = tonumber(v760.CooldownRemaining or 1) or 0;
                                if v761 > 0 then
                                    local v762 = u715;
                                    local v763 = time() + v761;
                                    u715 = math.max(v762, v763);
                                    u716 = u716 + 1;
                                    local u764 = u716;
                                    task.spawn(function() --[[ Line: 3261 ]]
                                        -- upvalues: u764 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                        while u764 == u716 and u632.Parent do
                                            if u717 then
                                                u717();
                                            end;
                                            local v765 = u715 - time();
                                            if math.max(v765, 0) <= 0 then
                                                break;
                                            end;
                                            task.wait(0.25);
                                        end;
                                    end);
                                end;
                            elseif v760.Success then
                                local v766 = tonumber(v760.CooldownSeconds or 5.05) or 0;
                                if v766 > 0 then
                                    local v767 = u715;
                                    local v768 = time() + v766;
                                    u715 = math.max(v767, v768);
                                    u716 = u716 + 1;
                                    local u769 = u716;
                                    task.spawn(function() --[[ Line: 3261 ]]
                                        -- upvalues: u769 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                        while u769 == u716 and u632.Parent do
                                            if u717 then
                                                u717();
                                            end;
                                            local v770 = u715 - time();
                                            if math.max(v770, 0) <= 0 then
                                                break;
                                            end;
                                            task.wait(0.25);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                        u717();
                    end;
                end);
                if u711 then
                    u711.MouseButton1Click:Connect(function() --[[ Line: 3402 ]]
                        -- upvalues: u620 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u711 (copy), u17 (ref), u622 (copy), u715 (ref), u716 (ref), u632 (copy), u717 (ref)
                        local v771 = u620;
                        local v772 = l__ClientPlayerState__21.GetProxy("Inventory", l__Players__1.LocalPlayer);
                        if v772 then
                            v772 = v772:FindFirstChild(v771);
                        end;
                        local v773;
                        if v772 then
                            local v774 = v772:GetAttribute("Amount");
                            v773 = v774 == nil and 1 or (tonumber(v774) or 0);
                        else
                            v773 = 0;
                        end;
                        if v773 <= 0 then
                        else
                            u711.Text = "Opening...";
                            u711.Active = false;
                            u711.AutoButtonColor = false;
                            local v775 = u17 and u17(u620, "Open3Owned", u622);
                            if v775 then
                                if v775.Error == "CaseBusy" then
                                    local v776 = tonumber(v775.CooldownRemaining or 1) or 0;
                                    if v776 > 0 then
                                        local v777 = u715;
                                        local v778 = time() + v776;
                                        u715 = math.max(v777, v778);
                                        u716 = u716 + 1;
                                        local u779 = u716;
                                        task.spawn(function() --[[ Line: 3261 ]]
                                            -- upvalues: u779 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                            while u779 == u716 and u632.Parent do
                                                if u717 then
                                                    u717();
                                                end;
                                                local v780 = u715 - time();
                                                if math.max(v780, 0) <= 0 then
                                                    break;
                                                end;
                                                task.wait(0.25);
                                            end;
                                        end);
                                    end;
                                elseif v775.Success then
                                    local v781 = tonumber(v775.CooldownSeconds or 5.05) or 0;
                                    if v781 > 0 then
                                        local v782 = u715;
                                        local v783 = time() + v781;
                                        u715 = math.max(v782, v783);
                                        u716 = u716 + 1;
                                        local u784 = u716;
                                        task.spawn(function() --[[ Line: 3261 ]]
                                            -- upvalues: u784 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                            while u784 == u716 and u632.Parent do
                                                if u717 then
                                                    u717();
                                                end;
                                                local v785 = u715 - time();
                                                if math.max(v785, 0) <= 0 then
                                                    break;
                                                end;
                                                task.wait(0.25);
                                            end;
                                        end);
                                    end;
                                end;
                            end;
                            u717();
                        end;
                    end);
                end;
                if u712 then
                    u712.MouseButton1Click:Connect(function() --[[ Line: 3421 ]]
                        -- upvalues: u620 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u712 (copy), u17 (ref), u622 (copy), u715 (ref), u716 (ref), u632 (copy), u717 (ref)
                        local v786 = u620;
                        local v787 = l__ClientPlayerState__21.GetProxy("Inventory", l__Players__1.LocalPlayer);
                        if v787 then
                            v787 = v787:FindFirstChild(v786);
                        end;
                        local v788;
                        if v787 then
                            local v789 = v787:GetAttribute("Amount");
                            v788 = v789 == nil and 1 or (tonumber(v789) or 0);
                        else
                            v788 = 0;
                        end;
                        if v788 <= 0 then
                        else
                            u712.Text = "Opening...";
                            u712.Active = false;
                            u712.AutoButtonColor = false;
                            local v790 = u17 and u17(u620, "OpenAllOwned", u622);
                            if v790 then
                                if v790.Error == "CaseBusy" then
                                    local v791 = tonumber(v790.CooldownRemaining or 1) or 0;
                                    if v791 > 0 then
                                        local v792 = u715;
                                        local v793 = time() + v791;
                                        u715 = math.max(v792, v793);
                                        u716 = u716 + 1;
                                        local u794 = u716;
                                        task.spawn(function() --[[ Line: 3261 ]]
                                            -- upvalues: u794 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                            while u794 == u716 and u632.Parent do
                                                if u717 then
                                                    u717();
                                                end;
                                                local v795 = u715 - time();
                                                if math.max(v795, 0) <= 0 then
                                                    break;
                                                end;
                                                task.wait(0.25);
                                            end;
                                        end);
                                    end;
                                elseif v790.Success then
                                    local v796 = tonumber(v790.CooldownSeconds or 5.05) or 0;
                                    if v796 > 0 then
                                        local v797 = u715;
                                        local v798 = time() + v796;
                                        u715 = math.max(v797, v798);
                                        u716 = u716 + 1;
                                        local u799 = u716;
                                        task.spawn(function() --[[ Line: 3261 ]]
                                            -- upvalues: u799 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                            while u799 == u716 and u632.Parent do
                                                if u717 then
                                                    u717();
                                                end;
                                                local v800 = u715 - time();
                                                if math.max(v800, 0) <= 0 then
                                                    break;
                                                end;
                                                task.wait(0.25);
                                            end;
                                        end);
                                    end;
                                end;
                            end;
                            u717();
                        end;
                    end);
                end;
                if u713 then
                    u713.MouseButton1Click:Connect(function() --[[ Line: 3440 ]]
                        -- upvalues: u713 (copy), u17 (ref), u620 (copy), u622 (copy), u715 (ref), u716 (ref), u632 (copy), u717 (ref)
                        u713.Text = "Opening...";
                        u713.Active = false;
                        u713.AutoButtonColor = false;
                        local v801 = u17 and u17(u620, "BuyAndOpen", u622);
                        if v801 then
                            if v801.Error == "CaseBusy" then
                                local v802 = tonumber(v801.CooldownRemaining or 1) or 0;
                                if v802 > 0 then
                                    local v803 = u715;
                                    local v804 = time() + v802;
                                    u715 = math.max(v803, v804);
                                    u716 = u716 + 1;
                                    local u805 = u716;
                                    task.spawn(function() --[[ Line: 3261 ]]
                                        -- upvalues: u805 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                        while u805 == u716 and u632.Parent do
                                            if u717 then
                                                u717();
                                            end;
                                            local v806 = u715 - time();
                                            if math.max(v806, 0) <= 0 then
                                                break;
                                            end;
                                            task.wait(0.25);
                                        end;
                                    end);
                                end;
                            elseif v801.Success then
                                local v807 = tonumber(v801.CooldownSeconds or 5.05) or 0;
                                if v807 > 0 then
                                    local v808 = u715;
                                    local v809 = time() + v807;
                                    u715 = math.max(v808, v809);
                                    u716 = u716 + 1;
                                    local u810 = u716;
                                    task.spawn(function() --[[ Line: 3261 ]]
                                        -- upvalues: u810 (copy), u716 (ref), u632 (ref), u717 (ref), u715 (ref)
                                        while u810 == u716 and u632.Parent do
                                            if u717 then
                                                u717();
                                            end;
                                            local v811 = u715 - time();
                                            if math.max(v811, 0) <= 0 then
                                                break;
                                            end;
                                            task.wait(0.25);
                                        end;
                                    end);
                                end;
                            end;
                        end;
                        u717();
                    end);
                end;
                if v714 then
                    v714.MouseButton1Click:Connect(function() --[[ Line: 3455 ]]
                        -- upvalues: u632 (copy), u221 (ref), u620 (copy), u626 (copy), u622 (copy)
                        u632:Destroy();
                        u221(u620, u626, u622);
                    end);
                end;
                v639.MouseButton1Click:Connect(function() --[[ Line: 3461 ]]
                    -- upvalues: u632 (copy)
                    u632:Destroy();
                end);
            end;
        end;
    else
        u466(u622, "This case has no configured rewards.");
    end;
end;
local u813 = {
    CurrentFilter = "All",
    Refresh = nil
};
local function u890(u814, u815, u816, u817) --[[ Line: 4040 ]]
    -- upvalues: u14 (ref), l__GameDatabase__19 (copy), u250 (copy), u294 (copy), u812 (ref), l__ClientPlayerState__21 (copy), l__Players__1 (copy), u17 (ref), u221 (copy), l__EquipItemEvent__10 (copy), u108 (copy), u57 (copy), u438 (copy), u32 (copy), u402 (copy), u15 (ref), l__ReplicatedStorage__2 (copy)
    u14 = {};
    local v818 = {};
    for v819, v820 in pairs(l__GameDatabase__19.Items) do
        table.insert(v818, {
            key = v819,
            data = v820
        });
    end;
    table.sort(v818, function(p821, p822) --[[ Line: 4051 ]]
        local l__data__44 = p821.data;
        local v823 = tonumber(l__data__44.Price);
        if not v823 then
            if l__data__44.Price == "Lvl" then
                v823 = tonumber(l__data__44.Lvl) or (1 / 0);
            else
                v823 = l__data__44.Price == "Free" and -2 or (l__data__44.Price == "Owned" and -1 or (1 / 0));
            end;
        end;
        local l__data__45 = p822.data;
        local v824 = tonumber(l__data__45.Price);
        if not v824 then
            if l__data__45.Price == "Lvl" then
                v824 = tonumber(l__data__45.Lvl) or (1 / 0);
            else
                v824 = l__data__45.Price == "Free" and -2 or (l__data__45.Price == "Owned" and -1 or (1 / 0));
            end;
        end;
        if v823 == v824 then
            return tostring(p821.data.Name or p821.key) < tostring(p822.data.Name or p822.key);
        else
            return v823 < v824;
        end;
    end);
    for v825, v826 in ipairs(v818) do
        local l__key__46 = v826.key;
        local l__data__47 = v826.data;
        if l__data__47.InventoryOnly ~= true and l__data__47.ShopHidden ~= true then
            l__data__47 = l__data__47;
            local v827;
            if l__data__47 then
                v827 = l__data__47.Type;
            end;
            local u828 = v827 == "Skins" and "Skin" or ((v827 == "Accessory" or (v827 == "Accessories" or (v827 == "Hat" or v827 == "Hats"))) and "Accessory" or (v827 == "Abilities" and "Ability" or (v827 == "Cases" and "Case" or v827)));
            local u829 = u814:FindFirstChild(u828 == "PassiveBoost" and not l__data__47.ShopCategory and "Abilities" or (u828 == "Case" and "Cases" or (u828 == "Accessory" and "Accessories" or (u828 == "Ability" and "Abilities" or (u828 == "Skin" and "Skins" or (l__data__47.ShopCategory or u828))))));
            if u829 then
                if u828 == "Ability" or u828 == "Case" then
                    local v830 = u829:FindFirstChild("Buy");
                    local v831 = u829:FindFirstChild("Owned");
                    local v832 = {};
                    if u828 == "Case" then
                        if (type(l__data__47.Price) == "number" or tonumber(l__data__47.Price)) and v830 then
                            table.insert(v832, v830);
                        end;
                        if v831 then
                            table.insert(v832, v831);
                        end;
                    else
                        if v830 then
                            table.insert(v832, v830);
                        end;
                        if v831 then
                            table.insert(v832, v831);
                        end;
                    end;
                    if #v832 <= 0 and u828 == "Case" then
                        table.insert(v832, u829);
                    end;
                    for _, u833 in ipairs(v832) do
                        local v834 = u250(l__key__46, l__data__47, u833);
                        v834.LayoutOrder = v825 or 0;
                        table.insert(u14, {
                            clone = v834,
                            key = l__key__46,
                            data = l__data__47
                        });
                        u294(v834, l__key__46, l__data__47);
                        local v835 = v834:FindFirstChild("BottomRow");
                        local v836;
                        if v835 then
                            v836 = v835:FindFirstChild("Button");
                        else
                            v836 = v835;
                        end;
                        local v837 = v834:FindFirstChild("TryBtn");
                        if v837 then
                            v835 = v837;
                        elseif v835 then
                            v835 = v835:FindFirstChild("TryBtn");
                        end;
                        if v835 then
                            v835.MouseButton1Click:Connect(function() --[[ Line: 4141 ]]
                                -- upvalues: u828 (copy), u812 (ref), l__key__46 (copy), u829 (copy), u815 (copy), u816 (copy), u817 (copy), u833 (copy)
                                if u828 == "Case" and u812 then
                                    u812(l__key__46, u829, u815, u816, u817, u833.Name);
                                end;
                            end);
                        end;
                        if v836 then
                            v836.MouseButton1Click:Connect(function() --[[ Line: 4149 ]]
                                -- upvalues: u828 (copy), u833 (copy), l__key__46 (copy), l__ClientPlayerState__21 (ref), l__Players__1 (ref), u17 (ref), u815 (copy), l__data__47 (copy), u221 (ref), l__EquipItemEvent__10 (ref)
                                if u828 == "Case" then
                                    if u833.Name == "Owned" then
                                        local v838 = l__key__46;
                                        local v839 = l__ClientPlayerState__21.GetProxy("Inventory", l__Players__1.LocalPlayer);
                                        if v839 then
                                            v839 = v839:FindFirstChild(v838);
                                        end;
                                        local v840;
                                        if v839 then
                                            local v841 = v839:GetAttribute("Amount");
                                            v840 = v841 == nil and 1 or (tonumber(v841) or 0);
                                        else
                                            v840 = 0;
                                        end;
                                        if v840 > 0 and u17 then
                                            u17(l__key__46, "Inventory", u815);
                                        end;
                                    elseif type(l__data__47.Price) == "number" or tonumber(l__data__47.Price) then
                                        u221(l__key__46, l__data__47, u815);
                                    end;
                                elseif u833.Name == "Buy" then
                                    if type(l__data__47.Price) == "number" or tonumber(l__data__47.Price) then
                                        u221(l__key__46, l__data__47, u815);
                                    end;
                                elseif u833.Name == "Owned" then
                                    local v842 = l__ClientPlayerState__21.WaitForProxy("Inventory", l__Players__1.LocalPlayer, 10);
                                    if not v842 then
                                        return;
                                    end;
                                    local v843 = l__key__46;
                                    local v844 = l__data__47;
                                    if v842 then
                                        v842 = v842:FindFirstChild(v843);
                                    end;
                                    local v845;
                                    if v842 then
                                        local v846 = v842:GetAttribute("Amount");
                                        if v846 == nil then
                                            v845 = true;
                                        elseif tonumber(v846) == nil then
                                            v845 = false;
                                        else
                                            v845 = tonumber(v846) > 0;
                                        end;
                                    else
                                        v845 = false;
                                    end;
                                    if not v845 then
                                        if v844 then
                                            v844 = v844.SubscriptionBound;
                                        end;
                                        if type(v844) == "string" and v844 ~= "" then
                                            local v847 = l__ClientPlayerState__21.GetProxy("Gamepasses", l__Players__1.LocalPlayer);
                                            if v847 == nil then
                                                v845 = false;
                                            else
                                                v845 = v847:GetAttribute(v844) == true;
                                            end;
                                        else
                                            v845 = false;
                                        end;
                                    end;
                                    if v845 and l__EquipItemEvent__10 then
                                        l__EquipItemEvent__10:FireServer(l__key__46);
                                    end;
                                end;
                            end);
                        end;
                    end;
                else
                    local v848 = nil;
                    if l__data__47.Price == "Lvl" and u828 == "Skin" then
                        v848 = u108(u829) or u829;
                    elseif l__data__47.Price == "Free" then
                        v848 = u829:FindFirstChild("Free") or u829;
                    elseif l__data__47.Price == "Owned" then
                        v848 = u829:FindFirstChild("Owned") or u829;
                    elseif type(l__data__47.Price) == "number" then
                        v848 = u829:FindFirstChild("Buy");
                    elseif tonumber(l__data__47.Price) then
                        v848 = u829:FindFirstChild("Buy");
                    end;
                    if v848 then
                        local v849 = u250(l__key__46, l__data__47, v848);
                        v849.LayoutOrder = v825 or 0;
                        table.insert(u14, {
                            clone = v849,
                            key = l__key__46,
                            data = l__data__47
                        });
                        u294(v849, l__key__46, l__data__47);
                        local v850 = v849:FindFirstChild("BottomRow");
                        if v850 then
                            local v851 = v849:FindFirstChild("TryBtn") or v850:FindFirstChild("TryBtn");
                            if v851 then
                                v851.MouseButton1Click:Connect(function() --[[ Line: 4206 ]]
                                    -- upvalues: u828 (copy), u57 (ref), l__key__46 (copy), u438 (ref), u816 (copy), u817 (copy), u14 (ref), u294 (ref)
                                    if u828 == "Skin" or u828 == "Accessory" then
                                        u57(l__key__46, u828);
                                        u438(u816, u817);
                                        for _, v852 in ipairs(u14) do
                                            u294(v852.clone, v852.key, v852.data);
                                        end;
                                    end;
                                end);
                            end;
                            local v853 = v850:FindFirstChild("Button");
                            if v853 then
                                v853.MouseButton1Click:Connect(function() --[[ Line: 4222 ]]
                                    -- upvalues: l__ClientPlayerState__21 (ref), l__Players__1 (ref), l__key__46 (copy), l__data__47 (copy), u32 (ref), l__EquipItemEvent__10 (ref), u221 (ref), u815 (copy)
                                    local v854 = l__ClientPlayerState__21.WaitForProxy("Inventory", l__Players__1.LocalPlayer, 10);
                                    if v854 then
                                        local v855 = l__key__46;
                                        local v856 = l__data__47;
                                        if v854 then
                                            v854 = v854:FindFirstChild(v855);
                                        end;
                                        local v857;
                                        if v854 then
                                            local v858 = v854:GetAttribute("Amount");
                                            if v858 == nil then
                                                v857 = true;
                                            elseif tonumber(v858) == nil then
                                                v857 = false;
                                            else
                                                v857 = tonumber(v858) > 0;
                                            end;
                                        else
                                            v857 = false;
                                        end;
                                        if not v857 then
                                            if v856 then
                                                v856 = v856.SubscriptionBound;
                                            end;
                                            if type(v856) == "string" and v856 ~= "" then
                                                local v859 = l__ClientPlayerState__21.GetProxy("Gamepasses", l__Players__1.LocalPlayer);
                                                if v859 == nil then
                                                    v857 = false;
                                                else
                                                    v857 = v859:GetAttribute(v856) == true;
                                                end;
                                            else
                                                v857 = false;
                                            end;
                                        end;
                                        if not v857 then
                                            if l__data__47.Price == "Free" then
                                                v857 = true;
                                            else
                                                local l__LocalPlayer__48 = l__Players__1.LocalPlayer;
                                                local v860 = l__data__47;
                                                if v860.Price == "Lvl" then
                                                    v857 = (tonumber(v860.Lvl) or 0) <= u32(l__LocalPlayer__48);
                                                else
                                                    v857 = false;
                                                end;
                                            end;
                                        end;
                                        if v857 then
                                            if l__EquipItemEvent__10 then
                                                l__EquipItemEvent__10:FireServer(l__key__46);
                                            end;
                                        else
                                            if l__data__47.Price == "Owned" then
                                                return;
                                            end;
                                            if l__data__47.Price == "Lvl" then
                                                return;
                                            end;
                                            if type(l__data__47.Price) == "number" or tonumber(l__data__47.Price) then
                                                u221(l__key__46, l__data__47, u815);
                                                return;
                                            end;
                                            warn("Cannot buy item with invalid price:", l__key__46, l__data__47.Price);
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
    u402(u814);
    local v861 = l__ClientPlayerState__21.WaitForProxy("Inventory", l__Players__1.LocalPlayer, 10);
    local v862 = l__ClientPlayerState__21.WaitForProxy("Equipped.Skins", l__Players__1.LocalPlayer, 10);
    local v863 = l__ClientPlayerState__21.WaitForProxy("Equipped.Hats", l__Players__1.LocalPlayer, 10);
    local v864 = l__ClientPlayerState__21.GetProxy("Equipped.Abilities", l__Players__1.LocalPlayer);
    local v865 = l__ClientPlayerState__21.GetProxy("Gamepasses", l__Players__1.LocalPlayer);
    if v861 and (v862 and v863) then
        local u866 = {};
        local u867 = true;
        local u868 = true;
        local u869 = false;
        local function u874(p870) --[[ Line: 4278 ]]
            -- upvalues: u869 (ref), u814 (copy), u14 (ref), u294 (ref), u867 (ref), u815 (copy), u438 (ref), u816 (copy), u817 (copy), u868 (ref)
            u869 = false;
            local v871;
            if p870 ~= true then
                local v872 = u814;
                if v872 then
                    v872 = u814.Visible == true;
                end;
                if not v872 then
                    v871 = u814;
                    if v871 then
                        v871 = u814.Visible == true;
                    end;
                    if not v871 then
                        v871 = u815;
                        if v871 then
                            v871 = u815:FindFirstChild("Inventory");
                        end;
                        if v871 then
                            v871 = v871.Visible == true;
                        end;
                    end;
                    if v871 then
                        u438(u816, u817);
                        u868 = false;
                        return;
                    else
                        u868 = true;
                        return;
                    end;
                end;
            end;
            for _, v873 in ipairs(u14) do
                u294(v873.clone, v873.key, v873.data);
            end;
            u867 = false;
            v871 = u814;
            if v871 then
                v871 = u814.Visible == true;
            end;
            if not v871 then
                v871 = u815;
                if v871 then
                    v871 = u815:FindFirstChild("Inventory");
                end;
                if v871 then
                    v871 = v871.Visible == true;
                end;
            end;
            if v871 then
                u438(u816, u817);
                u868 = false;
            else
                u868 = true;
            end;
        end;
        local function u878(p875) --[[ Line: 4296 ]]
            -- upvalues: u867 (ref), u868 (ref), u874 (copy), u814 (copy), u815 (copy), u869 (ref)
            u867 = true;
            u868 = true;
            if p875 == true then
                u874(true);
            else
                local v876 = u814;
                if v876 then
                    v876 = u814.Visible == true;
                end;
                if not v876 then
                    v876 = u815;
                    if v876 then
                        v876 = u815:FindFirstChild("Inventory");
                    end;
                    if v876 then
                        v876 = v876.Visible == true;
                    end;
                end;
                if v876 then
                    if u869 then
                    else
                        u869 = true;
                        task.defer(function() --[[ Line: 4314 ]]
                            -- upvalues: u867 (ref), u868 (ref), u869 (ref), u814 (ref), u815 (ref), u874 (ref)
                            if u867 or u868 then
                                local v877 = u814;
                                if v877 then
                                    v877 = u814.Visible == true;
                                end;
                                if not v877 then
                                    v877 = u815;
                                    if v877 then
                                        v877 = u815:FindFirstChild("Inventory");
                                    end;
                                    if v877 then
                                        v877 = v877.Visible == true;
                                    end;
                                end;
                                if v877 then
                                    u874(false);
                                else
                                    u869 = false;
                                end;
                            else
                                u869 = false;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        u15 = u878;
        local v879 = l__ReplicatedStorage__2:FindFirstChild("TotalStats");
        if v879 then
            for _, v880 in ipairs({ "Items", "Stats" }) do
                local v881 = v879:FindFirstChild(v880);
                if v881 then
                    v881.AttributeChanged:Connect(u878);
                end;
            end;
        end;
        for _, v882 in ipairs(v861:GetChildren()) do
            if v882:IsA("Configuration") then
                if not u866[v882] then
                    u866[v882] = v882:GetAttributeChangedSignal("Amount"):Connect(u878);
                end;
            end;
        end;
        v862.AttributeChanged:Connect(u878);
        v863.AttributeChanged:Connect(u878);
        if v865 then
            v865.AttributeChanged:Connect(u878);
        end;
        if v864 then
            v864.AttributeChanged:Connect(u878);
        end;
        l__ClientPlayerState__21.GetProxy("Settings", l__Players__1.LocalPlayer):GetAttributeChangedSignal("BlobColor"):Connect(u878);
        local function v887(p883) --[[ Line: 4360 ]]
            -- upvalues: u878 (copy)
            if p883 then
                for _, v884 in ipairs({ "Level", "Lvl", "XP" }) do
                    p883:GetAttributeChangedSignal(v884):Connect(u878);
                    local u885 = p883:FindFirstChild(v884);
                    if u885 then
                        pcall(function() --[[ Line: 4368 ]]
                            -- upvalues: u885 (copy), u878 (ref)
                            u885.Changed:Connect(u878);
                        end);
                    end;
                end;
                p883.ChildAdded:Connect(function(u886) --[[ Line: 4374 ]]
                    -- upvalues: u878 (ref)
                    if u886.Name == "Level" or (u886.Name == "Lvl" or u886.Name == "XP") then
                        pcall(function() --[[ Line: 4376 ]]
                            -- upvalues: u886 (copy), u878 (ref)
                            u886.Changed:Connect(u878);
                        end);
                        u878();
                    end;
                end);
            end;
        end;
        v887(l__ClientPlayerState__21.GetProxy("Stats", l__Players__1.LocalPlayer));
        v887(l__ClientPlayerState__21.GetProxy("Gameplay", l__Players__1.LocalPlayer));
        l__ClientPlayerState__21.OnChanged("Stats", function() --[[ Line: 4388 ]]
            -- upvalues: u878 (copy)
            u878();
        end, l__Players__1.LocalPlayer);
        l__ClientPlayerState__21.OnChanged("Gameplay", function() --[[ Line: 4391 ]]
            -- upvalues: u878 (copy)
            u878();
        end, l__Players__1.LocalPlayer);
        v861.ChildAdded:Connect(function(p888) --[[ Line: 4395 ]]
            -- upvalues: u866 (copy), u878 (copy)
            if p888:IsA("Configuration") and not u866[p888] then
                u866[p888] = p888:GetAttributeChangedSignal("Amount"):Connect(u878);
            end;
            u878();
        end);
        v861.ChildRemoved:Connect(function(p889) --[[ Line: 4400 ]]
            -- upvalues: u866 (copy), u878 (copy)
            if u866[p889] then
                u866[p889]:Disconnect();
                u866[p889] = nil;
            end;
            u878();
        end);
    end;
end;
function u1.Init() --[[ Line: 4410 ]]
    -- upvalues: l__Players__1 (copy), u1 (copy), u138 (copy), u890 (copy), u438 (copy), u15 (ref), u13 (copy), u813 (copy), u189 (copy), u58 (copy), l__SpawnPlayer__7 (copy), l__SpectatePlayer__8 (copy), l__ClientPlayerState__21 (copy), l__UpdateNicknameEvent__12 (copy)
    local l__LocalPlayer__49 = l__Players__1.LocalPlayer;
    local l__PlayerGui__50 = l__LocalPlayer__49:WaitForChild("PlayerGui");
    local l__Gui__51 = l__PlayerGui__50:WaitForChild("Gui");
    local l__MainScreenGui__52 = l__PlayerGui__50:WaitForChild("MainScreenGui");
    local l__Menu__53 = l__Gui__51:WaitForChild("Menu");
    local u891 = l__Gui__51:FindFirstChild("Shop");
    local v892 = l__Menu__53:FindFirstChild("Center");
    local u893;
    if v892 then
        u893 = v892:FindFirstChild("Avatar");
    else
        u893 = v892;
    end;
    local u894;
    if u891 then
        u894 = u891:FindFirstChild("Avatar");
    else
        u894 = u891;
    end;
    local v895;
    if u891 then
        v895 = u891:FindFirstChild("SelectColor");
    else
        v895 = u891;
    end;
    local v896;
    if v892 then
        v896 = v892:FindFirstChild("Play");
    else
        v896 = v892;
    end;
    local v897;
    if v892 then
        v897 = v892:FindFirstChild("Spectate");
    else
        v897 = v892;
    end;
    if v896 and v896:IsA("GuiButton") then
        v896.Active = true;
    end;
    if v897 and v897:IsA("GuiButton") then
        v897.Active = true;
    end;
    local u898;
    if v892 then
        u898 = v892:FindFirstChild("Nickname");
    else
        u898 = v892;
    end;
    if v892 then
        v892 = v892:FindFirstChild("Avatar");
    end;
    local v899 = l__Menu__53:FindFirstChild("Left");
    local v900;
    if v899 then
        v900 = v899:FindFirstChild("Shop");
    else
        v900 = v899;
    end;
    local v901 = l__MainScreenGui__52:FindFirstChild("ScreenMenu");
    if v901 then
        v901 = v901:FindFirstChild("Menu");
    end;
    local v902;
    if u891 then
        v902 = u891:FindFirstChild("Close");
    else
        v902 = u891;
    end;
    if u891 then
        local v903 = u891:FindFirstChild("ModDefult");
        if v903 and v903:IsA("GuiObject") then
            if v903:IsA("TextLabel") or v903:IsA("TextButton") then
                v903.Text = "";
            end;
            v903.Visible = false;
        end;
        for _, v904 in ipairs(u891:GetDescendants()) do
            if v904:IsA("TextLabel") or v904:IsA("TextButton") then
                local v905 = string.lower((tostring(v904.Text or "")));
                if string.find(v905, "new game", 1, true) or string.find(v905, "новая", 1, true) then
                    v904.Text = "";
                    v904.Visible = false;
                end;
            end;
        end;
        u1.EnsureBotsShopTab(u891);
        u138("MainShop", u891:FindFirstChild("Select"), u891);
        for _, v906 in ipairs({
            "Skins",
            "Accessories",
            "Abilities",
            "Cases",
            "Bots"
        }) do
            local v907 = u891:FindFirstChild(v906);
            if v907 then
                u138(v906, v907:FindFirstChild("Select") or v907:FindFirstChild("SelectSkins"), v907);
            end;
        end;
        u890(u891, l__Gui__51, u893, u894);
        u891.Visible = false;
    end;
    local v908 = l__Gui__51:FindFirstChild("Inventory");
    if v908 and v908:IsA("GuiObject") then
        v908.Visible = false;
        v908:Destroy();
    end;
    local u909 = nil;
    u1.ToggleMenu(l__Menu__53, true);
    u438(u893, u894);
    local function v910() --[[ Line: 4518 ]]
        -- upvalues: u909 (ref), u891 (copy), u15 (ref), u813 (ref)
        if u909 then
            u909.Visible = true;
            if u891 then
                u891.Visible = false;
            end;
            if u15 then
                u15(false);
            end;
            if u813.Refresh then
                u813.Refresh();
            end;
        end;
    end;
    if v892 and v892:IsA("GuiButton") then
        v892.MouseButton1Click:Connect(function() --[[ Line: 4534 ]]
            -- upvalues: u891 (copy), u909 (ref), u15 (ref), u13 (ref)
            if u891 then
                u891.Visible = true;
                if u909 then
                    u909.Visible = false;
                end;
                if u15 then
                    u15(true);
                end;
                if u13.MainShop then
                    u13.MainShop("Skins");
                end;
                if u13.Skins then
                    u13.Skins("Free");
                end;
            end;
        end);
    end;
    if v900 then
        v900.MouseButton1Click:Connect(function() --[[ Line: 4540 ]]
            -- upvalues: u891 (copy), u909 (ref), u15 (ref), u13 (ref)
            if u891 then
                u891.Visible = true;
                if u909 then
                    u909.Visible = false;
                end;
                if u15 then
                    u15(true);
                end;
                if u13.MainShop then
                    u13.MainShop("Skins");
                end;
                if u13.Skins then
                    u13.Skins("Free");
                end;
            end;
        end);
    end;
    local v911;
    if v899 then
        local v912 = v899:FindFirstChild("Inventory");
        if v912 and v912:IsA("GuiObject") then
            v912:Destroy();
            v911 = nil;
        else
            v911 = nil;
        end;
    else
        v911 = nil;
    end;
    if v911 then
        v911.MouseButton1Click:Connect(v910);
    end;
    if v902 then
        v902.MouseButton1Click:Connect(function() --[[ Line: 4551 ]]
            -- upvalues: u891 (copy)
            if u891 then
                u891.Visible = false;
            end;
        end);
    end;
    if v895 then
        v895.MouseButton1Click:Connect(function() --[[ Line: 4559 ]]
            -- upvalues: u189 (ref), l__Gui__51 (copy)
            u189(l__Gui__51);
        end);
    end;
    if u894 and u894:IsA("GuiButton") then
        u894.MouseButton1Click:Connect(function() --[[ Line: 4565 ]]
            -- upvalues: u189 (ref), l__Gui__51 (copy)
            u189(l__Gui__51);
        end);
    end;
    if v896 then
        v896.MouseButton1Click:Connect(function() --[[ Line: 4571 ]]
            -- upvalues: u58 (ref), u438 (ref), u893 (copy), u894 (copy), l__LocalPlayer__49 (copy), u1 (ref), l__Menu__53 (copy), u891 (copy), u909 (ref), l__SpawnPlayer__7 (ref)
            u58();
            u438(u893, u894);
            if tostring(l__LocalPlayer__49.Team) == "Server" then
                u1.ToggleMenu(l__Menu__53, false);
                if u891 then
                    u891.Visible = false;
                end;
                if u909 then
                    u909.Visible = false;
                end;
            else
                l__SpawnPlayer__7:FireServer();
                u1.ToggleMenu(l__Menu__53, false);
                if u891 then
                    u891.Visible = false;
                end;
                if u909 then
                    u909.Visible = false;
                end;
            end;
        end);
    end;
    if v897 then
        v897.MouseButton1Click:Connect(function() --[[ Line: 4601 ]]
            -- upvalues: u58 (ref), u438 (ref), u893 (copy), u894 (copy), l__SpectatePlayer__8 (ref), u1 (ref), l__Menu__53 (copy), u891 (copy), u909 (ref)
            u58();
            u438(u893, u894);
            l__SpectatePlayer__8:FireServer();
            u1.ToggleMenu(l__Menu__53, false);
            if u891 then
                u891.Visible = false;
            end;
            if u909 then
                u909.Visible = false;
            end;
        end);
    end;
    if u898 and u898:IsA("TextBox") then
        u898.TextEditable = true;
        u898.ClearTextOnFocus = false;
        u898.MultiLine = false;
        u898.Active = true;
        u898.Selectable = true;
        u898.ShowNativeInput = true;
        u898.ZIndex = 50;
        u898.InputBegan:Connect(function(p913) --[[ Line: 4626 ]]
            -- upvalues: u898 (copy)
            if p913.UserInputType == Enum.UserInputType.Touch then
                task.defer(function() --[[ Line: 4628 ]]
                    -- upvalues: u898 (ref)
                    u898:CaptureFocus();
                end);
            end;
        end);
        task.spawn(function() --[[ Line: 4634 ]]
            -- upvalues: l__ClientPlayerState__21 (ref), l__LocalPlayer__49 (copy), u898 (copy), l__UpdateNicknameEvent__12 (ref)
            local u914 = l__ClientPlayerState__21.WaitForProxy("Settings", l__LocalPlayer__49, 10);
            if u914 then
                local function v915() --[[ Line: 4638 ]]
                    -- upvalues: u898 (ref), u914 (copy)
                    if not u898:IsFocused() then
                        u898.Text = u914:GetAttribute("Nickname") or "";
                    end;
                end;
                if not u898:IsFocused() then
                    u898.Text = u914:GetAttribute("Nickname") or "";
                end;
                u914:GetAttributeChangedSignal("Nickname"):Connect(v915);
                u898.FocusLost:Connect(function() --[[ Line: 4648 ]]
                    -- upvalues: l__UpdateNicknameEvent__12 (ref), u898 (ref)
                    if l__UpdateNicknameEvent__12 then
                        l__UpdateNicknameEvent__12:FireServer(u898.Text);
                    end;
                end);
            end;
        end);
    end;
    function u1.ToggleMainMenu() --[[ Line: 4656 ]]
        -- upvalues: u1 (ref), l__Menu__53 (copy), u891 (copy), u909 (ref)
        local v916 = not u1.IsMenuActive;
        u1.ToggleMenu(l__Menu__53, v916);
        if not v916 and u891 then
            u891.Visible = false;
        end;
        if not v916 and u909 then
            u909.Visible = false;
        end;
    end;
    if v901 then
        v901.MouseButton1Click:Connect(u1.ToggleMainMenu);
    end;
end;
function u1.ToggleMenu(p917, p918) --[[ Line: 4674 ]]
    -- upvalues: u1 (copy), l__Players__1 (copy)
    u1.IsMenuActive = p918;
    if p917 then
        p917.Visible = p918;
    end;
    local v919 = l__Players__1.LocalPlayer:FindFirstChild("PlayerGui");
    if v919 then
        v919 = v919:FindFirstChild("MobileAgaricControls");
    end;
    if v919 then
        v919.Enabled = not p918;
    end;
end;
return u1;