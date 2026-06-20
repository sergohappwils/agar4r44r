-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Gameplay.ClientGameplay

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__RunService__3 = game:GetService("RunService");
local l__Workspace__4 = game:GetService("Workspace");
local l__UserInputService__5 = game:GetService("UserInputService");
local l__GuiService__6 = game:GetService("GuiService");
local l__StarterGui__7 = game:GetService("StarterGui");
local l__HttpService__8 = game:GetService("HttpService");
pcall(function() --[[ Line: 13 ]]
    -- upvalues: l__StarterGui__7 (copy)
    l__StarterGui__7:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
end);
local u1 = l__Players__1.LocalPlayer or l__Players__1.PlayerAdded:Wait();
local l__PlayerGui__9 = u1:WaitForChild("PlayerGui");
l__PlayerGui__9:WaitForChild("Gui", 15);
l__PlayerGui__9:WaitForChild("MainScreenGui", 15);
local l__Gameplay__10 = l__ReplicatedStorage__2:WaitForChild("Gameplay");
local l__Config__11 = require(l__Gameplay__10:WaitForChild("Config"));
local l__SharedGameplay__12 = require(l__Gameplay__10:WaitForChild("SharedGameplay"));
local l__Network__13 = l__Gameplay__10:WaitForChild("Network");
task.defer(function() --[[ Line: 28 ]]
    -- upvalues: l__Network__13 (copy), l__SharedGameplay__12 (copy)
    local v2 = l__Network__13:FindFirstChild(l__SharedGameplay__12.NetworkNames.AntiCheatReport);
    if v2 and v2:IsA("RemoteEvent") then
        v2:FireServer({
            Kind = "Surface",
            Surface = "ClientGameplay",
            Version = 1
        });
    end;
end);
local l__Framework__14 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__GameDatabase__15 = require(l__Framework__14:WaitForChild("GameDatabase"));
local l__ClientPlayerState__16 = require(l__Framework__14:WaitForChild("ClientPlayerState"));
local l__ClientPrediction__17 = require(script.Parent:WaitForChild("ClientPrediction"));
local l__LobbyController__18 = require(u1:WaitForChild("PlayerScripts"):WaitForChild("Framework"):WaitForChild("LobbyController"));
local l__DonateController__19 = require(u1:WaitForChild("PlayerScripts"):WaitForChild("Framework"):WaitForChild("DonateController"));
local l__HUDController__20 = require(u1.PlayerScripts.Framework.HUDController);
local l__TutorialController__21 = require(u1.PlayerScripts.Framework.TutorialController);
local l__abs__22 = math.abs;
local l__round__23 = math.round;
local l__exp__24 = math.exp;
local l__sqrt__25 = math.sqrt;
local l__clamp__26 = math.clamp;
local l__floor__27 = math.floor;
local l__max__28 = math.max;
local l__min__29 = math.min;
local u5 = math.atan2 or function(p3, p4) --[[ Line: 57 ]]
    return math.atan(p3, p4);
end;
local l__deg__30 = math.deg;
local l__fromOffset__31 = UDim2.fromOffset;
local l__new__32 = Vector2.new;
local l__GRID_PRIME__33 = l__SharedGameplay__12.Grid.GRID_PRIME;
local u6 = Color3.new(1, 1, 1);
local u7 = Color3.fromRGB(145, 145, 145);
local u8 = l__new__32(0, 0);
NameVisual = {
    TitleFallbackColor = Color3.fromRGB(255, 216, 90)
};
function NameVisual.EscapeRichText(p9) --[[ Line: 69 ]]
    return tostring(p9 or ""):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("\'", "&apos;");
end;
function NameVisual.ColorToHex(p10) --[[ Line: 79 ]]
    -- upvalues: u6 (copy), l__clamp__26 (copy), l__floor__27 (copy)
    local v11 = typeof(p10) == "Color3" and p10 and p10 or u6;
    return string.format("#%02X%02X%02X", l__floor__27(l__clamp__26(v11.R, 0, 1) * 255 + 0.5), l__floor__27(l__clamp__26(v11.G, 0, 1) * 255 + 0.5), (l__floor__27(l__clamp__26(v11.B, 0, 1) * 255 + 0.5)));
end;
function NameVisual.ParseHexColor(u12, p13) --[[ Line: 89 ]]
    -- upvalues: u6 (copy)
    if type(u12) ~= "string" or u12 == "" then
        return p13 or u6;
    end;
    local v14, v15 = pcall(function() --[[ Line: 94 ]]
        -- upvalues: u12 (copy)
        return Color3.fromHex(string.gsub(u12, "#", ""));
    end);
    return v14 and v15 and v15 or (p13 or u6);
end;
function NameVisual.NormalizeGradientStops(u16, p17, p18) --[[ Line: 100 ]]
    -- upvalues: l__HttpService__8 (copy), u6 (copy), l__clamp__26 (copy), l__min__29 (copy)
    local v19 = nil;
    if type(u16) == "string" and u16 ~= "" then
        local v20;
        v20, u16 = pcall(function() --[[ Line: 103 ]]
            -- upvalues: l__HttpService__8 (ref), u16 (copy)
            return l__HttpService__8:JSONDecode(u16);
        end);
        if v20 then
            if type(u16) ~= "table" then
                u16 = v19;
            end;
        else
            u16 = v19;
        end;
    elseif type(u16) ~= "table" then
        u16 = v19;
    end;
    local v21 = type(p17) == "string" and p17 and p17 or NameVisual.ColorToHex(p17 or u6);
    local v22 = type(p18) == "string" and p18 and p18 or NameVisual.ColorToHex(p18 or (p17 or u6));
    local v23 = {};
    if type(u16) == "table" then
        for _, v24 in ipairs(u16) do
            if type(v24) == "table" then
                local v25 = NameVisual.ParseHexColor(v24.Color or v24.Hex, nil);
                if v25 then
                    v23[#v23 + 1] = {
                        Position = l__clamp__26(tonumber(v24.Position or v24.Time) or 0, 0, 1),
                        Color = NameVisual.ColorToHex(v25)
                    };
                end;
                if #v23 >= 16 then
                    break;
                end;
            end;
        end;
    end;
    local v26 = #v23 == 0 and {
        {
            Position = 0,
            Color = v21
        },
        {
            Position = 1,
            Color = v22
        }
    } or v23;
    table.sort(v26, function(p27, p28) --[[ Line: 141 ]]
        return p27.Position < p28.Position;
    end);
    if #v26 == 1 then
        v26[#v26 + 1] = {
            Position = 1,
            Color = v26[1].Color
        };
    end;
    if v26[1].Position > 0 then
        table.insert(v26, 1, {
            Position = 0,
            Color = v26[1].Color
        });
    else
        v26[1].Position = 0;
    end;
    if v26[#v26].Position < 1 then
        v26[#v26 + 1] = {
            Position = 1,
            Color = v26[#v26].Color
        };
    else
        v26[#v26].Position = 1;
    end;
    while #v26 > 16 do
        table.remove(v26, #v26 - 1);
    end;
    for v29 = 2, #v26 do
        if v26[v29].Position <= v26[v29 - 1].Position then
            v26[v29].Position = l__min__29(1, v26[v29 - 1].Position + 0.001);
        end;
    end;
    v26[#v26].Position = 1;
    return v26;
end;
function NameVisual.ColorAtStops(p30, p31) --[[ Line: 169 ]]
    -- upvalues: l__clamp__26 (copy), l__max__28 (copy), u6 (copy)
    local v32 = l__clamp__26(tonumber(p31) or 0, 0, 1);
    for v33 = 1, #p30 - 1 do
        local v34 = p30[v33];
        local v35 = p30[v33 + 1];
        if v34.Position <= v32 and v32 <= v35.Position then
            local v36 = l__max__28(v35.Position - v34.Position, 0.001);
            local v37 = (v32 - v34.Position) / v36;
            return NameVisual.ParseHexColor(v34.Color, u6):Lerp(NameVisual.ParseHexColor(v35.Color, u6), v37);
        end;
    end;
    return NameVisual.ParseHexColor(p30[#p30].Color, u6);
end;
function NameVisual.RichTextStyled(p38, p39, p40, p41, p42) --[[ Line: 183 ]]
    -- upvalues: u6 (copy)
    local v43 = tostring(p38 or "");
    local v44 = NameVisual.ColorToHex(p39 or u6);
    if tostring(p40 or "") ~= "Gradient" then
        return string.format("<font color=\"%s\">%s</font>", v44, NameVisual.EscapeRichText(v43));
    end;
    local v45 = {};
    for _, v46 in utf8.codes(v43) do
        v45[#v45 + 1] = utf8.char(v46);
    end;
    if #v45 == 0 then
        return "";
    end;
    local v47 = NameVisual.NormalizeGradientStops(p41, v44, p42 or v44);
    local v48 = {};
    for v49, v50 in ipairs(v45) do
        v48[#v48 + 1] = string.format("<font color=\"%s\">%s</font>", NameVisual.ColorToHex(NameVisual.ColorAtStops(v47, #v45 > 1 and ((v49 - 1) / (#v45 - 1) or 0.5) or 0.5)), NameVisual.EscapeRichText(v50));
    end;
    return table.concat(v48);
end;
function NameVisual.BuildPlayerNameText(p51, p52, p53, p54, p55, p56) --[[ Line: 207 ]]
    -- upvalues: u6 (copy)
    local v57 = NameVisual.EscapeRichText(p52 or "");
    local v58 = tostring(p51 or "");
    local v59 = v58 == "" and "" or (NameVisual.RichTextStyled(v58, p53 or u6, p55, p56, "#7DD3FC") or "");
    if v57 == "" or v59 == "" then
        if v57 == "" then
            return v59;
        else
            return string.format("<font color=\"%s\">[%s]</font>", NameVisual.ColorToHex(p54 or NameVisual.TitleFallbackColor), v57);
        end;
    else
        return string.format("<font color=\"%s\">[%s]</font>\n%s", NameVisual.ColorToHex(p54 or NameVisual.TitleFallbackColor), v57, v59);
    end;
end;
local u60 = 4000;
local u61 = {};
local u62 = {};
local u63 = {};
local u64 = {};
local u65 = {};
local u66 = {};
local l__CLIENT_GRID_SIZE__34 = l__SharedGameplay__12.Grid.CLIENT_GRID_SIZE;
local u67 = {};
local u68 = {};
local u69 = 0;
local u70 = false;
NameVisual.HUGE_DYNAMIC_RADIUS = 900;
NameVisual.HugeDynamicEntities = NameVisual.HugeDynamicEntities or {};
NameVisual.PLAYER_RENDER_LERP_SPEED = 14;
NameVisual.ENTITY_RENDER_LERP_SPEED = 10;
NameVisual.SIZE_RENDER_LERP_SPEED = 16;
NameVisual.CLIENT_PREDICTION_ENABLED = false;
NameVisual.PLAYER_EXTRAPOLATE_MAX_AGE = 0.12;
NameVisual.PLAYER_EXTRAPOLATE_MAX_RADIUS_MULT = 0.85;
NameVisual.INPUT_TARGET_SEND_INTERVAL = 0.05;
NameVisual.SPECTATE_UI_UPDATE_INTERVAL = 0.12;
NameVisual.WORLD_EVENT_UI_UPDATE_INTERVAL = 0.2;
NameVisual.CLIENT_PREDICTION_MAX_AGE = 0.18;
NameVisual.CLIENT_PREDICTION_MAX_RADIUS_MULT = 0.65;
NameVisual.CLIENT_PREDICTION_SPEED_SCALE = 1.08;
NameVisual.uiCreatesThisFrame = 0;
local u71 = {
    Enabled = NameVisual.CLIENT_PREDICTION_ENABLED,
    PlayerExtrapolateMaxAge = NameVisual.PLAYER_EXTRAPOLATE_MAX_AGE,
    PlayerExtrapolateMaxRadiusMult = NameVisual.PLAYER_EXTRAPOLATE_MAX_RADIUS_MULT,
    ClientPredictionMaxAge = NameVisual.CLIENT_PREDICTION_MAX_AGE,
    ClientPredictionMaxRadiusMult = NameVisual.CLIENT_PREDICTION_MAX_RADIUS_MULT,
    ClientPredictionSpeedScale = NameVisual.CLIENT_PREDICTION_SPEED_SCALE
};
local u72 = {
    PlayerBlob = 1200,
    Food = 1400,
    NegativeFood = 300,
    StaticBlob = 300,
    Gold = 300,
    GoldCoin = 300,
    EjectedMass = 500,
    GoldenBlock = 80,
    GoldenCrate = 12,
    KingHill = 8,
    Spike = 80,
    Spawner = 80,
    FreezeFood = 80,
    Mass1000 = 80
};
local function u77() --[[ Line: 290 ]]
    -- upvalues: u62 (copy), l__max__28 (copy), l__min__29 (copy), u69 (ref), u70 (ref)
    local v73 = 0;
    for _, v74 in pairs(u62) do
        if v74.Type == "PlayerBlob" then
            NameVisual.UpdateHugeDynamicTracking(v74);
            local v75 = v74.Radius or 0;
            local v76 = l__min__29(l__max__28(v75, v74.RenderRadius or v75), NameVisual.HUGE_DYNAMIC_RADIUS);
            if v73 < v76 then
                v73 = v76;
            end;
        end;
    end;
    u69 = v73;
    u70 = false;
end;
function NameVisual.UpdateHugeDynamicTracking(p78) --[[ Line: 307 ]]
    -- upvalues: l__max__28 (copy)
    if p78 and (not p78.IsStatic and p78.Type == "PlayerBlob") then
        local v79 = p78.Radius or 0;
        if l__max__28(v79, p78.RenderRadius or v79) >= NameVisual.HUGE_DYNAMIC_RADIUS then
            NameVisual.HugeDynamicEntities[p78.ID] = p78;
        else
            NameVisual.HugeDynamicEntities[p78.ID] = nil;
        end;
    end;
end;
local function u85(p80, p81) --[[ Line: 316 ]]
    -- upvalues: l__max__28 (copy), l__min__29 (copy), u69 (ref), u70 (ref)
    if p80.IsStatic or p80.Type ~= "PlayerBlob" then
    else
        NameVisual.UpdateHugeDynamicTracking(p80);
        local v82 = p80.Radius or 0;
        local v83 = l__max__28(v82, p80.RenderRadius or v82);
        local v84 = l__min__29(v83, NameVisual.HUGE_DYNAMIC_RADIUS);
        if u69 < v84 then
            u69 = v84;
        else
            if p81 and (u69 <= p81 and v83 < p81) then
                u70 = true;
            end;
        end;
    end;
end;
local function u91(p86) --[[ Line: 344 ]]
    -- upvalues: l__SharedGameplay__12 (copy), l__CLIENT_GRID_SIZE__34 (copy), l__GRID_PRIME__33 (copy), u68 (copy), u67 (copy)
    local v87, v88 = l__SharedGameplay__12.GetGridCoords(p86.ServerX, p86.ServerY, l__CLIENT_GRID_SIZE__34);
    p86.CellX = v87;
    p86.CellY = v88;
    local v89 = v87 * l__GRID_PRIME__33 + v88;
    local v90 = p86.IsStatic and u68 or u67;
    if not v90[v89] then
        v90[v89] = {};
    end;
    v90[v89][p86.ID] = p86;
end;
local function u99(p92) --[[ Line: 364 ]]
    -- upvalues: l__SharedGameplay__12 (copy), l__CLIENT_GRID_SIZE__34 (copy), l__GRID_PRIME__33 (copy), u68 (copy), u67 (copy)
    local v93, v94 = l__SharedGameplay__12.GetGridCoords(p92.ServerX, p92.ServerY, l__CLIENT_GRID_SIZE__34);
    if p92.CellX ~= v93 or p92.CellY ~= v94 then
        if p92.CellX then
            local v95 = p92.CellX * l__GRID_PRIME__33 + p92.CellY;
            local v96 = p92.IsStatic and u68 or u67;
            if v96[v95] then
                v96[v95][p92.ID] = nil;
                if next(v96[v95]) == nil then
                    v96[v95] = nil;
                end;
            end;
        end;
        p92.CellX = v93;
        p92.CellY = v94;
        local v97 = v93 * l__GRID_PRIME__33 + v94;
        local v98 = p92.IsStatic and u68 or u67;
        if not v98[v97] then
            v98[v97] = {};
        end;
        v98[v97][p92.ID] = p92;
    end;
end;
local u100 = {};
local v101 = 0;
local u102 = {};
local function u113(p103) --[[ Line: 405 ]]
    -- upvalues: u100 (copy), u7 (copy), u6 (copy), u102 (copy)
    if p103.IsBot and (type(p103.BotColor) == "string" and p103.BotColor ~= "") then
        if p103.BotColor3 == nil or p103.LastBotColorHex ~= p103.BotColor then
            local v104, v105 = pcall(Color3.fromHex, p103.BotColor);
            if v104 then
                p103.BotColor3 = v105;
                p103.LastBotColorHex = p103.BotColor;
            end;
        end;
        if p103.BotColor3 then
            return p103.BotColor3;
        end;
    end;
    if type(p103.TeamColor) == "string" and p103.TeamColor ~= "" then
        if p103.TeamColor3 == nil or p103.LastTeamColorHex ~= p103.TeamColor then
            local v106, v107 = pcall(Color3.fromHex, p103.TeamColor);
            if v106 then
                p103.TeamColor3 = v107;
                p103.LastTeamColorHex = p103.TeamColor;
            end;
        end;
        if p103.TeamColor3 then
            return p103.TeamColor3;
        end;
    end;
    local v108 = p103.VisualUid or (p103.OwnerUid or p103.PlayerUid);
    local v109;
    if v108 then
        v109 = u100[v108];
    else
        v109 = v108;
    end;
    if v109 and (v109.Color and v109.Color ~= u7) then
        return v109.Color;
    end;
    if not v108 then
        return u6;
    end;
    local v110 = u102[v108];
    if v110 then
        return v110;
    end;
    local v111 = tonumber(v108) or 0;
    local v112 = Color3.fromHSV(v111 % 359 / 359, 0.78, 1);
    u102[v108] = v112;
    return v112;
end;
local u114 = 0;
local u115 = 0;
local u116 = 0;
local u117 = 0;
local u118 = 0;
local u119 = 0;
local u120 = 0;
local u121 = nil;
local u122 = {
    ManualTarget = false,
    LastTargetText = ""
};
local u123 = tostring(u1.UserId);
local u124;
if u1.Team then
    u124 = u1.Team.Name or nil;
else
    u124 = nil;
end;
local function u128(p125) --[[ Line: 447 ]]
    -- upvalues: u123 (copy), l__Players__1 (copy)
    if type(p125) ~= "table" or (p125.Type ~= "PlayerBlob" or (p125.IsBot == true or p125.IsMultiAccount == true)) then
        return false;
    end;
    local v126 = tonumber(p125.PlayerId);
    local v127;
    if v126 == nil or tostring(v126) == u123 then
        v127 = false;
    else
        v127 = l__Players__1:GetPlayerByUserId(v126) == nil;
    end;
    return v127;
end;
local function u129() --[[ Line: 454 ]] end;
local function u130() --[[ Line: 455 ]] end;
u1:GetPropertyChangedSignal("Team"):Connect(function() --[[ Line: 457 ]]
    -- upvalues: u124 (ref), u1 (copy), u122 (copy), u129 (ref), u130 (ref)
    u124 = u1.Team and u1.Team.Name or nil;
    if u124 ~= "Spectate" then
        u122.ManualTarget = false;
    end;
    u129();
    u130();
    if u122.Update then
        u122.Update();
    end;
end);
u1:GetAttributeChangedSignal("ModeTeamId"):Connect(function() --[[ Line: 468 ]]
    -- upvalues: u130 (ref), u129 (ref)
    u130();
    u129();
end);
local u131 = 1;
local u132 = -1;
NameVisual.RenderZoomVersion = 0;
NameVisual.RenderCoordinateScale = 1;
function NameVisual.GetRenderZoom() --[[ Line: 478 ]]
    -- upvalues: u132 (ref), u131 (ref)
    if u132 > 0 then
        return u132;
    else
        return u131;
    end;
end;
function NameVisual.GetRenderCoordinateScale() --[[ Line: 482 ]]
    return NameVisual.RenderCoordinateScale or 1;
end;
function NameVisual.WorldToCanvasPoint(p133, p134, p135) --[[ Line: 486 ]]
    -- upvalues: l__round__23 (copy)
    local v136 = p135 or NameVisual.GetRenderZoom();
    local v137 = NameVisual.GetRenderCoordinateScale();
    return l__round__23(p133 * v136 * v137), l__round__23(p134 * v136 * v137);
end;
function NameVisual.WorldToCanvasSize(p138, p139) --[[ Line: 492 ]]
    -- upvalues: l__round__23 (copy), l__max__28 (copy)
    local v140 = p139 or NameVisual.GetRenderZoom();
    local v141 = NameVisual.GetRenderCoordinateScale();
    return l__max__28(1, (l__round__23(p138 * v140 * v141)));
end;
function NameVisual.WorldToCanvasOffset(p142, p143) --[[ Line: 498 ]]
    -- upvalues: l__round__23 (copy)
    local v144 = p143 or NameVisual.GetRenderZoom();
    local v145 = NameVisual.GetRenderCoordinateScale();
    return l__round__23(p142 * v144 * v145);
end;
local v146 = l__PlayerGui__9:FindFirstChild("AgaricGameplayPositionQuery");
if not (v146 and v146:IsA("BindableFunction")) then
    if v146 then
        v146:Destroy();
    end;
    v146 = Instance.new("BindableFunction");
    v146.Name = "AgaricGameplayPositionQuery";
    v146.Parent = l__PlayerGui__9;
end;
function v146.OnInvoke() --[[ Line: 515 ]]
    -- upvalues: u66 (copy), l__max__28 (copy), l__sqrt__25 (copy), u60 (ref), u119 (ref), u120 (ref), u118 (ref)
    local v147 = {};
    for v148, v149 in pairs(u66) do
        local v150 = 0;
        local v151 = 0;
        local v152 = 0;
        local v153 = 0;
        for _, v154 in pairs(v149) do
            local v155 = v154.RenderRadius or (v154.Radius or 0);
            v150 = v150 + (v154.RenderX or (v154.ServerX or 0));
            v151 = v151 + (v154.RenderY or (v154.ServerY or 0));
            v152 = v152 + v155 * v155;
            v153 = v153 + 1;
        end;
        if v153 > 0 then
            v147[tostring(v148)] = {
                X = v150 / v153,
                Y = v151 / v153,
                Radius = l__sqrt__25((l__max__28(v152, 1)))
            };
        end;
    end;
    local v156 = u60 / 2;
    return {
        Self = {
            X = u119,
            Y = u120,
            Radius = l__sqrt__25((l__max__28(u118, 1)))
        },
        Zoom = NameVisual.GetRenderZoom(),
        MapSize = u60,
        MapHalfSize = v156,
        MapMinX = -v156,
        MapMaxX = v156,
        MapMinY = -v156,
        MapMaxY = v156,
        Players = v147
    };
end;
local u157 = 0;
local u158 = 0;
local u159 = -9999;
local u160 = -9999;
local u161 = {
    IsHoldingW = false,
    IsHoldingBotFeed = false,
    UserZoomOffset = 0,
    IsHoldingJoystick = false,
    LastWTime = 0,
    MobileGui = nil,
    ActiveMode = nil,
    PredictedTargetX = nil,
    PredictedTargetY = nil,
    FixedMouseEnabled = false,
    FixedMouseWorldX = nil,
    FixedMouseWorldY = nil,
    LocalFreezePendingUntil = 0,
    SpawnPendingUntil = 0,
    MobileAimPower = 0,
    DirArrow = nil,
    BotHud = nil,
    LastArrowX = -9999,
    LastArrowY = -9999,
    LastArrowRotation = -9999,
    LastFixedMarkerX = -9999,
    LastFixedMarkerY = -9999,
    SettingsProxy = nil,
    TouchOffset = l__new__32(0, 0),
    BaseZoom = l__Config__11.Client.BASE_ZOOM_PC,
    MobileAimDir = l__new__32(1, 0),
    BotButtons = {},
    KeyBindActions = {},
    KeyBindDefaults = {
        Split = "Space",
        Feed = "W",
        Freeze = "F",
        DoubleSplit = "E",
        TripleSplit = "R",
        Respawn = "B",
        Menu = "M",
        FixedMouse = "C",
        CycleControlledBlob = "Q",
        BotFeed = "X",
        BotSplit = "Z",
        BotFreeze = "A",
        Slot1 = "One",
        Slot2 = "Two",
        Slot3 = "Three",
        Slot4 = "Four",
        Slot5 = "Five",
        Slot6 = "Six",
        Slot7 = "Seven",
        Slot8 = "Eight",
        Slot9 = "Nine",
        Slot10 = "Zero"
    },
    KeyBindOrder = {
        "Split",
        "Feed",
        "Freeze",
        "DoubleSplit",
        "TripleSplit",
        "Respawn",
        "Menu",
        "FixedMouse",
        "CycleControlledBlob",
        "BotFeed",
        "BotSplit",
        "BotFreeze",
        "Slot1",
        "Slot2",
        "Slot3",
        "Slot4",
        "Slot5",
        "Slot6",
        "Slot7",
        "Slot8",
        "Slot9",
        "Slot10"
    }
};
local function v164() --[[ Line: 600 ]]
    -- upvalues: u1 (copy), u161 (copy)
    local v162 = u1:GetAttribute("ControlledBlobId");
    local v163 = u161;
    if type(v162) ~= "string" or v162 == "" then
        v162 = nil;
    end;
    v163.ControlledBlobId = v162;
end;
local function v167() --[[ Line: 604 ]]
    -- upvalues: u1 (copy), u161 (copy)
    local v165 = u1:GetAttribute("ControlledAccountId");
    local v166 = u161;
    if type(v165) ~= "string" or v165 == "" then
        v165 = nil;
    end;
    v166.ControlledAccountId = v165;
end;
local v168 = u1:GetAttribute("ControlledBlobId");
if type(v168) ~= "string" or v168 == "" then
    v168 = nil;
end;
u161.ControlledBlobId = v168;
local v169 = u1:GetAttribute("ControlledAccountId");
if type(v169) ~= "string" or v169 == "" then
    v169 = nil;
end;
u161.ControlledAccountId = v169;
u1:GetAttributeChangedSignal("ControlledBlobId"):Connect(v164);
u1:GetAttributeChangedSignal("ControlledAccountId"):Connect(v167);
local function u170(_) --[[ Line: 614 ]] end;
local function u171() --[[ Line: 615 ]] end;
local l__TouchEnabled__35 = l__UserInputService__5.TouchEnabled;
if l__TouchEnabled__35 then
    l__TouchEnabled__35 = not l__UserInputService__5.KeyboardEnabled;
end;
if l__TouchEnabled__35 then
    u161.BaseZoom = l__Config__11.Client.BASE_ZOOM_MOBILE;
    NameVisual.RenderCoordinateScale = 2;
else
    NameVisual.RenderCoordinateScale = 1;
end;
local v172 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.WorldInit);
local v173 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.WorldDelta);
local v174 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.WorldMove);
local u175 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.InputAction);
local u176 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.InputTarget);
local u177 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.InputPlace);
u161.StopBotPackFunction = l__Network__13:WaitForChild("StopBotPack", 10);
local u178 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.ReorderAbilitiesEvent);
local v179 = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.MatchState);
WorldEventEvent = l__Network__13:WaitForChild(l__SharedGameplay__12.NetworkNames.WorldEvent);
local u180 = {};
local u181 = Instance.new("ScreenGui");
u181.Name = "Agaric2D";
u181.ResetOnSpawn = false;
u181.IgnoreGuiInset = true;
u181.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
u181.ScreenInsets = Enum.ScreenInsets.None;
u181.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
u181.Parent = l__PlayerGui__9;
WorldEventOverlayGui = Instance.new("ScreenGui");
WorldEventOverlayGui.Name = "AgaricWorldEventOverlay";
WorldEventOverlayGui.ResetOnSpawn = false;
WorldEventOverlayGui.IgnoreGuiInset = true;
WorldEventOverlayGui.DisplayOrder = 1000;
WorldEventOverlayGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
WorldEventOverlayGui.ScreenInsets = Enum.ScreenInsets.None;
WorldEventOverlayGui.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
WorldEventOverlayGui.Parent = l__PlayerGui__9;
NameVisual.CachedScreenSize = u181.AbsoluteSize;
local v182 = Instance.new("ScreenGui");
v182.Name = "AgaricMatchOverlay";
v182.ResetOnSpawn = false;
v182.IgnoreGuiInset = true;
v182.DisplayOrder = 30;
v182.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
v182.ScreenInsets = Enum.ScreenInsets.None;
v182.SafeAreaCompatibility = Enum.SafeAreaCompatibility.None;
v182.Parent = l__PlayerGui__9;
local u183 = Instance.new("Frame", u181);
u183.Name = "VoidBackground";
u183.Size = UDim2.new(1, 0, 1, 0);
u183.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
u183.BorderSizePixel = 0;
u183.ZIndex = -20;
local u184 = Instance.new("Frame", u181);
u184.Name = "Camera";
u184.Size = UDim2.new(0, 0, 0, 0);
u184.Position = UDim2.new(0.5, 0, 0.5, 0);
u184.BackgroundTransparency = 1;
u184:SetAttribute("RenderZoom", 1);
Instance.new("UIScale", u184).Scale = 1 / NameVisual.GetRenderCoordinateScale();
local u185 = Instance.new("Frame", u184);
u185.Name = "Canvas";
u185.Size = UDim2.new(0, 0, 0, 0);
u185.BackgroundTransparency = 1;
NameVisual.PoolRoot = Instance.new("Frame", u181);
NameVisual.PoolRoot.Name = "PoolRoot";
NameVisual.PoolRoot.Size = l__fromOffset__31(0, 0);
NameVisual.PoolRoot.Position = l__fromOffset__31(-100000, -100000);
NameVisual.PoolRoot.BackgroundTransparency = 1;
NameVisual.PoolRoot.Visible = false;
local u186 = Instance.new("Frame", u185);
u186.Name = "LayerBottom";
u186.Size = UDim2.new(1, 0, 1, 0);
u186.BackgroundTransparency = 1;
u186.ZIndex = 1;
local u187 = Instance.new("Frame", u185);
u187.Name = "LayerMain";
u187.Size = UDim2.new(1, 0, 1, 0);
u187.BackgroundTransparency = 1;
u187.ZIndex = 2;
local u188 = Instance.new("ImageLabel", u187);
u188.Name = "PlacementPreview";
u188.AnchorPoint = l__new__32(0.5, 0.5);
u188.BackgroundTransparency = 1;
u188.ImageTransparency = 0.5;
u188.ZIndex = 100;
u188.Visible = false;
local v189 = nil;
local v190 = nil;
local v191 = nil;
local u192 = Instance.new("Frame", u187);
u192.Name = "FixedMouseMarker";
u192.AnchorPoint = l__new__32(0.5, 1);
u192.BackgroundTransparency = 1;
u192.Size = l__fromOffset__31(36, 48);
u192.ZIndex = 120;
u192.Visible = false;
local v193 = Instance.new("Frame", u192);
v193.Name = "Head";
v193.AnchorPoint = l__new__32(0.5, 0.5);
v193.Position = UDim2.new(0.5, 0, 0, 18);
v193.Size = l__fromOffset__31(18, 18);
v193.Rotation = 45;
v193.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
v193.BorderSizePixel = 0;
v193.ZIndex = u192.ZIndex + 1;
Instance.new("UICorner", v193).CornerRadius = UDim.new(0, 3);
local v194 = Instance.new("UIStroke", v193);
v194.Color = Color3.fromRGB(25, 25, 25);
v194.Thickness = 2;
local v195 = Instance.new("Frame", u192);
v195.Name = "Stem";
v195.AnchorPoint = l__new__32(0.5, 0);
v195.Position = UDim2.new(0.5, 0, 0, 27);
v195.Size = l__fromOffset__31(4, 19);
v195.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
v195.BorderSizePixel = 0;
v195.ZIndex = u192.ZIndex + 1;
local v196 = Instance.new("UIStroke", v195);
v196.Color = Color3.fromRGB(25, 25, 25);
v196.Thickness = 1;
function u161.UpdateFixedMouseMarkerPosition(p197) --[[ Line: 773 ]]
    -- upvalues: u161 (copy), u192 (copy), l__fromOffset__31 (copy)
    if type(u161.FixedMouseWorldX) == "number" and type(u161.FixedMouseWorldY) == "number" then
        local v198, v199 = NameVisual.WorldToCanvasPoint(u161.FixedMouseWorldX, u161.FixedMouseWorldY, p197);
        if u161.LastFixedMarkerX ~= v198 or u161.LastFixedMarkerY ~= v199 then
            u192.Position = l__fromOffset__31(v198, v199);
            local v200 = u161;
            u161.LastFixedMarkerX = v198;
            v200.LastFixedMarkerY = v199;
        end;
    end;
end;
u122.Frame = Instance.new("Frame");
u122.Frame.Name = "SpectateControls";
u122.Frame.AnchorPoint = l__new__32(0.5, 1);
u122.Frame.Position = UDim2.new(0.5, 0, 1, -96);
u122.Frame.Size = l__fromOffset__31(300, 44);
u122.Frame.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
u122.Frame.BackgroundTransparency = 0.18;
u122.Frame.BorderSizePixel = 0;
u122.Frame.ZIndex = 900;
u122.Frame.Visible = false;
u122.Frame.Parent = u181;
Instance.new("UICorner", u122.Frame).CornerRadius = UDim.new(0, 8);
u122.FrameStroke = Instance.new("UIStroke", u122.Frame);
u122.FrameStroke.Color = Color3.fromRGB(255, 255, 255);
u122.FrameStroke.Transparency = 0.78;
u122.FrameStroke.Thickness = 1;
u122.PrevButton = Instance.new("TextButton", u122.Frame);
u122.PrevButton.Name = "Previous";
u122.PrevButton.AnchorPoint = l__new__32(0, 0.5);
u122.PrevButton.Position = UDim2.new(0, 8, 0.5, 0);
u122.PrevButton.Size = l__fromOffset__31(38, 32);
u122.PrevButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
u122.PrevButton.BackgroundTransparency = 0.05;
u122.PrevButton.BorderSizePixel = 0;
u122.PrevButton.Text = "<";
u122.PrevButton.TextColor3 = Color3.fromRGB(255, 255, 255);
u122.PrevButton.Font = Enum.Font.GothamBlack;
u122.PrevButton.TextSize = 22;
u122.PrevButton.ZIndex = 901;
Instance.new("UICorner", u122.PrevButton).CornerRadius = UDim.new(0, 7);
u122.NextButton = Instance.new("TextButton", u122.Frame);
u122.NextButton.Name = "Next";
u122.NextButton.AnchorPoint = l__new__32(1, 0.5);
u122.NextButton.Position = UDim2.new(1, -8, 0.5, 0);
u122.NextButton.Size = l__fromOffset__31(38, 32);
u122.NextButton.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
u122.NextButton.BackgroundTransparency = 0.05;
u122.NextButton.BorderSizePixel = 0;
u122.NextButton.Text = ">";
u122.NextButton.TextColor3 = Color3.fromRGB(255, 255, 255);
u122.NextButton.Font = Enum.Font.GothamBlack;
u122.NextButton.TextSize = 22;
u122.NextButton.ZIndex = 901;
Instance.new("UICorner", u122.NextButton).CornerRadius = UDim.new(0, 7);
u122.TargetLabel = Instance.new("TextLabel", u122.Frame);
u122.TargetLabel.Name = "Target";
u122.TargetLabel.AnchorPoint = l__new__32(0.5, 0.5);
u122.TargetLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
u122.TargetLabel.Size = UDim2.new(1, -104, 1, -8);
u122.TargetLabel.BackgroundTransparency = 1;
u122.TargetLabel.Text = "Spectating";
u122.TargetLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
u122.TargetLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
u122.TargetLabel.TextStrokeTransparency = 0.8;
u122.TargetLabel.Font = Enum.Font.GothamBold;
u122.TargetLabel.TextSize = 14;
u122.TargetLabel.TextTruncate = Enum.TextTruncate.AtEnd;
u122.TargetLabel.ZIndex = 901;
local u201 = Instance.new("ImageLabel", u185);
u201.Name = "MapBackground";
u201.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
u201.BorderSizePixel = 0;
u201.ScaleType = Enum.ScaleType.Tile;
u201.TileSize = UDim2.new(0, l__Config__11.Client.TILE_SIZE, 0, l__Config__11.Client.TILE_SIZE);
u201.ZIndex = -10;
u201.AnchorPoint = l__new__32(0.5, 0.5);
if l__Config__11.Client.BACKGROUND_IMAGE_ID == "" then
    u201.Visible = false;
else
    u201.Visible = true;
    u201.Image = l__Config__11.Client.BACKGROUND_IMAGE_ID;
end;
function u161.ApplyBackgroundColor() --[[ Line: 863 ]]
    -- upvalues: u161 (copy), u183 (copy), u201 (copy)
    local l__SettingsProxy__36 = u161.SettingsProxy;
    if l__SettingsProxy__36 then
        local u202 = Color3.fromRGB(255, 255, 255);
        local u203;
        if l__SettingsProxy__36 then
            local v204 = l__SettingsProxy__36:GetAttribute("BackgroundColor") or "";
            u203 = tostring(v204) or "";
        else
            u203 = "";
        end;
        if u203 ~= "" then
            pcall(function() --[[ Line: 871 ]]
                -- upvalues: u202 (ref), u203 (copy)
                u202 = Color3.fromHex(string.gsub(u203, "#", ""));
            end);
        end;
        u183.BackgroundColor3 = u202;
        u201.BackgroundColor3 = u202;
    end;
end;
task.spawn(function() --[[ Line: 879 ]]
    -- upvalues: u161 (copy), l__ClientPlayerState__16 (copy), u1 (copy)
    u161.SettingsProxy = u161.SettingsProxy or l__ClientPlayerState__16.WaitForProxy("Settings", u1, 10);
    u161.ApplyBackgroundColor();
    if u161.SettingsProxy then
        u161.SettingsProxy:GetAttributeChangedSignal("BackgroundColor"):Connect(u161.ApplyBackgroundColor);
    end;
end);
local u205 = Instance.new("Frame", u185);
u205.Name = "FogBoundary";
u205.AnchorPoint = l__new__32(0.5, 0.5);
u205.Position = l__fromOffset__31(0, 0);
u205.Size = l__fromOffset__31(0, 0);
u205.BackgroundTransparency = 1;
u205.BorderSizePixel = 0;
u205.Visible = false;
u205.ZIndex = 0;
Instance.new("UICorner", u205).CornerRadius = UDim.new(0, 0);
local v206 = Instance.new("UIStroke", u205);
v206.Color = Color3.fromRGB(220, 35, 35);
v206.Thickness = 8;
v206.Transparency = 0.1;
local u207 = v189;
local u208 = v191;
local u209 = v190;
local u210 = u132;
local u211 = u131;
local u212 = v101;
local u213 = u124;
local u214 = {};
for _, v215 in ipairs({
    "Top",
    "Bottom",
    "Left",
    "Right"
}) do
    local v216 = Instance.new("Frame", u185);
    v216.Name = "FogDamage" .. v215;
    v216.AnchorPoint = l__new__32(0.5, 0.5);
    v216.BackgroundColor3 = Color3.fromRGB(220, 35, 35);
    v216.BackgroundTransparency = 0.68;
    v216.BorderSizePixel = 0;
    v216.Visible = false;
    v216.ZIndex = -1;
    u214[v215] = v216;
end;
local u217 = {
    Enabled = false,
    Phase = "",
    FogActive = false,
    FogRadius = 0,
    LocalReady = false
};
local u218 = Instance.new("TextLabel", v182);
u218.Name = "MatchStatus";
u218.AnchorPoint = l__new__32(0.5, 0);
u218.Position = UDim2.new(0.5, 0, 0, 12);
u218.Size = l__fromOffset__31(560, 34);
u218.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
u218.BackgroundTransparency = 0.22;
u218.BorderSizePixel = 0;
u218.Font = Enum.Font.GothamBold;
u218.TextColor3 = Color3.fromRGB(255, 255, 255);
u218.TextSize = 17;
u218.Text = "";
u218.Visible = false;
u218.ZIndex = 930;
Instance.new("UICorner", u218).CornerRadius = UDim.new(0, 8);
local v219 = Instance.new("UIStroke", u218);
v219.Color = Color3.fromRGB(255, 85, 0);
v219.Thickness = 2;
v219.Transparency = 0.25;
WorldEventState = nil;
WORLD_EVENT_BANNER_TOP = 8;
WORLD_EVENT_BANNER_GAP = 1;
WorldEventUi = {
    WeatherVisual = "",
    WeatherSignature = "",
    TooltipPinned = false,
    NextFlashAt = 0,
    FlashUntil = 0,
    Buttons = {},
    WeatherParts = {},
    Sounds = {}
};
WorldEventUi.Tint = Instance.new("Frame", u181);
WorldEventUi.Tint.Name = "WorldEventTint";
WorldEventUi.Tint.Size = UDim2.new(1, 0, 1, 0);
WorldEventUi.Tint.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
WorldEventUi.Tint.BackgroundTransparency = 1;
WorldEventUi.Tint.BorderSizePixel = 0;
WorldEventUi.Tint.ZIndex = 820;
WorldEventUi.Tint.Visible = false;
WorldEventUi.Tint.Active = false;
WorldEventUi.WeatherLayer = Instance.new("Frame", u181);
WorldEventUi.WeatherLayer.Name = "WorldEventWeather";
WorldEventUi.WeatherLayer.Size = UDim2.new(1, 0, 1, 0);
WorldEventUi.WeatherLayer.BackgroundTransparency = 1;
WorldEventUi.WeatherLayer.BorderSizePixel = 0;
WorldEventUi.WeatherLayer.ZIndex = 830;
WorldEventUi.WeatherLayer.Visible = false;
WorldEventUi.WeatherLayer.Active = false;
WorldEventUi.BoostBar = Instance.new("Frame", u181);
WorldEventUi.BoostBar.Name = "WorldEventBoostBar";
WorldEventUi.BoostBar.AnchorPoint = l__new__32(0.5, 0);
WorldEventUi.BoostBar.Position = UDim2.new(0.5, 0, 0, WORLD_EVENT_BANNER_TOP);
WorldEventUi.BoostBar.Size = l__fromOffset__31(520, 46);
WorldEventUi.BoostBar.BackgroundColor3 = Color3.fromRGB(20, 22, 28);
WorldEventUi.BoostBar.BackgroundTransparency = 1;
WorldEventUi.BoostBar.BorderSizePixel = 0;
WorldEventUi.BoostBar.Visible = false;
WorldEventUi.BoostBar.ZIndex = 1240;
WorldEventUi.BoostBar.Active = false;
Instance.new("UICorner", WorldEventUi.BoostBar).CornerRadius = UDim.new(0, 8);
WorldEventUi.BoostStroke = Instance.new("UIStroke", WorldEventUi.BoostBar);
WorldEventUi.BoostStroke.Color = Color3.fromRGB(255, 255, 255);
WorldEventUi.BoostStroke.Thickness = 1;
WorldEventUi.BoostStroke.Transparency = 1;
WorldEventUi.BoostLayout = Instance.new("UIListLayout", WorldEventUi.BoostBar);
WorldEventUi.BoostLayout.FillDirection = Enum.FillDirection.Horizontal;
WorldEventUi.BoostLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
WorldEventUi.BoostLayout.VerticalAlignment = Enum.VerticalAlignment.Center;
WorldEventUi.BoostLayout.Padding = UDim.new(0, 6);
WorldEventUi.Title = Instance.new("TextLabel", WorldEventUi.BoostBar);
WorldEventUi.Title.Name = "Title";
WorldEventUi.Title.Size = l__fromOffset__31(170, 40);
WorldEventUi.Title.BackgroundTransparency = 1;
WorldEventUi.Title.Font = Enum.Font.GothamBold;
WorldEventUi.Title.TextColor3 = Color3.fromRGB(255, 255, 255);
WorldEventUi.Title.TextTransparency = 1;
WorldEventUi.Title.TextSize = 12;
WorldEventUi.Title.Visible = false;
WorldEventUi.Title.TextWrapped = true;
WorldEventUi.Title.TextXAlignment = Enum.TextXAlignment.Center;
WorldEventUi.Title.TextYAlignment = Enum.TextYAlignment.Center;
WorldEventUi.Title.ZIndex = 1241;
WorldEventUi.Tooltip = Instance.new("TextLabel", u181);
WorldEventUi.Tooltip.Name = "WorldEventTooltip";
WorldEventUi.Tooltip.AnchorPoint = l__new__32(0, 0);
WorldEventUi.Tooltip.Position = UDim2.new(0.5, 0, 0, 60);
WorldEventUi.Tooltip.Size = l__fromOffset__31(360, 34);
WorldEventUi.Tooltip.BackgroundColor3 = Color3.fromRGB(16, 16, 18);
WorldEventUi.Tooltip.BackgroundTransparency = 0.12;
WorldEventUi.Tooltip.BorderSizePixel = 0;
WorldEventUi.Tooltip.Font = Enum.Font.GothamBold;
WorldEventUi.Tooltip.TextColor3 = Color3.fromRGB(255, 255, 255);
WorldEventUi.Tooltip.TextSize = 12;
WorldEventUi.Tooltip.TextWrapped = true;
WorldEventUi.Tooltip.Visible = false;
WorldEventUi.Tooltip.ZIndex = 5000;
Instance.new("UICorner", WorldEventUi.Tooltip).CornerRadius = UDim.new(0, 8);
WorldEventUi.CrateState = nil;
WorldEventUi.KingHillState = nil;
WorldEventUi.LeaderBountyState = nil;
WorldEventUi.CrateBanner = Instance.new("Frame", WorldEventOverlayGui);
WorldEventUi.CrateBanner.Name = "GoldenCrateBanner";
WorldEventUi.CrateBanner.AnchorPoint = l__new__32(0.5, 0);
WorldEventUi.CrateBanner.Position = UDim2.new(0.5, 0, 0, WORLD_EVENT_BANNER_TOP);
WorldEventUi.CrateBanner.Size = l__fromOffset__31(500, 52);
WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(28, 20, 6);
WorldEventUi.CrateBanner.BackgroundTransparency = 1;
WorldEventUi.CrateBanner.BorderSizePixel = 0;
WorldEventUi.CrateBanner.Visible = false;
WorldEventUi.CrateBanner.ZIndex = 9000;
Instance.new("UICorner", WorldEventUi.CrateBanner).CornerRadius = UDim.new(0, 8);
WorldEventUi.CrateStroke = Instance.new("UIStroke", WorldEventUi.CrateBanner);
WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 210, 80);
WorldEventUi.CrateStroke.Thickness = 1;
WorldEventUi.CrateStroke.Transparency = 1;
WorldEventUi.CrateLabel = Instance.new("TextLabel", WorldEventUi.CrateBanner);
WorldEventUi.CrateLabel.Name = "Text";
WorldEventUi.CrateLabel.Size = UDim2.new(1, -18, 1, -10);
WorldEventUi.CrateLabel.Position = UDim2.fromOffset(9, 5);
WorldEventUi.CrateLabel.BackgroundTransparency = 1;
WorldEventUi.CrateLabel.Font = Enum.Font.GothamBlack;
WorldEventUi.CrateLabel.TextColor3 = Color3.fromRGB(255, 232, 125);
WorldEventUi.CrateLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
WorldEventUi.CrateLabel.TextStrokeTransparency = 0.32;
WorldEventUi.CrateLabel.TextScaled = true;
WorldEventUi.CrateLabel.TextWrapped = true;
WorldEventUi.CrateLabel.TextYAlignment = Enum.TextYAlignment.Top;
WorldEventUi.CrateLabel.ZIndex = 9001;
local v220 = Instance.new("UITextSizeConstraint", WorldEventUi.CrateLabel);
v220.MinTextSize = 12;
v220.MaxTextSize = 22;
WorldEventUi.CrateSound = Instance.new("Sound", u181);
WorldEventUi.CrateSound.Name = "GoldenCrateSound";
function WorldEventFormatMultiplier(p221)
    -- upvalues: l__round__23 (copy), l__abs__22 (copy)
    local v222 = tonumber(p221) or 1;
    if l__abs__22(v222 - l__round__23(v222)) >= 0.01 then
        return "x" .. string.format("%.2f", v222):gsub("0$", ""):gsub("%.$", "");
    end;
    local v223 = l__round__23(v222);
    return "x" .. tostring(v223);
