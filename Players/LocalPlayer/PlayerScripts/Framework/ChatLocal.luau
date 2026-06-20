-- ClassName: LocalScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.ChatLocal

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__TextChatService__3 = game:GetService("TextChatService");
local l__StarterGui__4 = game:GetService("StarterGui");
local l__RunService__5 = game:GetService("RunService");
local l__TweenService__6 = game:GetService("TweenService");
local l__HttpService__7 = game:GetService("HttpService");
local l__LocalPlayer__8 = l__Players__1.LocalPlayer;
local l__PlayerGui__9 = l__LocalPlayer__8:WaitForChild("PlayerGui");
local l__Framework__10 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__ClientPlayerState__11 = require(l__Framework__10:WaitForChild("ClientPlayerState"));
local l__GlobalChatTipsRemote__12 = l__ReplicatedStorage__2:WaitForChild("GlobalChatTipsRemote");
local l__AgeSafeChatRemote__13 = l__ReplicatedStorage__2:WaitForChild("AgeSafeChatRemote");
local function u9(p1) --[[ Line: 25 ]]
    local v2 = tostring(p1 or "#FFFFFF"):gsub("#", "");
    local v3 = v2:sub(1, 2);
    local v4 = tonumber(v3, 16) or 255;
    local v5 = v2:sub(3, 4);
    local v6 = tonumber(v5, 16) or 255;
    local v7 = v2:sub(5, 6);
    local v8 = tonumber(v7, 16) or 255;
    return Color3.fromRGB(v4, v6, v8);
end;
local function u12(p10) --[[ Line: 36 ]]
    local v11 = typeof(p10) == "Color3" and p10 and p10 or Color3.fromRGB(255, 255, 255);
    return string.format("#%02X%02X%02X", math.floor(v11.R * 255 + 0.5), math.floor(v11.G * 255 + 0.5), (math.floor(v11.B * 255 + 0.5)));
end;
local function u15(u13, u14) --[[ Line: 41 ]]
    -- upvalues: l__StarterGui__4 (copy), u9 (copy)
    for _ = 1, 10 do
        if pcall(function() --[[ Line: 43 ]]
            -- upvalues: l__StarterGui__4 (ref), u13 (copy), u9 (ref), u14 (copy)
            l__StarterGui__4:SetCore("ChatMakeSystemMessage", {
                TextSize = 18,
                Text = u13,
                Color = u9(u14),
                Font = Enum.Font.GothamBold
            });
        end) then
            return;
        end;
        task.wait(0.5);
    end;
end;
local function u18(u16) --[[ Line: 60 ]]
    -- upvalues: l__TextChatService__3 (copy)
    local l__TextChannels__14 = l__TextChatService__3:WaitForChild("TextChannels", 10);
    if l__TextChannels__14 then
        local u17 = l__TextChannels__14:FindFirstChild("RBXGeneral") or l__TextChannels__14:WaitForChild("RBXGeneral", 10);
        if u17 then
            return pcall(function() --[[ Line: 77 ]]
                -- upvalues: u17 (ref), u16 (copy)
                u17:DisplaySystemMessage(u16);
            end);
        else
            return false;
        end;
    else
        return false;
    end;
end;
local function u20(p19) --[[ Line: 91 ]]
    return tostring(p19 or ""):gsub("&", "&amp;"):gsub("<", "&lt;"):gsub(">", "&gt;"):gsub("\"", "&quot;"):gsub("\'", "&apos;");