end;
function WorldEventFormatTime(p224)
    -- upvalues: l__floor__27 (copy), l__max__28 (copy)
    local v225 = l__max__28(0, (l__floor__27(tonumber(p224) or 0)));
    return string.format("%d:%02d", l__floor__27(v225 / 60), v225 % 60);
end;
local u226 = {
    Rain = "Rain",
    Snow = "Snow",
    Thunderstorm = "Thunderstorm",
    MeteorStorm = "Meteor Storm",
    FoodBloom = "Food Bloom"
};
local u227 = {
    ["Дождь"] = "Rain",
    ["Снег"] = "Snow",
    ["Гроза"] = "Thunderstorm",
    ["Метеоритный шторм"] = "Meteor Storm"
};
function WorldEventDisplayName(p228)
    -- upvalues: u226 (copy), u227 (copy)
    if type(p228) ~= "table" then
        return "World Event";
    end;
    local v229 = tostring(p228.Id or "");
    if u226[v229] then
        return u226[v229];
    end;
    local v230 = tostring(p228.DisplayName or "");
    return u227[v230] or ((v230 == "" or not v230) and "World Event" or v230);
end;
function WorldEventGetActiveEvents(p231)
    local v232 = {};
    if type(p231) == "table" and type(p231.ActiveEvents) == "table" then
        for _, v233 in ipairs(p231.ActiveEvents) do
            if type(v233) == "table" and v233.Active == true then
                v232[#v232 + 1] = v233;
            end;
        end;
        return v232;
    else
        if type(p231) == "table" and p231.Active == true then
            v232[1] = p231;
        end;
        return v232;
    end;
end;
function WorldEventBuildTitle(p234, p235)
    -- upvalues: l__Workspace__4 (copy), l__min__29 (copy)
    if type(p234) ~= "table" or #p234 == 0 then
        return "World Event";
    end;
    local v236 = p235 and 1 or 2;
    local v237 = {};
    local v238 = (1 / 0);
    for v239, v240 in ipairs(p234) do
        if v239 <= v236 then
            v237[#v237 + 1] = WorldEventDisplayName(v240);
        end;
        v238 = l__min__29(v238, (tonumber(v240.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow());
    end;
    local v241 = #p234 - v236;
    local v242 = v241 > 0 and " +" .. tostring(v241) or "";
    return table.concat(v237, " + ") .. v242 .. "\n" .. WorldEventFormatTime(v238);
end;
function WorldEventBoostText(p243)
    local v244 = tostring(p243.Kind or "Boost");
    local v245 = tostring(p243.Label or v244);
    local v246 = v244 == "Gold" and "gold" or (v244 == "XP" and "XP" or (v244 == "MapSize" and "map size" or (v244 == "FoodSize" and "food size" or v245)));
    return WorldEventFormatMultiplier(p243.Multiplier) .. " " .. v246;
end;
function WorldEventRemainingRatioFromTimes(p247, p248)
    -- upvalues: l__max__28 (copy), l__Workspace__4 (copy), l__clamp__26 (copy)
    local v249 = tonumber(p248) or 0;
    local v250 = l__max__28(1, v249 - (tonumber(p247) or 0));
    return l__clamp__26((v249 - l__Workspace__4:GetServerTimeNow()) / v250, 0, 1);
end;
function WorldEventRemainingTextFromEnd(p251)
    -- upvalues: l__Workspace__4 (copy)
    return WorldEventFormatTime((tonumber(p251) or 0) - l__Workspace__4:GetServerTimeNow());
end;
function WorldEventBuildBoostTooltip(p252, p253)
    local v254 = WorldEventDisplayName(p252);
    local v255 = ": ";
    local v256 = WorldEventBoostText(p253);
    local v257 = " | ";
    local v258 = WorldEventRemainingTextFromEnd;
    if p252 then
        p252 = p252.EndsAt;
    end;
    return v254 .. v255 .. v256 .. v257 .. v258(p252) .. " left";
end;
function WorldEventUpdateBoostButtonTimers()
    for _, v259 in ipairs(WorldEventUi.Buttons or {}) do
        if v259 and v259.Parent then
            local v260 = WorldEventRemainingRatioFromTimes(v259:GetAttribute("EventStartedAt"), v259:GetAttribute("EventEndsAt"));
            local v261 = v259:FindFirstChild("TimeFill");
            if v261 and v261:IsA("Frame") then
                v261.Size = UDim2.new(1, 0, v260, 0);
            end;
            local v262 = v259:GetAttribute("TooltipPrefix");
            if type(v262) == "string" and v262 ~= "" then
                local v263 = v262 .. " | " .. WorldEventRemainingTextFromEnd(v259:GetAttribute("EventEndsAt")) .. " left";
                v259:SetAttribute("TooltipText", v263);
                if WorldEventUi.Tooltip.Visible and WorldEventUi.TouchTooltipButton == v259 then
                    WorldEventUi.Tooltip.Text = v263;
                end;
            end;
        end;
    end;
end;
function WorldEventGetBoostTooltipTop(p264)
    -- upvalues: l__max__28 (copy)
    local v265 = tonumber(p264) or 60;
    if WorldEventUi and (WorldEventUi.BoostBar and WorldEventUi.BoostBar.Visible) then
        v265 = l__max__28(v265, (tonumber(WorldEventUi.BoostBar.Position.Y.Offset) or WORLD_EVENT_BANNER_TOP) + (tonumber(WorldEventUi.BoostBar.Size.Y.Offset) or 46) + 4);
    end;
    return v265;
end;
function WorldEventPositionTooltipNearButton(p266)
    -- upvalues: u181 (copy), l__max__28 (copy), l__TouchEnabled__35 (ref), l__UserInputService__5 (copy), l__clamp__26 (copy)
    local l__AbsoluteSize__37 = u181.AbsoluteSize;
    local l__AbsoluteSize__38 = WorldEventUi.Tooltip.AbsoluteSize;
    local v267 = l__max__28(l__AbsoluteSize__38.X, WorldEventUi.Tooltip.Size.X.Offset);
    local v268 = l__max__28(l__AbsoluteSize__38.Y, WorldEventUi.Tooltip.Size.Y.Offset);
    local v269 = (l__AbsoluteSize__37.X - v267) * 0.5;
    local v270 = WorldEventGetBoostTooltipTop(l__TouchEnabled__35 and 88 or 60);
    if l__TouchEnabled__35 then
        if p266 and p266.Parent then
            local l__AbsolutePosition__39 = p266.AbsolutePosition;
            local l__AbsoluteSize__40 = p266.AbsoluteSize;
            v269 = l__AbsolutePosition__39.X + l__AbsoluteSize__40.X * 0.5 - v267 * 0.5;
            v270 = l__AbsolutePosition__39.Y + l__AbsoluteSize__40.Y + 6;
            if v270 + v268 > l__AbsoluteSize__37.Y - 8 then
                v270 = l__AbsolutePosition__39.Y - v268 - 6;
            end;
        end;
    else
        local v271 = l__UserInputService__5:GetMouseLocation();
        v269 = v271.X + 14;
        v270 = v271.Y + 18;
        if v269 + v267 > l__AbsoluteSize__37.X - 8 then
            v269 = v271.X - v267 - 14;
        end;
        if v270 + v268 > l__AbsoluteSize__37.Y - 8 then
            v270 = v271.Y - v268 - 14;
        end;
    end;
    local v272 = l__clamp__26(v269, 8, (l__max__28(8, l__AbsoluteSize__37.X - v267 - 8)));
    local v273 = l__clamp__26(v270, 8, (l__max__28(8, l__AbsoluteSize__37.Y - v268 - 8)));
    WorldEventUi.Tooltip.Position = UDim2.fromOffset(v272, v273);
end;
function WorldEventShowTooltip(p274, p275)
    -- upvalues: l__TouchEnabled__35 (ref), l__fromOffset__31 (copy), u181 (copy), l__clamp__26 (copy)
    WorldEventUi.TooltipHideToken = (WorldEventUi.TooltipHideToken or 0) + 1;
    WorldEventUi.Tooltip.Text = tostring(p274 or "");
    if l__TouchEnabled__35 then
        WorldEventUi.Tooltip.Size = l__fromOffset__31(l__clamp__26(u181.AbsoluteSize.X - 56, 220, 320), 42);
        WorldEventUi.Tooltip.TextSize = 11;
    else
        WorldEventUi.Tooltip.Size = l__fromOffset__31(300, 34);
        WorldEventUi.Tooltip.TextSize = 12;
    end;
    WorldEventPositionTooltipNearButton(p275);
    WorldEventUi.Tooltip.Visible = WorldEventUi.Tooltip.Text ~= "";
end;
function WorldEventScheduleTooltipHide(p276, u277)
    WorldEventUi.TooltipHideToken = (WorldEventUi.TooltipHideToken or 0) + 1;
    local l__TooltipHideToken__41 = WorldEventUi.TooltipHideToken;
    task.delay(p276 or 2.25, function() --[[ Line: 1245 ]]
        -- upvalues: l__TooltipHideToken__41 (copy), u277 (copy)
        if WorldEventUi.TooltipHideToken == l__TooltipHideToken__41 and (not u277 or WorldEventUi.TouchTooltipButton == u277) then
            WorldEventUi.TooltipPinned = false;
            WorldEventUi.TouchTooltipButton = nil;
            WorldEventHideTooltip();
        end;
    end);
end;
function WorldEventHideTooltip()
    if not WorldEventUi.TooltipPinned then
        WorldEventUi.Tooltip.Visible = false;
        WorldEventUi.TouchTooltipButton = nil;
    end;
end;
function WorldEventFindBoostButtonAtPosition(p278)
    local v279;
    if p278 then
        v279 = p278.X;
    else
        v279 = p278;
    end;
    local v280 = tonumber(v279);
    if p278 then
        p278 = p278.Y;
    end;
    local v281 = tonumber(p278);
    if not (v280 and v281) then
        return nil;
    end;
    for _, v282 in ipairs(WorldEventUi.Buttons or {}) do
        if v282 and (v282.Parent and v282.Visible) then
            local l__AbsolutePosition__42 = v282.AbsolutePosition;
            local l__AbsoluteSize__43 = v282.AbsoluteSize;
            if l__AbsolutePosition__42.X <= v280 and (v280 <= l__AbsolutePosition__42.X + l__AbsoluteSize__43.X and (l__AbsolutePosition__42.Y <= v281 and v281 <= l__AbsolutePosition__42.Y + l__AbsoluteSize__43.Y)) then
                return v282;
            end;
        end;
    end;
    return nil;
end;
function WorldEventShowBoostTooltipForButton(p283, p284)
    if not p283 then
        return false;
    end;
    local v285 = p283:GetAttribute("TooltipText");
    if type(v285) ~= "string" or v285 == "" then
        return false;
    end;
    WorldEventUi.TooltipPinned = p284 == true;
    WorldEventUi.TouchTooltipButton = p283;
    WorldEventShowTooltip(v285, p283);
    return true;
end;
l__UserInputService__5.InputBegan:Connect(function(p286, _) --[[ Line: 1294 ]]
    if p286.UserInputType == Enum.UserInputType.Touch then
        local v287 = WorldEventFindBoostButtonAtPosition(p286.Position);
        if v287 then
            WorldEventUi.ActiveTouchBoostInput = p286;
            WorldEventShowBoostTooltipForButton(v287, true);
        end;
    end;
end);
l__UserInputService__5.InputChanged:Connect(function(p288) --[[ Line: 1305 ]]
    -- upvalues: l__TouchEnabled__35 (ref)
    if p288.UserInputType == Enum.UserInputType.MouseMovement then
        if WorldEventUi.Tooltip.Visible and (WorldEventUi.TouchTooltipButton and not l__TouchEnabled__35) then
            WorldEventPositionTooltipNearButton(WorldEventUi.TouchTooltipButton);
        end;
    elseif p288.UserInputType == Enum.UserInputType.Touch and p288 == WorldEventUi.ActiveTouchBoostInput then
        local v289 = WorldEventFindBoostButtonAtPosition(p288.Position);
        if v289 and v289 ~= WorldEventUi.TouchTooltipButton then
            WorldEventShowBoostTooltipForButton(v289, true);
        end;
    end;
end);
l__UserInputService__5.InputEnded:Connect(function(p290) --[[ Line: 1321 ]]
    if p290.UserInputType == Enum.UserInputType.Touch and p290 == WorldEventUi.ActiveTouchBoostInput then
        WorldEventUi.ActiveTouchBoostInput = nil;
        WorldEventScheduleTooltipHide(3, WorldEventUi.TouchTooltipButton);
    end;
end);
function WorldEventClearBoosts()
    for _, v291 in ipairs(WorldEventUi.Buttons) do
        v291:Destroy();
    end;
    table.clear(WorldEventUi.Buttons);
    WorldEventUi.Tooltip.Visible = false;
    WorldEventUi.TooltipPinned = false;
    WorldEventUi.TouchTooltipButton = nil;
    WorldEventUi.TooltipHideToken = (WorldEventUi.TooltipHideToken or 0) + 1;
end;
function WorldEventClearWeather()
    for _, v292 in ipairs(WorldEventUi.WeatherParts) do
        v292:Destroy();
    end;
    table.clear(WorldEventUi.WeatherParts);
    WorldEventUi.WeatherVisual = "";
    WorldEventUi.WeatherSignature = "";
    WorldEventUi.WeatherLayer.Visible = false;
end;
function WorldEventMakeWeatherPart(p293, p294)
    -- upvalues: l__fromOffset__31 (copy), u181 (copy), l__max__28 (copy)
    local v295 = Instance.new("Frame");
    v295.BorderSizePixel = 0;
    v295.ZIndex = 831;
    v295.Parent = WorldEventUi.WeatherLayer;
    v295:SetAttribute("Speed", math.random(120, 340));
    v295:SetAttribute("Drift", math.random(-25, 25));
    v295:SetAttribute("Visual", p293);
    if p293 == "Snow" then
        v295.Size = l__fromOffset__31(math.random(3, 7), math.random(3, 7));
        v295.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
        v295.BackgroundTransparency = math.random(10, 38) / 100;
        Instance.new("UICorner", v295).CornerRadius = UDim.new(1, 0);
        v295:SetAttribute("Speed", math.random(28, 78));
    elseif p293 == "Meteor" then
        v295.Size = l__fromOffset__31(math.random(38, 86), 3);
        v295.BackgroundColor3 = Color3.fromRGB(255, math.random(120, 210), 70);
        v295.BackgroundTransparency = math.random(5, 26) / 100;
        v295.Rotation = 35;
        v295:SetAttribute("Speed", math.random(360, 760));
    elseif p293 == "Bloom" then
        v295.Size = l__fromOffset__31(math.random(5, 12), math.random(5, 12));
        v295.BackgroundColor3 = Color3.fromRGB(math.random(90, 140), math.random(210, 255), math.random(110, 170));
        v295.BackgroundTransparency = math.random(30, 55) / 100;
        Instance.new("UICorner", v295).CornerRadius = UDim.new(1, 0);
        v295:SetAttribute("Speed", math.random(18, 42));
    else
        v295.Size = l__fromOffset__31(2, math.random(14, 26));
        v295.BackgroundColor3 = p293 == "Storm" and Color3.fromRGB(160, 190, 255) or Color3.fromRGB(130, 185, 255);
        v295.BackgroundTransparency = math.random(25, 55) / 100;
        v295.Rotation = 8;
    end;
    v295.Position = UDim2.fromOffset(math.random(-80, (l__max__28(80, u181.AbsoluteSize.X + 80))), math.random(-120, (l__max__28(120, u181.AbsoluteSize.Y))));
    WorldEventUi.WeatherParts[p294] = v295;
end;
function WorldEventWeatherSignature(p296)
    local v297 = {};
    for _, v298 in ipairs(p296 or {}) do
        local v299 = tostring(v298.Visual or "");
        if v299 ~= "" then
            v297[#v297 + 1] = v299;
        end;
    end;
    return table.concat(v297, "|");
end;
function WorldEventBuildWeather(p300)
    -- upvalues: l__sqrt__25 (copy), l__clamp__26 (copy), l__floor__27 (copy)
    WorldEventClearWeather();
    local v301 = WorldEventWeatherSignature(p300);
    WorldEventUi.WeatherSignature = v301;
    WorldEventUi.WeatherVisual = v301;
    WorldEventUi.WeatherLayer.Visible = v301 ~= "";
    local v302 = {};
    for _, v303 in ipairs(p300 or {}) do
        local v304 = tostring(v303.Visual or "");
        if v304 ~= "" then
            v302[#v302 + 1] = v304;
        end;
    end;
    local v305 = #v302 > 1 and (l__clamp__26(1 / l__sqrt__25(#v302), 0.4, 0.75) or 1) or 1;
    for _, v306 in ipairs(v302) do
        local v307 = l__floor__27((v306 == "Rain" and 58 or (v306 == "Storm" and 74 or (v306 == "Snow" and 54 or (v306 == "Meteor" and 18 or (v306 == "Bloom" and 34 or 0))))) * v305);
        local v308 = #WorldEventUi.WeatherParts;
        for v309 = 1, v307 do
            WorldEventMakeWeatherPart(v306, v308 + v309);
        end;
    end;
end;
function WorldEventTintColor(p310)
    local v311 = type(p310) == "table" and p310.TintColor or nil;
    if type(v311) == "table" then
        return Color3.fromRGB(tonumber(v311[1]) or 255, tonumber(v311[2]) or 255, tonumber(v311[3]) or 255);
    else
        return Color3.fromRGB(255, 255, 255);
    end;
end;
function WorldEventTintTransparency(p312)
    -- upvalues: l__max__28 (copy), l__clamp__26 (copy)
    if p312 then
        p312 = p312.TintTransparency;
    end;
    return l__clamp__26(l__max__28(tonumber(p312) or 0.93, 0.93), 0, 1);
end;
function WorldEventSelectTintPayload(p313)
    local v314;
    if type(p313) == "table" then
        v314 = p313[1] or nil;
    else
        v314 = nil;
    end;
    local v315 = 2;
    for _, v316 in ipairs(p313 or {}) do
        local v317 = WorldEventTintTransparency(v316);
        if v317 < v315 then
            v314 = v316;
            v315 = v317;
        end;
    end;
    return v314;
end;
function WorldEventHasVisual(p318, p319)
    for _, v320 in ipairs(p318 or {}) do
        if tostring(v320.Visual or "") == p319 then
            return true;
        end;
    end;
    return false;
end;
function WorldEventSoundId(p321)
    local v322 = tostring(p321 and (p321.SoundId or "") or "");
    if v322 ~= "" then
        return v322;
    end;
    local v323 = tostring(p321 and p321.SoundName or "");
    if v323 ~= "" then
        local v324 = game:GetService("SoundService"):FindFirstChild(v323);
        if v324 and v324:IsA("Sound") then
            return v324.SoundId;
        end;
    end;
    return "";
end;
function GoldenCrateFormatCoins(p325)
    -- upvalues: l__floor__27 (copy), l__max__28 (copy)
    local v326 = l__max__28(0, (l__floor__27(tonumber(p325) or 0)));
    local v327 = tostring(v326);
    local v328;
    repeat
        v327, v328 = v327:gsub("^(%d+)(%d%d%d)", "%1,%2");
    until v328 == 0;
    return v327;
end;
function GoldenCratePlaySound(p329)
    -- upvalues: l__clamp__26 (copy)
    local l__CrateSound__44 = WorldEventUi.CrateSound;
    local v330 = WorldEventSoundId(p329);
    if v330 == "" then
        l__CrateSound__44:Stop();
    else
        if l__CrateSound__44.SoundId ~= v330 then
            l__CrateSound__44.SoundId = v330;
        end;
        l__CrateSound__44.Looped = p329.SoundLoop == true;
        l__CrateSound__44.Volume = l__clamp__26(tonumber(p329.SoundVolume) or 0.12, 0, 0.3);
        l__CrateSound__44:Play();
    end;
end;
function GoldenCrateBuildText(p331)
    -- upvalues: l__Workspace__4 (copy)
    local v332 = tostring(p331.Phase or "");
    if v332 == "Spawned" then
        return "Golden Crate dropped! Reward: " .. GoldenCrateFormatCoins(p331.Reward) .. " Gold";
    end;
    if v332 == "Collected" then
        return tostring(p331.PlayerName or "Player") .. " collected the Golden Crate: " .. GoldenCrateFormatCoins(p331.Reward) .. " Gold";
    end;
    local v333 = (tonumber(p331.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
    return "Golden Crate drops in " .. WorldEventFormatTime(v333) .. " | " .. GoldenCrateFormatCoins(p331.Reward) .. " Gold";
end;
function GoldenCrateApply(p334)
    if type(p334) == "table" then
        local v335 = tostring(p334.Phase or "");
        if v335 == "Clear" or v335 == "" then
            WorldEventUi.CrateState = nil;
            WorldEventRefreshSpecialBanner();
        else
            WorldEventUi.CrateState = p334;
            WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(28, 20, 6);
            WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 210, 80);
            GoldenCratePlaySound(p334);
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function GoldenCrateUpdate()
    -- upvalues: l__Workspace__4 (copy)
    local l__CrateState__45 = WorldEventUi.CrateState;
    if type(l__CrateState__45) == "table" then
        local v336 = tostring(l__CrateState__45.Phase or "");
        local v337 = (tonumber(l__CrateState__45.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
        if v336 == "Collected" and v337 <= 0 then
            GoldenCrateApply({
                Phase = "Clear"
            });
        else
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function KingHillBuildText(p338)
    -- upvalues: l__Workspace__4 (copy)
    local v339 = (tonumber(p338.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
    local v340 = GoldenCrateFormatCoins(p338.Reward);
    local v341 = "Reward: " .. v340 .. " Gold";
    local v342 = tostring(p338.Phase or "");
    if v342 == "Started" then
        return "King Hill started! " .. v341 .. " | " .. WorldEventFormatTime(v339);
    elseif v342 == "Status" then
        local v343 = tonumber(p338.ContestCount) or 0;
        if v343 >= 2 then
            return "Zone contested: " .. tostring(v343) .. " players inside. Tokens paused | " .. v341 .. " | " .. WorldEventFormatTime(v339);
        else
            local v344 = tostring(p338.HolderName or "");
            if v344 == "" then
                return "Zone open. " .. v341 .. " | Stand inside to earn tokens | " .. WorldEventFormatTime(v339);
            else
                return "King Hill: " .. v344 .. " | " .. v341 .. " | tokens: " .. tostring(p338.Tokens or 0) .. " | " .. WorldEventFormatTime(v339);
            end;
        end;
    else
        if v342 ~= "Ended" then
            return "King Hill | " .. v341;
        end;
        local v345 = tostring(p338.WinnerName or "");
        return v345 == "" and "King Hill ended with no winner" or v345 .. " won King Hill: " .. v340 .. " Gold";
    end;
end;
function KingHillApply(p346)
    if type(p346) == "table" then
        local v347 = tostring(p346.Phase or "");
        if v347 == "Clear" or v347 == "" then
            WorldEventUi.KingHillState = nil;
            WorldEventRefreshSpecialBanner();
        else
            WorldEventUi.KingHillState = p346;
            WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(30, 22, 8);
            WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 214, 86);
            GoldenCratePlaySound(p346);
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function KingHillUpdate()
    -- upvalues: l__Workspace__4 (copy)
    local l__KingHillState__46 = WorldEventUi.KingHillState;
    if type(l__KingHillState__46) == "table" then
        local v348 = tostring(l__KingHillState__46.Phase or "");
        local v349 = (tonumber(l__KingHillState__46.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
        if v348 == "Ended" and v349 <= 0 then
            KingHillApply({
                Phase = "Clear"
            });
        else
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function LeaderBountyBuildText(p350)
    -- upvalues: l__Workspace__4 (copy)
    local v351 = tostring(p350.Phase or "");
    local v352 = GoldenCrateFormatCoins(p350.Reward);
    local v353 = tostring(p350.TargetName or "the leader");
    local v354 = (tonumber(p350.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
    if v351 == "Claimed" then
        return tostring(p350.KillerName or "Player") .. " defeated leader " .. v353 .. ": " .. v352 .. " Gold";
    elseif v351 == "Survived" then
        return v353 .. " survived and earned " .. v352 .. " Gold";
    else
        return v351 == "Ended" and "Leader Bounty ended" or "Leader Bounty: " .. v353 .. " | " .. v352 .. " Gold | " .. WorldEventFormatTime(v354);
    end;
end;
function WorldEventHasSpecialEventState()
    return (type(WorldEventUi.CrateState) == "table" or type(WorldEventUi.KingHillState) == "table") and true or type(WorldEventUi.LeaderBountyState) == "table";
end;
function WorldEventLayoutTopBanners()
    -- upvalues: l__min__29 (copy)
    local v355 = WorldEventHasSpecialEventState() and WorldEventUi.CrateBanner;
    if v355 then
        v355 = WorldEventUi.CrateBanner.Visible;
    end;
    if WorldEventUi.CrateBanner then
        WorldEventUi.CrateBanner.Position = UDim2.new(0.5, 0, 0, WORLD_EVENT_BANNER_TOP);
    end;
    if WorldEventUi.BoostBar then
        local v356 = WORLD_EVENT_BANNER_TOP;
        if v355 then
            v356 = v356 + (l__min__29(tonumber(WorldEventUi.CrateBanner.Size.Y.Offset) or 52, 28) + WORLD_EVENT_BANNER_GAP);
        end;
        WorldEventUi.BoostBar.Position = UDim2.new(0.5, 0, 0, v356);
    end;
    if WorldEventUi.Tooltip and WorldEventUi.Tooltip.Visible then
        WorldEventPositionTooltipNearButton(WorldEventUi.TouchTooltipButton);
    end;
end;
function WorldEventRefreshSpecialBanner()
    -- upvalues: l__fromOffset__31 (copy)
    local v357 = {};
    if type(WorldEventUi.CrateState) == "table" then
        v357[#v357 + 1] = GoldenCrateBuildText(WorldEventUi.CrateState);
    end;
    if type(WorldEventUi.KingHillState) == "table" then
        v357[#v357 + 1] = KingHillBuildText(WorldEventUi.KingHillState);
    end;
    if type(WorldEventUi.LeaderBountyState) == "table" then
        v357[#v357 + 1] = LeaderBountyBuildText(WorldEventUi.LeaderBountyState);
    end;
    if #v357 == 0 then
        WorldEventUi.CrateBanner.Visible = false;
        WorldEventUi.CrateSound:Stop();
        WorldEventLayoutTopBanners();
    else
        WorldEventUi.CrateBanner.Visible = true;
        WorldEventUi.CrateBanner.Size = l__fromOffset__31(500, #v357 >= 3 and 82 or (#v357 == 2 and 66 or 52));
        WorldEventUi.CrateStroke.Transparency = 1;
        WorldEventUi.CrateLabel.TextStrokeTransparency = 0.32;
        WorldEventUi.CrateLabel.Text = table.concat(v357, "\n");
        WorldEventLayoutTopBanners();
        if type(WorldEventUi.LeaderBountyState) == "table" then
            WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(34, 10, 10);
            WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 100, 100);
        else
            WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(30, 22, 8);
            WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 214, 86);
        end;
    end;
end;
function LeaderBountyApply(p358)
    if type(p358) == "table" then
        local v359 = tostring(p358.Phase or "");
        if v359 == "Clear" or v359 == "" then
            WorldEventUi.LeaderBountyState = nil;
            WorldEventRefreshSpecialBanner();
        else
            WorldEventUi.LeaderBountyState = p358;
            WorldEventUi.CrateBanner.BackgroundColor3 = Color3.fromRGB(34, 10, 10);
            WorldEventUi.CrateStroke.Color = Color3.fromRGB(255, 100, 100);
            GoldenCratePlaySound(p358);
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function LeaderBountyUpdate()
    -- upvalues: l__Workspace__4 (copy)
    local l__LeaderBountyState__47 = WorldEventUi.LeaderBountyState;
    if type(l__LeaderBountyState__47) == "table" then
        local v360 = tostring(l__LeaderBountyState__47.Phase or "");
        local v361 = (tonumber(l__LeaderBountyState__47.EndsAt) or 0) - l__Workspace__4:GetServerTimeNow();
        if (v360 == "Claimed" or (v360 == "Survived" or v360 == "Ended")) and v361 <= 0 then
            LeaderBountyApply({
                Phase = "Clear"
            });
        else
            WorldEventRefreshSpecialBanner();
        end;
    end;
end;
function WorldEventStopSounds()
    for _, v362 in ipairs(WorldEventUi.Sounds or {}) do
        v362:Stop();
    end;
end;
function WorldEventApplySounds(p363)
    -- upvalues: u181 (copy), l__clamp__26 (copy)
    WorldEventUi.Sounds = WorldEventUi.Sounds or {};
    local v364 = 0;
    for v365, v366 in ipairs(p363 or {}) do
        if v365 > 5 then
            break;
        end;
        local v367 = WorldEventUi.Sounds[v365];
        if not v367 then
            v367 = Instance.new("Sound", u181);
            v367.Name = "WorldEventSound" .. tostring(v365);
            WorldEventUi.Sounds[v365] = v367;
        end;
        local v368 = WorldEventSoundId(v366);
        if v368 == "" then
            v367:Stop();
            v364 = v365;
        else
            if v367.SoundId ~= v368 then
                v367.SoundId = v368;
            end;
            v367.Looped = v366.SoundLoop == true;
            v367.Volume = l__clamp__26(tonumber(v366.SoundVolume) or 0.06, 0, 0.25);
            if v367.IsPlaying then
                v364 = v365;
            else
                v367:Play();
                v364 = v365;
            end;
        end;
    end;
    for v369 = v364 + 1, #(WorldEventUi.Sounds or {}) do
        WorldEventUi.Sounds[v369]:Stop();
    end;
end;
function WorldEventApply(p370)
    -- upvalues: l__TouchEnabled__35 (ref), u181 (copy), l__max__28 (copy), l__clamp__26 (copy), l__floor__27 (copy), l__fromOffset__31 (copy), l__new__32 (copy)
    if type(p370) == "table" and p370.Kind == "GoldenCrate" then
        GoldenCrateApply(p370);
    elseif type(p370) == "table" and p370.Kind == "KingHill" then
        KingHillApply(p370);
    elseif type(p370) == "table" and p370.Kind == "LeaderBounty" then
        LeaderBountyApply(p370);
    else
        local v371 = WorldEventGetActiveEvents(p370);
        if type(p370) == "table" and (p370.Active == true and #v371 ~= 0) then
            WorldEventState = p370;
            WorldEventState.ActiveEvents = v371;
            WorldEventClearBoosts();
            WorldEventUi.BoostBar.Visible = true;
            local v372 = l__TouchEnabled__35 or u181.AbsoluteSize.X < 640;
            WorldEventUi.Title.Text = "";
            local v373 = WorldEventSelectTintPayload(v371);
            WorldEventUi.Tint.BackgroundColor3 = WorldEventTintColor(v373);
            WorldEventUi.Tint.BackgroundTransparency = WorldEventTintTransparency(v373);
            WorldEventUi.Tint.Visible = true;
            WorldEventApplySounds(v371);
            local v374 = 0;
            for _, v375 in ipairs(v371) do
                v374 = v374 + #(type(v375.Boosts) == "table" and (v375.Boosts or {}) or {});
            end;
            local v376 = v372 and 2 or 6;
            WorldEventUi.BoostLayout.Padding = UDim.new(0, v376);
            WorldEventUi.BoostBar.BackgroundTransparency = 1;
            local v377 = v372 and l__clamp__26(l__max__28(250, u181.AbsoluteSize.X - 24), 250, 420) or l__clamp__26(l__max__28(320, u181.AbsoluteSize.X) - 20, 320, 780);
            local v378 = v377 - 0 - (v372 and 12 or 24) - l__max__28(v374 - 1, 0) * v376;
            local v379 = v372 and l__clamp__26(l__floor__27(v378 / l__max__28(v374, 1)), 26, 32) or l__clamp__26(l__floor__27(v378 / l__max__28(v374, 1)), 26, 42);
            WorldEventUi.BoostBar.Size = l__fromOffset__31(v377, v372 and 40 or 46);
            WorldEventUi.Title.Size = l__fromOffset__31(0, v372 and 32 or 40);
            WorldEventUi.Title.TextSize = v372 and (v374 >= 6 and 8 or 9) or 12;
            WorldEventUi.Title.Visible = false;
            WorldEventLayoutTopBanners();
            local v380 = 0;
            local v381 = v372 and 32 or 36;
            for _, v382 in ipairs(v371) do
                local v383 = type(v382.Boosts) == "table" and (v382.Boosts or {}) or {};
                for _, v384 in ipairs(v383) do
                    v380 = v380 + 1;
                    local u385 = Instance.new("TextButton");
                    u385.Name = "Boost" .. tostring(v380);
                    u385.Size = l__fromOffset__31(v379, v381);
                    u385.BackgroundColor3 = Color3.fromRGB(35, 38, 48);
                    u385.BackgroundTransparency = 0.04;
                    u385.BorderSizePixel = 0;
                    u385.Active = true;
                    u385.AutoButtonColor = true;
                    u385.Font = Enum.Font.GothamBlack;
                    local v386 = tostring(v384.Icon or (v384.Label or "B"));
                    u385.Text = "";
                    u385.TextColor3 = Color3.fromRGB(255, 255, 255);
                    u385.TextSize = 1;
                    u385.ClipsDescendants = true;
                    u385.ZIndex = 1241;
                    u385.Parent = WorldEventUi.BoostBar;
                    Instance.new("UICorner", u385).CornerRadius = UDim.new(0, 7);
                    local v387 = Instance.new("Frame");
                    v387.Name = "TimeFill";
                    v387.AnchorPoint = l__new__32(0, 1);
                    v387.Position = UDim2.new(0, 0, 1, 0);
                    v387.Size = UDim2.new(1, 0, WorldEventRemainingRatioFromTimes(v382.StartedAt, v382.EndsAt), 0);
                    v387.BackgroundColor3 = Color3.fromRGB(0, 160, 220);
                    v387.BackgroundTransparency = 0.18;
                    v387.BorderSizePixel = 0;
                    v387.ZIndex = u385.ZIndex + 1;
                    v387.Parent = u385;
                    Instance.new("UICorner", v387).CornerRadius = UDim.new(0, 7);
                    local v388 = Instance.new("TextLabel");
                    v388.Name = "Icon";
                    v388.BackgroundTransparency = 1;
                    v388.Size = UDim2.new(1, 0, 1, 0);
                    v388.Font = Enum.Font.GothamBlack;
                    v388.Text = v386;
                    v388.TextColor3 = Color3.fromRGB(255, 255, 255);
                    v388.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
                    v388.TextStrokeTransparency = 0.55;
                    v388.TextSize = v372 and (#v386 > 2 and l__clamp__26(v379 - 12, 7, 10) or l__clamp__26(v379 - 8, 10, 14)) or (#v386 > 2 and l__clamp__26(v379 - 22, 9, 12) or l__clamp__26(v379 - 18, 12, 18));
                    v388.ZIndex = u385.ZIndex + 2;
                    v388.Parent = u385;
                    local v389 = WorldEventDisplayName(v382) .. ": " .. WorldEventBoostText(v384);
                    u385:SetAttribute("TooltipPrefix", v389);
                    u385:SetAttribute("TooltipText", v389 .. " | " .. WorldEventRemainingTextFromEnd(v382.EndsAt) .. " left");
                    u385:SetAttribute("EventStartedAt", tonumber(v382.StartedAt) or 0);
                    u385:SetAttribute("EventEndsAt", tonumber(v382.EndsAt) or 0);
                    u385.MouseEnter:Connect(function() --[[ Line: 1854 ]]
                        -- upvalues: u385 (copy)
                        WorldEventShowBoostTooltipForButton(u385, false);
                    end);
                    u385.MouseLeave:Connect(function() --[[ Line: 1855 ]]
                        WorldEventUi.TooltipPinned = false;
                        WorldEventHideTooltip();
                    end);
                    u385.InputBegan:Connect(function(p390) --[[ Line: 1859 ]]
                        -- upvalues: u385 (copy)
                        if p390.UserInputType == Enum.UserInputType.Touch then
                            WorldEventUi.ActiveTouchBoostInput = p390;
                            WorldEventShowBoostTooltipForButton(u385, true);
                        end;
                    end);
                    u385.InputEnded:Connect(function(p391) --[[ Line: 1865 ]]
                        -- upvalues: u385 (copy)
                        if p391.UserInputType == Enum.UserInputType.Touch then
                            WorldEventScheduleTooltipHide(2.25, u385);
                        end;
                    end);
                    u385.Activated:Connect(function() --[[ Line: 1870 ]]
                        -- upvalues: l__TouchEnabled__35 (ref), u385 (copy)
                        if l__TouchEnabled__35 then
                            WorldEventShowBoostTooltipForButton(u385, true);
                            WorldEventScheduleTooltipHide(3, u385);
                        else
                            WorldEventShowBoostTooltipForButton(u385, false);
                            WorldEventScheduleTooltipHide(2, u385);
                        end;
                    end);
                    WorldEventUi.Buttons[#WorldEventUi.Buttons + 1] = u385;
                end;
            end;
            if WorldEventWeatherSignature(v371) ~= WorldEventUi.WeatherSignature then
                WorldEventBuildWeather(v371);
            end;
        else
            WorldEventState = nil;
            WorldEventClearBoosts();
            WorldEventClearWeather();
            WorldEventUi.BoostBar.Visible = false;
            WorldEventLayoutTopBanners();
            WorldEventUi.Tint.Visible = false;
            WorldEventUi.Tint.BackgroundTransparency = 1;
            WorldEventStopSounds();
        end;
    end;
end;
function WorldEventUpdateWeather(p392, p393)
    -- upvalues: l__max__28 (copy)
    if type(WorldEventState) == "table" and WorldEventState.Active == true then
        local v394 = WorldEventGetActiveEvents(WorldEventState);
        if #v394 == 0 then
        else
            local v395 = os.clock();
            if (WorldEventUi.NextTitleRefreshAt or 0) <= v395 then
                WorldEventUi.NextTitleRefreshAt = v395 + (NameVisual.WORLD_EVENT_UI_UPDATE_INTERVAL or 0.2);
                WorldEventUpdateBoostButtonTimers();
            end;
            local v396 = l__max__28(1, p393.X);
            local v397 = l__max__28(1, p393.Y);
            for _, v398 in ipairs(WorldEventUi.WeatherParts) do
                local v399 = v398:GetAttribute("Visual") or "";
                local v400 = tostring(v399);
                local v401 = tonumber(v398:GetAttribute("Speed")) or 120;
                local v402 = tonumber(v398:GetAttribute("Drift")) or 0;
                local l__Offset__48 = v398.Position.X.Offset;
                local l__Offset__49 = v398.Position.Y.Offset;
                local v403, v404;
                if v400 == "Snow" then
                    v403 = l__Offset__48 + v402 * p392;
                    v404 = l__Offset__49 + v401 * p392;
                elseif v400 == "Meteor" then
                    v403 = l__Offset__48 + v401 * p392 * 1.2;
                    v404 = l__Offset__49 + v401 * p392 * 0.62;
                elseif v400 == "Bloom" then
                    v403 = l__Offset__48 + v402 * p392 * 0.5;
                    v404 = l__Offset__49 - v401 * p392;
                else
                    v403 = l__Offset__48 + v402 * p392 * 0.35;
                    v404 = l__Offset__49 + v401 * p392;
                end;
                if v397 + 90 < v404 or (v396 + 120 < v403 or v404 < -120) then
                    v403 = math.random(-80, v396 + 40);
                    v404 = v400 == "Bloom" and v397 + math.random(12, 80) or math.random(-160, -20);
                    if v400 == "Meteor" then
                        v403 = math.random(-220, v396);
                        v404 = math.random(-180, 20);
                    end;
                end;
                v398.Position = UDim2.fromOffset(v403, v404);
            end;
            if WorldEventHasVisual(v394, "Storm") then
                if (WorldEventUi.NextFlashAt or 0) <= v395 then
                    WorldEventUi.NextFlashAt = v395 + math.random(30, 75) / 10;
                    WorldEventUi.FlashUntil = v395 + 0.08;
                end;
                if v395 < (WorldEventUi.FlashUntil or 0) then
                    WorldEventUi.Tint.BackgroundColor3 = Color3.fromRGB(235, 242, 255);
                    WorldEventUi.Tint.BackgroundTransparency = 0.82;
                    return;
                end;
                local v405 = WorldEventSelectTintPayload(v394);
                WorldEventUi.Tint.BackgroundColor3 = WorldEventTintColor(v405);
                WorldEventUi.Tint.BackgroundTransparency = WorldEventTintTransparency(v405);
            end;
        end;
    end;
end;
local u406 = Instance.new("TextButton", v182);
u406.Name = "MatchReadyButton";
u406.AnchorPoint = l__new__32(0.5, 0);
u406.Position = UDim2.new(0.5, 0, 0.5, 34);
u406.Size = l__fromOffset__31(180, 38);
u406.Active = true;
u406.AutoButtonColor = true;
u406.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
u406.BorderSizePixel = 0;
u406.Font = Enum.Font.GothamBold;
u406.Text = "Ready";
u406.TextColor3 = Color3.fromRGB(255, 255, 255);
u406.TextSize = 17;
u406.Visible = false;
u406.ZIndex = 1200;
Instance.new("UICorner", u406).CornerRadius = UDim.new(0, 8);
local v407 = Instance.new("UIStroke", u406);
v407.Color = Color3.fromRGB(35, 35, 35);
v407.Thickness = 2;
v407.Transparency = 0.18;
local u408 = 0;
u406.Activated:Connect(function() --[[ Line: 1974 ]]
    -- upvalues: u408 (ref), u175 (copy)
    local v409 = os.clock();
    if v409 - u408 < 0.35 then
    else
        u408 = v409;
        u175:FireServer("MatchReady");
    end;
end);
local u410 = Instance.new("Frame", v182);
u410.Name = "WinnerPanel";
u410.AnchorPoint = l__new__32(0.5, 0.5);
u410.Position = UDim2.new(0.5, 0, 0.5, 0);
u410.Size = l__fromOffset__31(420, 190);
u410.BackgroundColor3 = Color3.fromRGB(35, 35, 35);
u410.BackgroundTransparency = 0.05;
u410.BorderSizePixel = 0;
u410.Visible = false;
u410.ZIndex = 1210;
Instance.new("UICorner", u410).CornerRadius = UDim.new(0, 10);
local v411 = Instance.new("UIStroke", u410);
v411.Color = Color3.fromRGB(255, 85, 0);
v411.Thickness = 3;
v411.Transparency = 0.15;
local u412 = Instance.new("ImageLabel", u410);
u412.Name = "Avatar";
u412.AnchorPoint = l__new__32(0.5, 0);
u412.Position = UDim2.new(0.5, 0, 0, 16);
u412.Size = l__fromOffset__31(82, 82);
u412.BackgroundTransparency = 1;
u412.Image = "";
u412.ZIndex = 941;
Instance.new("UICorner", u412).CornerRadius = UDim.new(1, 0);
local u413 = Instance.new("TextLabel", u410);
u413.Name = "Title";
u413.BackgroundTransparency = 1;
u413.Position = l__fromOffset__31(20, 104);
u413.Size = UDim2.new(1, -40, 0, 34);
u413.Font = Enum.Font.GothamBlack;
u413.TextColor3 = Color3.fromRGB(255, 255, 255);
u413.TextSize = 23;
u413.Text = "Winner";
u413.ZIndex = 941;
local u414 = Instance.new("TextLabel", u410);
u414.Name = "Reward";
u414.BackgroundTransparency = 1;
u414.Position = l__fromOffset__31(20, 142);
u414.Size = UDim2.new(1, -40, 0, 30);
u414.Font = Enum.Font.GothamBold;
u414.TextColor3 = Color3.fromRGB(255, 210, 80);
u414.TextSize = 18;
u414.Text = "";
u414.ZIndex = 941;
local u415 = nil;
local u416 = {};
local u417 = {};
local u418 = Instance.new("Frame", u181);
u418.Name = "TeamChooser";
u418.AnchorPoint = l__new__32(0.5, 0);
u418.Position = UDim2.new(0.5, 0, 0, 74);
u418.Size = l__fromOffset__31(292, 88);
u418.BackgroundColor3 = Color3.fromRGB(46, 46, 46);
u418.BackgroundTransparency = 0.08;
u418.BorderSizePixel = 0;
u418.ZIndex = 900;
u418.Visible = false;
Instance.new("UICorner", u418).CornerRadius = UDim.new(0, 8);
local v419 = Instance.new("UIStroke", u418);
v419.Color = Color3.fromRGB(28, 28, 28);
v419.Thickness = 2;
v419.Transparency = 0.25;
local v420 = Instance.new("TextLabel", u418);
v420.Name = "Title";
v420.BackgroundTransparency = 1;
v420.Position = l__fromOffset__31(12, 5);
v420.Size = UDim2.new(1, -24, 0, 24);
v420.Font = Enum.Font.GothamBold;
v420.Text = "Choose Team";
v420.TextColor3 = Color3.fromRGB(255, 255, 255);
v420.TextSize = 16;
v420.TextXAlignment = Enum.TextXAlignment.Left;
v420.ZIndex = 901;
local u421 = Instance.new("Frame", u418);
u421.Name = "Buttons";
u421.BackgroundTransparency = 1;
u421.Position = l__fromOffset__31(10, 36);
u421.Size = UDim2.new(1, -20, 0, 42);
u421.ZIndex = 901;
local u422 = Instance.new("UIGridLayout", u421);
u422.HorizontalAlignment = Enum.HorizontalAlignment.Center;
u422.VerticalAlignment = Enum.VerticalAlignment.Center;
u422.SortOrder = Enum.SortOrder.LayoutOrder;
u422.CellPadding = l__fromOffset__31(6, 6);
u422.CellSize = l__fromOffset__31(64, 34);
u130 = function() --[[ Line: 2086 ]]
    -- upvalues: u1 (copy), u416 (copy), u417 (copy)
    local v423 = tonumber(u1:GetAttribute("ModeTeamId"));
    for v424, v425 in pairs(u416) do
        local v426 = v423 == v424;
        v425.BackgroundTransparency = v426 and 0 or 0.18;
        v425.TextTransparency = 0;
        local v427 = u417[v424];
        if v427 then
            v427.Thickness = v426 and 3 or 1;
            v427.Color = v426 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(35, 35, 35);
            v427.Transparency = v426 and 0 or 0.25;
        end;
    end;
end;
u129 = function() --[[ Line: 2101 ]]
    -- upvalues: u1 (copy), u213 (ref), u415 (ref), u418 (copy)
    local v428 = tonumber(u1:GetAttribute("ModeTeamId"));
    local v429 = u213 == nil and true or u213 == "Spectate";
    local v430 = u415;
    if v430 then
        if u415.ManualChoice == true then
            v430 = v428 == nil;
        else
            v430 = false;
        end;
    end;
    local v431 = u415;
    if v431 then
        if u415.Enabled == true then
            v431 = v429 or v430;
        else
            v431 = false;
        end;
    end;
    u418.Visible = v431 == true;
end;
local function u448(p432) --[[ Line: 2109 ]]
    -- upvalues: u415 (ref), u421 (copy), u416 (copy), u417 (copy), u129 (ref), l__clamp__26 (copy), l__floor__27 (copy), u422 (copy), l__fromOffset__31 (copy), u418 (copy), u175 (copy), u130 (ref)
    u415 = p432;
    for _, v433 in ipairs(u421:GetChildren()) do
        if v433:IsA("GuiButton") then
            v433:Destroy();
        end;
    end;
    table.clear(u416);
    table.clear(u417);
    if not p432 or p432.Enabled ~= true then
        u129();
        return;
    end;
    local v434 = p432.Definitions or {};
    local v435 = math.max(1, #v434);
    local v436 = l__clamp__26(v435, 1, 4);
    local v437 = math.ceil(v435 / v436);
    local v438 = math.max(1, v437);
    local v439 = l__floor__27((272 - (v436 - 1) * 6) / v436);
    local v440 = v435 > 8 and 28 or 34;
    u422.CellSize = l__fromOffset__31(v439, v440);
    u421.Size = UDim2.new(1, -20, 0, v438 * (v440 + 6));
    u418.Size = l__fromOffset__31(292, v438 * (v440 + 6) + 46);
    for _, v441 in ipairs(v434) do
        local u442 = tonumber(v441.Id);
        if u442 then
            local v443 = Instance.new("TextButton", u421);
            v443.Name = "Team" .. tostring(u442);
            v443.Size = l__fromOffset__31(v439, v440);
            local l__ColorHex__50 = v441.ColorHex;
            local v444, v445, v446;
            if type(l__ColorHex__50) ~= "string" or l__ColorHex__50 == "" then
                v444 = Color3.fromRGB(255, 85, 0);
                v443.BackgroundColor3 = v444;
                v443.BorderSizePixel = 0;
                v443.AutoButtonColor = true;
                v443.Text = tostring(v441.Name or u442);
                v443.TextColor3 = Color3.fromRGB(255, 255, 255);
                v443.TextSize = v435 > 8 and 11 or 14;
                v443.TextScaled = true;
                v443.Font = Enum.Font.GothamBold;
                v443.ZIndex = 902;
                Instance.new("UICorner", v443).CornerRadius = UDim.new(0, 7);
                v445 = Instance.new("UIPadding", v443);
                v445.PaddingLeft = UDim.new(0, 5);
                v445.PaddingRight = UDim.new(0, 5);
                v446 = Instance.new("UIStroke", v443);
                v446.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                v446.Color = Color3.fromRGB(35, 35, 35);
                v446.Thickness = 1;
                v446.Transparency = 0.25;
                u416[u442] = v443;
                u417[u442] = v446;
                v443.MouseButton1Click:Connect(function() --[[ Line: 2164 ]]
                    -- upvalues: u175 (ref), u442 (copy)
                    u175:FireServer("ChooseTeam", u442);
                end);
            end;
            local v447;
            v447, v444 = pcall(Color3.fromHex, l__ColorHex__50);
            if not v447 then
                v444 = Color3.fromRGB(255, 85, 0);
                v443.BackgroundColor3 = v444;
                v443.BorderSizePixel = 0;
                v443.AutoButtonColor = true;
                v443.Text = tostring(v441.Name or u442);
                v443.TextColor3 = Color3.fromRGB(255, 255, 255);
                v443.TextSize = v435 > 8 and 11 or 14;
                v443.TextScaled = true;
                v443.Font = Enum.Font.GothamBold;
                v443.ZIndex = 902;
                Instance.new("UICorner", v443).CornerRadius = UDim.new(0, 7);
                v445 = Instance.new("UIPadding", v443);
                v445.PaddingLeft = UDim.new(0, 5);
                v445.PaddingRight = UDim.new(0, 5);
                v446 = Instance.new("UIStroke", v443);
                v446.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                v446.Color = Color3.fromRGB(35, 35, 35);
                v446.Thickness = 1;
                v446.Transparency = 0.25;
                u416[u442] = v443;
                u417[u442] = v446;
                v443.MouseButton1Click:Connect(function() --[[ Line: 2164 ]]
                    -- upvalues: u175 (ref), u442 (copy)
                    u175:FireServer("ChooseTeam", u442);
                end);
            end;
            v443.BackgroundColor3 = v444;
            v443.BorderSizePixel = 0;
            v443.AutoButtonColor = true;
            v443.Text = tostring(v441.Name or u442);
            v443.TextColor3 = Color3.fromRGB(255, 255, 255);
            v443.TextSize = v435 > 8 and 11 or 14;
            v443.TextScaled = true;
            v443.Font = Enum.Font.GothamBold;
            v443.ZIndex = 902;
            Instance.new("UICorner", v443).CornerRadius = UDim.new(0, 7);
            v445 = Instance.new("UIPadding", v443);
            v445.PaddingLeft = UDim.new(0, 5);
            v445.PaddingRight = UDim.new(0, 5);
            v446 = Instance.new("UIStroke", v443);
            v446.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
            v446.Color = Color3.fromRGB(35, 35, 35);
            v446.Thickness = 1;
            v446.Transparency = 0.25;
            u416[u442] = v443;
            u417[u442] = v446;
            v443.MouseButton1Click:Connect(function() --[[ Line: 2164 ]]
                -- upvalues: u175 (ref), u442 (copy)
                u175:FireServer("ChooseTeam", u442);
            end);
        end;
    end;
    u130();
    u129();
end;
local v449 = 0;
local v450 = 0;
local v451 = 0;
local function u459() --[[ Line: 2183 ]]
    -- upvalues: u66 (copy), u123 (copy), u161 (copy), u119 (ref), u120 (ref), u61 (copy), u118 (ref), l__max__28 (copy), l__sqrt__25 (copy)
    local v452 = u66[u123];
    local v453 = 0;
    local v454 = 0;
    local v455 = 0;
    local v456 = 0;
    local l__ControlledAccountId__51 = u161.ControlledAccountId;
    if v452 then
        for _, v457 in pairs(v452) do
            if not l__ControlledAccountId__51 or tostring(v457.PlayerUid) == l__ControlledAccountId__51 then
                local v458 = v457.RenderRadius or (v457.Radius or 30);
                v453 = v453 + (v457.RenderX or (v457.ServerX or u119));
                v454 = v454 + (v457.RenderY or (v457.ServerY or u120));
                v455 = v455 + v458 * v458;
                v456 = v456 + 1;
            end;
        end;
    end;
    if v456 == 0 then
        local l__ControlledBlobId__52 = u161.ControlledBlobId;
        if l__ControlledBlobId__52 then
            l__ControlledBlobId__52 = u61[u161.ControlledBlobId];
        end;
        if l__ControlledBlobId__52 and l__ControlledBlobId__52.Type == "PlayerBlob" then
            return l__ControlledBlobId__52.RenderX or (l__ControlledBlobId__52.ServerX or u119), l__ControlledBlobId__52.RenderY or (l__ControlledBlobId__52.ServerY or u120), l__ControlledBlobId__52.RenderRadius or (l__ControlledBlobId__52.Radius or 30);
        else
            return u119, u120, l__sqrt__25((l__max__28(u118, 900)));
        end;
    else
        return v453 / v456, v454 / v456, l__sqrt__25((l__max__28(v455, 900)));
    end;
end;
local function u469(p460) --[[ Line: 2280 ]]
    -- upvalues: u161 (copy), l__TouchEnabled__35 (ref), u459 (copy), l__clamp__26 (copy), l__round__23 (copy), u5 (copy), l__deg__30 (copy), l__fromOffset__31 (copy)
    local l__DirArrow__53 = u161.DirArrow;
    if l__DirArrow__53 then
        if l__TouchEnabled__35 and (u161.IsHoldingJoystick and u161.MobileAimPower > 0.08) then
            local v461 = p460.X * 0.5;
            local v462 = p460.Y * 0.5;
            local l__MobileAimDir__54 = u161.MobileAimDir;
            local _, _, v463 = u459();
            local v464 = 34 + (l__clamp__26(v463 / 240, 0, 1) * 0.15 + 0.85) * 78 * u161.MobileAimPower;
            local v465 = l__round__23(v461 + l__MobileAimDir__54.X * v464);
            local v466 = l__round__23(v462 + l__MobileAimDir__54.Y * v464);
            local v467 = l__round__23((l__deg__30((u5(l__MobileAimDir__54.Y, l__MobileAimDir__54.X)))));
            if u161.LastArrowX ~= v465 or u161.LastArrowY ~= v466 then
                l__DirArrow__53.Position = l__fromOffset__31(v465, v466);
                local v468 = u161;
                u161.LastArrowX = v465;
                v468.LastArrowY = v466;
            end;
            if u161.LastArrowRotation ~= v467 then
                l__DirArrow__53.Rotation = v467;
                u161.LastArrowRotation = v467;
            end;
            if not l__DirArrow__53.Visible then
                l__DirArrow__53.Visible = true;
            end;
        else
            if l__DirArrow__53.Visible then
                l__DirArrow__53.Visible = false;
            end;
        end;
    end;
end;
local function u478() --[[ Line: 2318 ]]
    -- upvalues: l__new__32 (copy)
    local v470 = Instance.new("ImageLabel");
    v470.Name = "PlayerBlob";
    v470.AnchorPoint = l__new__32(0.5, 0.5);
    v470.BackgroundTransparency = 1;
    v470.Image = "rbxassetid://1217158727";
    v470.BorderSizePixel = 0;
    local v471 = Instance.new("Frame", v470);
    v471.Name = "SkinsContainer";
    v471.Size = UDim2.new(1, 0, 1, 0);
    v471.BackgroundTransparency = 1;
    v471.ZIndex = 2;
    v471.ClipsDescendants = false;
    local v472 = Instance.new("Frame", v470);
    v472.Name = "HatsContainer";
    v472.Size = UDim2.new(1.5, 0, 1.5, 0);
    v472.Position = UDim2.new(0.5, 0, 0.5, 0);
    v472.AnchorPoint = l__new__32(0.5, 0.5);
    v472.BackgroundTransparency = 1;
    v472.ZIndex = 5;
    local v473 = Instance.new("Frame", v470);
    v473.Name = "EffectsContainer";
    v473.Size = UDim2.new(1.5, 0, 1.5, 0);
    v473.Position = UDim2.new(0.5, 0, 0.5, 0);
    v473.AnchorPoint = l__new__32(0.5, 0.5);
    v473.BackgroundTransparency = 1;
    v473.ZIndex = 6;
    local v474 = Instance.new("TextLabel", v470);
    v474.Name = "NameLabel";
    v474.BackgroundTransparency = 1;
    v474.AnchorPoint = l__new__32(0.5, 0.5);
    v474.Size = UDim2.new(0.82, 0, 0.26, 0);
    v474.Position = UDim2.new(0.5, 0, 0.38, 0);
    v474.Font = Enum.Font.GothamBold;
    v474.TextScaled = true;
    v474.RichText = true;
    v474.TextColor3 = Color3.new(1, 1, 1);
    v474.TextStrokeTransparency = 0.3;
    v474.Visible = true;
    v474.ZIndex = 10;
    local v475 = Instance.new("UITextSizeConstraint", v474);
    v475.Name = "TextSizeLimit";
    v475.MinTextSize = NameVisual.PLAYER_TEXT_MIN_TEXT_SIZE;
    v475.MaxTextSize = NameVisual.PLAYER_NAME_MAX_TEXT_SIZE;
    local v476 = Instance.new("TextLabel", v470);
    v476.Name = "MassLabel";
    v476.BackgroundTransparency = 1;
    v476.AnchorPoint = l__new__32(0.5, 0.5);
    v476.Size = UDim2.new(0.55, 0, 0.18, 0);
    v476.Position = UDim2.new(0.5, 0, 0.62, 0);
    v476.Font = Enum.Font.GothamBold;
    v476.TextScaled = true;
    v476.TextColor3 = Color3.new(1, 1, 1);
    v476.TextStrokeTransparency = 0.3;
    v476.Visible = true;
    v476.ZIndex = 12;
    local v477 = Instance.new("UITextSizeConstraint", v476);
    v477.Name = "TextSizeLimit";
    v477.MinTextSize = NameVisual.PLAYER_TEXT_MIN_TEXT_SIZE;
    v477.MaxTextSize = NameVisual.PLAYER_MASS_MAX_TEXT_SIZE;
    return v470;
end;
function NameVisual.GetTextSizeLimit(p479) --[[ Line: 2381 ]]
    if p479 then
        local v480 = p479:FindFirstChild("TextSizeLimit");
        if v480 and v480:IsA("UITextSizeConstraint") then
            return v480;
        else
            return p479:FindFirstChildWhichIsA("UITextSizeConstraint");
        end;
    else
        return nil;
    end;
end;
function NameVisual.DestroyTextCameraScale(p481) --[[ Line: 2390 ]]
    if p481 then
        local v482 = p481:FindFirstChild("CameraZoomTextScale");
        if v482 then
            v482:Destroy();
        end;
    end;
end;
function ApplyPlayerNameTextZoom(p483)
    if p483 then
        NameVisual.DestroyTextCameraScale(p483.NameLabel);
        NameVisual.DestroyTextCameraScale(p483.MassLabel);
        local v484 = NameVisual.PLAYER_TEXT_MIN_TEXT_SIZE or 1;
        local l__NameTextLimit__55 = p483.NameTextLimit;
        local v485 = NameVisual.PLAYER_NAME_MAX_TEXT_SIZE or 10000;
        if l__NameTextLimit__55 then
            if p483.LastNameMinTextSize ~= v484 then
                l__NameTextLimit__55.MinTextSize = v484;
                p483.LastNameMinTextSize = v484;
            end;
            if p483.LastNameMaxTextSize ~= v485 then
                l__NameTextLimit__55.MaxTextSize = v485;
                p483.LastNameMaxTextSize = v485;
            end;
        end;
        local l__MassTextLimit__56 = p483.MassTextLimit;
        local v486 = NameVisual.PLAYER_MASS_MAX_TEXT_SIZE or 10000;
        if l__MassTextLimit__56 then
            if p483.LastMassMinTextSize ~= v484 then
                l__MassTextLimit__56.MinTextSize = v484;
                p483.LastMassMinTextSize = v484;
            end;
            if p483.LastMassMaxTextSize ~= v486 then
                l__MassTextLimit__56.MaxTextSize = v486;
                p483.LastMassMaxTextSize = v486;
            end;
        end;
    end;
end;
local function u496(p487) --[[ Line: 2437 ]]
    -- upvalues: u180 (copy), u186 (copy), u187 (copy), u478 (copy), l__new__32 (copy), l__fromOffset__31 (copy)
    local v488 = u180[p487];
    if v488 and #v488 > 0 then
        local v489 = table.remove(v488);
        local v490;
        if p487 == "Food" or (p487 == "NegativeFood" or (p487 == "Gold" or (p487 == "StaticBlob" or (p487 == "GoldenBlock" or (p487 == "GoldenCrate" or (p487 == "EjectedMass" or (p487 == "FreezeFood" or p487 == "Mass1000"))))))) then
            v490 = u186;
        else
            v490 = u187;
        end;
        v489.Parent = v490;
        return v489;
    end;
    local v491;
    if p487 == "PlayerBlob" then
        v491 = u478();
    elseif p487 == "Food" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "Food";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
    elseif p487 == "NegativeFood" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "NegativeFood";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
    elseif p487 == "Spike" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "Spike";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://91836576350283";
        v491.BorderSizePixel = 0;
    elseif p487 == "Spawner" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "Spawner";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://107648441182956";
        v491.BorderSizePixel = 0;
    elseif p487 == "GoldenBlock" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "GoldenBlock";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://133112511930324";
        v491.BorderSizePixel = 0;
    elseif p487 == "GoldenCrate" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "GoldenCrate";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://133112511930324";
        v491.BorderSizePixel = 0;
        local v492 = Instance.new("TextLabel", v491);
        v492.Name = "ValueLabel";
        v492.BackgroundTransparency = 1;
        v492.Size = UDim2.new(1, 0, 0.42, 0);
        v492.Position = UDim2.new(0, 0, 0.58, 0);
        v492.Font = Enum.Font.GothamBlack;
        v492.TextScaled = true;
        v492.TextColor3 = Color3.fromRGB(255, 255, 255);
        v492.TextStrokeTransparency = 0.25;
        v492.ZIndex = 4;
    elseif p487 == "KingHill" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "KingHill";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
        v491.ZIndex = 12000;
        v491.ImageColor3 = Color3.fromRGB(255, 202, 58);
        v491.ImageTransparency = 0.38;
        local v493 = Instance.new("TextLabel", v491);
        v493.Name = "ValueLabel";
        v493.BackgroundTransparency = 1;
        v493.Size = UDim2.new(0.86, 0, 0.5, 0);
        v493.Position = UDim2.new(0.07, 0, 0.25, 0);
        v493.Font = Enum.Font.GothamBlack;
        v493.TextScaled = true;
        v493.TextWrapped = true;
        v493.TextColor3 = Color3.fromRGB(255, 255, 255);
        v493.TextStrokeTransparency = 0.22;
        v493.ZIndex = 12001;
    elseif p487 == "FreezeFood" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "FreezeFood";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://120014132919241";
        v491.BorderSizePixel = 0;
    elseif p487 == "Mass1000" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "Mass1000";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://97140855194617";
        v491.BorderSizePixel = 0;
    elseif p487 == "EjectedMass" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "EjectedMass";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
    elseif p487 == "StaticBlob" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "StaticBlob";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
    elseif p487 == "Gold" then
        v491 = Instance.new("ImageLabel");
        v491.Name = "GoldCoin";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
        local v494 = Instance.new("TextLabel", v491);
        v494.Name = "ValueLabel";
        v494.BackgroundTransparency = 1;
        v494.Size = UDim2.new(0.8, 0, 0.8, 0);
        v494.Position = UDim2.new(0.1, 0, 0.1, 0);
        v494.Font = Enum.Font.GothamBlack;
        v494.TextScaled = true;
        v494.TextColor3 = Color3.new(1, 1, 1);
        v494.TextStrokeTransparency = 0.3;
        v494.ZIndex = 3;
    else
        v491 = Instance.new("ImageLabel");
        v491.Name = "Unknown";
        v491.AnchorPoint = l__new__32(0.5, 0.5);
        v491.BackgroundTransparency = 1;
        v491.Image = "rbxassetid://1217158727";
        v491.BorderSizePixel = 0;
    end;
    v491.Visible = false;
    v491.Position = l__fromOffset__31(-9999, -9999);
    local v495;
    if p487 == "Food" or (p487 == "NegativeFood" or (p487 == "Gold" or (p487 == "StaticBlob" or (p487 == "GoldenBlock" or (p487 == "GoldenCrate" or (p487 == "EjectedMass" or (p487 == "FreezeFood" or p487 == "Mass1000"))))))) then
        v495 = u186;
    else
        v495 = u187;
    end;
    v491.Parent = v495;
    return v491;
end;
local function u505(p497, p498) --[[ Line: 2508 ]]
    -- upvalues: l__fromOffset__31 (copy), u7 (copy), u180 (copy), u72 (copy)
    if p498 then
        p498.Visible = false;
        p498.Position = l__fromOffset__31(-9999, -9999);
        if p497 == "PlayerBlob" then
            p498.ImageColor3 = u7;
            p498:SetAttribute("OwnerUid", nil);
            p498:SetAttribute("AgaricProfileUserId", nil);
            p498:SetAttribute("AgaricProfileName", nil);
            p498:SetAttribute("AgaricProfileDisplayName", nil);
            local v499 = p498:FindFirstChild("NameLabel");
            if v499 then
                v499.Text = "";
                v499.Visible = false;
                NameVisual.DestroyTextCameraScale(v499);
            end;
            local v500 = p498:FindFirstChild("MassLabel");
            if v500 then
                v500.Text = "";
                v500.Visible = false;
                NameVisual.DestroyTextCameraScale(v500);
            end;
            local function v503(p501) --[[ Line: 2534 ]]
                if p501 then
                    p501.Visible = true;
                    for _, v502 in ipairs(p501:GetChildren()) do
                        if v502:IsA("ImageLabel") and v502.Name:match("^Slot%d+$") then
                            v502:Destroy();
                        end;
                    end;
                end;
            end;
            v503(p498:FindFirstChild("SkinsContainer"));
            v503(p498:FindFirstChild("HatsContainer"));
            v503(p498:FindFirstChild("EffectsContainer"));
        end;
        if not u180[p497] then
            u180[p497] = {};
        end;
        local v504 = u180[p497];
        if (u72[p497] or 120) <= #v504 then
            p498:Destroy();
        else
            p498.Parent = NameVisual.PoolRoot;
            v504[#v504 + 1] = p498;
        end;
    end;
end;
local u506 = {
    "#FF0000",
    "#00FF00",
    "#0000FF",
    "#FFFF00",
    "#00FFFF",
    "#FF00FF",
    "#FF8000",
    "#8000FF"
};
local function u515(p507) --[[ Line: 2566 ]]
    -- upvalues: l__max__28 (copy), u114 (ref), u115 (ref), u119 (ref), u120 (ref), u116 (ref), u118 (ref), u117 (ref), u157 (ref), u158 (ref), u159 (ref), u160 (ref), u161 (copy), u121 (ref), u122 (copy)
    if p507 then
        local v508 = tonumber(p507.RenderX) or (tonumber(p507.ServerX) or 0);
        local v509 = tonumber(p507.RenderY) or (tonumber(p507.ServerY) or 0);
        local v510 = l__max__28(tonumber(p507.RenderRadius) or (tonumber(p507.Radius) or 30), 1);
        u114 = v508;
        u115 = v509;
        u119 = v508;
        u120 = v509;
        local v511 = v510 * v510;
        local v512 = v510 * v510;
        u116 = v511;
        u118 = v512;
        u117 = 1;
        local v513 = -v508;
        local v514 = -v509;
        u157 = v513;
        u158 = v514;
        u159 = -9999;
        u160 = -9999;
        u161.SpawnPendingUntil = 0;
        u121 = nil;
        u122.ManualTarget = false;
        if u122.Update then
            u122.Update();
        end;
    end;
end;
local function u527(p516) --[[ Line: 2586 ]]
    -- upvalues: u128 (copy), l__SharedGameplay__12 (copy), u506 (copy), u61 (copy), u91 (copy), u62 (copy), l__max__28 (copy), l__min__29 (copy), u69 (ref), u65 (copy), u123 (copy), u66 (copy), u515 (copy)
    if u128(p516) then
    else
        local v517 = l__SharedGameplay__12.IsStaticEntity(p516.Type);
        if v517 then
            if p516.Type == "Spike" then
                v517 = false;
            else
                v517 = p516.Type ~= "GoldenBlock";
            end;
        end;
        local v518 = {
            ID = p516.ID,
            Type = p516.Type,
            ServerX = p516.X,
            ServerY = p516.Y,
            Radius = p516.Radius,
            RenderX = p516.X,
            RenderY = p516.Y,
            RenderRadius = p516.Radius,
            LastServerSampleAt = os.clock(),
            MoveVx = 0,
            MoveVy = 0,
            PlayerId = p516.PlayerId
        };
        local v519;
        if p516.PlayerId then
            v519 = tostring(p516.PlayerId) or nil;
        else
            v519 = nil;
        end;
        v518.PlayerUid = v519;
        v518.IsBot = p516.IsBot == true;
        v518.IsMultiAccount = p516.IsMultiAccount == true;
        v518.MultiAccountIndex = p516.MultiAccountIndex;
        v518.BotColor = p516.BotColor;
        v518.BotFreezeEffect = p516.BotFreezeEffect == true;
        v518.IsFrozen = p516.IsFrozen == true;
        v518.ManualFrozen = p516.ManualFrozen == true;
        v518.BotColor3 = nil;
        v518.LastBotColorHex = nil;
        v518.AccountColor = p516.AccountColor;
        v518.AccountColor3 = nil;
        v518.LastAccountColorHex = nil;
        v518.OwnerUserId = p516.OwnerUserId;
        local v520;
        if p516.OwnerUserId then
            v520 = tostring(p516.OwnerUserId) or nil;
        else
            v520 = nil;
        end;
        v518.OwnerUid = v520;
        local v521 = p516.OwnerUserId and tostring(p516.OwnerUserId);
        if not v521 then
            if p516.PlayerId then
                v521 = tostring(p516.PlayerId) or nil;
            else
                v521 = nil;
            end;
        end;
        v518.VisualUid = v521;
        v518.CameraUid = nil;
        v518.TeamId = p516.TeamId;
        v518.TeamColor = p516.TeamColor;
        v518.TeamColor3 = nil;
        v518.LastTeamColorHex = nil;
        v518.Value = p516.Value;
        v518.IsCooldown = p516.IsCooldown;
        v518.HasUI = false;
        v518.Frame = nil;
        v518.LastSeenFrame = 0;
        v518.NeedsRender = not v517;
        v518.IsStatic = v517;
        v518.StaticColor = nil;
        v518.LastUIX = -9999;
        v518.LastUIY = -9999;
        v518.LastUISize = -9999;
        v518.LastZoomVersion = -1;
        if p516.Type == "Food" then
            v518.StaticColor = Color3.fromHSV(math.random(), 0.7, 1);
        elseif p516.Type == "NegativeFood" then
            v518.StaticColor = Color3.fromRGB(255, 0, 0);
        elseif p516.Type == "StaticBlob" then
            v518.StaticColor = Color3.fromHex(u506[math.random(1, #u506)]);
        elseif p516.Type == "Gold" then
            v518.StaticColor = Color3.fromRGB(255, 215, 0);
        elseif p516.Type == "KingHill" then
            v518.StaticColor = Color3.fromRGB(255, 202, 58);
        end;
        u61[p516.ID] = v518;
        u91(v518);
        if not v518.IsStatic then
            u62[p516.ID] = v518;
            if not v518.IsStatic and v518.Type == "PlayerBlob" then
                NameVisual.UpdateHugeDynamicTracking(v518);
                local v522 = v518.Radius or 0;
                local v523 = l__min__29(l__max__28(v522, v518.RenderRadius or v522), NameVisual.HUGE_DYNAMIC_RADIUS);
                if u69 < v523 then
                    u69 = v523;
                end;
            end;
        end;
        if p516.Type == "PlayerBlob" then
            u65[p516.ID] = v518;
            local v524;
            if v518.IsMultiAccount and v518.OwnerUid then
                v524 = v518.OwnerUid;
            else
                v524 = v518.PlayerUid;
            end;
            local v525;
            if v524 == u123 then
                v525 = not u66[u123] or next(u66[u123]) == nil;
            else
                v525 = false;
            end;
            v518.CameraUid = v524;
            if v524 then
                local v526 = u66[v524];
                if not v526 then
                    v526 = {};
                    u66[v524] = v526;
                end;
                v526[p516.ID] = v518;
            end;
            if v525 then
                u515(v518);
            end;
        end;
    end;
end;
local function u538(p528, p529, p530, p531, p532) --[[ Line: 2670 ]]
    -- upvalues: u61 (copy), l__max__28 (copy), l__abs__22 (copy), u99 (copy), u85 (copy)
    local v533 = u61[p528];
    if v533 then
        local v534 = v533.Radius or 0;
        local v535 = l__max__28(v534, v533.RenderRadius or v534);
        if v533.ServerX ~= p529 or (v533.ServerY ~= p530 or (v533.Radius ~= p531 or v533.IsCooldown ~= p532)) then
            local v536 = os.clock();
            local l__LastServerSampleAt__57 = v533.LastServerSampleAt;
            if l__LastServerSampleAt__57 and not v533.IsStatic then
                local v537 = v536 - l__LastServerSampleAt__57;
                if v537 > 0.005 and v537 < 0.5 then
                    v533.MoveVx = (p529 - v533.ServerX) / v537;
                    v533.MoveVy = (p530 - v533.ServerY) / v537;
                else
                    v533.MoveVx = 0;
                    v533.MoveVy = 0;
                end;
            end;
            v533.LastServerSampleAt = v536;
            v533.ServerX = p529;
            v533.ServerY = p530;
            if l__abs__22(v533.Radius - p531) > 10 then
                v533.RenderRadius = p531;
            end;
            v533.Radius = p531;
            v533.IsCooldown = p532;
            v533.NeedsRender = true;
            u99(v533);
            u85(v533, v535);
            if v533.IsStatic then
                local l__ServerX__58 = v533.ServerX;
                local l__ServerY__59 = v533.ServerY;
                local l__Radius__60 = v533.Radius;
                v533.RenderX = l__ServerX__58;
                v533.RenderY = l__ServerY__59;
                v533.RenderRadius = l__Radius__60;
            end;
        end;
    end;
end;
local function u542(p539, p540) --[[ Line: 2706 ]]
    -- upvalues: u71 (copy), u123 (copy)
    if not u71.Enabled then
        return false;
    end;
    local v541;
    if p539.Type == "PlayerBlob" and (p539.PlayerUid == u123 or (p539.OwnerUid == u123 or p539.VisualUid == u123)) and (p539.LastServerSampleAt ~= nil and p540 - p539.LastServerSampleAt <= u71.PlayerExtrapolateMaxAge) then
        v541 = (p539.MoveVx or 0) ~= 0 and true or (p539.MoveVy or 0) ~= 0;
    else
        v541 = false;
    end;
    return v541;
end;
local u543 = nil;
function ApplyPlayerProfileClickAttributes(_) end;
local function u549(p544) --[[ Line: 2728 ]]
    -- upvalues: u128 (copy), u543 (ref), u61 (copy), u66 (copy), u538 (copy)
    if u128(p544) then
        u543(p544.ID);
    else
        local v545 = u61[p544.ID];
        if v545 then
            if v545.Type == "PlayerBlob" and p544.PlayerId ~= nil then
                local v546 = tostring(p544.PlayerId);
                if v545.PlayerUid ~= v546 then
                    local v547 = v545.PlayerUid and u66[v545.PlayerUid];
                    if v547 then
                        v547[v545.ID] = nil;
                        if next(v547) == nil then
                            u66[v545.PlayerUid] = nil;
                        end;
                    end;
                    v545.PlayerId = p544.PlayerId;
                    v545.PlayerUid = v546;
                    local v548 = u66[v546];
                    if not v548 then
                        v548 = {};
                        u66[v546] = v548;
                    end;
                    v548[v545.ID] = v545;
                    v545.LastVisualVersion = -1;
                    v545.LastColor = nil;
                    v545.LastName = nil;
                    v545.LastSlotVisualsVisible = nil;
                    v545.VisualCacheMissing = false;
                    if v545.Frame then
                        v545.Frame:SetAttribute("OwnerUid", v546);
                        ApplyPlayerProfileClickAttributes(v545);
                    end;
                end;
            end;
            if v545.Type == "PlayerBlob" then
                if p544.IsBot ~= nil then
                    v545.IsBot = p544.IsBot == true;
                end;
                if p544.IsMultiAccount ~= nil then
                    v545.IsMultiAccount = p544.IsMultiAccount == true;
                end;
                if p544.MultiAccountIndex ~= nil then
                    v545.MultiAccountIndex = p544.MultiAccountIndex;
                end;
                if p544.OwnerUserId ~= nil then
                    v545.OwnerUserId = p544.OwnerUserId;
                    v545.OwnerUid = tostring(p544.OwnerUserId);
                    v545.VisualUid = v545.OwnerUid;
                    if v545.Frame then
                        v545.Frame:SetAttribute("OwnerUid", v545.VisualUid or (v545.PlayerUid or ""));
                        ApplyPlayerProfileClickAttributes(v545);
                    end;
                end;
                if p544.BotColor ~= nil and v545.BotColor ~= p544.BotColor then
                    v545.BotColor = p544.BotColor;
                    v545.BotColor3 = nil;
                    v545.LastBotColorHex = nil;
                    v545.LastColor = nil;
                    v545.LastVisualVersion = -1;
                end;
                if p544.AccountColor ~= nil and v545.AccountColor ~= p544.AccountColor then
                    v545.AccountColor = p544.AccountColor;
                    v545.AccountColor3 = nil;
                    v545.LastAccountColorHex = nil;
                    v545.LastColor = nil;
                    v545.LastVisualVersion = -1;
                end;
                if p544.BotFreezeEffect ~= nil and v545.BotFreezeEffect ~= (p544.BotFreezeEffect == true) then
                    v545.BotFreezeEffect = p544.BotFreezeEffect == true;
                    v545.LastBotFreezeEffect = nil;
                    v545.LastVisualVersion = -1;
                end;
                if p544.IsFrozen ~= nil then
                    v545.IsFrozen = p544.IsFrozen == true;
                end;
                if p544.ManualFrozen ~= nil then
                    v545.ManualFrozen = p544.ManualFrozen == true;
                end;
                if p544.TeamId ~= nil then
                    v545.TeamId = p544.TeamId;
                end;
                if p544.TeamColor ~= nil and v545.TeamColor ~= p544.TeamColor then
                    v545.TeamColor = p544.TeamColor;
                    v545.TeamColor3 = nil;
                    v545.LastTeamColorHex = nil;
                    v545.LastColor = nil;
                end;
            end;
            u538(p544.ID, p544.X, p544.Y, p544.Radius, p544.IsCooldown);
        end;
    end;
end;
u543 = function(p550) --[[ Name: DestroyEntity, Line 2819 ]]
    -- upvalues: u61 (copy), u505 (copy), l__GRID_PRIME__33 (copy), u68 (copy), u67 (copy), l__max__28 (copy), u62 (copy), u69 (ref), u70 (ref), u65 (copy), u66 (copy), u63 (copy), u64 (copy)
    local v551 = u61[p550];
    if v551 then
        if v551.HasUI then
            u505(v551.Type, v551.Frame);
        end;
        if v551.CellX then
            local v552 = v551.CellX * l__GRID_PRIME__33 + v551.CellY;
            local v553 = v551.IsStatic and u68 or u67;
            if v553[v552] then
                v553[v552][v551.ID] = nil;
                if next(v553[v552]) == nil then
                    v553[v552] = nil;
                end;
            end;
        end;
        NameVisual.HugeDynamicEntities[p550] = nil;
        local v554 = v551.Radius or 0;
        local v555 = l__max__28(v554, v551.RenderRadius or v554);
        if not v551.IsStatic then
            u62[p550] = nil;
            if v551.Type == "PlayerBlob" and u69 <= v555 then
                u70 = true;
            end;
        end;
        u65[p550] = nil;
        if v551.Type == "PlayerBlob" then
            local v556 = v551.CameraUid or v551.PlayerUid;
            local v557;
            if v556 then
                v557 = u66[v556];
            else
                v557 = v556;
            end;
            if v557 then
                v557[p550] = nil;
                if next(v557) == nil then
                    u66[v556] = nil;
                end;
            end;
        end;
        u63[p550] = nil;
        u64[p550] = nil;
        u61[p550] = nil;
    end;
end;
local function u564(p558) --[[ Line: 2850 ]]
    -- upvalues: u61 (copy), u543 (ref)
    local v559 = tostring(p558 or "");
    if v559 == "" then
    else
        local v560 = {};
        for v561, v562 in pairs(u61) do
            if v562.Type == "PlayerBlob" and (tostring(v562.PlayerUid or "") == v559 or (tostring(v562.VisualUid or "") == v559 or (tostring(v562.OwnerUid or "") == v559 or (tostring(v562.CameraUid or "") == v559 or (tostring(v562.PlayerId or "") == v559 or tostring(v562.OwnerUserId or "") == v559))))) then
                v560[#v560 + 1] = v561;
            end;
        end;
        for _, v563 in ipairs(v560) do
            u543(v563);
        end;
    end;
end;
local function u568() --[[ Line: 2871 ]]
    -- upvalues: u61 (copy), u543 (ref), u62 (copy), u63 (copy), u64 (copy), u65 (copy), u66 (copy), u67 (copy), u68 (copy), u69 (ref), u70 (ref), u117 (ref), u116 (ref), u118 (ref), u121 (ref), u122 (copy)
    local v565 = {};
    for v566 in pairs(u61) do
        v565[#v565 + 1] = v566;
    end;
    for _, v567 in ipairs(v565) do
        u543(v567);
    end;
    table.clear(u61);
    table.clear(u62);
    table.clear(u63);
    table.clear(u64);
    table.clear(u65);
    table.clear(u66);
    table.clear(u67);
    table.clear(u68);
    table.clear(NameVisual.HugeDynamicEntities);
    u69 = 0;
    u70 = false;
    u117 = 0;
    u116 = 0;
    u118 = 0;
    u121 = nil;
    u122.ManualTarget = false;
end;
v172.OnClientEvent:Connect(function(p569) --[[ Line: 2900 ]]
    -- upvalues: u568 (copy), u161 (copy), u121 (ref), u122 (copy), u60 (ref), u448 (copy)
    if p569 and p569.ResetWorld == true then
        u568();
    end;
    if p569 and p569.SpawnGeneration ~= nil then
        u161.LastSpawnGeneration = p569.SpawnGeneration;
        u161.SpawnPendingUntil = os.clock() + 2.5;
        u121 = nil;
        u122.ManualTarget = false;
    end;
    if p569 and p569.MapSize then
        u60 = p569.MapSize;
    end;
    if p569 then
        u448(p569.Teams);
    end;
    if p569 and p569.WorldEvent then
        WorldEventApply(p569.WorldEvent);
    end;
end);
WorldEventEvent.OnClientEvent:Connect(WorldEventApply);
v173.OnClientEvent:Connect(function(p570, p571, p572, p573) --[[ Line: 2917 ]]
    -- upvalues: u60 (ref), u527 (copy), u549 (copy), u543 (ref)
    if type(p573) == "number" then
        u60 = p573;
    end;
    if p570 then
        for v574 = 1, #p570 do
            u527(p570[v574]);
        end;
    end;
    if p571 then
        for v575 = 1, #p571 do
            u549(p571[v575]);
        end;
    end;
    if p572 then
        for v576 = 1, #p572 do
            u543(p572[v576]);
        end;
    end;
end);
v174.OnClientEvent:Connect(function(p577, p578) --[[ Line: 2927 ]]
    -- upvalues: u60 (ref), u538 (copy)
    if type(p578) == "number" then
        u60 = p578;
    end;
    if p577 then
        for v579 = 1, #p577, 4 do
            local v580 = p577[v579];
            local v581 = p577[v579 + 1];
            local v582 = p577[v579 + 2];
            local v583 = p577[v579 + 3];
            if type(v580) == "string" and (type(v581) == "number" and (type(v582) == "number" and type(v583) == "number")) then
                u538(v580, v581, v582, v583, nil);
            end;
        end;
    end;
end);
v179.OnClientEvent:Connect(function(p584) --[[ Line: 2943 ]]
    -- upvalues: u217 (copy), u218 (copy), u406 (copy), u410 (copy), u205 (copy), u214 (copy), u60 (ref), l__max__28 (copy), u123 (copy), l__new__32 (copy), l__fromOffset__31 (copy), u413 (copy), u414 (copy), l__Players__1 (copy), u412 (copy)
    if type(p584) == "table" and p584.Enabled == true then
        u217.Enabled = true;
        u217.Phase = tostring(p584.Phase or "");
        u217.FogActive = p584.FogActive == true;
        u217.FogRadius = tonumber(p584.FogRadius) or 0;
        u60 = tonumber(p584.MapSize) or u60;
        local v585 = type(p584.ReadyPlayers) == "table" and (p584.ReadyPlayers or {}) or {};
        local v586 = tonumber(p584.ReadyCount) or 0;
        local v587 = l__max__28(tonumber(p584.ReadyRequired) or 0, 0);
        u217.LocalReady = v585[u123] == true;
        u218.Text = tostring(p584.Text or "");
        u218.Visible = u218.Text ~= "";
        if u217.Phase == "Waiting" then
            u218.AnchorPoint = l__new__32(0.5, 0);
            u218.Position = UDim2.new(0.5, 0, 0, 62);
            u218.Size = l__fromOffset__31(560, 40);
            u218.TextSize = 18;
        else
            u218.AnchorPoint = l__new__32(0.5, 0);
            u218.Position = UDim2.new(0.5, 0, 0, 12);
            u218.Size = l__fromOffset__31(560, 34);
            u218.TextSize = 17;
        end;
        local v588;
        if p584.CanReady == true then
            v588 = u217.Phase == "Waiting";
        else
            v588 = false;
        end;
        u406.Visible = v588;
        if v588 then
            u406.Position = UDim2.new(0.5, 0, 0, 108);
            u406.Size = l__fromOffset__31(180, 38);
            u406.TextSize = 17;
            local v589 = u406;
            local v590;
            if u217.LocalReady then
                v590 = string.format("Ready %d/%d", v586, v587);
            else
                v590 = string.format("Ready %d/%d", v586, v587);
            end;
            v589.Text = v590;
            local v591 = u406;
            local v592;
            if u217.LocalReady then
                v592 = Color3.fromRGB(45, 150, 85);
            else
                v592 = Color3.fromRGB(255, 85, 0);
            end;
            v591.BackgroundColor3 = v592;
        end;
        local v593 = u205;
        local l__FogActive__61 = u217.FogActive;
        if l__FogActive__61 then
            l__FogActive__61 = u217.FogRadius > 0;
        end;
        v593.Visible = l__FogActive__61;
        for _, v594 in pairs(u214) do
            v594.Visible = u205.Visible;
        end;
        if u217.Phase == "Ended" then
            local v595 = tostring(p584.WinnerName or "No winner");
            local v596 = tonumber(p584.WinnerGold) or 0;
            u413.Text = v595 .. " wins";
            u414.Text = v596 <= 0 and "Match complete" or "+" .. tostring(v596) .. " Gold";
            u410.Visible = true;
            local u597 = tonumber(p584.WinnerUserId);
            if u597 then
                task.spawn(function() --[[ Line: 3000 ]]
                    -- upvalues: l__Players__1 (ref), u597 (copy), u217 (ref), u412 (ref)
                    local v598, v599 = pcall(function() --[[ Line: 3001 ]]
                        -- upvalues: l__Players__1 (ref), u597 (ref)
                        return l__Players__1:GetUserThumbnailAsync(u597, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
                    end);
                    if v598 and (v599 ~= "" and u217.Phase == "Ended") then
                        u412.Image = v599;
                    end;
                end);
            else
                u412.Image = "";
            end;
        else
            u410.Visible = false;
        end;
    else
        u217.Enabled = false;
        u218.Visible = false;
        u406.Visible = false;
        u410.Visible = false;
        u205.Visible = false;
        for _, v600 in pairs(u214) do
            v600.Visible = false;
        end;
    end;
end);
local u601 = {};
local u602 = nil;
local u603 = -1;
function u122.IsHudOpen() --[[ Line: 3025 ]]
    -- upvalues: l__LobbyController__18 (copy), u122 (copy), l__PlayerGui__9 (copy)
    if l__LobbyController__18.IsMenuActive then
        return true;
    end;
    local l__MenuFrame__62 = u122.MenuFrame;
    if not (l__MenuFrame__62 and l__MenuFrame__62.Parent) then
        l__MenuFrame__62 = l__PlayerGui__9:FindFirstChild("Gui");
        if l__MenuFrame__62 then
            l__MenuFrame__62 = l__MenuFrame__62:FindFirstChild("Menu");
        end;
        u122.MenuFrame = l__MenuFrame__62;
    end;
    if l__MenuFrame__62 then
        l__MenuFrame__62 = l__MenuFrame__62.Visible == true;
    end;
    return l__MenuFrame__62;
end;
function u122.HasTarget(p604) --[[ Line: 3038 ]]
    -- upvalues: l__Players__1 (copy), u601 (copy), u66 (copy)
    local v605 = p604 and tostring(p604) or nil;
    local v606;
    if v605 == nil or l__Players__1:GetPlayerByUserId(tonumber(v605) or -1) == nil then
        v606 = false;
    elseif (u601[v605] or 0) > 0 then
        v606 = true;
    else
        local v607 = v605 and tostring(v605) or nil;
        if v607 then
            v607 = u66[v607];
        end;
        if type(v607) == "table" then
            v606 = next(v607) ~= nil;
        else
            v606 = false;
        end;
    end;
    return v606;
end;
function u122.SetTarget(p608, p609) --[[ Line: 3043 ]]
    -- upvalues: u122 (copy), u121 (ref), u175 (copy)
    local v610 = p608 and tostring(p608) or nil;
    if not u122.HasTarget(v610) then
        return false;
    end;
    if p609 == true then
        local v611 = os.clock();
        if v611 < (u122.NextFollowSendAt or 0) then
            return false;
        end;
        u122.NextFollowSendAt = v611 + 0.35;
    end;
    u121 = v610;
    u122.ManualTarget = p609 == true;
    if p609 == true then
        u175:FireServer("SpectateFollow", v610);
    end;
    u122.Update();
    return true;
end;
function u122.BuildTargets() --[[ Line: 3064 ]]
    -- upvalues: l__Players__1 (copy), u601 (copy)
    local v612 = {};
    for _, v613 in ipairs(l__Players__1:GetPlayers()) do
        local v614 = tostring(v613.UserId);
        local v615 = u601[v614] or 0;
        if v615 > 0 then
            v612[#v612 + 1] = {
                Uid = v614,
                Size = v615,
                Name = v613.DisplayName ~= "" and v613.DisplayName or v613.Name
            };
        end;
    end;
    table.sort(v612, function(p616, p617) --[[ Line: 3073 ]]
        if p616.Size == p617.Size then
            return p616.Name < p617.Name;
        else
            return p616.Size > p617.Size;
        end;
    end);
    return v612;
end;
function u122.Cycle(p618) --[[ Line: 3082 ]]
    -- upvalues: u122 (copy), u121 (ref), u175 (copy)
    local v619 = u122.BuildTargets();
    local v620 = #v619;
    if v620 <= 0 then
        u121 = nil;
        u122.ManualTarget = false;
        u175:FireServer("SpectateFollow", "");
        u122.Update();
        return;
    end;
    local v621 = 1;
    for v622, v623 in ipairs(v619) do
        if v623.Uid == u121 then
            v621 = v622;
            break;
        end;
    end;
    u122.SetTarget(v619[(v621 - 1 + p618) % v620 + 1].Uid, true);
end;
function u122.TrySelectAtInput(p624) --[[ Line: 3105 ]]
    -- upvalues: u213 (ref), u122 (copy), u161 (copy), u123 (copy), u66 (copy), l__UserInputService__5 (copy), u181 (copy), u157 (ref), u158 (ref), l__max__28 (copy), u65 (copy), l__Players__1 (copy)
    if u213 == "Spectate" and (not u122.IsHudOpen() and u161.ActiveMode == nil) then
        local v625 = u123;
        local v626 = v625 and tostring(v625) or nil;
        if v626 then
            v626 = u66[v626];
        end;
        local v627;
        if type(v626) == "table" then
            v627 = next(v626) ~= nil;
        else
            v627 = false;
        end;
        if not v627 then
            local v628, v629;
            if p624 and p624.UserInputType == Enum.UserInputType.Touch then
                if p624 then
                    v628 = p624.Position.X;
                    v629 = p624.Position.Y;
                else
                    local v630 = l__UserInputService__5:GetMouseLocation();
                    v628 = v630.X;
                    v629 = v630.Y;
                end;
            else
                local v631 = l__UserInputService__5:GetMouseLocation();
                v628 = v631.X;
                v629 = v631.Y;
            end;
            local v632 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
            local v633 = NameVisual.GetRenderZoom();
            local v634 = (v628 - v632.X * 0.5) / v633 - u157;
            local v635 = (v629 - v632.Y * 0.5) / v633 - u158;
            local v636 = 18 / l__max__28(NameVisual.GetRenderZoom(), 0.05);
            local v637 = (1 / 0);
            local v638 = nil;
            for _, v639 in pairs(u65) do
                local v640 = v639.CameraUid or (v639.OwnerUid or v639.PlayerUid);
                if v640 and l__Players__1:GetPlayerByUserId(tonumber(v640) or -1) then
                    local v641 = l__max__28(v639.RenderRadius or (v639.Radius or 0), v639.Radius or 0) + v636;
                    local v642 = v634 - (v639.RenderX or (v639.ServerX or 0));
                    local v643 = v635 - (v639.RenderY or (v639.ServerY or 0));
                    local v644 = v642 * v642 + v643 * v643;
                    if v644 <= v641 * v641 and v644 < v637 then
                        v638 = tostring(v640);
                        v637 = v644;
                    end;
                end;
            end;
            if v638 then
                return u122.SetTarget(v638, true);
            else
                return false;
            end;
        end;
    end;
    return false;
end;
function u122.Update(p645) --[[ Line: 3133 ]]
    -- upvalues: u122 (copy), u161 (copy), u213 (ref), u123 (copy), u66 (copy), u121 (ref), l__Players__1 (copy), u601 (copy), l__floor__27 (copy)
    if u122.Frame then
        local v646 = (tonumber(u161.SpawnPendingUntil) or 0) > (p645 or os.clock());
        local v647;
        if u213 == "Spectate" then
            v647 = not (v646 or u122.IsHudOpen());
            if v647 then
                local v648 = u123;
                local v649 = v648 and tostring(v648) or nil;
                if v649 then
                    v649 = u66[v649];
                end;
                local v650;
                if type(v649) == "table" then
                    v650 = next(v649) ~= nil;
                else
                    v650 = false;
                end;
                v647 = not v650;
            end;
        else
            v647 = false;
        end;
        if u122.Frame.Visible ~= v647 then
            u122.Frame.Visible = v647;
        end;
        if v647 then
            local v651 = u121;
            if v651 then
                v651 = l__Players__1:GetPlayerByUserId(tonumber(u121) or -1);
            end;
            local v652 = v651 and (string.format("%s  |  %d", v651.DisplayName ~= "" and v651.DisplayName or v651.Name, (l__floor__27(u121 and (u601[u121] or 0) or 0))) or "Waiting for players") or "Waiting for players";
            if v652 ~= u122.LastTargetText then
                u122.TargetLabel.Text = v652;
                u122.LastTargetText = v652;
            end;
        end;
    end;
end;
if u122.PrevButton then
    u122.PrevButton.MouseButton1Click:Connect(function() --[[ Line: 3157 ]]
        -- upvalues: u122 (copy)
        u122.Cycle(-1);
    end);
end;
if u122.NextButton then
    u122.NextButton.MouseButton1Click:Connect(function() --[[ Line: 3162 ]]
        -- upvalues: u122 (copy)
        u122.Cycle(1);
    end);
end;
local function u659(p653) --[[ Line: 3167 ]]
    -- upvalues: u602 (ref), u601 (copy), u603 (ref), u122 (copy), u121 (ref)
    if p653 and p653 ~= u602 then
        local v654 = u601[p653] or 0;
        if u603 < v654 then
            u602 = p653;
            u603 = v654;
            if not (u122.ManualTarget and u122.HasTarget(u121)) then
                u121 = u602;
                u122.ManualTarget = false;
                u122.Update();
            end;
            return;
        end;
    end;
    local v655 = -1;
    local v656 = nil;
    for v657, v658 in pairs(u601) do
        if v655 < v658 then
            v656 = v657;
            v655 = v658;
        end;
    end;
    u602 = v656;
    u603 = v655;
    if not (u122.ManualTarget and u122.HasTarget(u121)) then
        u121 = u602;
        u122.ManualTarget = false;
        u122.Update();
    end;
end;
local u660 = v451;
local u661 = v450;
local u662 = v449;
local function v710(u663) --[[ Line: 3194 ]]
    -- upvalues: u601 (copy), u659 (copy), l__ClientPlayerState__16 (copy), u100 (copy), u7 (copy), u6 (copy), l__GameDatabase__15 (copy), u212 (ref)
    local u664 = tostring(u663.UserId);
    task.spawn(function() --[[ Line: 3196 ]]
        -- upvalues: u601 (ref), u664 (copy), u663 (copy), u659 (ref)
        local function v665() --[[ Line: 3197 ]]
            -- upvalues: u601 (ref), u664 (ref), u663 (ref), u659 (ref)
            u601[u664] = tonumber(u663:GetAttribute("RuntimeSize")) or 0;
            u659(u664);
        end;
        u601[u664] = tonumber(u663:GetAttribute("RuntimeSize")) or 0;
        u659(u664);
        u663:GetAttributeChangedSignal("RuntimeSize"):Connect(v665);
    end);
    task.spawn(function() --[[ Line: 3204 ]]
        -- upvalues: l__ClientPlayerState__16 (ref), u663 (copy), u100 (ref), u664 (copy), u7 (ref), u6 (ref), l__GameDatabase__15 (ref), u212 (ref)
        local u666 = l__ClientPlayerState__16.WaitForProxy("Settings", u663, 15);
        local u667 = l__ClientPlayerState__16.WaitForProxy("Equipped.Skins", u663, 15);
        local u668 = l__ClientPlayerState__16.WaitForProxy("Equipped.Hats", u663, 15);
        local u669 = l__ClientPlayerState__16.WaitForProxy("Equipped.Titles", u663, 5);
        local v670 = u663:FindFirstChild("TempStats") or u663:WaitForChild("TempStats", 3);
        local v671 = v670;
        if v671 then
            v671 = v670:FindFirstChild("Effects");
        end;
        local u673 = v671 or {
            GetAttribute = function(_, p672) --[[ Name: GetAttribute, Line 3213 ]]
                -- upvalues: u663 (ref)
                return u663:GetAttribute("Effect" .. tostring(p672));
            end
        };
        if not (u666 and (u667 and u668)) then
            for _ = 1, 15 do
                if not u663.Parent then
                    return;
                end;
                u666 = u666 or l__ClientPlayerState__16.WaitForProxy("Settings", u663, 1);
                u667 = u667 or l__ClientPlayerState__16.WaitForProxy("Equipped.Skins", u663, 1);
                u668 = u668 or l__ClientPlayerState__16.WaitForProxy("Equipped.Hats", u663, 1);
                u669 = u669 or l__ClientPlayerState__16.WaitForProxy("Equipped.Titles", u663, 1);
                if u666 and (u667 and u668) then
                    break;
                end;
                task.wait(1);
            end;
        end;
        if u666 and (u667 and u668) then
            if not u100[u664] then
                u100[u664] = {
                    Name = "",
                    NameColorMode = "Solid",
                    NameGradient = "",
                    Title = "",
                    Version = 0,
                    Color = u7,
                    NameColor = u6,
                    TitleColor = NameVisual.TitleFallbackColor,
                    Skins = {},
                    Hats = {},
                    Effects = {}
                };
            end;
            local function u683(u674, u675) --[[ Line: 3240 ]]
                -- upvalues: l__GameDatabase__15 (ref), u663 (ref), u664 (ref), u100 (ref), u212 (ref)
                if u674 and u675 then
                    local v676 = false;
                    for u677 = 1, 5 do
                        local u678 = u674:GetAttribute("Slot" .. u677);
                        if u678 and (u678 ~= "" and u678 ~= "None") then
                            if not u675[u677] or u675[u677].ItemId ~= u678 then
                                local v679 = l__GameDatabase__15.Items[u678];
                                if v679 then
                                    u675[u677] = {
                                        ItemId = u678,
                                        Image = u675[u677] and (u675[u677].Image or "") or "",
                                        IsAnimated = v679.TypeSkin == "Animated",
                                        NeedsRounding = v679.NeedsRounding,
                                        Data = v679
                                    };
                                    v676 = true;
                                    if v679.TypeSkin == "Static" then
                                        u675[u677].Image = v679.ImageId;
                                    elseif v679.TypeSkin == "Async" then
                                        v679.Fetch(u663.UserId, function(p680) --[[ Line: 3263 ]]
                                            -- upvalues: u674 (copy), u677 (copy), u678 (copy), u675 (copy), u664 (ref), u100 (ref), u212 (ref)
                                            if u674:GetAttribute("Slot" .. u677) == u678 and u675[u677] then
                                                u675[u677].Image = p680;
                                                local v681 = u100[u664];
                                                if v681 then
                                                    u212 = u212 + 1;
                                                    v681.Version = u212;
                                                end;
                                            end;
                                        end);
                                    end;
                                elseif u675[u677] ~= nil then
                                    u675[u677] = nil;
                                    v676 = true;
                                end;
                            end;
                        elseif u675[u677] ~= nil then
                            u675[u677] = nil;
                            v676 = true;
                        end;
                    end;
                    local v682 = v676 and u100[u664];
                    if v682 then
                        u212 = u212 + 1;
                        v682.Version = u212;
                    end;
                end;
            end;
            local function u689(p684) --[[ Line: 3281 ]]
                -- upvalues: u100 (ref), u664 (ref), l__GameDatabase__15 (ref), u212 (ref)
                local v685 = u100[u664];
                if v685 then
                    local v686 = "";
                    local l__TitleFallbackColor__63 = NameVisual.TitleFallbackColor;
                    if p684 then
                        p684 = p684:GetAttribute("Slot1");
                    end;
                    if p684 and (p684 ~= "" and p684 ~= "None") then
                        local v687 = l__GameDatabase__15.Items[p684];
                        if v687 and v687.Type == "Title" then
                            v686 = tostring(v687.TitleText or (v687.Name or p684));
                            l__TitleFallbackColor__63 = NameVisual.ParseHexColor(v687.TitleColor, NameVisual.TitleFallbackColor);
                        end;
                    end;
                    if v685.Title ~= v686 or v685.TitleColor ~= l__TitleFallbackColor__63 then
                        v685.Title = v686;
                        v685.TitleColor = l__TitleFallbackColor__63;
                        local v688 = u100[u664];
                        if v688 then
                            u212 = u212 + 1;
                            v688.Version = u212;
                        end;
                    end;
                end;
            end;
            local function v703(p690) --[[ Line: 3303 ]]
                -- upvalues: u100 (ref), u664 (ref), u666 (ref), u6 (ref), u212 (ref)
                local u691 = u100[u664];
                if u691 then
                    local u692 = false;
                    if p690 == "Nickname" or not p690 then
                        local v693 = u666:GetAttribute("Nickname");
                        local v694 = type(v693) == "string" and v693 and v693 or "";
                        if u691.Name ~= v694 then
                            u691.Name = v694;
                            u692 = true;
                        end;
                    end;
                    if p690 == "BlobColor" or not p690 then
                        local u695 = u666:GetAttribute("BlobColor");
                        if u695 and u695 ~= "" then
                            pcall(function() --[[ Line: 3320 ]]
                                -- upvalues: u695 (copy), u691 (copy), u692 (ref)
                                local v696 = Color3.fromHex(u695);
                                if u691.Color ~= v696 then
                                    u691.Color = v696;
                                    u692 = true;
                                end;
                            end);
                        end;
                    end;
                    if p690 == "NicknameColor" or (p690 == "NicknameColorMode" or (p690 == "NicknameGradient" or not p690)) then
                        local v697 = NameVisual.ParseHexColor(u666:GetAttribute("NicknameColor"), u6);
                        local v698 = u666:GetAttribute("NicknameColorMode") or "Solid";
                        local v699 = tostring(v698);
                        local v700 = u666:GetAttribute("NicknameGradient") or "";
                        local v701 = tostring(v700);
                        if u691.NameColor ~= v697 then
                            u691.NameColor = v697;
                            u692 = true;
                        end;
                        if u691.NameColorMode ~= v699 then
                            u691.NameColorMode = v699;
                            u692 = true;
                        end;
                        if u691.NameGradient ~= v701 then
                            u691.NameGradient = v701;
                            u692 = true;
                        end;
                    end;
                    local v702 = u692 and u100[u664];
                    if v702 then
                        u212 = u212 + 1;
                        v702.Version = u212;
                    end;
                end;
            end;
            u666.AttributeChanged:Connect(v703);
            u667.AttributeChanged:Connect(function() --[[ Line: 3350 ]]
                -- upvalues: u100 (ref), u664 (ref), u683 (copy), u667 (ref)
                local v704 = u100[u664];
                if v704 then
                    u683(u667, v704.Skins);
                end;
            end);
            u668.AttributeChanged:Connect(function() --[[ Line: 3354 ]]
                -- upvalues: u100 (ref), u664 (ref), u683 (copy), u668 (ref)
                local v705 = u100[u664];
                if v705 then
                    u683(u668, v705.Hats);
                end;
            end);
            if u669 then
                u669.AttributeChanged:Connect(function() --[[ Line: 3359 ]]
                    -- upvalues: u689 (copy), u669 (ref)
                    u689(u669);
                end);
            end;
            if typeof(u673) == "Instance" then
                u673.AttributeChanged:Connect(function() --[[ Line: 3362 ]]
                    -- upvalues: u100 (ref), u664 (ref), u683 (copy), u673 (ref)
                    local v706 = u100[u664];
                    if v706 then
                        u683(u673, v706.Effects);
                    end;
                end);
            else
                for v707 = 1, 5 do
                    u663:GetAttributeChangedSignal("EffectSlot" .. v707):Connect(function() --[[ Line: 3368 ]]
                        -- upvalues: u100 (ref), u664 (ref), u683 (copy), u673 (ref)
                        local v708 = u100[u664];
                        if v708 then
                            u683(u673, v708.Effects);
                        end;
                    end);
                end;
            end;
            v703();
            local v709 = u100[u664];
            if v709 then
                u683(u667, v709.Skins);
                u683(u668, v709.Hats);
                u689(u669);
                u683(u673, v709.Effects);
            end;
        end;
    end);
end;
for _, v711 in ipairs(l__Players__1:GetPlayers()) do
    v710(v711);
end;
l__Players__1.PlayerAdded:Connect(v710);
l__Players__1.PlayerRemoving:Connect(function(p712) --[[ Line: 3389 ]]
    -- upvalues: u564 (copy), u601 (copy), u100 (copy), u659 (copy)
    local v713 = tostring(p712.UserId);
    u564(v713);
    u601[v713] = nil;
    u100[v713] = nil;
    u659();
end);
local u714 = l__PlayerGui__9:FindFirstChild("Gui");
u714 = u714;
local u715;
if u714 then
    u715 = u714:FindFirstChild("Menu");
else
    u715 = u714;
end;
local u716 = {
    Merge = {
        Action = "Merge",
        Image = "rbxassetid://105142089333769"
    },
    Speed = {
        Action = "Speed",
        Image = "rbxassetid://118640499559215"
    },
    Spike = {
        Mode = "Spike",
        Image = "rbxassetid://91836576350283"
    },
    Spawner = {
        Mode = "Spawner",
        Image = "rbxassetid://107648441182956"
    },
    FreezeFood = {
        Mode = "FreezeFood",
        Image = "rbxassetid://120014132919241"
    },
    Mass1000 = {
        Mode = "Mass1000",
        Image = "rbxassetid://97140855194617"
    }
};
local u717 = {
    [Enum.KeyCode.One] = "Slot1",
    [Enum.KeyCode.Two] = "Slot2",
    [Enum.KeyCode.Three] = "Slot3",
    [Enum.KeyCode.Four] = "Slot4",
    [Enum.KeyCode.Five] = "Slot5",
    [Enum.KeyCode.Six] = "Slot6",
    [Enum.KeyCode.Seven] = "Slot7",
    [Enum.KeyCode.Eight] = "Slot8",
    [Enum.KeyCode.Nine] = "Slot9",
    [Enum.KeyCode.Zero] = "Slot10"
};
function u161.RefreshKeyBinds() --[[ Line: 3430 ]]
    -- upvalues: u161 (copy)
    local l__SettingsProxy__64 = u161.SettingsProxy;
    table.clear(u161.KeyBindActions);
    for _, v718 in ipairs(u161.KeyBindOrder) do
        local u719;
        if l__SettingsProxy__64 then
            u719 = l__SettingsProxy__64:GetAttribute("Bind_" .. v718);
        end;
        if type(u719) ~= "string" or u719 == "" then
            u719 = u161.KeyBindDefaults[v718];
        end;
        local u720 = nil;
        pcall(function() --[[ Line: 3439 ]]
            -- upvalues: u720 (ref), u719 (ref)
            u720 = Enum.KeyCode[u719];
        end);
        if u720 then
            local v721 = u161.KeyBindActions[u720];
            if type(v721) ~= "table" then
                v721 = {};
                u161.KeyBindActions[u720] = v721;
            end;
            table.insert(v721, v718);
        end;
    end;
end;
function u161.RunBoundAction(p722) --[[ Line: 3453 ]]
    -- upvalues: u170 (ref), u175 (copy), u161 (copy), l__LobbyController__18 (copy), l__UserInputService__5 (copy), u181 (copy), u157 (ref), u158 (ref), u192 (copy)
    if string.sub(p722, 1, 4) == "Slot" then
        u170(p722);
    elseif p722 == "Split" then
        u175:FireServer("Split");
    elseif p722 == "DoubleSplit" then
        u175:FireServer("DoubleSplit");
    elseif p722 == "TripleSplit" then
        u175:FireServer("TripleSplit");
    elseif p722 == "Respawn" then
        u161.LocalFreezePendingUntil = 0;
        local v723 = os.clock();
        if v723 < (tonumber(u161.NextRespawnActionAt) or 0) then
        else
            u161.NextRespawnActionAt = v723 + 1.5;
            u175:FireServer("Respawn");
        end;
    else
        if p722 == "Menu" then
            if type(l__LobbyController__18.ToggleMainMenu) == "function" then
                l__LobbyController__18.ToggleMainMenu();
            end;
        else
            if p722 == "FixedMouse" then
                u161.FixedMouseEnabled = not u161.FixedMouseEnabled;
                if u161.FixedMouseEnabled then
                    local v724 = l__UserInputService__5:GetMouseLocation();
                    local l__X__65 = v724.X;
                    local l__Y__66 = v724.Y;
                    local v725 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
                    local v726 = NameVisual.GetRenderZoom();
                    local v727 = (l__X__65 - v725.X * 0.5) / v726 - u157;
                    local v728 = (l__Y__66 - v725.Y * 0.5) / v726 - u158;
                    u161.FixedMouseWorldX = v727;
                    u161.FixedMouseWorldY = v728;
                    u161.UpdateFixedMouseMarkerPosition();
                    u192.Visible = true;
                    return;
                else
                    u161.FixedMouseWorldX = nil;
                    u161.FixedMouseWorldY = nil;
                    u192.Visible = false;
                    return;
                end;
            end;
            if p722 == "CycleControlledBlob" then
                u175:FireServer("CycleControlledBlob");
                return;
            end;
            if p722 == "Feed" then
                if not u161.IsHoldingW then
                    u161.IsHoldingW = true;
                    u175:FireServer("Eject_Start");
                end;
            else
                if p722 == "Freeze" then
                    u161.LocalFreezePendingUntil = os.clock() + 0.25;
                    u175:FireServer("Freeze");
                    return;
                end;
                if p722 == "BotFeed" then
                    if not u161.IsHoldingBotFeed then
                        u161.IsHoldingBotFeed = true;
                        u175:FireServer("BotEject_Start");
                    end;
                else
                    if p722 == "BotSplit" then
                        u175:FireServer("BotSplit");
                        return;
                    end;
                    if p722 == "BotFreeze" then
                        u175:FireServer("BotFreeze");
                    end;
                end;
            end;
        end;
    end;
end;
u161.RefreshKeyBinds();
task.spawn(function() --[[ Line: 3511 ]]
    -- upvalues: u161 (copy), l__ClientPlayerState__16 (copy), u1 (copy)
    u161.SettingsProxy = u161.SettingsProxy or l__ClientPlayerState__16.WaitForProxy("Settings", u1, 10);
    u161.RefreshKeyBinds();
    if u161.SettingsProxy then
        for _, v729 in ipairs(u161.KeyBindOrder) do
            u161.SettingsProxy:GetAttributeChangedSignal("Bind_" .. v729):Connect(u161.RefreshKeyBinds);
        end;
    end;
end);
function u161.FormatBotDuration(p730) --[[ Line: 3521 ]]
    -- upvalues: l__floor__27 (copy), l__max__28 (copy)
    local v731 = l__max__28(0, (l__floor__27(tonumber(p730) or 0)));
    local v732 = l__floor__27(v731 / 3600);
    local v733 = l__floor__27(v731 % 3600 / 60);
    local v734 = v731 % 60;
    if v732 > 0 then
        return string.format("%d:%02d:%02d", v732, v733, v734);
    else
        return string.format("%d:%02d", v733, v734);
    end;
end;
function u161.GetActiveBotInfo() --[[ Line: 3532 ]]
    -- upvalues: l__Gameplay__10 (copy), l__ClientPlayerState__16 (copy), u1 (copy), l__GameDatabase__15 (copy)
    if l__Gameplay__10:GetAttribute("BotsEnabled") == false then
        return nil;
    end;
    local v735 = l__ClientPlayerState__16.GetProxy("ActiveBoosts", u1);
    if v735 then
        v735 = v735:FindFirstChild("BotActive");
    end;
    if not v735 then
        return nil;
    end;
    local v736 = tonumber(v735:GetAttribute("RemainingSeconds")) or 0;
    local v737 = v735:GetAttribute("PackId") or "";
    local v738 = tostring(v737);
    local v739 = (l__GameDatabase__15.BotPacks or {})[v738];
    local v740 = v739 and v739.BotCount or v735:GetAttribute("BotCount");
    local v741 = tonumber(v740) or 0;
    if v736 <= 0 or v741 <= 0 then
        return nil;
    end;
    local v742 = {
        RemainingSeconds = v736,
        BotCount = v741
    };
    local v743 = v739 and v739.BotMass or v735:GetAttribute("BotMass");
    v742.BotMass = tonumber(v743) or 0;
    v742.PackId = v738;
    return v742;
end;
function u161.SetBotButtonsVisible(p744) --[[ Line: 3558 ]]
    -- upvalues: u161 (copy)
    for _, v745 in ipairs(u161.BotButtons or {}) do
        if v745 and v745.Parent then
            v745.Visible = p744 == true;
        end;
    end;
end;
function u161.SetupBotBoostHud() --[[ Line: 3566 ]]
    -- upvalues: l__PlayerGui__9 (copy), u161 (copy), l__new__32 (copy), l__TouchEnabled__35 (ref), u175 (copy)
    local u746 = Instance.new("ScreenGui", l__PlayerGui__9);
    u746.Name = "BotBoostHud";
    u746.ResetOnSpawn = false;
    u746.IgnoreGuiInset = true;
    u746.DisplayOrder = 12;
    local l__MainScreenGui__67 = l__PlayerGui__9:WaitForChild("MainScreenGui", 5);
    if l__MainScreenGui__67 then
        l__MainScreenGui__67 = l__MainScreenGui__67:WaitForChild("Mass", 5);
    end;
    local v747 = l__MainScreenGui__67 or u746;
    local u748 = v747 == l__MainScreenGui__67;
    local u749 = Instance.new("Frame", v747);
    u749.Name = "BotBoostPanel";
    u749.Size = UDim2.new(0, 174, 0, 22);
    u749.Position = u748 and UDim2.new(0, 0, 0, 202) or UDim2.new(0, 10, 0, 74);
    u749.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
    u749.BackgroundTransparency = 0.18;
    u749.BorderSizePixel = 0;
    u749.LayoutOrder = 60;
    u749.Visible = false;
    Instance.new("UICorner", u749).CornerRadius = UDim.new(0, 6);
    local u750 = Instance.new("TextLabel", u749);
    u750.Name = "Label";
    u750.Size = UDim2.new(1, -45, 1, 0);
    u750.Position = UDim2.new(0, 6, 0, 0);
    u750.BackgroundTransparency = 1;
    u750.TextColor3 = Color3.fromRGB(245, 245, 245);
    u750.Font = Enum.Font.GothamBold;
    u750.TextSize = 11;
    u750.TextXAlignment = Enum.TextXAlignment.Left;
    u750.Text = "";
    local u751 = Instance.new("TextButton", u749);
    u751.Name = "Stop";
    u751.Size = UDim2.new(0, 38, 0, 18);
    u751.Position = UDim2.new(1, -41, 0.5, -9);
    u751.BackgroundColor3 = Color3.fromRGB(190, 70, 55);
    u751.BorderSizePixel = 0;
    u751.Text = "Stop";
    u751.TextColor3 = Color3.new(1, 1, 1);
    u751.Font = Enum.Font.GothamBold;
    u751.TextSize = 9;
    Instance.new("UICorner", u751).CornerRadius = UDim.new(0, 5);
    u751.MouseButton1Click:Connect(function() --[[ Line: 3612 ]]
        -- upvalues: u161 (ref)
        if u161.StopBotPackFunction then
            pcall(function() --[[ Line: 3614 ]]
                -- upvalues: u161 (ref)
                u161.StopBotPackFunction:InvokeServer();
            end);
        end;
    end);
    local function u754() --[[ Line: 3620 ]]
        -- upvalues: l__new__32 (ref), l__TouchEnabled__35 (ref), u748 (copy), u749 (copy), u750 (copy), u751 (copy)
        local v752 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or l__new__32(1280, 720);
        local v753 = l__TouchEnabled__35 or (v752.X < 900 and true or v752.Y < 520);
        if u748 then
            u749.Size = v753 and UDim2.new(0, 154, 0, 20) or UDim2.new(0, 174, 0, 22);
            u749.Position = v753 and UDim2.new(0, 0, 0, 192) or UDim2.new(0, 0, 0, 202);
        else
            u749.Size = v753 and UDim2.new(0, 154, 0, 20) or UDim2.new(0, 174, 0, 22);
            u749.Position = v753 and UDim2.new(0, 8, 0, 70) or UDim2.new(0, 10, 0, 74);
        end;
        u750.Size = v753 and UDim2.new(1, -41, 1, 0) or UDim2.new(1, -45, 1, 0);
        u750.Position = v753 and UDim2.new(0, 5, 0, 0) or UDim2.new(0, 6, 0, 0);
        u750.TextSize = v753 and 10 or 11;
        u751.Size = v753 and UDim2.new(0, 35, 0, 17) or UDim2.new(0, 38, 0, 18);
        u751.Position = v753 and UDim2.new(1, -38, 0.5, -8) or UDim2.new(1, -41, 0.5, -9);
        u751.TextSize = v753 and 8 or 9;
    end;
    u754();
    u161.BotHud = u749;
    task.spawn(function() --[[ Line: 3641 ]]
        -- upvalues: u746 (copy), u754 (copy), u161 (ref), u749 (copy), l__TouchEnabled__35 (ref), u750 (copy), u175 (ref)
        while u746.Parent do
            u754();
            local v755 = u161.GetActiveBotInfo();
            local v756 = v755 ~= nil;
            u749.Visible = v756;
            local l__SetBotButtonsVisible__68 = u161.SetBotButtonsVisible;
            if v756 then
                v756 = l__TouchEnabled__35;
            end;
            l__SetBotButtonsVisible__68(v756);
            if v755 then
                u750.Text = string.format("B:%d M:%d %s", v755.BotCount, v755.BotMass, u161.FormatBotDuration(v755.RemainingSeconds));
            elseif u161.IsHoldingBotFeed then
                u161.IsHoldingBotFeed = false;
                u175:FireServer("BotEject_Stop");
            end;
            task.wait(0.35);
        end;
    end);
end;
u161.SetupBotBoostHud();
local function u853() --[[ Line: 3661 ]]
    -- upvalues: u161 (copy), l__PlayerGui__9 (copy), l__new__32 (copy), l__Config__11 (copy), l__clamp__26 (copy), l__TouchEnabled__35 (ref), u181 (copy), u459 (copy), u71 (copy), u176 (copy), u662 (ref), u661 (ref), u660 (ref), u175 (copy), l__GuiService__6 (copy), u8 (copy), l__UserInputService__5 (copy), l__fromOffset__31 (copy), u157 (ref), u158 (ref), u177 (copy)
    u161.MobileGui = Instance.new("ScreenGui", l__PlayerGui__9);
    u161.MobileGui.Name = "MobileAgaricControls";
    u161.MobileGui.Enabled = false;
    u161.MobileGui.DisplayOrder = 10;
    u161.MobileGui.IgnoreGuiInset = true;
    u161.MobileGui.ScreenInsets = Enum.ScreenInsets.None;
    local v757 = Instance.new("TextLabel", u161.MobileGui);
    v757.Name = "DirectionArrow";
    v757.Size = UDim2.new(0, 34, 0, 34);
    v757.AnchorPoint = l__new__32(0.5, 0.5);
    v757.BackgroundTransparency = 1;
    v757.Text = ">";
    v757.TextColor3 = Color3.fromRGB(255, 255, 255);
    v757.Font = Enum.Font.GothamBlack;
    v757.TextScaled = true;
    v757.ZIndex = 100;
    v757.Visible = false;
    local v758 = Instance.new("UIStroke", v757);
    v758.Color = Color3.fromRGB(0, 0, 0);
    v758.Thickness = 1.2;
    v758.ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual;
    u161.DirArrow = v757;
    local function v770(p759, p760, p761, p762, p763, p764) --[[ Line: 3688 ]]
        -- upvalues: u161 (ref), l__new__32 (ref)
        local u765 = Instance.new("TextButton", u161.MobileGui);
        u765.Name = p759;
        u765.Size = p761;
        u765.Position = p762;
        u765.AnchorPoint = l__new__32(0.5, 0.5);
        u765.BackgroundColor3 = p763;
        u765.BackgroundTransparency = 1;
        u765.Text = p760;
        u765.TextScaled = true;
        u765.TextColor3 = p763;
        u765.Font = Enum.Font.GothamBlack;
        u765.ZIndex = 20;
        Instance.new("UICorner", u765).CornerRadius = p764;
        local v766 = Instance.new("UIStroke", u765);
        v766.Color = p763;
        v766.Thickness = 3;
        v766.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        local v767 = Instance.new("UIPadding", u765);
        v767.PaddingTop = UDim.new(0.2, 0);
        v767.PaddingBottom = UDim.new(0.2, 0);
        v767.PaddingLeft = UDim.new(0.1, 0);
        v767.PaddingRight = UDim.new(0.1, 0);
        u765.InputBegan:Connect(function(p768) --[[ Line: 3715 ]]
            -- upvalues: u765 (copy)
            if p768.UserInputType == Enum.UserInputType.Touch or p768.UserInputType == Enum.UserInputType.MouseButton1 then
                u765.BackgroundTransparency = 0.7;
            end;
        end);
        u765.InputEnded:Connect(function(p769) --[[ Line: 3718 ]]
            -- upvalues: u765 (copy)
            if (p769.UserInputType == Enum.UserInputType.Touch or p769.UserInputType == Enum.UserInputType.MouseButton1) and not u765:GetAttribute("IsToggled") then
                u765.BackgroundTransparency = 1;
            end;
        end);
        return u765;
    end;
    v770("BtnZoomOut", "-", UDim2.new(0, 40, 0, 40), UDim2.new(0, 142, 0, 82), Color3.fromRGB(150, 150, 150), UDim.new(1, 0)).MouseButton1Click:Connect(function() --[[ Line: 3727 ]]
        -- upvalues: u161 (ref), l__Config__11 (ref), l__clamp__26 (ref)
        u161.UserZoomOffset = l__clamp__26(u161.UserZoomOffset - l__Config__11.Client.ZOOM_SPEED_TOUCH, -u161.BaseZoom + 5, 1000);
    end);
    v770("BtnZoomIn", "+", UDim2.new(0, 40, 0, 40), UDim2.new(0, 192, 0, 82), Color3.fromRGB(150, 150, 150), UDim.new(1, 0)).MouseButton1Click:Connect(function() --[[ Line: 3732 ]]
        -- upvalues: u161 (ref), l__Config__11 (ref), l__clamp__26 (ref)
        u161.UserZoomOffset = l__clamp__26(u161.UserZoomOffset + l__Config__11.Client.ZOOM_SPEED_TOUCH, -u161.BaseZoom + 5, 1000);
    end);
    local v771 = v770("BtnSplit", "SPLIT", UDim2.new(0, 90, 0, 90), UDim2.new(1, -160, 1, -70), Color3.fromRGB(255, 150, 50), UDim.new(1, 0));
    v771.ZIndex = 40;
    v771.MouseButton1Click:Connect(function() --[[ Line: 3738 ]]
        -- upvalues: l__TouchEnabled__35 (ref), u181 (ref), u161 (ref), u459 (ref), u71 (ref), u176 (ref), u662 (ref), u661 (ref), u660 (ref), u175 (ref)
        if l__TouchEnabled__35 then
            if not NameVisual.CachedScreenSize then
                local _ = u181.AbsoluteSize;
            end;
            local v772, v773;
            if u161.MobileAimPower <= 0.08 then
                v772, v773 = u459();
            else
                local v774, v775, v776 = u459();
                local l__MobileAimDir__69 = u161.MobileAimDir;
                local v777 = v776 * 0.15;
                local v778 = v777 + (v776 * 2.45 - v777) * u161.MobileAimPower;
                v772 = v774 + l__MobileAimDir__69.X * v778;
                v773 = v775 + l__MobileAimDir__69.Y * v778;
            end;
            if u71.Enabled then
                local v779 = u161;
                u161.PredictedTargetX = v772;
                v779.PredictedTargetY = v773;
            end;
            u176:FireServer(v772, v773);
            u662 = os.clock();
            u661 = v772;
            u660 = v773;
        end;
        u175:FireServer("Split");
    end);
    local v780 = v770("BtnFeed", "FEED", UDim2.new(0, 75, 0, 75), UDim2.new(1, -70, 1, -160), Color3.fromRGB(255, 200, 50), UDim.new(1, 0));
    v780.InputBegan:Connect(function(p781) --[[ Line: 3744 ]]
        -- upvalues: l__TouchEnabled__35 (ref), u181 (ref), u161 (ref), u459 (ref), u71 (ref), u176 (ref), u662 (ref), u661 (ref), u660 (ref), u175 (ref)
        if p781.UserInputType == Enum.UserInputType.Touch or p781.UserInputType == Enum.UserInputType.MouseButton1 then
            if l__TouchEnabled__35 then
                if not NameVisual.CachedScreenSize then
                    local _ = u181.AbsoluteSize;
                end;
                local v782, v783;
                if u161.MobileAimPower <= 0.08 then
                    v782, v783 = u459();
                else
                    local v784, v785, v786 = u459();
                    local l__MobileAimDir__70 = u161.MobileAimDir;
                    local v787 = v786 * 0.15;
                    local v788 = v787 + (v786 * 2.45 - v787) * u161.MobileAimPower;
                    v782 = v784 + l__MobileAimDir__70.X * v788;
                    v783 = v785 + l__MobileAimDir__70.Y * v788;
                end;
                if u71.Enabled then
                    local v789 = u161;
                    u161.PredictedTargetX = v782;
                    v789.PredictedTargetY = v783;
                end;
                u176:FireServer(v782, v783);
                u662 = os.clock();
                u661 = v782;
                u660 = v783;
            end;
            u161.IsHoldingW = true;
            u175:FireServer("Eject_Start");
        end;
    end);
    v780.InputEnded:Connect(function(p790) --[[ Line: 3751 ]]
        -- upvalues: u161 (ref), u175 (ref)
        if p790.UserInputType == Enum.UserInputType.Touch or p790.UserInputType == Enum.UserInputType.MouseButton1 then
            u161.IsHoldingW = false;
            u175:FireServer("Eject_Stop");
        end;
    end);
    local u791 = v770("BtnFreeze", "FREEZE", UDim2.new(0, 70, 0, 70), UDim2.new(1, -70, 1, -70), Color3.fromRGB(50, 170, 255), UDim.new(1, 0));
    local u792 = false;
    u791.MouseButton1Click:Connect(function() --[[ Line: 3760 ]]
        -- upvalues: u792 (ref), u161 (ref), u791 (copy), u175 (ref)
        u792 = not u792;
        u161.LocalFreezePendingUntil = os.clock() + 0.25;
        u791:SetAttribute("IsToggled", u792);
        u791.BackgroundTransparency = u792 and 0.5 or 1;
        u175:FireServer("Freeze");
    end);
    local u793 = v770("BtnAutoFeed", "FEED\nLOCK", UDim2.new(0, 65, 0, 65), UDim2.new(1, -150, 1, -160), Color3.fromRGB(120, 255, 50), UDim.new(1, 0));
    u793.TextScaled = false;
    u793.TextSize = 11;
    u161.IsAutoFeedActive = false;
    u793.MouseButton1Click:Connect(function() --[[ Line: 3772 ]]
        -- upvalues: u161 (ref), u793 (copy), l__TouchEnabled__35 (ref), u181 (ref), u459 (ref), u71 (ref), u176 (ref), u662 (ref), u661 (ref), u660 (ref), u175 (ref)
        u161.IsAutoFeedActive = not u161.IsAutoFeedActive;
        u793:SetAttribute("IsToggled", u161.IsAutoFeedActive);
        u793.BackgroundTransparency = u161.IsAutoFeedActive and 0.5 or 1;
        if u161.IsAutoFeedActive then
            if l__TouchEnabled__35 then
                if not NameVisual.CachedScreenSize then
                    local _ = u181.AbsoluteSize;
                end;
                local v794, v795;
                if u161.MobileAimPower <= 0.08 then
                    v794, v795 = u459();
                else
                    local v796, v797, v798 = u459();
                    local l__MobileAimDir__71 = u161.MobileAimDir;
                    local v799 = v798 * 0.15;
                    local v800 = v799 + (v798 * 2.45 - v799) * u161.MobileAimPower;
                    v794 = v796 + l__MobileAimDir__71.X * v800;
                    v795 = v797 + l__MobileAimDir__71.Y * v800;
                end;
                if u71.Enabled then
                    local v801 = u161;
                    u161.PredictedTargetX = v794;
                    v801.PredictedTargetY = v795;
                end;
                u176:FireServer(v794, v795);
                u662 = os.clock();
                u661 = v794;
                u660 = v795;
            end;
            u175:FireServer("Eject_Start");
        else
            u175:FireServer("Eject_Stop");
        end;
    end);
    local v802 = v770("BtnBotFeed", "B\nFEED", UDim2.new(0, 62, 0, 44), UDim2.new(1, -262, 1, -70), Color3.fromRGB(255, 220, 80), UDim.new(0, 12));
    local v803 = v770("BtnBotSplit", "B\nSPLIT", UDim2.new(0, 62, 0, 44), UDim2.new(1, -262, 1, -126), Color3.fromRGB(255, 120, 70), UDim.new(0, 12));
    local v804 = v770("BtnBotFreeze", "B\nFREEZE", UDim2.new(0, 62, 0, 44), UDim2.new(1, -336, 1, -126), Color3.fromRGB(80, 200, 255), UDim.new(0, 12));
    for _, v805 in ipairs({ v803, v802, v804 }) do
        v805.TextScaled = false;
        v805.TextSize = 10;
        v805.ZIndex = 18;
        v805.Visible = false;
        table.insert(u161.BotButtons, v805);
    end;
    v803.MouseButton1Click:Connect(function() --[[ Line: 3794 ]]
        -- upvalues: l__TouchEnabled__35 (ref), u181 (ref), u161 (ref), u459 (ref), u71 (ref), u176 (ref), u662 (ref), u661 (ref), u660 (ref), u175 (ref)
        if l__TouchEnabled__35 then
            if not NameVisual.CachedScreenSize then
                local _ = u181.AbsoluteSize;
            end;
            local v806, v807;
            if u161.MobileAimPower <= 0.08 then
                v806, v807 = u459();
            else
                local v808, v809, v810 = u459();
                local l__MobileAimDir__72 = u161.MobileAimDir;
                local v811 = v810 * 0.15;
                local v812 = v811 + (v810 * 2.45 - v811) * u161.MobileAimPower;
                v806 = v808 + l__MobileAimDir__72.X * v812;
                v807 = v809 + l__MobileAimDir__72.Y * v812;
            end;
            if u71.Enabled then
                local v813 = u161;
                u161.PredictedTargetX = v806;
                v813.PredictedTargetY = v807;
            end;
            u176:FireServer(v806, v807);
            u662 = os.clock();
            u661 = v806;
            u660 = v807;
        end;
        u175:FireServer("BotSplit");
    end);
    v802.InputBegan:Connect(function(p814) --[[ Line: 3798 ]]
        -- upvalues: l__TouchEnabled__35 (ref), u181 (ref), u161 (ref), u459 (ref), u71 (ref), u176 (ref), u662 (ref), u661 (ref), u660 (ref), u175 (ref)
        if p814.UserInputType == Enum.UserInputType.Touch or p814.UserInputType == Enum.UserInputType.MouseButton1 then
            if l__TouchEnabled__35 then
                if not NameVisual.CachedScreenSize then
                    local _ = u181.AbsoluteSize;
                end;
                local v815, v816;
                if u161.MobileAimPower <= 0.08 then
                    v815, v816 = u459();
                else
                    local v817, v818, v819 = u459();
                    local l__MobileAimDir__73 = u161.MobileAimDir;
                    local v820 = v819 * 0.15;
                    local v821 = v820 + (v819 * 2.45 - v820) * u161.MobileAimPower;
                    v815 = v817 + l__MobileAimDir__73.X * v821;
                    v816 = v818 + l__MobileAimDir__73.Y * v821;
                end;
                if u71.Enabled then
                    local v822 = u161;
                    u161.PredictedTargetX = v815;
                    v822.PredictedTargetY = v816;
                end;
                u176:FireServer(v815, v816);
                u662 = os.clock();
                u661 = v815;
                u660 = v816;
            end;
            u161.IsHoldingBotFeed = true;
            u175:FireServer("BotEject_Start");
        end;
    end);
    v802.InputEnded:Connect(function(p823) --[[ Line: 3805 ]]
        -- upvalues: u161 (ref), u175 (ref)
        if p823.UserInputType == Enum.UserInputType.Touch or p823.UserInputType == Enum.UserInputType.MouseButton1 then
            u161.IsHoldingBotFeed = false;
            u175:FireServer("BotEject_Stop");
        end;
    end);
    v804.MouseButton1Click:Connect(function() --[[ Line: 3811 ]]
        -- upvalues: u175 (ref)
        u175:FireServer("BotFreeze");
    end);
    local v824 = Instance.new("TextButton", u161.MobileGui);
    v824.Size = UDim2.new(1, 0, 1, 0);
    v824.Position = UDim2.new(0, 0, 0, 0);
    v824.BackgroundTransparency = 1;
    v824.Text = "";
    v824.ZIndex = -10;
    local u825 = Instance.new("Frame", u161.MobileGui);
    u825.Name = "JoystickBase";
    u825.Size = UDim2.new(0, 100, 0, 100);
    u825.AnchorPoint = l__new__32(0.5, 0.5);
    u825.BackgroundColor3 = Color3.new(0, 0, 0);
    u825.BackgroundTransparency = 0.7;
    u825.Visible = false;
    Instance.new("UICorner", u825).CornerRadius = UDim.new(1, 0);
    u825.ZIndex = -9;
    local u826 = Instance.new("Frame", u825);
    u826.Name = "JoystickStick";
    u826.Size = UDim2.new(0, 60, 0, 60);
    u826.AnchorPoint = l__new__32(0.5, 0.5);
    u826.Position = UDim2.new(0.5, 0, 0.5, 0);
    u826.BackgroundColor3 = Color3.new(1, 1, 1);
    u826.BackgroundTransparency = 0.4;
    Instance.new("UICorner", u826).CornerRadius = UDim.new(1, 0);
    u826.ZIndex = -8;
    local u827 = nil;
    local u828 = l__new__32();
    local u829 = false;
    v824.InputBegan:Connect(function(p830) --[[ Line: 3845 ]]
        -- upvalues: u827 (ref), l__GuiService__6 (ref), u828 (ref), l__new__32 (ref), u825 (copy), u826 (copy), u161 (ref), u8 (ref), l__clamp__26 (ref), u829 (ref)
        if (p830.UserInputType == Enum.UserInputType.Touch or p830.UserInputType == Enum.UserInputType.MouseButton1) and not u827 then
            u827 = p830;
            local v831 = l__GuiService__6:GetGuiInset();
            u828 = l__new__32(p830.Position.X, p830.Position.Y + v831.Y);
            u825.Position = UDim2.new(0, u828.X, 0, u828.Y);
            u825.Visible = true;
            u826.Position = UDim2.new(0.5, 0, 0.5, 0);
            u161.IsHoldingJoystick = true;
            local v832 = u8;
            local v833 = u825.AbsoluteSize.X / 2;
            local l__Magnitude__74 = v832.Magnitude;
            u161.TouchOffset = v833 > 0 and v832 / v833 or u8;
            if v833 <= 0 or l__Magnitude__74 / v833 <= 0.08 then
                u161.MobileAimPower = 0;
            else
                u161.MobileAimDir = v832 / l__Magnitude__74;
                u161.MobileAimPower = l__clamp__26(l__Magnitude__74 / v833, 0, 1);
            end;
            u829 = true;
        end;
    end);
    l__UserInputService__5.InputChanged:Connect(function(p834) --[[ Line: 3861 ]]
        -- upvalues: u827 (ref), l__GuiService__6 (ref), l__new__32 (ref), u828 (ref), u829 (ref), u825 (copy), u826 (copy), l__fromOffset__31 (ref), u161 (ref), u8 (ref), l__clamp__26 (ref)
        if p834 == u827 then
            local v835 = l__GuiService__6:GetGuiInset();
            local v836 = l__new__32(p834.Position.X, p834.Position.Y + v835.Y) - u828;
            if v836.Magnitude > 15 then
                u829 = false;
            end;
            local v837 = u825.AbsoluteSize.X / 2;
            if v837 < v836.Magnitude then
                v836 = v836.Unit * v837 or v836;
            end;
            u826.Position = l__fromOffset__31(u825.Size.X.Offset / 2 + v836.X, u825.Size.Y.Offset / 2 + v836.Y);
            local l__Magnitude__75 = v836.Magnitude;
            u161.TouchOffset = v837 > 0 and v836 / v837 or u8;
            if v837 <= 0 or l__Magnitude__75 / v837 <= 0.08 then
                u161.MobileAimPower = 0;
                return;
            end;
            u161.MobileAimDir = v836 / l__Magnitude__75;
            u161.MobileAimPower = l__clamp__26(l__Magnitude__75 / v837, 0, 1);
        end;
    end);
    local function v838() --[[ Line: 3876 ]]
        -- upvalues: u827 (ref), u825 (copy), u161 (ref), u8 (ref)
        u827 = nil;
        u825.Visible = false;
        u161.IsHoldingJoystick = false;
        u161.TouchOffset = u8;
        u161.MobileAimPower = 0;
        if u161.DirArrow then
            u161.DirArrow.Visible = false;
        end;
    end;
    l__UserInputService__5.InputEnded:Connect(function(p839) --[[ Line: 3885 ]]
        -- upvalues: u827 (ref), u829 (ref), u161 (ref), u181 (ref), u459 (ref), l__UserInputService__5 (ref), u157 (ref), u158 (ref), u177 (ref), u825 (copy), u8 (ref)
        if p839 == u827 then
            if u829 and u161.ActiveMode ~= nil then
                if not NameVisual.CachedScreenSize then
                    local _ = u181.AbsoluteSize;
                end;
                local v840, v841;
                if u161.MobileAimPower <= 0.08 then
                    v840, v841 = u459();
                else
                    local v842, v843, v844 = u459();
                    local l__MobileAimDir__76 = u161.MobileAimDir;
                    local v845 = v844 * 0.15;
                    local v846 = v845 + (v844 * 2.45 - v845) * u161.MobileAimPower;
                    v840 = v842 + l__MobileAimDir__76.X * v846;
                    v841 = v843 + l__MobileAimDir__76.Y * v846;
                end;
                if u161.MobileAimPower <= 0.08 then
                    local v847, v848;
                    if p839 and p839.UserInputType == Enum.UserInputType.Touch then
                        if p839 then
                            v847 = p839.Position.X;
                            v848 = p839.Position.Y;
                        else
                            local v849 = l__UserInputService__5:GetMouseLocation();
                            v847 = v849.X;
                            v848 = v849.Y;
                        end;
                    else
                        local v850 = l__UserInputService__5:GetMouseLocation();
                        v847 = v850.X;
                        v848 = v850.Y;
                    end;
                    local v851 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
                    local v852 = NameVisual.GetRenderZoom();
                    v840 = (v847 - v851.X * 0.5) / v852 - u157;
                    v841 = (v848 - v851.Y * 0.5) / v852 - u158;
                end;
                u177:FireServer(u161.ActiveMode, v840, v841);
            end;
            u827 = nil;
            u825.Visible = false;
            u161.IsHoldingJoystick = false;
            u161.TouchOffset = u8;
            u161.MobileAimPower = 0;
            if u161.DirArrow then
                u161.DirArrow.Visible = false;
            end;
        end;
    end);
    u161.MobileGui:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 3901 ]]
        -- upvalues: u161 (ref), u827 (ref), u825 (copy), u8 (ref)
        if not u161.MobileGui.Enabled then
            u827 = nil;
            u825.Visible = false;
            u161.IsHoldingJoystick = false;
            u161.TouchOffset = u8;
            u161.MobileAimPower = 0;
            if u161.DirArrow then
                u161.DirArrow.Visible = false;
            end;
        end;
    end);
    l__GuiService__6.MenuOpened:Connect(v838);
    l__UserInputService__5.WindowFocusReleased:Connect(v838);
end;
if l__TouchEnabled__35 then
    u853();
end;
l__UserInputService__5.LastInputTypeChanged:Connect(function(p854) --[[ Line: 3910 ]]
    -- upvalues: l__TouchEnabled__35 (ref), u161 (copy), l__Config__11 (copy), u171 (ref)
    if p854 == Enum.UserInputType.Touch then
        l__TouchEnabled__35 = true;
        u161.BaseZoom = l__Config__11.Client.BASE_ZOOM_MOBILE;
    elseif p854 == Enum.UserInputType.Keyboard or p854 == Enum.UserInputType.MouseMovement then
        l__TouchEnabled__35 = false;
        u161.BaseZoom = l__Config__11.Client.BASE_ZOOM_PC;
    end;
    u171();
end);
l__UserInputService__5.InputBegan:Connect(function(p855, p856) --[[ Line: 3921 ]]
    -- upvalues: l__UserInputService__5 (copy), u161 (copy), u213 (ref), u715 (ref), u714 (copy), u122 (copy), u717 (copy), u170 (ref), l__TouchEnabled__35 (ref), u181 (copy), u157 (ref), u158 (ref), u177 (copy)
    if p856 then
    elseif l__UserInputService__5:GetFocusedTextBox() then
    else
        if p855.UserInputType == Enum.UserInputType.Keyboard then
            local v857 = u161.KeyBindActions[p855.KeyCode];
            if type(v857) == "table" then
                for _, v858 in ipairs(v857) do
                    if v858 == "Menu" then
                        u161.RunBoundAction(v858);
                        return;
                    end;
                end;
            end;
        end;
        local v859;
        if u213 == "Spectate" then
            v859 = false;
        else
            if not u715 and u714 then
                u715 = u714:FindFirstChild("Menu");
            end;
            local v860 = u715;
            if v860 then
                v860 = u715.Visible;
            end;
            v859 = not v860;
        end;
        if v859 then
            if p855.UserInputType == Enum.UserInputType.Keyboard then
                local v861 = u161.KeyBindActions[p855.KeyCode];
                if type(v861) == "table" and #v861 > 0 then
                    for _, v862 in ipairs(v861) do
                        u161.RunBoundAction(v862);
                    end;
                else
                    if u717[p855.KeyCode] then
                        u170(u717[p855.KeyCode]);
                    end;
                end;
            else
                if (p855.UserInputType == Enum.UserInputType.MouseButton1 or p855.UserInputType == Enum.UserInputType.Touch and not l__TouchEnabled__35) and u161.ActiveMode ~= nil then
                    local l__ActiveMode__77 = u161.ActiveMode;
                    local v863, v864;
                    if p855 and p855.UserInputType == Enum.UserInputType.Touch then
                        if p855 then
                            v863 = p855.Position.X;
                            v864 = p855.Position.Y;
                        else
                            local v865 = l__UserInputService__5:GetMouseLocation();
                            v863 = v865.X;
                            v864 = v865.Y;
                        end;
                    else
                        local v866 = l__UserInputService__5:GetMouseLocation();
                        v863 = v866.X;
                        v864 = v866.Y;
                    end;
                    local v867 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
                    local v868 = NameVisual.GetRenderZoom();
                    u177:FireServer(l__ActiveMode__77, (v863 - v867.X * 0.5) / v868 - u157, (v864 - v867.Y * 0.5) / v868 - u158);
                end;
            end;
        else
            if p855.UserInputType == Enum.UserInputType.MouseButton1 or p855.UserInputType == Enum.UserInputType.Touch then
                u122.TrySelectAtInput(p855);
            end;
        end;
    end;
end);
l__UserInputService__5.InputEnded:Connect(function(p869) --[[ Line: 3967 ]]
    -- upvalues: u161 (copy), u175 (copy)
    local v870 = u161.KeyBindActions[p869.KeyCode];
    if type(v870) == "table" then
        for _, v871 in ipairs(v870) do
            if v871 == "Feed" and u161.IsHoldingW then
                u161.IsHoldingW = false;
                u175:FireServer("Eject_Stop");
            elseif v871 == "BotFeed" and u161.IsHoldingBotFeed then
                u161.IsHoldingBotFeed = false;
                u175:FireServer("BotEject_Stop");
            end;
        end;
    end;
end);
l__UserInputService__5.InputChanged:Connect(function(p872, p873) --[[ Line: 3983 ]]
    -- upvalues: u161 (copy), l__Config__11 (copy), l__clamp__26 (copy)
    if p873 then
    else
        if p872.UserInputType == Enum.UserInputType.MouseWheel then
            u161.UserZoomOffset = l__clamp__26(u161.UserZoomOffset + p872.Position.Z * l__Config__11.Client.ZOOM_SPEED_MOUSE, -u161.BaseZoom + 5, 1000);
        end;
    end;
end);
task.spawn(function() --[[ Line: 3990 ]]
    -- upvalues: u213 (ref), u715 (ref), u714 (copy), l__TouchEnabled__35 (ref), u161 (copy), u853 (copy), u175 (copy), u8 (copy), u181 (copy), u459 (copy), u71 (copy), u176 (copy), u662 (ref), u661 (ref), u660 (ref), l__UserInputService__5 (copy), u157 (ref), u158 (ref), u119 (ref), u120 (ref), l__LobbyController__18 (copy)
    while true do
        task.wait(NameVisual.INPUT_TARGET_SEND_INTERVAL);
        local v874;
        if u213 == "Spectate" then
            v874 = false;
        else
            if not u715 and u714 then
                u715 = u714:FindFirstChild("Menu");
            end;
            local v875 = u715;
            if v875 then
                v875 = u715.Visible;
            end;
            v874 = not v875;
        end;
        if l__TouchEnabled__35 and not u161.MobileGui then
            u853();
        end;
        if u161.MobileGui then
            local v876;
            if v874 then
                v876 = l__TouchEnabled__35;
            else
                v876 = v874;
            end;
            if u161.MobileGui.Enabled ~= v876 then
                u161.MobileGui.Enabled = v876;
                if not v876 then
                    if u161.IsHoldingBotFeed then
                        u175:FireServer("BotEject_Stop");
                    end;
                    u161.IsHoldingW = false;
                    u161.IsHoldingBotFeed = false;
                    u161.IsHoldingJoystick = false;
                    u161.TouchOffset = u8;
                    u161.MobileAimPower = 0;
                end;
            end;
        end;
        if v874 then
            if (u161.IsHoldingW or u161.IsHoldingBotFeed) and os.clock() - u161.LastWTime >= 0.1 then
                if l__TouchEnabled__35 then
                    if not NameVisual.CachedScreenSize then
                        local _ = u181.AbsoluteSize;
                    end;
                    local v877, v878;
                    if u161.MobileAimPower <= 0.08 then
                        v877, v878 = u459();
                    else
                        local v879, v880, v881 = u459();
                        local l__MobileAimDir__78 = u161.MobileAimDir;
                        local v882 = v881 * 0.15;
                        local v883 = v882 + (v881 * 2.45 - v882) * u161.MobileAimPower;
                        v877 = v879 + l__MobileAimDir__78.X * v883;
                        v878 = v880 + l__MobileAimDir__78.Y * v883;
                    end;
                    if u71.Enabled then
                        local v884 = u161;
                        u161.PredictedTargetX = v877;
                        v884.PredictedTargetY = v878;
                    end;
                    u176:FireServer(v877, v878);
                    u662 = os.clock();
                    u661 = v877;
                    u660 = v878;
                end;
                u161.LastWTime = os.clock();
            end;
            local v885, v886;
            if l__TouchEnabled__35 then
                if not NameVisual.CachedScreenSize then
                    local _ = u181.AbsoluteSize;
                end;
                if u161.MobileAimPower <= 0.08 then
                    v885, v886 = u459();
                else
                    local v887, v888, v889 = u459();
                    local l__MobileAimDir__79 = u161.MobileAimDir;
                    local v890 = v889 * 0.15;
                    local v891 = v890 + (v889 * 2.45 - v890) * u161.MobileAimPower;
                    v885 = v887 + l__MobileAimDir__79.X * v891;
                    v886 = v888 + l__MobileAimDir__79.Y * v891;
                end;
            elseif u161.FixedMouseEnabled then
                if type(u161.FixedMouseWorldX) ~= "number" or type(u161.FixedMouseWorldY) ~= "number" then
                    local v892 = l__UserInputService__5:GetMouseLocation();
                    local l__X__80 = v892.X;
                    local l__Y__81 = v892.Y;
                    local v893 = u161;
                    local v894 = u161;
                    local v895 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
                    local v896 = NameVisual.GetRenderZoom();
                    local v897 = (l__X__80 - v895.X * 0.5) / v896 - u157;
                    local v898 = (l__Y__81 - v895.Y * 0.5) / v896 - u158;
                    v893.FixedMouseWorldX = v897;
                    v894.FixedMouseWorldY = v898;
                    u161.UpdateFixedMouseMarkerPosition();
                end;
                v885 = u161.FixedMouseWorldX;
                v886 = u161.FixedMouseWorldY;
            else
                local v899 = l__UserInputService__5:GetMouseLocation();
                local v900 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
                local v901 = NameVisual.GetRenderZoom();
                v885 = u119 + (v899.X - v900.X / 2) / v901;
                v886 = u120 + (v899.Y - v900.Y / 2) / v901;
            end;
            if u71.Enabled then
                local v902 = u161;
                u161.PredictedTargetX = v885;
                v902.PredictedTargetY = v886;
            end;
            if not l__LobbyController__18.IsMenuActive and u213 ~= "Spectate" then
                local v903 = os.clock();
                if v903 - u662 >= NameVisual.INPUT_TARGET_SEND_INTERVAL and (v885 - u661) ^ 2 + (v886 - u660) ^ 2 >= 0.25 then
                    u176:FireServer(v885, v886);
                    u662 = v903;
                    u661 = v885;
                    u660 = v886;
                end;
            end;
        end;
    end;
end);
u161.PingLabel = l__PlayerGui__9:WaitForChild("MainScreenGui"):WaitForChild("Mass"):WaitForChild("Ping");
if u161.PingLabel:IsA("TextLabel") then
    u161.PingLabel.BackgroundTransparency = 1;
    u161.PingLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
    u161.PingLabel.TextStrokeTransparency = 0.78;
    local l__PingLabel__82 = u161.PingLabel;
    l__PingLabel__82.ZIndex = l__PingLabel__82.ZIndex + 1;
end;
u161.FpsLabel = u161.PingLabel.Parent:FindFirstChild("FPS");
function u161.GetHudCounterSetting(p904, p905) --[[ Line: 4062 ]]
    -- upvalues: l__PlayerGui__9 (copy), u161 (copy)
    local v906 = l__PlayerGui__9:GetAttribute(p904 .. "Override");
    if v906 == nil then
        local l__SettingsProxy__83 = u161.SettingsProxy;
        if l__SettingsProxy__83 then
            l__SettingsProxy__83 = l__SettingsProxy__83:GetAttribute(p904);
        end;
        if l__SettingsProxy__83 == nil or l__SettingsProxy__83 == "" then
            return p905;
        else
            return l__SettingsProxy__83;
        end;
    else
        return v906;
    end;
end;
function u161.ApplyHudCounterVisibility() --[[ Line: 4074 ]]
    -- upvalues: u161 (copy)
    if u161.FpsLabel and u161.FpsLabel:IsA("GuiObject") then
        u161.FpsLabel.Visible = u161.GetHudCounterSetting("FpsCounterEnabled", false) == true;
    end;
    if u161.PingLabel and u161.PingLabel:IsA("GuiObject") then
        u161.PingLabel.Visible = u161.GetHudCounterSetting("PingCounterEnabled", true) ~= false;
    end;
end;
u161.ApplyHudCounterVisibility();
l__PlayerGui__9:GetAttributeChangedSignal("FpsCounterEnabledOverride"):Connect(u161.ApplyHudCounterVisibility);
l__PlayerGui__9:GetAttributeChangedSignal("PingCounterEnabledOverride"):Connect(u161.ApplyHudCounterVisibility);
task.spawn(function() --[[ Line: 4085 ]]
    -- upvalues: u161 (copy), l__ClientPlayerState__16 (copy), u1 (copy)
    u161.SettingsProxy = u161.SettingsProxy or l__ClientPlayerState__16.WaitForProxy("Settings", u1, 10);
    u161.ApplyHudCounterVisibility();
    if u161.SettingsProxy then
        u161.SettingsProxy:GetAttributeChangedSignal("FpsCounterEnabled"):Connect(u161.ApplyHudCounterVisibility);
        u161.SettingsProxy:GetAttributeChangedSignal("PingCounterEnabled"):Connect(u161.ApplyHudCounterVisibility);
    end;
end);
u161.SmoothPing = 0;
local v907 = NameVisual;
local v908 = NameVisual;
v907.FpsFrames = 0;
v908.FpsElapsed = 0;
NameVisual.LastSizeStr = 0;
NameVisual.FrameCount = 0;
NameVisual.StaticScanAccumulator = 0;
NameVisual.SpectateUpdateAccumulator = 0;
NameVisual.WorldEventUiAccumulator = 0;
local v909 = NameVisual;
local v910 = NameVisual;
local v911 = NameVisual;
local v912 = NameVisual;
v909.LastStaticMinCX = nil;
v910.LastStaticMaxCX = nil;
v911.LastStaticMinCY = nil;
v912.LastStaticMaxCY = nil;
NameVisual.SLOT_COUNT = 10;
NameVisual.PLAYER_TEXT_RADIUS = 15;
NameVisual.PLAYER_SLOT_LOD_RADIUS = 10;
NameVisual.PLAYER_NAME_MAX_TEXT_SIZE = 10000;
NameVisual.PLAYER_MASS_MAX_TEXT_SIZE = 10000;
NameVisual.PLAYER_TEXT_MIN_TEXT_SIZE = 1;
NameVisual.PLAYER_TEXT_MAX_INVERSE_ZOOM_SCALE = 24;
NameVisual.FOOD_MIN_PIXEL_SIZE = 1;
NameVisual.STATIC_BLOB_MIN_PIXEL_SIZE = 4;
function GetPingTextColor(p913)
    if p913 >= 200 then
        return Color3.fromRGB(255, 95, 80);
    elseif p913 >= 100 then
        return Color3.fromRGB(255, 225, 80);
    else
        return Color3.new(1, 1, 1);
    end;
end;
function CollectSlotRefs(p914)
    local v915 = {};
    if not p914 then
        return v915;
    end;
    for v916 = 1, NameVisual.SLOT_COUNT do
        v915[v916] = p914:FindFirstChild("Slot" .. v916);
    end;
    return v915;
end;
function ClearSlotRefs(p917)
    if p917 then
        for v918 = 1, NameVisual.SLOT_COUNT do
            local v919 = p917[v918];
            if v919 then
                v919:Destroy();
                p917[v918] = nil;
            end;
        end;
    end;
end;
function EnsureSlotImage(p920, p921, p922, p923, p924, p925)
    local v926 = p921[p922];
    if not v926 then
        v926 = Instance.new("ImageLabel");
        v926.Name = "Slot" .. p922;
        v926.Size = UDim2.new(1, 0, 1, 0);
        v926.BackgroundTransparency = 1;
        v926.ScaleType = p923;
        v926.ZIndex = p922;
        v926.Parent = p920;
        p921[p922] = v926;
    end;
    local v927 = v926:FindFirstChild("RoundCorner");
    if p924 and p925.NeedsRounding then
        if not v927 then
            local v928 = Instance.new("UICorner");
            v928.Name = "RoundCorner";
            v928.CornerRadius = UDim.new(1, 0);
            v928.Parent = v926;
            return v926;
        end;
    elseif v927 then
        v927:Destroy();
    end;
    return v926;
end;
function ApplySlotGroup(p929, p930, p931, p932, p933, p934)
    if p930 and p932 then
        for v935 = 1, NameVisual.SLOT_COUNT do
            local v936;
            if p931 then
                v936 = p931[v935];
            else
                v936 = p931;
            end;
            local v937;
            if v936 then
                v937 = v936.IsAnimated or v936.Image ~= "";
            else
                v937 = v936;
            end;
            local v938 = p932[v935];
            if v937 then
                local v939 = EnsureSlotImage(p930, p932, v935, p933, p934, v936);
                if v936.IsAnimated and v936.Data then
                    p929.AnimatedVisualCount = p929.AnimatedVisualCount + 1;
                    local l__AnimatedVisualCount__84 = p929.AnimatedVisualCount;
                    p929.AnimatedVisualFrames[l__AnimatedVisualCount__84] = v939;
                    p929.AnimatedVisualData[l__AnimatedVisualCount__84] = v936.Data;
                else
                    if v939.Rotation ~= 0 then
                        v939.Rotation = 0;
                    end;
                    if v939.Image ~= v936.Image then
                        v939.Image = v936.Image;
                    end;
                end;
            elseif v938 then
                v938:Destroy();
                p932[v935] = nil;
            end;
        end;
    end;
end;
function ClearPlayerVisualSlots(p940)
    ClearSlotRefs(p940.SkinSlots);
    ClearSlotRefs(p940.HatSlots);
    ClearSlotRefs(p940.EffectSlots);
    p940.AnimatedVisualCount = 0;
end;
function GetPlayerVisualColor(p941, p942)
    if p941.IsBot and (type(p941.BotColor) == "string" and p941.BotColor ~= "") then
        if p941.BotColor3 == nil or p941.LastBotColorHex ~= p941.BotColor then
            local v943, v944 = pcall(Color3.fromHex, p941.BotColor);
            if v943 then
                p941.BotColor3 = v944;
                p941.LastBotColorHex = p941.BotColor;
            end;
        end;
        if p941.BotColor3 then
            return p941.BotColor3;
        end;
    end;
    if type(p941.TeamColor) == "string" and p941.TeamColor ~= "" then
        if p941.TeamColor3 == nil or p941.LastTeamColorHex ~= p941.TeamColor then
            local v945, v946 = pcall(Color3.fromHex, p941.TeamColor);
            if v945 then
                p941.TeamColor3 = v946;
                p941.LastTeamColorHex = p941.TeamColor;
            end;
        end;
        if p941.TeamColor3 then
            return p941.TeamColor3;
        end;
    end;
    if p941.IsMultiAccount and (type(p941.AccountColor) == "string" and p941.AccountColor ~= "") then
        if p941.AccountColor3 == nil or p941.LastAccountColorHex ~= p941.AccountColor then
            local v947, v948 = pcall(Color3.fromHex, p941.AccountColor);
            if v947 then
                p941.AccountColor3 = v948;
                p941.LastAccountColorHex = p941.AccountColor;
            end;
        end;
        if p941.AccountColor3 then
            return p941.AccountColor3;
        end;
    end;
    return p942.Color;
end;
function ApplyPlayerVisuals(p949, p950)
    -- upvalues: u6 (copy), l__GameDatabase__15 (copy)
    if p949.Frame and (p949.VisualUid or (p949.PlayerUid or "")) ~= p949.Frame:GetAttribute("OwnerUid") then
        p949.LastVisualVersion = -1;
    else
        if p949.IsBot and p949.LastBotFreezeEffect ~= (p949.BotFreezeEffect == true) then
            p949.LastVisualVersion = -1;
        end;
        if p949.LastVisualVersion == p950.Version then
        else
            p949.VisualCacheMissing = false;
            local v951 = GetPlayerVisualColor(p949, p950);
            if p949.LastColor ~= v951 then
                p949.Frame.ImageColor3 = v951;
                p949.LastColor = v951;
            end;
            local v952 = p950.Name or "";
            if p949.IsBot and v952 ~= "" then
                v952 = v952 .. " Bot";
            end;
            local v953 = NameVisual.BuildPlayerNameText(v952, p950.Title, p950.NameColor, p950.TitleColor, p950.NameColorMode, p950.NameGradient);
            if p949.NameLabel then
                local v954 = p950.NameColor or u6;
                if p949.NameLabel.TextColor3 ~= v954 then
                    p949.NameLabel.TextColor3 = v954;
                end;
                if p949.LastName ~= v953 then
                    p949.NameLabel.Text = v953;
                    p949.LastName = v953;
                end;
            end;
            p949.AnimatedVisualCount = 0;
            if p949.IsBot then
                ClearSlotRefs(p949.SkinSlots);
                ClearSlotRefs(p949.HatSlots);
                local v955;
                if p949.BotFreezeEffect then
                    local v956;
                    if l__GameDatabase__15.Items then
                        v956 = l__GameDatabase__15.Items.Freeze_Effect or (l__GameDatabase__15.Items.FreezeFood or nil);
                    else
                        v956 = nil;
                    end;
                    v955 = {};
                    local v957 = {
                        ItemId = "BotFreezeEffect",
                        Image = v956 and (v956.ImageId or "rbxassetid://120014132919241") or "rbxassetid://120014132919241",
                        IsAnimated = v956 and v956.TypeSkin == "Animated" and true or false
                    };
                    local v958;
                    if v956 then
                        v958 = v956.NeedsRounding or false;
                    else
                        v958 = false;
                    end;
                    v957.NeedsRounding = v958;
                    v957.Data = v956;
                    v955[1] = v957;
                else
                    v955 = nil;
                end;
                ApplySlotGroup(p949, p949.EffectsContainer, v955, p949.EffectSlots, Enum.ScaleType.Fit, false);
                p949.LastBotFreezeEffect = p949.BotFreezeEffect == true;
                p949.LastVisualVersion = p950.Version;
            else
                ApplySlotGroup(p949, p949.SkinsContainer, p950.Skins, p949.SkinSlots, Enum.ScaleType.Crop, true);
                ApplySlotGroup(p949, p949.HatsContainer, p950.Hats, p949.HatSlots, Enum.ScaleType.Fit, false);
                ApplySlotGroup(p949, p949.EffectsContainer, p950.Effects, p949.EffectSlots, Enum.ScaleType.Fit, false);
                p949.LastVisualVersion = p950.Version;
            end;
        end;
    end;
end;
function ApplyPlayerBaseVisuals(p959, p960)
    -- upvalues: u6 (copy)
    local v961 = GetPlayerVisualColor(p959, p960);
    if p959.LastColor ~= v961 then
        p959.Frame.ImageColor3 = v961;
        p959.LastColor = v961;
    end;
    local v962 = p960.Version or 0;
    local v963 = p959.IsBot == true;
    if p959.LastBaseNameVersion ~= v962 or (p959.LastBaseNameBot ~= v963 or p959.LastName == nil) then
        local v964 = p960.Name or "";
        if v963 and v964 ~= "" then
            v964 = v964 .. " Bot";
        end;
        local v965 = NameVisual.BuildPlayerNameText(v964, p960.Title, p960.NameColor, p960.TitleColor, p960.NameColorMode, p960.NameGradient);
        if p959.NameLabel then
            local v966 = p960.NameColor or u6;
            if p959.NameLabel.TextColor3 ~= v966 then
                p959.NameLabel.TextColor3 = v966;
            end;
            if p959.LastName ~= v965 then
                p959.NameLabel.Text = v965;
                p959.LastName = v965;
            end;
        end;
        p959.LastBaseNameVersion = v962;
        p959.LastBaseNameBot = v963;
    end;
end;
function ApplyMissingPlayerVisuals(p967)
    -- upvalues: u7 (copy)
    if p967.VisualCacheMissing then
    else
        ClearPlayerVisualSlots(p967);
        if p967.Frame then
            p967.Frame.ImageColor3 = u7;
            p967.LastColor = u7;
        end;
        p967.LastVisualVersion = -1;
        p967.VisualCacheMissing = true;
        if p967.NameLabel and p967.LastName ~= "" then
            p967.NameLabel.Text = "Loading...";
            p967.LastName = "";
        end;
    end;
end;
function AnimatePlayerVisuals(p968, p969)
    local v970 = p968.AnimatedVisualCount or 0;
    if v970 <= 0 then
    else
        local l__AnimatedVisualFrames__85 = p968.AnimatedVisualFrames;
        local l__AnimatedVisualData__86 = p968.AnimatedVisualData;
        for v971 = 1, v970 do
            l__AnimatedVisualData__86[v971].Animate(l__AnimatedVisualFrames__85[v971], p969);
        end;
    end;
end;
function ApplyPlayerProfileClickAttributes(p972)
    -- upvalues: u123 (copy), l__Players__1 (copy)
    local v973;
    if p972 then
        v973 = p972.Frame;
    else
        v973 = p972;
    end;
    if v973 and p972.Type == "PlayerBlob" then
        local v974 = tonumber(p972.OwnerUid or p972.PlayerUid);
        if v974 and tostring(v974) ~= u123 then
            local v975 = l__Players__1:GetPlayerByUserId(v974);
            v973:SetAttribute("AgaricProfileUserId", v974);
            local v976 = "AgaricProfileName";
            local v977;
            if v975 then
                v977 = v975.Name or nil;
            else
                v977 = nil;
            end;
            v973:SetAttribute(v976, v977);
            v973:SetAttribute("AgaricProfileDisplayName", v975 and v975.DisplayName or nil);
        else
            v973:SetAttribute("AgaricProfileUserId", nil);
            v973:SetAttribute("AgaricProfileName", nil);
            v973:SetAttribute("AgaricProfileDisplayName", nil);
        end;
    end;
end;
function ShowEntityUI(p978, p979, p980, p981)
    -- upvalues: u496 (copy), l__fromOffset__31 (copy), l__floor__27 (copy), l__clamp__26 (copy), u113 (copy), l__new__32 (copy), u7 (copy), u64 (copy), u63 (copy)
    if p978.HasUI then
        return true;
    end;
    if p978.IsStatic and NameVisual.uiCreatesThisFrame >= 64 then
        return false;
    end;
    local v982 = NameVisual;
    v982.uiCreatesThisFrame = v982.uiCreatesThisFrame + 1;
    p978.Frame = u496(p978.Type);
    p978.Frame.Position = l__fromOffset__31(p979, p980);
    p978.Frame.Size = l__fromOffset__31(p981, p981);
    p978.LastUIX = p979;
    p978.LastUIY = p980;
    p978.LastUISize = p981;
    if p978.Type == "Food" or (p978.Type == "NegativeFood" or (p978.Type == "Gold" or p978.Type == "StaticBlob")) then
        p978.Frame.ZIndex = 1;
        if p978.StaticColor then
            p978.Frame.ImageColor3 = p978.StaticColor;
        end;
    elseif p978.Type == "EjectedMass" then
        local v983 = l__clamp__26(l__floor__27(p978.RenderRadius / 5) * 5, 1, 10000);
        p978.Frame.ZIndex = v983;
        local v984 = u113(p978);
        p978.Frame.ImageColor3 = v984;
        p978.LastColor = v984;
    elseif p978.Type == "GoldenBlock" then
        p978.Frame.ZIndex = 3;
    elseif p978.Type == "GoldenCrate" then
        p978.Frame.ZIndex = 4;
    elseif p978.Type == "KingHill" then
        p978.Frame.ZIndex = 12000;
    else
        local v985 = l__clamp__26(l__floor__27(p978.RenderRadius / 5) * 5, 1, 10000);
        p978.Frame.ZIndex = v985;
    end;
    if p978.Type == "PlayerBlob" then
        p978.NameLabel = p978.Frame:FindFirstChild("NameLabel");
        p978.MassLabel = p978.Frame:FindFirstChild("MassLabel");
        if p978.NameLabel then
            p978.NameLabel.AnchorPoint = l__new__32(0.5, 0.5);
            p978.NameLabel.Size = UDim2.new(0.82, 0, 0.26, 0);
            p978.NameLabel.Position = UDim2.new(0.5, 0, 0.38, 0);
            p978.NameLabel.TextScaled = true;
            p978.NameLabel.Visible = true;
            NameVisual.DestroyTextCameraScale(p978.NameLabel);
        end;
        if p978.MassLabel then
            p978.MassLabel.AnchorPoint = l__new__32(0.5, 0.5);
            p978.MassLabel.Size = UDim2.new(0.55, 0, 0.18, 0);
            p978.MassLabel.Position = UDim2.new(0.5, 0, 0.62, 0);
            p978.MassLabel.TextScaled = true;
            p978.MassLabel.Visible = true;
            NameVisual.DestroyTextCameraScale(p978.MassLabel);
        end;
        p978.NameTextLimit = NameVisual.GetTextSizeLimit(p978.NameLabel);
        p978.MassTextLimit = NameVisual.GetTextSizeLimit(p978.MassLabel);
        p978.LastNameMinTextSize = nil;
        p978.LastNameMaxTextSize = nil;
        p978.LastMassMinTextSize = nil;
        p978.LastMassMaxTextSize = nil;
        ApplyPlayerNameTextZoom(p978);
        p978.SkinsContainer = p978.Frame:FindFirstChild("SkinsContainer");
        p978.HatsContainer = p978.Frame:FindFirstChild("HatsContainer");
        p978.EffectsContainer = p978.Frame:FindFirstChild("EffectsContainer");
        p978.SkinSlots = CollectSlotRefs(p978.SkinsContainer);
        p978.HatSlots = CollectSlotRefs(p978.HatsContainer);
        p978.EffectSlots = CollectSlotRefs(p978.EffectsContainer);
        ClearPlayerVisualSlots(p978);
        p978.Frame:SetAttribute("OwnerUid", p978.VisualUid or (p978.PlayerUid or ""));
        ApplyPlayerProfileClickAttributes(p978);
        p978.Frame.ImageColor3 = u7;
        p978.LastColor = u7;
        p978.LastName = nil;
        p978.LastMass = nil;
        p978.LastZIdx = nil;
        p978.LastSlotVisualsVisible = nil;
        if p978.NameLabel then
            p978.NameLabel.Text = "";
        end;
        if p978.MassLabel then
            p978.MassLabel.Text = "";
        end;
        p978.AnimatedVisualFrames = p978.AnimatedVisualFrames or {};
        p978.AnimatedVisualData = p978.AnimatedVisualData or {};
        p978.AnimatedVisualCount = 0;
        p978.LastVisualVersion = -1;
        p978.VisualCacheMissing = false;
    elseif p978.Type == "Gold" then
        p978.Frame.ValueLabel.Text = tostring(p978.Value or 50);
    elseif p978.Type == "GoldenCrate" then
        local v986 = p978.Frame:FindFirstChild("ValueLabel");
        if v986 then
            v986.Text = GoldenCrateFormatCoins(p978.Value);
        end;
    else
        local v987 = p978.Type == "KingHill" and p978.Frame:FindFirstChild("ValueLabel");
        if v987 then
            v987.ZIndex = 12001;
            v987.Text = "KING\n" .. GoldenCrateFormatCoins(p978.Value);
        end;
    end;
    p978.Frame.Visible = true;
    p978.HasUI = true;
    p978.LastZoomVersion = NameVisual.RenderZoomVersion;
    if p978.IsStatic then
        u64[p978.ID] = p978;
    else
        u63[p978.ID] = p978;
    end;
    return true;
end;
function ClientFreezeCountEntries(p988)
    local v989 = 0;
    if type(p988) ~= "table" then
        return 0;
    end;
    for _ in pairs(p988) do
        v989 = v989 + 1;
    end;
    return v989;
end;
ClientFrameProfiler = ClientFrameProfiler or {
    LastWarnAt = 0
};
task.spawn(function() --[[ Line: 4505 ]]
    -- upvalues: u1 (copy), l__exp__24 (copy), u161 (copy), l__round__23 (copy)
    while true do
        local v990;
        repeat
            local v991 = task.wait(1);
            local v992 = u1:GetNetworkPing() * 1000;
            local v993 = 1 - l__exp__24(-5 * v991);
            u161.SmoothPing = u161.SmoothPing + (v992 - u161.SmoothPing) * v993;
            v990 = l__round__23(u161.SmoothPing);
            u161.PingLabel.Text = "Ping: " .. v990 .. "ms";
        until u161.PingLabel:IsA("TextLabel");
        u161.PingLabel.TextColor3 = GetPingTextColor(v990);
    end;
end);
l__RunService__3.RenderStepped:Connect(function(p994) --[[ Line: 4519 ]]
    -- upvalues: u161 (copy), l__round__23 (copy), l__exp__24 (copy), u118 (ref), l__sqrt__25 (copy), l__max__28 (copy), l__Config__11 (copy), l__clamp__26 (copy), u211 (ref), u210 (ref), l__abs__22 (copy), u184 (copy), u201 (copy), u60 (ref), l__fromOffset__31 (copy), u205 (copy), u217 (copy), u214 (copy), u71 (copy), u61 (copy), u62 (copy), u63 (copy), u64 (copy), u181 (copy), u122 (copy), u469 (copy), u119 (ref), u120 (ref), l__CLIENT_GRID_SIZE__34 (copy), l__floor__27 (copy), u123 (copy), u66 (copy), u213 (ref), u121 (ref), u542 (copy), l__ClientPrediction__17 (copy), u100 (copy), u113 (copy), u70 (ref), u77 (copy), u69 (ref), u67 (copy), l__GRID_PRIME__33 (copy), u68 (copy), u505 (copy), u114 (ref), u115 (ref), u116 (ref), u117 (ref), u157 (ref), u158 (ref), u159 (ref), u160 (ref), u185 (copy), u192 (copy), u188 (copy), l__UserInputService__5 (copy), u207 (ref), u209 (ref), u208 (ref)
    local v995 = NameVisual;
    v995.FrameCount = v995.FrameCount + 1;
    local v996 = NameVisual;
    v996.FpsFrames = v996.FpsFrames + 1;
    local v997 = NameVisual;
    v997.FpsElapsed = v997.FpsElapsed + p994;
    if NameVisual.FpsElapsed >= 0.5 then
        if u161.FpsLabel and u161.FpsLabel.Visible then
            u161.FpsLabel.Text = "FPS: " .. l__round__23(NameVisual.FpsFrames / NameVisual.FpsElapsed);
        end;
        local v998 = NameVisual;
        local v999 = NameVisual;
        v998.FpsFrames = 0;
        v999.FpsElapsed = 0;
    end;
    NameVisual.uiCreatesThisFrame = 0;
    local v1000 = 1 - l__exp__24(-10 * p994);
    local v1001 = 15 + l__max__28(0, l__sqrt__25(u118) - 15) * l__Config__11.Client.ZOOM_OUT_POWER;
    u211 = u211 + (l__clamp__26((u161.BaseZoom + u161.UserZoomOffset) / v1001, l__Config__11.Client.MIN_ZOOM_LIMIT, l__Config__11.Client.MAX_ZOOM_LIMIT) - u211) * v1000;
    local v1002 = l__round__23(u211 * 1000) / 1000;
    local v1003;
    if l__abs__22(u210 - v1002) >= 0.001 then
        u210 = v1002;
        u184:SetAttribute("RenderZoom", v1002);
        local v1004 = NameVisual;
        v1004.RenderZoomVersion = v1004.RenderZoomVersion + 1;
        v1003 = true;
    else
        v1003 = false;
    end;
    local u1005 = NameVisual.GetRenderZoom();
    if u201.Visible and (NameVisual.LastSizeStr ~= u60 or NameVisual.LastBackgroundZoom ~= u1005) then
        local v1006 = NameVisual.WorldToCanvasSize(u60, u1005);
        local v1007 = NameVisual.WorldToCanvasSize(l__Config__11.Client.TILE_SIZE, u1005);
        u201.Size = l__fromOffset__31(v1006, v1006);
        u201.TileSize = l__fromOffset__31(v1007, v1007);
        NameVisual.LastSizeStr = u60;
        NameVisual.LastBackgroundZoom = u1005;
    end;
    if u205.Visible and (u217.FogRadius and u217.FogRadius > 0) then
        local v1008 = l__round__23(u217.FogRadius);
        local v1009 = v1008 * 2;
        local v1010 = l__round__23(u60);
        local v1011 = l__max__28(0, v1010 / 2 - v1008);
        local v1012 = l__max__28(0, NameVisual.WorldToCanvasOffset(v1009, u1005));
        local v1013 = l__max__28(0, NameVisual.WorldToCanvasOffset(v1010, u1005));
        local v1014 = l__max__28(0, NameVisual.WorldToCanvasOffset(v1011, u1005));
        local v1015 = NameVisual.WorldToCanvasOffset(v1008, u1005);
        u205.Size = l__fromOffset__31(v1012, v1012);
        u205.Position = l__fromOffset__31(0, 0);
        u214.Top.Size = l__fromOffset__31(v1013, v1014);
        u214.Top.Position = l__fromOffset__31(0, -v1015 - l__round__23(v1014 / 2));
        u214.Bottom.Size = l__fromOffset__31(v1013, v1014);
        u214.Bottom.Position = l__fromOffset__31(0, v1015 + l__round__23(v1014 / 2));
        u214.Left.Size = l__fromOffset__31(v1014, v1012);
        u214.Left.Position = l__fromOffset__31(-v1015 - l__round__23(v1014 / 2), 0);
        u214.Right.Size = l__fromOffset__31(v1014, v1012);
        u214.Right.Position = l__fromOffset__31(v1015 + l__round__23(v1014 / 2), 0);
    end;
    local l__FrameCount__87 = NameVisual.FrameCount;
    local u1016 = 1 - l__exp__24(-NameVisual.PLAYER_RENDER_LERP_SPEED * p994);
    local u1017 = 1 - l__exp__24(-NameVisual.ENTITY_RENDER_LERP_SPEED * p994);
    local u1018 = 1 - l__exp__24(-NameVisual.SIZE_RENDER_LERP_SPEED * p994);
    local u1019 = os.clock();
    local l__Enabled__88 = u71.Enabled;
    if p994 >= 0.25 and u1019 - (ClientFrameProfiler.LastWarnAt or 0) >= 3 then
        ClientFrameProfiler.LastWarnAt = u1019;
        warn(string.format("[AgaricClient] Frame freeze %.0fms; entities=%d dynamic=%d visible=%d staticVisible=%d uiCreates=%d", p994 * 1000, ClientFreezeCountEntries(u61), ClientFreezeCountEntries(u62), ClientFreezeCountEntries(u63), ClientFreezeCountEntries(u64), NameVisual.uiCreatesThisFrame or 0));
    end;
    local l__AbsoluteSize__89 = u181.AbsoluteSize;
    NameVisual.CachedScreenSize = l__AbsoluteSize__89;
    WorldEventUpdateWeather(p994, l__AbsoluteSize__89);
    local v1020 = NameVisual;
    v1020.WorldEventUiAccumulator = v1020.WorldEventUiAccumulator + p994;
    if NameVisual.WorldEventUiAccumulator >= (NameVisual.WORLD_EVENT_UI_UPDATE_INTERVAL or 0.2) then
        NameVisual.WorldEventUiAccumulator = 0;
        GoldenCrateUpdate();
        KingHillUpdate();
        LeaderBountyUpdate();
    end;
    local v1021 = NameVisual;
    v1021.SpectateUpdateAccumulator = v1021.SpectateUpdateAccumulator + p994;
    if NameVisual.SpectateUpdateAccumulator >= NameVisual.SPECTATE_UI_UPDATE_INTERVAL then
        NameVisual.SpectateUpdateAccumulator = 0;
        u122.Update(u1019);
    end;
    u469(l__AbsoluteSize__89);
    local v1022 = l__AbsoluteSize__89.X / u1005 / 2 + 160;
    local v1023 = l__AbsoluteSize__89.Y / u1005 / 2 + 160;
    local u1024 = u119 - v1022;
    local u1025 = u119 + v1022;
    local u1026 = u120 - v1023;
    local u1027 = u120 + v1023;
    local v1028 = l__floor__27(u1024 / l__CLIENT_GRID_SIZE__34) - 1;
    local v1029 = l__floor__27(u1025 / l__CLIENT_GRID_SIZE__34) + 1;
    local v1030 = l__floor__27(u1026 / l__CLIENT_GRID_SIZE__34) - 1;
    local v1031 = l__floor__27(u1027 / l__CLIENT_GRID_SIZE__34) + 1;
    local v1032 = 0;
    local v1033 = 0;
    local v1034 = 0;
    local v1035 = 0;
    local v1036 = u123;
    local v1037 = v1036 and tostring(v1036) or nil;
    if v1037 then
        v1037 = u66[v1037];
    end;
    local v1038;
    if type(v1037) == "table" then
        v1038 = next(v1037) ~= nil;
    else
        v1038 = false;
    end;
    local v1039;
    if u213 == "Spectate" then
        v1039 = not v1038;
    else
        v1039 = false;
    end;
    local v1040 = v1039 and (u121 or u123) or u123;
    local v1041 = u66[v1040];
    local v1042;
    if v1040 == u123 then
        v1042 = u161.ControlledAccountId;
    else
        v1042 = nil;
    end;
    local v1043;
    if v1042 or (v1040 ~= u123 or not u161.ControlledBlobId) then
        v1043 = nil;
    else
        v1043 = u61[u161.ControlledBlobId];
    end;
    if v1043 and v1043.Type == "PlayerBlob" then
        local l__RenderX__90 = v1043.RenderX;
        local l__RenderY__91 = v1043.RenderY;
        local l__RenderRadius__92 = v1043.RenderRadius;
        if v1043.NeedsRender or l__Enabled__88 and u542(v1043, u1019) then
            local v1044, v1045, v1046;
            if u71.Enabled then
                v1044, v1045, v1046 = l__ClientPrediction__17.GetRenderTarget(v1043, u1019, u161, u123, l__Config__11.Gameplay, u71);
            else
                v1044 = v1043.ServerX;
                v1045 = v1043.ServerY;
                v1046 = v1043.Radius;
            end;
            local v1047 = v1044 - l__RenderX__90;
            local v1048 = v1045 - l__RenderY__91;
            local v1049 = v1046 - l__RenderRadius__92;
            if l__abs__22(v1047) < 0.1 and (l__abs__22(v1048) < 0.1 and l__abs__22(v1049) < 0.1) then
                v1043.RenderX = v1044;
                v1043.RenderY = v1045;
                v1043.RenderRadius = v1046;
                local v1050;
                if l__Enabled__88 then
                    v1050 = u542(v1043, u1019) or false;
                else
                    v1050 = false;
                end;
                v1043.NeedsRender = v1050;
            else
                v1043.RenderX = l__RenderX__90 + v1047 * u1016;
                v1043.RenderY = l__RenderY__91 + v1048 * u1016;
                v1043.RenderRadius = l__RenderRadius__92 + v1049 * u1018;
            end;
            l__RenderX__90 = v1043.RenderX;
            l__RenderY__91 = v1043.RenderY;
            l__RenderRadius__92 = v1043.RenderRadius;
        end;
        v1043.LastInterpFrame = l__FrameCount__87;
        v1032 = v1032 + l__RenderX__90;
        v1033 = v1033 + l__RenderY__91;
        v1034 = v1034 + l__RenderRadius__92 * l__RenderRadius__92;
        v1035 = 1;
    elseif v1041 then
        for _, v1051 in pairs(v1041) do
            if not v1042 or tostring(v1051.PlayerUid) == v1042 then
                local l__RenderX__93 = v1051.RenderX;
                local l__RenderY__94 = v1051.RenderY;
                local l__RenderRadius__95 = v1051.RenderRadius;
                if v1051.NeedsRender or l__Enabled__88 and u542(v1051, u1019) then
                    local v1052, v1053, v1054;
                    if u71.Enabled then
                        v1052, v1053, v1054 = l__ClientPrediction__17.GetRenderTarget(v1051, u1019, u161, u123, l__Config__11.Gameplay, u71);
                    else
                        v1052 = v1051.ServerX;
                        v1053 = v1051.ServerY;
                        v1054 = v1051.Radius;
                    end;
                    local v1055 = v1052 - l__RenderX__93;
                    local v1056 = v1053 - l__RenderY__94;
                    local v1057 = v1054 - l__RenderRadius__95;
                    if l__abs__22(v1055) < 0.1 and (l__abs__22(v1056) < 0.1 and l__abs__22(v1057) < 0.1) then
                        v1051.RenderX = v1052;
                        v1051.RenderY = v1053;
                        v1051.RenderRadius = v1054;
                        local v1058;
                        if l__Enabled__88 then
                            v1058 = u542(v1051, u1019) or false;
                        else
                            v1058 = false;
                        end;
                        v1051.NeedsRender = v1058;
                    else
                        v1051.RenderX = l__RenderX__93 + v1055 * u1016;
                        v1051.RenderY = l__RenderY__94 + v1056 * u1016;
                        v1051.RenderRadius = l__RenderRadius__95 + v1057 * u1018;
                    end;
                    l__RenderX__93 = v1051.RenderX;
                    l__RenderY__94 = v1051.RenderY;
                    l__RenderRadius__95 = v1051.RenderRadius;
                end;
                v1051.LastInterpFrame = l__FrameCount__87;
                v1032 = v1032 + l__RenderX__93;
                v1033 = v1033 + l__RenderY__94;
                v1034 = v1034 + l__RenderRadius__95 * l__RenderRadius__95;
                v1035 = v1035 + 1;
            end;
        end;
    end;
    local v1059 = NameVisual;
    v1059.StaticScanAccumulator = v1059.StaticScanAccumulator + p994;
    local v1060 = (v1028 ~= NameVisual.LastStaticMinCX or (v1029 ~= NameVisual.LastStaticMaxCX or v1030 ~= NameVisual.LastStaticMinCY)) and true or v1031 ~= NameVisual.LastStaticMaxCY or (v1003 or NameVisual.StaticScanAccumulator >= 0.14);
    if v1060 then
        NameVisual.StaticScanAccumulator = 0;
        local v1061 = NameVisual;
        local v1062 = NameVisual;
        local v1063 = NameVisual;
        local v1064 = NameVisual;
        v1061.LastStaticMinCX = v1028;
        v1062.LastStaticMaxCX = v1029;
        v1063.LastStaticMinCY = v1030;
        v1064.LastStaticMaxCY = v1031;
    end;
    local function v1089(p1065) --[[ Line: 4695 ]]
        -- upvalues: l__Enabled__88 (copy), u542 (ref), u1019 (copy), l__FrameCount__87 (copy), u71 (ref), l__ClientPrediction__17 (ref), u161 (ref), u123 (ref), l__Config__11 (ref), l__abs__22 (ref), u1016 (copy), u1017 (copy), u1018 (copy), u1024 (copy), u1025 (copy), u1026 (copy), u1027 (copy), u1005 (copy), l__fromOffset__31 (ref), l__floor__27 (ref), l__clamp__26 (ref), u100 (ref), u113 (ref)
        local l__RenderX__96 = p1065.RenderX;
        local l__RenderY__97 = p1065.RenderY;
        local l__RenderRadius__98 = p1065.RenderRadius;
        if not p1065.IsStatic and (p1065.NeedsRender or l__Enabled__88 and u542(p1065, u1019)) and p1065.LastInterpFrame ~= l__FrameCount__87 then
            local v1066 = u1019;
            local v1067, v1068, v1069;
            if u71.Enabled then
                v1067, v1068, v1069 = l__ClientPrediction__17.GetRenderTarget(p1065, v1066, u161, u123, l__Config__11.Gameplay, u71);
            else
                v1067 = p1065.ServerX;
                v1068 = p1065.ServerY;
                v1069 = p1065.Radius;
            end;
            local v1070 = v1067 - l__RenderX__96;
            local v1071 = v1068 - l__RenderY__97;
            local v1072 = v1069 - l__RenderRadius__98;
            if l__abs__22(v1070) < 0.1 and (l__abs__22(v1071) < 0.1 and l__abs__22(v1072) < 0.1) then
                p1065.RenderX = v1067;
                p1065.RenderY = v1068;
                p1065.RenderRadius = v1069;
                local v1073;
                if l__Enabled__88 then
                    v1073 = u542(p1065, u1019) or false;
                else
                    v1073 = false;
                end;
                p1065.NeedsRender = v1073;
            else
                local v1074;
                if p1065.Type == "PlayerBlob" then
                    v1074 = u1016;
                else
                    v1074 = u1017;
                end;
                p1065.RenderX = l__RenderX__96 + v1070 * v1074;
                p1065.RenderY = l__RenderY__97 + v1071 * v1074;
                p1065.RenderRadius = l__RenderRadius__98 + v1072 * u1018;
            end;
            l__RenderX__96 = p1065.RenderX;
            l__RenderY__97 = p1065.RenderY;
            l__RenderRadius__98 = p1065.RenderRadius;
        end;
        local v1075;
        if u1024 < l__RenderX__96 + l__RenderRadius__98 and (l__RenderX__96 - l__RenderRadius__98 < u1025 and u1026 < l__RenderY__97 + l__RenderRadius__98) then
            v1075 = l__RenderY__97 - l__RenderRadius__98 < u1027;
        else
            v1075 = false;
        end;
        if v1075 then
            if p1065.IsStatic then
                local v1076 = l__RenderRadius__98 * 2 * u1005;
                if p1065.Type == "Food" then
                    if v1076 < NameVisual.FOOD_MIN_PIXEL_SIZE then
                        return;
                    end;
                elseif p1065.Type == "StaticBlob" and v1076 < NameVisual.STATIC_BLOB_MIN_PIXEL_SIZE then
                    return;
                end;
            end;
            if p1065.IsStatic and (p1065.HasUI and (not p1065.NeedsRender and p1065.LastZoomVersion == NameVisual.RenderZoomVersion)) then
                p1065.LastSeenFrame = l__FrameCount__87;
            else
                local v1077, v1078 = NameVisual.WorldToCanvasPoint(l__RenderX__96, l__RenderY__97, u1005);
                local v1079 = NameVisual.WorldToCanvasSize(l__RenderRadius__98 * 2, u1005);
                if ShowEntityUI(p1065, v1077, v1078, v1079) then
                    p1065.LastSeenFrame = l__FrameCount__87;
                    if p1065.LastUIX ~= v1077 or p1065.LastUIY ~= v1078 then
                        p1065.Frame.Position = l__fromOffset__31(v1077, v1078);
                        p1065.LastUIX = v1077;
                        p1065.LastUIY = v1078;
                    end;
                    if p1065.LastUISize ~= v1079 then
                        p1065.Frame.Size = l__fromOffset__31(v1079, v1079);
                        p1065.LastUISize = v1079;
                        if p1065.Type ~= "Food" and (p1065.Type ~= "Gold" and (p1065.Type ~= "GoldenBlock" and (p1065.Type ~= "GoldenCrate" and (p1065.Type ~= "KingHill" and p1065.Type ~= "StaticBlob")))) then
                            local v1080 = l__clamp__26(l__floor__27(l__RenderRadius__98 / 5) * 5, 1, 10000);
                            if p1065.LastZIdx ~= v1080 then
                                p1065.Frame.ZIndex = v1080;
                                p1065.LastZIdx = v1080;
                            end;
                        end;
                    end;
                    p1065.LastZoomVersion = NameVisual.RenderZoomVersion;
                    if p1065.Type == "PlayerBlob" then
                        local v1081 = u100[p1065.VisualUid or p1065.PlayerUid];
                        if v1081 then
                            local v1082 = NameVisual.PLAYER_SLOT_LOD_RADIUS < l__RenderRadius__98;
                            local v1083;
                            if v1082 then
                                v1083 = not p1065.IsBot;
                            else
                                v1083 = v1082;
                            end;
                            local v1084;
                            if v1082 then
                                v1084 = not p1065.IsBot or p1065.BotFreezeEffect == true;
                            else
                                v1084 = v1082;
                            end;
                            local v1085 = (v1083 and 1 or 0) + (v1084 and 2 or 0);
                            if p1065.LastSlotVisualsVisible ~= v1085 then
                                if p1065.SkinsContainer then
                                    p1065.SkinsContainer.Visible = v1083;
                                end;
                                if p1065.HatsContainer then
                                    p1065.HatsContainer.Visible = v1083;
                                end;
                                if p1065.EffectsContainer then
                                    p1065.EffectsContainer.Visible = v1084;
                                end;
                                p1065.LastSlotVisualsVisible = v1085;
                            end;
                            if v1082 then
                                ApplyPlayerVisuals(p1065, v1081);
                                AnimatePlayerVisuals(p1065, u1019);
                            else
                                ApplyPlayerBaseVisuals(p1065, v1081);
                            end;
                        else
                            ApplyMissingPlayerVisuals(p1065);
                        end;
                        local v1086 = l__floor__27(l__RenderRadius__98 * l__RenderRadius__98 / 10);
                        if p1065.MassLabel and p1065.LastMass ~= v1086 then
                            p1065.MassLabel.Text = tostring(v1086);
                            p1065.LastMass = v1086;
                        end;
                        local v1087 = NameVisual.PLAYER_TEXT_RADIUS < l__RenderRadius__98;
                        if p1065.NameLabel and p1065.NameLabel.Visible ~= v1087 then
                            p1065.NameLabel.Visible = v1087;
                        end;
                        if p1065.MassLabel and p1065.MassLabel.Visible ~= v1087 then
                            p1065.MassLabel.Visible = v1087;
                        end;
                    elseif p1065.Type == "EjectedMass" then
                        local v1088 = u113(p1065);
                        if p1065.LastColor ~= v1088 then
                            p1065.Frame.ImageColor3 = v1088;
                            p1065.LastColor = v1088;
                        end;
                    end;
                    if p1065.Type == "GoldenBlock" and p1065.LastCooldownState ~= p1065.IsCooldown then
                        p1065.LastCooldownState = p1065.IsCooldown;
                        p1065.Frame.Image = p1065.IsCooldown and "rbxassetid://72002548349456" or "rbxassetid://133112511930324";
                    end;
                    if p1065.IsStatic then
                        p1065.NeedsRender = false;
                    end;
                end;
            end;
        end;
    end;
    if u70 then
        u77();
    end;
    local v1090 = l__clamp__26(l__floor__27(u69 / l__CLIENT_GRID_SIZE__34) + 1, 1, 6);
    local v1091 = l__floor__27(u1024 / l__CLIENT_GRID_SIZE__34) - v1090;
    local v1092 = l__floor__27(u1025 / l__CLIENT_GRID_SIZE__34) + v1090;
    local v1093 = l__floor__27(u1026 / l__CLIENT_GRID_SIZE__34) - v1090;
    local v1094 = l__floor__27(u1027 / l__CLIENT_GRID_SIZE__34) + v1090;
    for v1095 = v1091, v1092 do
        for v1096 = v1093, v1094 do
            local v1097 = u67[v1095 * l__GRID_PRIME__33 + v1096];
            if v1097 then
                for _, v1098 in pairs(v1097) do
                    v1089(v1098);
                end;
            end;
        end;
    end;
    for v1099, v1100 in pairs(NameVisual.HugeDynamicEntities) do
        if u61[v1099] then
            if v1100.LastSeenFrame ~= l__FrameCount__87 then
                v1089(v1100);
            end;
        else
            NameVisual.HugeDynamicEntities[v1099] = nil;
        end;
    end;
    if v1060 then
        for v1101 = v1028, v1029 do
            for v1102 = v1030, v1031 do
                local v1103 = u68[v1101 * l__GRID_PRIME__33 + v1102];
                if v1103 then
                    for _, v1104 in pairs(v1103) do
                        v1089(v1104);
                    end;
                end;
            end;
        end;
    end;
    for v1105, v1106 in pairs(u63) do
        if v1106.LastSeenFrame ~= l__FrameCount__87 then
            u505(v1106.Type, v1106.Frame);
            v1106.HasUI = false;
            v1106.Frame = nil;
            u63[v1105] = nil;
        end;
    end;
    if v1060 then
        for v1107, v1108 in pairs(u64) do
            if v1108.LastSeenFrame ~= l__FrameCount__87 then
                u505(v1108.Type, v1108.Frame);
                v1108.HasUI = false;
                v1108.Frame = nil;
                u64[v1107] = nil;
            end;
        end;
    end;
    if v1035 > 0 then
        local v1109 = v1032 / v1035;
        local v1110 = v1033 / v1035;
        u114 = v1109;
        u115 = v1110;
        u116 = v1034;
        u117 = v1035;
        if u118 == 0 or l__abs__22(u116 - u118) > u118 * 0.01 then
            u118 = u116;
        end;
    end;
    local v1111 = 1 - l__exp__24(-(u161.ControlledBlobId and 3.5 or 6) * p994);
    u119 = u119 + (u114 - u119) * v1111;
    u120 = u120 + (u115 - u120) * v1111;
    local v1112 = 1 - l__exp__24(-(u161.ControlledBlobId and 12 or 20) * p994);
    u157 = u157 + (-u119 - u157) * v1112;
    u158 = u158 + (-u120 - u158) * v1112;
    local v1113 = NameVisual.WorldToCanvasOffset(u157, u1005);
    local v1114 = NameVisual.WorldToCanvasOffset(u158, u1005);
    if u159 ~= v1113 or u160 ~= v1114 then
        u185.Position = l__fromOffset__31(v1113, v1114);
        u159 = v1113;
        u160 = v1114;
    end;
    if u192.Visible then
        u161.UpdateFixedMouseMarkerPosition(u1005);
    end;
    if u188.Visible and u161.ActiveMode then
        local v1115 = l__UserInputService__5:GetMouseLocation();
        local l__X__99 = v1115.X;
        local l__Y__100 = v1115.Y;
        local v1116 = NameVisual.CachedScreenSize or u181.AbsoluteSize;
        local v1117 = NameVisual.GetRenderZoom();
        local v1118 = (l__X__99 - v1116.X * 0.5) / v1117 - u157;
        local v1119 = (l__Y__100 - v1116.Y * 0.5) / v1117 - u158;
        local v1120 = 100;
        if u161.ActiveMode == "Spike" then
            v1120 = l__Config__11.Objects.SPIKE_RADIUS * 2;
        elseif u161.ActiveMode == "Spawner" then
            v1120 = l__Config__11.Objects.SPAWNER_RADIUS * 2;
        elseif u161.ActiveMode == "FreezeFood" or u161.ActiveMode == "Mass1000" then
            v1120 = l__Config__11.Objects.SPIKE_RADIUS / 4 * 2;
        end;
        local v1121, v1122 = NameVisual.WorldToCanvasPoint(v1118, v1119, u1005);
        local v1123 = NameVisual.WorldToCanvasSize(v1120, u1005);
        if u207 ~= v1121 or u209 ~= v1122 then
            u188.Position = l__fromOffset__31(v1121, v1122);
            u207 = v1121;
            u209 = v1122;
        end;
        if u208 ~= v1123 then
            u188.Size = l__fromOffset__31(v1123, v1123);
            u208 = v1123;
        end;
    end;
end);
task.spawn(function() --[[ Line: 4908 ]]
    -- upvalues: l__LobbyController__18 (copy), l__HUDController__20 (copy), l__TutorialController__21 (copy), l__DonateController__19 (copy)
    l__LobbyController__18.Init();
    l__HUDController__20.Init();
    l__TutorialController__21.Init();
    l__DonateController__19.Init();
end);
task.spawn(function() --[[ Line: 4918 ]]
    -- upvalues: l__PlayerGui__9 (copy), l__ClientPlayerState__16 (copy), u1 (copy), l__Workspace__4 (copy), l__max__28 (copy), u171 (ref), u716 (copy), u161 (copy), l__TouchEnabled__35 (ref), u188 (copy), u170 (ref), u175 (copy), l__new__32 (copy), u207 (ref), u209 (ref), u208 (ref), l__UserInputService__5 (copy), u178 (copy)
    local l__Gui__101 = l__PlayerGui__9:WaitForChild("Gui");
    if l__Gui__101:IsA("ScreenGui") then
        l__Gui__101.DisplayOrder = 50;
    end;
    local u1124 = l__PlayerGui__9:FindFirstChild("DragScreenGui") or Instance.new("ScreenGui", l__PlayerGui__9);
    u1124.Name = "DragScreenGui";
    u1124.DisplayOrder = 9999;
    u1124.IgnoreGuiInset = true;
    local l__Bottom1ScreenGui__102 = l__Gui__101:WaitForChild("Abilities"):WaitForChild("Bottom1ScreenGui");
    local l__TemplateButton__103 = l__Bottom1ScreenGui__102:WaitForChild("TemplateButton");
    local l__Close__104 = l__Bottom1ScreenGui__102:WaitForChild("Close");
    l__TemplateButton__103.Visible = false;
    l__Close__104.Visible = false;
    local u1125 = l__ClientPlayerState__16.WaitForProxy("Inventory", u1, 15);
    local u1126 = l__ClientPlayerState__16.WaitForProxy("Equipped.Abilities", u1, 15);
    if not (u1125 and u1126) then
        for _ = 1, 15 do
            u1125 = u1125 or l__ClientPlayerState__16.WaitForProxy("Inventory", u1, 1);
            u1126 = u1126 or l__ClientPlayerState__16.WaitForProxy("Equipped.Abilities", u1, 1);
            if u1125 and u1126 then
                break;
            end;
            task.wait(1);
        end;
    end;
    if u1125 and u1126 then
        local u1127 = {};
        local u1128 = {};
        local u1129 = {};
        local u1130 = true;
        local function u1139() --[[ Line: 4964 ]]
            -- upvalues: u1128 (ref), u1129 (ref), u1 (ref), l__Workspace__4 (ref), l__max__28 (ref)
            for v1131, v1132 in pairs(u1128) do
                local v1133 = u1129[v1131];
                local v1134;
                if v1133 then
                    local v1135 = u1;
                    local v1136 = "AbilityCooldown_" .. tostring(v1133);
                    local v1137 = tonumber(v1135:GetAttribute(v1136)) or 0;
                    v1134 = v1137 <= 0 and 0 or l__max__28(0, v1137 - l__Workspace__4:GetServerTimeNow()) or 0;
                else
                    v1134 = 0;
                end;
                if v1134 > 0.05 then
                    local v1138 = math.ceil(v1134);
                    v1132.Text = tostring(v1138);
                    v1132.Visible = true;
                else
                    v1132.Visible = false;
                end;
            end;
        end;
        task.spawn(function() --[[ Line: 4977 ]]
            -- upvalues: l__Bottom1ScreenGui__102 (copy), u1139 (copy)
            while l__Bottom1ScreenGui__102.Parent do
                u1139();
                task.wait(0.1);
            end;
        end);
        u171 = function() --[[ Line: 4984 ]]
            -- upvalues: u1127 (ref), u1126 (ref), u716 (ref), u161 (ref), l__TouchEnabled__35 (ref), u188 (ref)
            local v1140 = false;
            for v1141, v1142 in pairs(u1127) do
                local v1143 = u1126:GetAttribute(v1141);
                if v1143 and v1143 ~= "None" then
                    local v1144 = u716[v1143];
                    if v1144 and v1144.Mode then
                        if u161.ActiveMode == v1144.Mode then
                            v1142.BackgroundColor3 = Color3.fromRGB(255, 85, 0);
                            v1142.BackgroundTransparency = 0.2;
                            if not l__TouchEnabled__35 then
                                u188.Image = v1144.Image;
                                u188.Visible = true;
                                v1140 = true;
                            end;
                        else
                            v1142.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
                            v1142.BackgroundTransparency = 0.6;
                        end;
                    end;
                end;
            end;
            if not v1140 and u188 then
                u188.Visible = false;
            end;
        end;
        u170 = function(p1145) --[[ Line: 5009 ]]
            -- upvalues: u1126 (ref), u716 (ref), u161 (ref), u171 (ref), u175 (ref)
            local v1146 = u1126:GetAttribute(p1145);
            if v1146 and v1146 ~= "None" then
                local v1147 = u716[v1146];
                if v1147 then
                    if v1147.Mode then
                        if u161.ActiveMode == v1147.Mode then
                            u161.ActiveMode = nil;
                        else
                            u161.ActiveMode = v1147.Mode;
                        end;
                        u171();
                    else
                        if v1147.Action then
                            u175:FireServer(v1147.Action);
                        end;
                    end;
                end;
            end;
        end;
        local u1148 = nil;
        local u1149 = nil;
        local u1150 = nil;
        local u1151 = l__new__32();
        local u1152 = l__new__32();
        local function u1167() --[[ Line: 5028 ]]
            -- upvalues: u1127 (ref), u1128 (ref), u1129 (ref), u161 (ref), u1126 (ref), u1125 (ref), u716 (ref), l__TemplateButton__103 (copy), u1130 (ref), l__Bottom1ScreenGui__102 (copy), l__new__32 (ref), u170 (ref), u1150 (ref), u1151 (ref), u1152 (ref), u1148 (ref), l__Close__104 (copy), u188 (ref), u207 (ref), u209 (ref), u208 (ref), u171 (ref), u1139 (copy)
            for _, v1153 in pairs(u1127) do
                v1153:Destroy();
            end;
            u1127 = {};
            u1128 = {};
            u1129 = {};
            local v1154 = u161.ActiveMode == nil;
            local v1155 = false;
            for u1156 = 1, 10 do
                local u1157 = "Slot" .. u1156;
                local v1158 = u1126:GetAttribute(u1157);
                if v1158 and (v1158 ~= "None" and v1158 ~= "") then
                    local v1159 = u1125:FindFirstChild(v1158);
                    local v1160 = v1159 and (tonumber(v1159:GetAttribute("Amount")) or 0) or 0;
                    if v1159 and v1160 > 0 then
                        v1155 = true;
                        local v1161 = u716[v1158];
                        if v1161 then
                            v1154 = v1161.Mode and v1161.Mode == u161.ActiveMode and true or v1154;
                            local v1162 = l__TemplateButton__103:Clone();
                            v1162.Name = u1157;
                            v1162.Image = v1161.Image;
                            v1162.Visible = u1130;
                            v1162.Parent = l__Bottom1ScreenGui__102;
                            v1162.LayoutOrder = u1156;
                            u1127[u1157] = v1162;
                            local v1163 = v1162:FindFirstChild("Amount") or v1162:FindFirstChildWhichIsA("TextLabel");
                            if v1163 then
                                u1125:FindFirstChild(v1158);
                                v1163.Text = tostring(v1160);
                            end;
                            local v1164 = Instance.new("TextLabel", v1162);
                            v1164.Name = "Cooldown";
                            v1164.Size = UDim2.new(1, 0, 1, 0);
                            v1164.Position = UDim2.new(0, 0, 0, 0);
                            v1164.BackgroundTransparency = 0.25;
                            v1164.BackgroundColor3 = Color3.new(0, 0, 0);
                            v1164.TextColor3 = Color3.new(1, 1, 1);
                            v1164.TextStrokeTransparency = 0.35;
                            v1164.Font = Enum.Font.GothamBlack;
                            v1164.TextScaled = true;
                            v1164.Text = "";
                            v1164.Visible = false;
                            v1164.ZIndex = v1162.ZIndex + 20;
                            u1129[u1157] = v1158;
                            u1128[u1157] = v1164;
                            local u1165 = Instance.new("TextLabel", v1162);
                            u1165.Size = UDim2.new(1, 40, 0, 20);
                            u1165.Position = UDim2.new(0.5, 0, 0, -25);
                            u1165.AnchorPoint = l__new__32(0.5, 1);
                            u1165.BackgroundTransparency = 0.5;
                            u1165.BackgroundColor3 = Color3.new(0, 0, 0);
                            u1165.TextColor3 = Color3.new(1, 1, 1);
                            u1165.Text = "Press " .. u1156;
                            u1165.Font = Enum.Font.GothamBold;
                            u1165.Visible = false;
                            v1162.MouseEnter:Connect(function() --[[ Line: 5095 ]]
                                -- upvalues: u1130 (ref), u1165 (copy)
                                if u1130 then
                                    u1165.Visible = true;
                                end;
                            end);
                            v1162.MouseLeave:Connect(function() --[[ Line: 5096 ]]
                                -- upvalues: u1165 (copy)
                                u1165.Visible = false;
                            end);
                            v1162.MouseButton1Click:Connect(function() --[[ Line: 5097 ]]
                                -- upvalues: u170 (ref), u1157 (copy)
                                u170(u1157);
                            end);
                            v1162.InputBegan:Connect(function(p1166) --[[ Line: 5099 ]]
                                -- upvalues: u1150 (ref), u1151 (ref), l__new__32 (ref), u1152 (ref), u1148 (ref), u1156 (copy)
                                if p1166.UserInputType == Enum.UserInputType.MouseButton1 or p1166.UserInputType == Enum.UserInputType.Touch then
                                    u1150 = p1166;
                                    u1151 = l__new__32(p1166.Position.X, p1166.Position.Y);
                                    u1152 = u1151;
                                    u1148 = u1156;
                                end;
                            end);
                        end;
                    end;
                end;
            end;
            l__Close__104.Visible = v1155;
            if v1154 then
                u171();
            elseif u161.ActiveMode ~= nil then
                u161.ActiveMode = nil;
                u188.Visible = false;
                u207 = nil;
                u209 = nil;
                u208 = nil;
                u171();
            end;
            u1139();
        end;
        local u1168 = u1130;
        local u1169 = u1150;
        local u1170 = u1148;
        local u1171 = u1151;
        local u1172 = u1152;
        local u1173 = u1127;
        for _, v1174 in ipairs(u1125:GetChildren()) do
            if v1174 then
                v1174:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 5123 ]]
                    -- upvalues: u1167 (copy)
                    u1167();
                end);
            end;
        end;
        u1125.ChildAdded:Connect(function(p1175) --[[ Line: 5132 ]]
            -- upvalues: u1167 (copy)
            if p1175 then
                p1175:GetAttributeChangedSignal("Amount"):Connect(function() --[[ Line: 5123 ]]
                    -- upvalues: u1167 (ref)
                    u1167();
                end);
            end;
            u1167();
        end);
        u1125.ChildRemoved:Connect(function() --[[ Line: 5137 ]]
            -- upvalues: u1167 (copy)
            u1167();
        end);
        u1126.AttributeChanged:Connect(u1167);
        u1167();
        l__UserInputService__5.InputChanged:Connect(function(p1176) --[[ Line: 5144 ]]
            -- upvalues: u1170 (ref), u1169 (ref), l__new__32 (ref), u1149 (ref), u1171 (ref), u1173 (ref), u1124 (copy), u1172 (ref)
            if u1170 and u1169 then
                if p1176 == u1169 or p1176.UserInputType == Enum.UserInputType.MouseMovement then
                    local v1177 = l__new__32(p1176.Position.X, p1176.Position.Y);
                    if not u1149 then
                        if (v1177 - u1171).Magnitude < 8 then
                            return;
                        end;
                        local v1178 = u1173["Slot" .. tostring(u1170)];
                        if not v1178 then
                            return;
                        end;
                        u1149 = v1178:Clone();
                        u1149.Parent = u1124;
                        u1149.Size = UDim2.new(0, v1178.AbsoluteSize.X, 0, v1178.AbsoluteSize.Y);
                        u1149.AnchorPoint = l__new__32(0.5, 0.5);
                        u1149.ZIndex = 100;
                        u1149.BackgroundTransparency = 0.5;
                        for _, v1179 in pairs(u1149:GetChildren()) do
                            if v1179:IsA("TextLabel") then
                                v1179:Destroy();
                            end;
                        end;
                    end;
                    u1172 = v1177;
                    u1149.Position = UDim2.new(0, v1177.X, 0, v1177.Y);
                end;
            end;
        end);
        l__UserInputService__5.InputEnded:Connect(function(p1180) --[[ Line: 5185 ]]
            -- upvalues: u1170 (ref), u1169 (ref), u1149 (ref), l__PlayerGui__9 (ref), u1172 (ref), u1173 (ref), u1126 (ref), u178 (ref)
            if not u1170 or p1180 ~= u1169 and p1180.UserInputType ~= Enum.UserInputType.MouseButton1 then
                return;
            end;
            if u1149 then
                local v1181 = l__PlayerGui__9:GetGuiObjectsAtPosition(u1172.X, u1172.Y);
                local v1182 = nil;
                for _, v1183 in ipairs(v1181) do
                    for v1184, v1185 in pairs(u1173) do
                        if v1183 == v1185 or v1183.Parent == v1185 then
                            v1182 = tonumber(v1184:match("%d+"));
                            break;
                        end;
                    end;
                    if v1182 then
                        break;
                    end;
                end;
                if v1182 and v1182 ~= u1170 then
                    local v1186 = {};
                    for v1187 = 1, 10 do
                        local v1188 = u1126:GetAttribute("Slot" .. v1187);
                        if v1188 and (v1188 ~= "None" and v1188 ~= "") then
                            table.insert(v1186, v1188);
                        end;
                    end;
                    if u1170 <= #v1186 and v1182 <= #v1186 + 1 then
                        local v1189 = table.remove(v1186, u1170);
                        table.insert(v1186, v1182, v1189);
                        u178:FireServer(v1186);
                    end;
                end;
            end;
            if u1149 then
                u1149:Destroy();
            end;
            u1149 = nil;
            u1170 = nil;
            u1169 = nil;
        end);
        l__Close__104.MouseButton1Click:Connect(function() --[[ Line: 5222 ]]
            -- upvalues: u1168 (ref), l__Close__104 (copy), u1173 (ref)
            u1168 = not u1168;
            l__Close__104.BackgroundTransparency = u1168 and 0.3 or 0.7;
            for _, v1190 in pairs(u1173) do
                v1190.Visible = u1168;
            end;
        end);
    end;
end);