end;
local function u34(p21, p22, p23) --[[ Line: 109 ]]
    local v24 = {};
    if typeof(p21) == "table" then
        for _, v25 in ipairs(p21) do
            if typeof(v25) == "table" then
                local v26 = #v24 + 1;
                local v27 = {};
                local v28 = tonumber(v25.Position or v25.Time) or 0;
                v27.Position = math.clamp(v28, 0, 1);
                local v29 = tostring(v25.Color or v25.Hex or ""):gsub("#", "");
                v27.Color = not v29:match("^%x%x%x%x%x%x$") and (p22 or "#FFFFFF") or "#" .. string.upper(v29);
                v24[v26] = v27;
                if #v24 >= 16 then
                    break;
                end;
            end;
        end;
    end;
    local v30 = #v24 == 0 and {
        {
            Position = 0,
            Color = p22
        },
        {
            Position = 1,
            Color = p23
        }
    } or v24;
    table.sort(v30, function(p31, p32) --[[ Line: 130 ]]
        return p31.Position < p32.Position;
    end);
    if #v30 == 1 then
        v30[#v30 + 1] = {
            Position = 1,
            Color = v30[1].Color
        };
    end;
    if v30[1].Position > 0 then
        table.insert(v30, 1, {
            Position = 0,
            Color = v30[1].Color
        });
    else
        v30[1].Position = 0;
    end;
    if v30[#v30].Position < 1 then
        v30[#v30 + 1] = {
            Position = 1,
            Color = v30[#v30].Color
        };
    else
        v30[#v30].Position = 1;
    end;
    while #v30 > 16 do
        table.remove(v30, #v30 - 1);
    end;
    for v33 = 2, #v30 do
        if v30[v33].Position <= v30[v33 - 1].Position then
            v30[v33].Position = math.min(1, v30[v33 - 1].Position + 0.001);
        end;
    end;
    v30[#v30].Position = 1;
    return v30;
end;
local function u44(p35, p36) --[[ Line: 158 ]]
    -- upvalues: u9 (copy)
    local v37 = tonumber(p36) or 0;
    local v38 = math.clamp(v37, 0, 1);
    for v39 = 1, #p35 - 1 do
        local v40 = p35[v39];
        local v41 = p35[v39 + 1];
        if v40.Position <= v38 and v38 <= v41.Position then
            local v42 = math.max(v41.Position - v40.Position, 0.001);
            local v43 = (v38 - v40.Position) / v42;
            return u9(v40.Color):Lerp(u9(v41.Color), v43);
        end;
    end;
    return u9(p35[#p35].Color);
end;
local function u50(p45) --[[ Line: 172 ]]
    -- upvalues: u9 (copy)
    local u46 = {};
    for _, v47 in ipairs(p45) do
        u46[#u46 + 1] = ColorSequenceKeypoint.new(v47.Position, u9(v47.Color));
    end;
    local v48, v49 = pcall(function() --[[ Line: 177 ]]
        -- upvalues: u46 (copy)
        return ColorSequence.new(u46);
    end);
    if v48 then
        return v49;
    else
        return ColorSequence.new(u9(p45[1].Color), u9(p45[#p45].Color));
    end;
end;
local function u56(u51, p52, p53) --[[ Line: 186 ]]
    -- upvalues: l__HttpService__7 (copy), u34 (copy)
    if type(u51) == "string" and u51 ~= "" then
        local v54, v55 = pcall(function() --[[ Line: 188 ]]
            -- upvalues: l__HttpService__7 (ref), u51 (copy)
            return l__HttpService__7:JSONDecode(u51);
        end);
        if v54 and type(v55) == "table" then
            return u34(v55, p52, p53);
        end;
    end;
    return u34(nil, p52, p53);
end;
local function u72(p57, p58, p59, p60, p61, p62) --[[ Line: 198 ]]
    -- upvalues: u20 (copy), u56 (copy), u12 (copy), u44 (copy)
    local v63 = tostring(p57 or "");
    local v64 = tostring(p58 or ""):gsub("#", "");
    local v65 = not v64:match("^%x%x%x%x%x%x$") and (p61 or "#FFFFFF" or "#FFFFFF") or "#" .. string.upper(v64);
    if tostring(p59 or "") ~= "Gradient" then
        return string.format("<font color=\"%s\">%s</font>", v65, (u20(v63)));
    end;
    local v66 = {};
    for _, v67 in utf8.codes(v63) do
        v66[#v66 + 1] = utf8.char(v67);
    end;
    if #v66 <= 0 then
        return "";
    end;
    local v68 = u56(p60, v65, p62 or v65);
    local v69 = {};
    for v70, v71 in ipairs(v66) do
        v69[#v69 + 1] = string.format("<font color=\"%s\">%s</font>", u12(u44(v68, #v66 > 1 and ((v70 - 1) / (#v66 - 1) or 0.5) or 0.5)), (u20(v71)));
    end;
    return table.concat(v69);
end;
local u73 = nil;
local u74 = 0;
local function u107(p75) --[[ Line: 233 ]]
    -- upvalues: u74 (ref), u34 (copy), u9 (copy), u50 (copy), u44 (copy), u73 (ref), l__PlayerGui__9 (copy), l__TweenService__6 (copy)
    if typeof(p75) == "table" then
        local v76 = tostring(p75.Text or "");
        if v76 == "" then
        else
            u74 = u74 + 1;
            local u77 = u74;
            local v78 = tonumber(p75.Duration) or 8;
            local v79 = math.clamp(v78, 1, 120);
            local v80 = tostring(p75.StartColor or ""):gsub("#", "");
            local v81 = not v80:match("^%x%x%x%x%x%x$") and "#FFE66D" or "#" .. string.upper(v80);
            local v82 = tostring(p75.EndColor or ""):gsub("#", "");
            local v83 = not v82:match("^%x%x%x%x%x%x$") and "#4D96FF" or "#" .. string.upper(v82);
            local v84 = u34(p75.Stops, v81, v83);
            u9(v84[1].Color);
            u9(v84[#v84].Color);
            local v85 = u50(v84);
            local v86 = u44(v84, 0.5);
            local v87 = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720);
            local v88 = v87.X <= 700 and true or v87.Y <= 500;
            local v89 = v88 and 44 or 58;
            local v90 = v88 and 0.68 or 0.72;
            local v91 = v88 and 96 or 104;
            local u92 = -(v89 + 18);
            if u73 then
                u73:Destroy();
                u73 = nil;
            end;
            local u93 = Instance.new("ScreenGui");
            u93.Name = "AdminAnnouncementOverlay";
            u93.ResetOnSpawn = false;
            u93.IgnoreGuiInset = true;
            u93.DisplayOrder = 1000000000;
            u93.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            u93.Parent = l__PlayerGui__9;
            u73 = u93;
            local u94 = Instance.new("Frame");
            u94.Name = "Message";
            u94.AnchorPoint = Vector2.new(0.5, 0);
            u94.Position = UDim2.new(0.5, 0, 0, u92);
            u94.Size = UDim2.new(v90, 0, 0, v89);
            u94.BackgroundColor3 = Color3.fromRGB(14, 16, 22);
            u94.BackgroundTransparency = 1;
            u94.BorderSizePixel = 0;
            u94.Parent = u93;
            local v95 = Instance.new("UISizeConstraint");
            v95.MaxSize = v88 and Vector2.new(430, 52) or Vector2.new(720, 70);
            v95.MinSize = v88 and Vector2.new(210, 38) or Vector2.new(280, 48);
            v95.Parent = u94;
            local v96 = Instance.new("UICorner");
            v96.CornerRadius = UDim.new(0, 8);
            v96.Parent = u94;
            local v97 = Instance.new("UIStroke");
            v97.Color = v86;
            v97.Transparency = 1;
            v97.Thickness = 0;
            v97.Parent = u94;
            local v98 = Instance.new("UIGradient");
            v98.Color = v85;
            v98.Transparency = NumberSequence.new(1);
            v98.Parent = u94;
            local v99 = Instance.new("UIPadding");
            v99.PaddingTop = UDim.new(0, v88 and 5 or 7);
            v99.PaddingBottom = UDim.new(0, v88 and 5 or 7);
            v99.PaddingLeft = UDim.new(0, v88 and 10 or 14);
            v99.PaddingRight = UDim.new(0, v88 and 10 or 14);
            v99.Parent = u94;
            local v100 = Instance.new("UIListLayout");
            v100.SortOrder = Enum.SortOrder.LayoutOrder;
            v100.Padding = UDim.new(0, 2);
            v100.Parent = u94;
            local v101 = Instance.new("TextLabel");
            v101.Name = "Title";
            v101.Size = UDim2.new(1, 0, 0, v88 and 0 or 13);
            v101.BackgroundTransparency = 1;
            v101.Font = Enum.Font.GothamBold;
            v101.Text = v88 and "" or "SERVER";
            v101.TextColor3 = Color3.fromRGB(255, 255, 255);
            v101.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
            v101.TextStrokeTransparency = 0.78;
            v101.TextSize = v88 and 1 or 10;
            v101.TextXAlignment = Enum.TextXAlignment.Center;
            v101.TextYAlignment = Enum.TextYAlignment.Center;
            v101.LayoutOrder = 1;
            v101.Parent = u94;
            local v102 = Instance.new("UIGradient");
            v102.Color = v85;
            v102.Parent = v101;
            local v103 = Instance.new("TextLabel");
            v103.Name = "Text";
            v103.Size = UDim2.new(1, 0, 0, v88 and 30 or 28);
            v103.BackgroundTransparency = 1;
            v103.Font = Enum.Font.GothamBold;
            v103.Text = v76;
            v103.TextColor3 = Color3.fromRGB(255, 255, 255);
            v103.TextStrokeColor3 = Color3.fromRGB(0, 0, 0);
            v103.TextStrokeTransparency = 0.7;
            v103.TextScaled = true;
            v103.TextWrapped = true;
            v103.TextXAlignment = Enum.TextXAlignment.Center;
            v103.TextYAlignment = Enum.TextYAlignment.Center;
            v103.LayoutOrder = 2;
            v103.Parent = u94;
            local v104 = Instance.new("UITextSizeConstraint");
            v104.MinTextSize = v88 and 9 or 12;
            v104.MaxTextSize = v88 and 14 or 20;
            v104.Parent = v103;
            local v105 = Instance.new("UIGradient");
            v105.Color = v85;
            v105.Parent = v103;
            l__TweenService__6:Create(u94, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                Position = UDim2.new(0.5, 0, 0, v91)
            }):Play();
            task.delay(v79, function() --[[ Line: 365 ]]
                -- upvalues: u77 (copy), u74 (ref), u94 (copy), l__TweenService__6 (ref), u92 (copy), u93 (copy), u73 (ref)
                if u77 == u74 and u94.Parent then
                    local v106 = l__TweenService__6:Create(u94, TweenInfo.new(0.18, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                        BackgroundTransparency = 1,
                        Position = UDim2.new(0.5, 0, 0, u92)
                    });
                    v106:Play();
                    v106.Completed:Wait();
                    if u77 == u74 and u93.Parent then
                        u93:Destroy();
                        u73 = nil;
                    end;
                end;
            end);
        end;
    end;
end;
local function u111(u108) --[[ Line: 382 ]]
    -- upvalues: l__LocalPlayer__8 (copy), l__AgeSafeChatRemote__13 (copy)
    local v109;
    if u108 then
        v109 = u108.TextSource;
    else
        v109 = u108;
    end;
    if v109 and v109.UserId == l__LocalPlayer__8.UserId then
        if u108.Status == Enum.TextChatMessageStatus.Success then
            local u110 = nil;
            pcall(function() --[[ Line: 392 ]]
                -- upvalues: u110 (ref), u108 (copy)
                u110 = u108.MessageId;
            end);
            l__AgeSafeChatRemote__13:FireServer({
                Kind = "ObservedMessage",
                Text = tostring(u108.Text or ""),
                MessageId = u110
            });
        end;
    end;
end;
local function u133(p112) --[[ Line: 402 ]]
    -- upvalues: l__ClientPlayerState__11 (copy), l__Players__1 (copy), u72 (copy)
    local l__TextSource__15 = p112.TextSource;
    if not l__TextSource__15 then
        return nil;
    end;
    local l__UserId__16 = l__TextSource__15.UserId;
    local v113 = l__ClientPlayerState__11.GetProxy("Settings", l__UserId__16);
    local v114 = tostring(p112.PrefixText or "");
    if v114 == "" then
        local v115 = l__Players__1:GetPlayerByUserId(l__UserId__16);
        v114 = (v115 and (v115.DisplayName or (v115.Name or "Player")) or "Player") .. ":";
    end;
    local v116 = string.find(v114, ":", 1, true);
    local v117, v118;
    if v116 then
        v117 = string.sub(v114, 1, v116 - 1);
        v118 = string.sub(v114, v116);
    else
        v117 = v114;
        v118 = "";
    end;
    local v119;
    if v113 then
        v119 = v113:GetAttribute("ChatNicknameColor") or v113:GetAttribute("NicknameColor");
    else
        v119 = v113;
    end;
    local v120 = tostring(v119 or ""):gsub("#", "");
    local v121 = not v120:match("^%x%x%x%x%x%x$") and "#FFFFFF" or "#" .. string.upper(v120);
    local v122 = v113 and (v113:GetAttribute("ChatNicknameColorMode") or (v113:GetAttribute("NicknameColorMode") or "Solid")) or "Solid";
    local v123 = tostring(v122);
    local v124 = v113 and (v113:GetAttribute("ChatNicknameGradient") or (v113:GetAttribute("NicknameGradient") or "")) or "";
    local v125 = v113 and (v113:GetAttribute("ChatTitle") or "") or "";
    local v126 = tostring(v125);
    local v127;
    if v113 then
        v127 = v113:GetAttribute("ChatTitleColor");
    else
        v127 = v113;
    end;
    local v128 = tostring(v127 or ""):gsub("#", "");
    local v129 = not v128:match("^%x%x%x%x%x%x$") and "#FFFFFF" or "#" .. string.upper(v128);
    local v130 = v113 and (v113:GetAttribute("ChatTitleColorMode") or "Solid") or "Solid";
    local v131 = tostring(v130);
    local v132 = v113 and v113:GetAttribute("ChatTitleGradient") or "";
    return (v126 == "" and "" or u72("[" .. v126 .. "]", v129, v131, v132, v129, "#FF4D6D") .. " ") .. u72(v117 .. v118, v121, v123, v124, v121, "#7DD3FC");
end;
local function u142(p134) --[[ Line: 439 ]]
    -- upvalues: l__ClientPlayerState__11 (copy), u72 (copy)
    local l__TextSource__17 = p134.TextSource;
    if not l__TextSource__17 then
        return nil;
    end;
    local v135 = l__ClientPlayerState__11.GetProxy("Settings", l__TextSource__17.UserId);
    if not v135 then
        return nil;
    end;
    local v136 = v135:GetAttribute("ChatTextColor");
    local v137 = v135:GetAttribute("ChatTextGradient");
    local v138 = v135:GetAttribute("ChatTextColorMode") or "Solid";
    local v139 = tostring(v138);
    if (v136 == nil or v136 == "") and (v137 == nil or v137 == "") then
        return nil;
    end;
    local v140 = tostring(v136 or ""):gsub("#", "");
    local v141 = not v140:match("^%x%x%x%x%x%x$") and "#FFFFFF" or "#" .. string.upper(v140);
    return u72(p134.Text or "", v141, v139, v137, v141, "#F472B6");
end;
if l__TextChatService__3.ChatVersion == Enum.ChatVersion.TextChatService then
    function l__TextChatService__3.OnIncomingMessage(p143) --[[ Line: 462 ]]
        -- upvalues: u133 (copy), u142 (copy)
        local v144 = u133(p143);
        local v145 = u142(p143);
        if not (v144 or v145) then
            return nil;
        end;
        local v146 = Instance.new("TextChatMessageProperties");
        if v144 then
            v146.PrefixText = v144;
        end;
        if v145 then
            v146.Text = v145;
        end;
        return v146;
    end;
end;
local u147 = nil;
local u148 = {};
local u149 = nil;
local u150 = nil;
local function u156(p151) --[[ Line: 508 ]]
    local u152 = tostring(p151 or ""):gsub("%c", " "):gsub("^%s+", ""):gsub("%s+$", "");
    local v153, v154 = pcall(function() --[[ Line: 512 ]]
        -- upvalues: u152 (ref)
        return utf8.offset(u152, 181);
    end);
    local v155;
    if v153 and v154 then
        u152 = string.sub(u152, 1, v154 - 1) .. "...";
        v155 = u152;
    else
        v155 = u152;
    end;
    return v155;
end;
local function u169(p157, p158) --[[ Line: 531 ]]
    -- upvalues: u147 (ref), l__PlayerGui__9 (copy)
    local v159;
    if u147 and u147.Parent then
        v159 = u147;
    else
        u147 = Instance.new("ScreenGui");
        u147.Name = "AgeSafeChatBubbles";
        u147.ResetOnSpawn = false;
        u147.IgnoreGuiInset = true;
        u147.DisplayOrder = 45;
        u147.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        u147.Parent = l__PlayerGui__9;
        v159 = u147;
    end;
    local v160 = Instance.new("Frame");
    v160.Name = "ChatBubble";
    v160.AnchorPoint = Vector2.new(0.5, 1);
    local l__fromOffset__18 = UDim2.fromOffset;
    local v161 = math.ceil(#p157 / 34) * 12 + 46;
    v160.Size = l__fromOffset__18(260, (math.clamp(v161, 54, 96)));
    v160.BackgroundColor3 = Color3.fromRGB(18, 21, 28);
    v160.BackgroundTransparency = 0.08;
    v160.BorderSizePixel = 0;
    v160.Visible = false;
    v160.ZIndex = 20;
    v160.Active = true;
    v160.Parent = v159;
    local v162;
    if p158 then
        v162 = p158.SenderUserId;
    else
        v162 = p158;
    end;
    local v163 = tonumber(v162);
    if v163 then
        v160:SetAttribute("AgaricProfileUserId", v163);
        v160:SetAttribute("AgaricProfileName", (tostring(p158.SenderName or "")));
        v160:SetAttribute("AgaricProfileDisplayName", (tostring(p158.DisplayName or "")));
    end;
    local v164 = Instance.new("UICorner");
    v164.CornerRadius = UDim.new(0, 10);
    v164.Parent = v160;
    local v165 = Instance.new("UIStroke");
    v165.Color = Color3.fromRGB(255, 255, 255);
    v165.Transparency = 0.78;
    v165.Thickness = 1;
    v165.Parent = v160;
    local v166 = Instance.new("UIPadding");
    v166.PaddingTop = UDim.new(0, 8);
    v166.PaddingBottom = UDim.new(0, 8);
    v166.PaddingLeft = UDim.new(0, 12);
    v166.PaddingRight = UDim.new(0, 12);
    v166.Parent = v160;
    local v167 = Instance.new("TextLabel");
    v167.Name = "Text";
    v167.Size = UDim2.fromScale(1, 1);
    v167.BackgroundTransparency = 1;
    v167.Font = Enum.Font.GothamSemibold;
    v167.Text = p157;
    v167.TextColor3 = Color3.fromRGB(255, 255, 255);
    v167.TextScaled = true;
    v167.TextWrapped = true;
    v167.TextXAlignment = Enum.TextXAlignment.Center;
    v167.TextYAlignment = Enum.TextYAlignment.Center;
    v167.ZIndex = v160.ZIndex + 1;
    v167.Parent = v160;
    local v168 = Instance.new("UITextSizeConstraint");
    v168.MinTextSize = 10;
    v168.MaxTextSize = 18;
    v168.Parent = v167;
    return v160;
end;
local function u174(p170) --[[ Line: 591 ]]
    -- upvalues: u156 (copy), u148 (copy), u169 (copy), u150 (ref)
    local v171 = tonumber(p170.SenderUserId);
    if v171 then
        local v172 = u156(p170.Text);
        if v172 == "" then
        else
            local v173 = u148[v171];
            if v173 then
                if v173.Frame then
                    v173.Frame:Destroy();
                end;
                u148[v171] = nil;
            end;
            u148[v171] = {
                Frame = u169(v172, p170),
                ExpiresAt = os.clock() + 6
            };
            if u150 then
                u150();
            end;
        end;
    end;
end;
local function u191() --[[ Line: 612 ]]
    -- upvalues: u147 (ref), u148 (copy), u149 (ref), l__PlayerGui__9 (copy)
    if u147 and next(u148) ~= nil then
        local u175 = l__PlayerGui__9:FindFirstChild("AgaricGameplayPositionQuery");
        local v176 = nil;
        local v177;
        if u175 and u175:IsA("BindableFunction") then
            local v178;
            v178, v177 = pcall(function() --[[ Line: 621 ]]
                -- upvalues: u175 (copy)
                return u175:Invoke();
            end);
            if v178 then
                if typeof(v177) ~= "table" then
                    v177 = v176;
                end;
            else
                v177 = v176;
            end;
        else
            v177 = v176;
        end;
        local v179;
        if v177 then
            v179 = v177.Players;
        else
            v179 = v177;
        end;
        local v180;
        if v177 then
            v180 = v177.Self;
        else
            v180 = v177;
        end;
        if v177 then
            v177 = v177.Zoom;
        end;
        local v181 = tonumber(v177) or 1;
        local l__AbsoluteSize__19 = u147.AbsoluteSize;
        local v182 = os.clock();
        for v183, v184 in pairs(u148) do
            local l__Frame__20 = v184.Frame;
            if l__Frame__20 and (l__Frame__20.Parent and v184.ExpiresAt > v182) then
                local v185;
                if v179 then
                    v185 = v179[tostring(v183)];
                else
                    v185 = v179;
                end;
                if v185 and v180 then
                    local v186 = tonumber(v185.Radius) or 0;
                    local v187 = l__AbsoluteSize__19.X * 0.5 + ((tonumber(v185.X) or 0) - (tonumber(v180.X) or 0)) * v181;
                    local v188 = l__AbsoluteSize__19.Y * 0.5 + ((tonumber(v185.Y) or 0) - (tonumber(v180.Y) or 0) - v186 - 26) * v181;
                    l__Frame__20.Position = UDim2.fromOffset(math.floor(v187 + 0.5), (math.floor(v188 + 0.5)));
                    local v189;
                    if v187 > -180 and (v187 < l__AbsoluteSize__19.X + 180 and v188 > -120) then
                        v189 = v188 < l__AbsoluteSize__19.Y + 120;
                    else
                        v189 = false;
                    end;
                    l__Frame__20.Visible = v189;
                else
                    l__Frame__20.Visible = false;
                end;
            else
                local v190 = u148[v183];
                if v190 then
                    if v190.Frame then
                        v190.Frame:Destroy();
                    end;
                    u148[v183] = nil;
                end;
            end;
        end;
        if next(u148) == nil and u149 then
            u149:Disconnect();
            u149 = nil;
        end;
    else
        if u149 then
            u149:Disconnect();
            u149 = nil;
        end;
    end;
end;
u150 = function() --[[ Line: 658 ]]
    -- upvalues: u149 (ref), l__RunService__5 (copy), u191 (copy)
    if u149 then
    else
        u149 = l__RunService__5.RenderStepped:Connect(u191);
    end;
end;
if l__TextChatService__3.ChatVersion == Enum.ChatVersion.TextChatService then
    l__TextChatService__3.MessageReceived:Connect(function(p192) --[[ Line: 666 ]]
        -- upvalues: u174 (copy), u111 (copy)
        local l__TextSource__21 = p192.TextSource;
        if l__TextSource__21 then
            u174({
                SenderUserId = l__TextSource__21.UserId,
                Text = p192.Text
            });
            u111(p192);
        end;
    end);
end;
local function u194(p193) --[[ Line: 679 ]]
    -- upvalues: u74 (ref), u73 (ref), u107 (copy), l__TextChatService__3 (copy), u18 (copy), u15 (copy)
    if typeof(p193) == "table" then
        if p193.Kind == "AdminAnnouncementClear" then
            u74 = u74 + 1;
            if u73 then
                u73:Destroy();
                u73 = nil;
            end;
        else
            if p193.Kind == "AdminAnnouncement" and p193.Screen then
                u107(p193.Screen);
            end;
            if p193.Chat == false then
            else
                local l__RichText__22 = p193.RichText;
                local l__PlainText__23 = p193.PlainText;
                local l__Color__24 = p193.Color;
                if typeof(l__RichText__22) == "string" and l__RichText__22 ~= "" then
                    if typeof(l__PlainText__23) ~= "string" or l__PlainText__23 == "" then
                        l__PlainText__23 = tostring(l__RichText__22 or ""):gsub("<br%s*/>", "\n"):gsub("<.->", "");
                    end;
                    if l__TextChatService__3.ChatVersion == Enum.ChatVersion.TextChatService and u18(l__RichText__22) then
                    else
                        u15(l__PlainText__23, l__Color__24);
                    end;
                end;
            end;
        end;
    end;
end;
local function u198(p195) --[[ Line: 719 ]]
    -- upvalues: u194 (copy), u20 (copy)
    local v196 = tostring(p195.DisplayName or (p195.SenderName or "Player"));
    local v197 = tostring(p195.Text or "");
    if v197 == "" then
    else
        u194({
            Color = "#8BD3FF",
            RichText = string.format("<font color=\"#8BD3FF\"><b>[History]</b></font> <font color=\"#FFFFFF\"><b>%s:</b> %s</font>", u20(v196), (u20(v197))),
            PlainText = "[History] " .. v196 .. ": " .. v197
        });
    end;
end;
l__GlobalChatTipsRemote__12.OnClientEvent:Connect(u194);
l__AgeSafeChatRemote__13.OnClientEvent:Connect(function(p199) --[[ Name: handleAgeSafeChat, Line 737 ]]
    -- upvalues: u174 (copy), u198 (copy)
    if typeof(p199) == "table" then
        if p199.Kind == "Live" then
            u174(p199);
        else
            if p199.Kind == "History" then
                u198(p199);
            end;
        end;
    end;
end);
l__AgeSafeChatRemote__13:FireServer({
    Kind = "Ready"
});