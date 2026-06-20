-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.LimitedLocal

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__SocialService__3 = game:GetService("SocialService");
local l__TweenService__4 = game:GetService("TweenService");
local l__VoiceChatService__5 = game:GetService("VoiceChatService");
local l__Workspace__6 = game:GetService("Workspace");
local l__LocalPlayer__7 = l__Players__1.LocalPlayer;
local l__PlayerGui__8 = l__LocalPlayer__7:WaitForChild("PlayerGui");
local l__UnixTimestamp__9 = DateTime.fromUniversalTime(2026, 7, 4, 18, 0, 0).UnixTimestamp;
local u1 = l__ReplicatedStorage__2:FindFirstChild("Remotes");
local u2;
if u1 then
    u2 = u1:FindFirstChild("LikeLimited_GetState");
else
    u2 = u1;
end;
if u1 then
    u1 = u1:FindFirstChild("LikeLimited_Claim");
end;
local v3 = l__PlayerGui__8:FindFirstChild("LimitedRewardGui");
if v3 then
    v3:Destroy();
end;
local u4 = Instance.new("ScreenGui");
u4.Name = "LimitedRewardGui";
u4.ResetOnSpawn = false;
u4.IgnoreGuiInset = false;
u4.DisplayOrder = 150;
u4.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
u4.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets;
u4.Parent = l__PlayerGui__8;
local v5 = {
    Name = "Shade",
    BackgroundTransparency = 0.45,
    Visible = false,
    ZIndex = 100,
    Size = UDim2.fromScale(1, 1),
    BackgroundColor3 = Color3.fromRGB(0, 0, 0)
};
local u6 = Instance.new("Frame");
for v7, v8 in pairs(v5) do
    u6[v7] = v8;
end;
u6.Parent = u4;
local v9 = {
    Name = "Panel",
    Visible = false,
    ZIndex = 101,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromOffset(500, 420),
    BackgroundColor3 = Color3.fromRGB(18, 18, 18)
};
local u10 = Instance.new("Frame");
for v11, v12 in pairs(v9) do
    u10[v11] = v12;
end;
u10.Parent = u4;
local v13 = Instance.new("UICorner");
v13.CornerRadius = UDim.new(0, 22);
v13.Parent = u10;
local v14 = Color3.fromRGB(255, 220, 70);
local v15 = Instance.new("UIStroke");
v15.Color = v14;
v15.Thickness = 2;
v15.Transparency = 0.05;
v15.Parent = u10;
local u16 = Instance.new("UIScale");
for v17, v18 in pairs({
    Scale = 1
}) do
    u16[v17] = v18;
end;
u16.Parent = u10;
local v19 = {
    Rotation = 90,
    Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(42, 42, 42)), ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)) })
};
local v20 = Instance.new("UIGradient");
for v21, v22 in pairs(v19) do
    v20[v21] = v22;
end;
v20.Parent = u10;
local function v25() --[[ Line: 98 ]]
    -- upvalues: l__Workspace__6 (copy), u16 (copy)
    local l__CurrentCamera__10 = l__Workspace__6.CurrentCamera;
    if l__CurrentCamera__10 then
        local l__ViewportSize__11 = l__CurrentCamera__10.ViewportSize;
        local v23 = u16;
        local v24 = math.min(l__ViewportSize__11.X * 0.78 / 500, l__ViewportSize__11.Y * 0.78 / 420);
        v23.Scale = math.clamp(v24, 0.55, 1);
    end;
end;
local l__CurrentCamera__12 = l__Workspace__6.CurrentCamera;
if l__CurrentCamera__12 then
    local l__ViewportSize__13 = l__CurrentCamera__12.ViewportSize;
    local v26 = math.min(l__ViewportSize__13.X * 0.78 / 500, l__ViewportSize__13.Y * 0.78 / 420);
    u16.Scale = math.clamp(v26, 0.55, 1);
end;
if l__Workspace__6.CurrentCamera then
    l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(v25);
end;
local v27 = {
    Name = "CloseButton",
    Text = "X",
    TextScaled = true,
    ZIndex = 110,
    AnchorPoint = Vector2.new(1, 0),
    Position = UDim2.new(1, -12, 0, 12),
    Size = UDim2.fromOffset(36, 36),
    BackgroundColor3 = Color3.fromRGB(55, 55, 55),
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBlack
};
local v28 = Instance.new("TextButton");
for v29, v30 in pairs(v27) do
    v28[v29] = v30;
end;
v28.Parent = u10;
local v31 = Instance.new("UICorner");
v31.CornerRadius = UDim.new(0, 10);
v31.Parent = v28;
local v32 = {
    Name = "Title",
    BackgroundTransparency = 1,
    Text = "LIKE GAME REWARD",
    TextScaled = true,
    ZIndex = 110,
    Position = UDim2.fromOffset(55, 18),
    Size = UDim2.fromOffset(390, 42),
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBlack
};
local v33 = Instance.new("TextLabel");
for v34, v35 in pairs(v32) do
    v33[v34] = v35;
end;
v33.Parent = u10;
local v36 = {
    Name = "Subtitle",
    BackgroundTransparency = 1,
    Text = "Like the game to unlock this limited skin",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 110,
    Position = UDim2.fromOffset(55, 58),
    Size = UDim2.fromOffset(390, 34),
    TextColor3 = Color3.fromRGB(255, 230, 90),
    Font = Enum.Font.GothamBold
};
local v37 = Instance.new("TextLabel");
for v38, v39 in pairs(v36) do
    v37[v38] = v39;
end;
v37.Parent = u10;
local v40 = {
    Name = "SkinHolder",
    ZIndex = 110,
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 102),
    Size = UDim2.fromOffset(92, 92),
    BackgroundColor3 = Color3.fromRGB(5, 5, 5)
};
local v41 = Instance.new("Frame");
for v42, v43 in pairs(v40) do
    v41[v42] = v43;
end;
v41.Parent = u10;
local v44 = Instance.new("UICorner");
v44.CornerRadius = UDim.new(0, 999);
v44.Parent = v41;
local v45 = Color3.fromRGB(255, 220, 70);
local v46 = Instance.new("UIStroke");
v46.Color = v45;
v46.Thickness = 3;
v46.Transparency = 0;
v46.Parent = v41;
local v47 = {
    Name = "SkinImage",
    BackgroundTransparency = 1,
    Image = "rbxassetid://107966257715719",
    ZIndex = 111,
    AnchorPoint = Vector2.new(0.5, 0.5),
    Position = UDim2.fromScale(0.5, 0.5),
    Size = UDim2.fromScale(0.9, 0.9),
    ScaleType = Enum.ScaleType.Fit
};
local v48 = Instance.new("ImageLabel");
for v49, v50 in pairs(v47) do
    v48[v49] = v50;
end;
v48.Parent = v41;
local v51 = Instance.new("UICorner");
v51.CornerRadius = UDim.new(0, 999);
v51.Parent = v48;
local v52 = {
    Name = "RewardName",
    BackgroundTransparency = 1,
    Text = "Like Skin",
    TextScaled = true,
    ZIndex = 110,
    Position = UDim2.fromOffset(70, 197),
    Size = UDim2.fromOffset(360, 34),
    TextColor3 = Color3.fromRGB(255, 255, 255),
    Font = Enum.Font.GothamBlack
};
local v53 = Instance.new("TextLabel");
for v54, v55 in pairs(v52) do
    v53[v54] = v55;
end;
v53.Parent = u10;
local v56 = {
    Name = "Info",
    BackgroundTransparency = 1,
    Text = "Like the game first, then press the button.",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 110,
    Position = UDim2.fromOffset(55, 230),
    Size = UDim2.fromOffset(390, 34),
    TextColor3 = Color3.fromRGB(230, 230, 230),
    Font = Enum.Font.GothamBold
};
local u57 = Instance.new("TextLabel");
for v58, v59 in pairs(v56) do
    u57[v58] = v59;
end;
u57.Parent = u10;
local v60 = {
    Name = "VerifyBox",
    ZIndex = 110,
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 273),
    Size = UDim2.fromOffset(300, 14),
    BackgroundColor3 = Color3.fromRGB(35, 35, 35)
};
local v61 = Instance.new("Frame");
for v62, v63 in pairs(v60) do
    v61[v62] = v63;
end;
v61.Parent = u10;
local v64 = Instance.new("UICorner");
v64.CornerRadius = UDim.new(0, 999);
v64.Parent = v61;
local v65 = Color3.fromRGB(255, 255, 255);
local v66 = Instance.new("UIStroke");
v66.Color = v65;
v66.Thickness = 1;
v66.Transparency = 0.82;
v66.Parent = v61;
local v67 = {
    Name = "VerifyFill",
    ZIndex = 111,
    Size = UDim2.fromScale(0, 1),
    BackgroundColor3 = Color3.fromRGB(255, 215, 65)
};
local u68 = Instance.new("Frame");
for v69, v70 in pairs(v67) do
    u68[v69] = v70;
end;
u68.Parent = v61;
local v71 = Instance.new("UICorner");
v71.CornerRadius = UDim.new(0, 999);
v71.Parent = u68;
local v72 = {
    Name = "TimerBox",
    ZIndex = 110,
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 302),
    Size = UDim2.fromOffset(285, 38),
    BackgroundColor3 = Color3.fromRGB(42, 42, 42)
};
local v73 = Instance.new("Frame");
for v74, v75 in pairs(v72) do
    v73[v74] = v75;
end;
v73.Parent = u10;
local v76 = Instance.new("UICorner");
v76.CornerRadius = UDim.new(0, 13);
v76.Parent = v73;
local v77 = Color3.fromRGB(255, 255, 255);
local v78 = Instance.new("UIStroke");
v78.Color = v77;
v78.Thickness = 1;
v78.Transparency = 0.75;
v78.Parent = v73;
local v79 = {
    Name = "TimerText",
    BackgroundTransparency = 1,
    Text = "Loading...",
    TextScaled = true,
    ZIndex = 111,
    Size = UDim2.fromScale(1, 1),
    TextColor3 = Color3.fromRGB(255, 230, 90),
    Font = Enum.Font.GothamBlack
};
local u80 = Instance.new("TextLabel");
for v81, v82 in pairs(v79) do
    u80[v81] = v82;
end;
u80.Parent = v73;
local v83 = {
    Name = "ClaimButton",
    Text = "I LIKED, CHECK NOW",
    TextScaled = true,
    ZIndex = 110,
    AutoButtonColor = true,
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 350),
    Size = UDim2.fromOffset(300, 46),
    BackgroundColor3 = Color3.fromRGB(255, 215, 65),
    TextColor3 = Color3.fromRGB(20, 20, 20),
    Font = Enum.Font.GothamBlack
};
local u84 = Instance.new("TextButton");
for v85, v86 in pairs(v83) do
    u84[v85] = v86;
end;
u84.Parent = u10;
local v87 = Instance.new("UICorner");
v87.CornerRadius = UDim.new(0, 15);
v87.Parent = u84;
local v88 = Color3.fromRGB(255, 255, 255);
local v89 = Instance.new("UIStroke");
v89.Color = v88;
v89.Thickness = 2;
v89.Transparency = 0.45;
v89.Parent = u84;
local v90 = {
    Name = "VerifyStatus",
    BackgroundTransparency = 1,
    Text = "",
    TextScaled = true,
    TextWrapped = true,
    ZIndex = 110,
    AnchorPoint = Vector2.new(0.5, 0),
    Position = UDim2.new(0.5, 0, 0, 398),
    Size = UDim2.fromOffset(340, 18),
    TextColor3 = Color3.fromRGB(180, 180, 180),
    Font = Enum.Font.GothamMedium
};
local u91 = Instance.new("TextLabel");
for v92, v93 in pairs(v90) do
    u91[v92] = v93;
end;
u91.Parent = u10;
local u94 = nil;
local u95 = nil;
local u96 = nil;
local u97 = nil;
local u98 = false;
local u99 = false;
local u100 = false;
local u101 = nil;
local u102 = false;
local u103 = 0;
local u104 = false;
local function u105() --[[ Line: 313 ]]
    -- upvalues: u103 (ref), u84 (copy), u57 (copy), u91 (copy), l__TweenService__4 (copy), u68 (copy)
    u103 = u103 + 1;
    u84.Active = true;
    u84.AutoButtonColor = true;
    u84.Text = "I LIKED, CHECK NOW";
    u57.Text = "Like the game first, then press the button.";
    u91.Text = "";
    l__TweenService__4:Create(u68, TweenInfo.new(0.18), {
        Size = UDim2.fromScale(0, 1)
    }):Play();
end;
local function u110() --[[ Line: 328 ]]
    -- upvalues: u103 (ref), u84 (copy), u57 (copy), u91 (copy), u68 (copy), l__TweenService__4 (copy)
    u103 = u103 + 1;
    local u106 = u103;
    u84.Active = false;
    u84.AutoButtonColor = false;
    u84.Text = "CHECKING...";
    u57.Text = "Checking your like.";
    u91.Text = "Starting verification";
    u68.Size = UDim2.fromScale(0, 1);
    l__TweenService__4:Create(u68, TweenInfo.new(2.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
        Size = UDim2.fromScale(1, 1)
    }):Play();
    task.spawn(function() --[[ Line: 344 ]]
        -- upvalues: u103 (ref), u106 (copy), u84 (ref), u91 (ref)
        local v107 = 0;
        while u103 == u106 do
            local v108 = v107 + 1;
            v107 = v108 > 3 and 1 or v108;
            local v109 = string.rep(".", v107);
            u84.Text = "CHECKING" .. v109;
            if v107 == 1 then
                u91.Text = "Checking like" .. v109;
            elseif v107 == 2 then
                u91.Text = "Verifying reward" .. v109;
            else
                u91.Text = "Almost done" .. v109;
            end;
            task.wait(0.35);
        end;
    end);
end;
local function u111() --[[ Line: 371 ]]
    -- upvalues: u103 (ref), l__TweenService__4 (copy), u68 (copy)
    u103 = u103 + 1;
    l__TweenService__4:Create(u68, TweenInfo.new(0.15), {
        Size = UDim2.fromScale(1, 1)
    }):Play();
end;
local function u114() --[[ Line: 379 ]]
    -- upvalues: u102 (ref), l__Workspace__6 (copy), u16 (copy), u6 (copy), u10 (copy), l__TweenService__4 (copy)
    if u102 then
    else
        local l__CurrentCamera__14 = l__Workspace__6.CurrentCamera;
        if l__CurrentCamera__14 then
            local l__ViewportSize__15 = l__CurrentCamera__14.ViewportSize;
            local v112 = u16;
            local v113 = math.min(l__ViewportSize__15.X * 0.78 / 500, l__ViewportSize__15.Y * 0.78 / 420);
            v112.Scale = math.clamp(v113, 0.55, 1);
        end;
        u102 = true;
        u6.Visible = true;
        u10.Visible = true;
        u6.BackgroundTransparency = 1;
        u10.Position = UDim2.fromScale(0.5, 0.55);
        l__TweenService__4:Create(u6, TweenInfo.new(0.12), {
            BackgroundTransparency = 0.45
        }):Play();
        l__TweenService__4:Create(u10, TweenInfo.new(0.18, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.fromScale(0.5, 0.5)
        }):Play();
    end;
end;
local function u116() --[[ Line: 402 ]]
    -- upvalues: u102 (ref), l__TweenService__4 (copy), u6 (copy), u10 (copy)
    if u102 then
        u102 = false;
        l__TweenService__4:Create(u6, TweenInfo.new(0.1), {
            BackgroundTransparency = 1
        }):Play();
        local v115 = l__TweenService__4:Create(u10, TweenInfo.new(0.1), {
            Position = UDim2.fromScale(0.5, 0.54)
        });
        v115:Play();
        v115.Completed:Once(function() --[[ Line: 419 ]]
            -- upvalues: u102 (ref), u6 (ref), u10 (ref)
            if not u102 then
                u6.Visible = false;
                u10.Visible = false;
            end;
        end);
    end;
end;
local function u117() --[[ Line: 427 ]]
    -- upvalues: u102 (ref), u116 (copy), u114 (copy)
    if u102 then
        u116();
    else
        u114();
    end;
end;
local function u122() --[[ Line: 435 ]]
    -- upvalues: u101 (ref), u100 (ref), l__SocialService__3 (copy)
    if u101 == Enum.RsvpStatus.Going or u100 then
    else
        u100 = true;
        task.spawn(function() --[[ Line: 441 ]]
            -- upvalues: l__SocialService__3 (ref), u100 (ref), u101 (ref)
            local v118, v119 = pcall(function() --[[ Line: 442 ]]
                -- upvalues: l__SocialService__3 (ref)
                return l__SocialService__3:GetEventRsvpStatusAsync("2658809578057237113");
            end);
            if v118 then
                u101 = v119;
                if u101 == Enum.RsvpStatus.Going then
                    u100 = false;
                else
                    local v120, v121 = pcall(function() --[[ Line: 458 ]]
                        -- upvalues: l__SocialService__3 (ref)
                        return l__SocialService__3:PromptRsvpToEventAsync("2658809578057237113");
                    end);
                    if v120 then
                        u101 = v121;
                    else
                        warn("Event RSVP prompt failed:", v121);
                    end;
                    u100 = false;
                end;
            else
                warn("Event RSVP status check failed:", v119);
                u100 = false;
            end;
        end);
    end;
end;
local function u128(p123) --[[ Line: 484 ]]
    -- upvalues: u97 (ref), l__Workspace__6 (copy), u98 (ref), u95 (ref), u96 (ref)
    local v124 = p123 or u97;
    if v124 then
        u97 = v124;
        local v125 = v124:FindFirstChildOfClass("UIPadding");
        if not v125 then
            v125 = Instance.new("UIPadding");
            v125.Parent = v124;
        end;
        local l__new__16 = UDim.new;
        local l__CurrentCamera__17 = l__Workspace__6.CurrentCamera;
        local v126 = l__CurrentCamera__17 and l__CurrentCamera__17.ViewportSize.X or 0;
        v125.PaddingLeft = l__new__16(0, u98 and 208 or (v126 > 0 and v126 < 720 and 124 or 170));
        v125.PaddingTop = UDim.new(0, 14);
        local v127 = v124:FindFirstChildOfClass("UIListLayout");
        if v127 then
            v127.Padding = UDim.new(0, 3);
        end;
        if u95 then
            u95.LayoutOrder = 0;
        end;
        if u96 then
            u96.LayoutOrder = 1;
        end;
    end;
end;
local function v131() --[[ Line: 511 ]]
    -- upvalues: l__VoiceChatService__5 (copy), l__LocalPlayer__7 (copy), u98 (ref), u128 (copy)
    local v129, v130 = pcall(function() --[[ Line: 512 ]]
        -- upvalues: l__VoiceChatService__5 (ref), l__LocalPlayer__7 (ref)
        return l__VoiceChatService__5:IsVoiceEnabledForUserIdAsync(l__LocalPlayer__7.UserId);
    end);
    if v129 then
        v129 = v130 == true;
    end;
    u98 = v129;
    u128();
end;
local function u135() --[[ Line: 519 ]]
    -- upvalues: l__PlayerGui__8 (copy), u95 (ref)
    local v132 = l__PlayerGui__8:FindFirstChild("Temp") or l__PlayerGui__8:WaitForChild("Temp", 5);
    if v132 then
        v132 = v132:FindFirstChild("Event");
    end;
    if v132 then
        for _, v133 in ipairs({ "Limited", "ModeZForumButton", "LikeRewardTopButton" }) do
            local v134 = v132:FindFirstChild(v133);
            if v134 and v134 ~= u95 then
                v134:Destroy();
            end;
        end;
    end;
end;
local function u152() --[[ Line: 533 ]]
    -- upvalues: l__PlayerGui__8 (copy), u128 (copy), u117 (copy), u95 (ref)
    local v136 = l__PlayerGui__8:FindFirstChild("Temp") or l__PlayerGui__8:WaitForChild("Temp", 30);
    if v136 then
        v136 = v136:WaitForChild("Event", 30);
    end;
    if not v136 then
        return nil;
    end;
    u128(v136);
    local v137 = v136:FindFirstChild("ModeLimitedButton");
    if v137 then
        v137:Destroy();
    end;
    local v138 = v136:FindFirstChild("Friend");
    local v139;
    if v138 and v138:IsA("GuiButton") then
        v139 = v138:Clone();
        v139.Name = "ModeLimitedButton";
        v139.Visible = true;
        v139.LayoutOrder = 0;
        v139.Parent = v136;
    else
        local v140 = {
            Name = "ModeLimitedButton",
            BackgroundTransparency = 0.18,
            BorderSizePixel = 0,
            Text = "",
            LayoutOrder = 0,
            Visible = true,
            Size = UDim2.fromOffset(42, 42),
            BackgroundColor3 = Color3.new(0, 0, 0)
        };
        v139 = Instance.new("TextButton");
        for v141, v142 in pairs(v140) do
            v139[v141] = v142;
        end;
        v139.Parent = v136;
        local v143 = Instance.new("UICorner");
        v143.CornerRadius = UDim.new(0, 10);
        v143.Parent = v139;
    end;
    v139:SetAttribute("SfxKind", "Open");
    v139.AutoButtonColor = true;
    v139.Size = UDim2.fromOffset(42, 42);
    v139.Visible = true;
    for _, v144 in ipairs(v139:GetChildren()) do
        if v144:IsA("UIAspectRatioConstraint") then
            v144:Destroy();
        end;
    end;
    if v139:IsA("ImageButton") then
        v139.Image = "rbxassetid://0";
        v139.ImageTransparency = 0.3;
    end;
    local v145 = v139:FindFirstChildWhichIsA("TextLabel", true);
    local v146;
    if v145 then
        v146 = v139;
    else
        local v147 = {
            Name = "TextLabel",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        v145 = Instance.new("TextLabel");
        v146 = v139;
        for v148, v149 in pairs(v147) do
            v145[v148] = v149;
        end;
        v145.Parent = v139;
    end;
    v145.Text = "Limited";
    v145.TextColor3 = Color3.fromRGB(255, 230, 90);
    v145.TextScaled = true;
    v145.TextWrapped = true;
    v145.TextXAlignment = Enum.TextXAlignment.Center;
    v145.TextYAlignment = Enum.TextYAlignment.Center;
    v145.Font = Enum.Font.GothamBlack;
    local v150 = v145:FindFirstChildOfClass("UITextSizeConstraint");
    if v150 then
        v150:Destroy();
    end;
    local v151 = Instance.new("UITextSizeConstraint");
    v151.MaxTextSize = 10;
    v151.MinTextSize = 7;
    v151.Parent = v145;
    v146.Activated:Connect(u117);
    u95 = v146;
    u128(v136);
    return v146;
end;
local function u169() --[[ Line: 614 ]]
    -- upvalues: l__PlayerGui__8 (copy), u128 (copy), u122 (copy), u96 (ref)
    local v153 = l__PlayerGui__8:FindFirstChild("Temp") or l__PlayerGui__8:WaitForChild("Temp", 30);
    if v153 then
        v153 = v153:WaitForChild("Event", 30);
    end;
    if not v153 then
        return nil;
    end;
    u128(v153);
    local v154 = v153:FindFirstChild("ModeEventButton");
    if v154 then
        v154:Destroy();
    end;
    local v155 = v153:FindFirstChild("Friend");
    local v156;
    if v155 and v155:IsA("GuiButton") then
        v156 = v155:Clone();
        v156.Name = "ModeEventButton";
        v156.Visible = true;
        v156.LayoutOrder = 1;
        v156.Parent = v153;
    else
        local v157 = {
            Name = "ModeEventButton",
            BackgroundTransparency = 0.18,
            BorderSizePixel = 0,
            Text = "",
            LayoutOrder = 1,
            Visible = true,
            Size = UDim2.fromOffset(42, 42),
            BackgroundColor3 = Color3.new(0, 0, 0)
        };
        v156 = Instance.new("TextButton");
        for v158, v159 in pairs(v157) do
            v156[v158] = v159;
        end;
        v156.Parent = v153;
        local v160 = Instance.new("UICorner");
        v160.CornerRadius = UDim.new(0, 10);
        v160.Parent = v156;
    end;
    v156:SetAttribute("SfxKind", "Open");
    v156.AutoButtonColor = true;
    v156.Size = UDim2.fromOffset(42, 42);
    v156.Visible = true;
    for _, v161 in ipairs(v156:GetChildren()) do
        if v161:IsA("UIAspectRatioConstraint") then
            v161:Destroy();
        end;
    end;
    if v156:IsA("ImageButton") then
        v156.Image = "rbxassetid://0";
        v156.ImageTransparency = 0.3;
    end;
    local v162 = v156:FindFirstChildWhichIsA("TextLabel", true);
    local v163;
    if v162 then
        v163 = v156;
    else
        local v164 = {
            Name = "TextLabel",
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 1)
        };
        v162 = Instance.new("TextLabel");
        v163 = v156;
        for v165, v166 in pairs(v164) do
            v162[v165] = v166;
        end;
        v162.Parent = v156;
    end;
    v162.Text = "Event";
    v162.TextColor3 = Color3.fromRGB(125, 220, 255);
    v162.TextScaled = true;
    v162.TextWrapped = true;
    v162.TextXAlignment = Enum.TextXAlignment.Center;
    v162.TextYAlignment = Enum.TextYAlignment.Center;
    v162.Font = Enum.Font.GothamBlack;
    local v167 = v162:FindFirstChildOfClass("UITextSizeConstraint");
    if v167 then
        v167:Destroy();
    end;
    local v168 = Instance.new("UITextSizeConstraint");
    v168.MaxTextSize = 12;
    v168.MinTextSize = 8;
    v168.Parent = v162;
    v163.Activated:Connect(u122);
    u96 = v163;
    u128(v153);
    return v163;
end;
local function u203() --[[ Line: 694 ]]
    -- upvalues: u135 (copy), l__PlayerGui__8 (copy), u114 (copy), u94 (ref)
    u135();
    local v170 = l__PlayerGui__8:FindFirstChild("Gui") or l__PlayerGui__8:WaitForChild("Gui", 10);
    if v170 then
        v170 = v170:FindFirstChild("Menu");
    end;
    if v170 then
        v170 = v170:FindFirstChild("Center");
    end;
    if not (v170 and v170:IsA("GuiObject")) then
        return nil;
    end;
    local v171 = v170:FindFirstChild("LikeRewardPrompt");
    if v171 then
        v171:Destroy();
    end;
    local v172 = {
        Name = "LikeRewardPrompt",
        BackgroundTransparency = 0.14,
        BorderSizePixel = 0,
        ZIndex = 45,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0.43, 0),
        Size = UDim2.new(0.92, 0, 0.245, 0),
        BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    };
    local v173 = Instance.new("Frame");
    for v174, v175 in pairs(v172) do
        v173[v174] = v175;
    end;
    v173.Parent = v170;
    local v176 = Instance.new("UICorner");
    v176.CornerRadius = UDim.new(0, 8);
    v176.Parent = v173;
    local v177 = Color3.fromRGB(255, 215, 65);
    local v178 = Instance.new("UIStroke");
    v178.Color = v177;
    v178.Thickness = 1;
    v178.Transparency = 0.25;
    v178.Parent = v173;
    local v179 = {
        Name = "RewardSkinIcon",
        BorderSizePixel = 0,
        Image = "rbxassetid://107966257715719",
        ZIndex = 46,
        BackgroundColor3 = Color3.fromRGB(5, 5, 5),
        Position = UDim2.new(0, 8, 0, 9),
        Size = UDim2.fromOffset(40, 40),
        ScaleType = Enum.ScaleType.Fit
    };
    local v180 = Instance.new("ImageLabel");
    for v181, v182 in pairs(v179) do
        v180[v181] = v182;
    end;
    v180.Parent = v173;
    local v183 = Instance.new("UICorner");
    v183.CornerRadius = UDim.new(0, 999);
    v183.Parent = v180;
    local v184 = Color3.fromRGB(255, 215, 65);
    local v185 = Instance.new("UIStroke");
    v185.Color = v184;
    v185.Thickness = 1;
    v185.Transparency = 0.15;
    v185.Parent = v180;
    local v186 = {
        Name = "RewardTitle",
        BackgroundTransparency = 1,
        Text = "LIKE THE GAME",
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 46,
        Position = UDim2.new(0, 56, 0, 5),
        Size = UDim2.new(1, -64, 0.25, 0),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBlack
    };
    local v187 = Instance.new("TextLabel");
    for v188, v189 in pairs(v186) do
        v187[v188] = v189;
    end;
    v187.Parent = v173;
    local v190 = {
        Name = "RewardName",
        BackgroundTransparency = 1,
        Text = "Get: Like Skin",
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 46,
        Position = UDim2.new(0, 56, 0.29, 0),
        Size = UDim2.new(1, -64, 0.23, 0),
        TextColor3 = Color3.fromRGB(255, 230, 90),
        TextXAlignment = Enum.TextXAlignment.Left,
        Font = Enum.Font.GothamBold
    };
    local v191 = Instance.new("TextLabel");
    for v192, v193 in pairs(v190) do
        v191[v192] = v193;
    end;
    v191.Parent = v173;
    local v194 = {
        Name = "RewardText",
        BackgroundTransparency = 1,
        Text = "Claim the free limited skin after liking.",
        TextScaled = true,
        TextWrapped = true,
        ZIndex = 46,
        Position = UDim2.new(0, 8, 0.52, 0),
        Size = UDim2.new(1, -16, 0.18, 0),
        TextColor3 = Color3.fromRGB(230, 230, 230),
        Font = Enum.Font.GothamBold
    };
    local v195 = Instance.new("TextLabel");
    for v196, v197 in pairs(v194) do
        v195[v196] = v197;
    end;
    v195.Parent = v173;
    local v198 = {
        Name = "LikeRewardButton",
        BorderSizePixel = 0,
        Text = "CLAIM LIKE SKIN",
        TextScaled = true,
        ZIndex = 46,
        AutoButtonColor = true,
        Position = UDim2.new(0, 8, 0.735, 0),
        Size = UDim2.new(1, -16, 0.22, 0),
        BackgroundColor3 = Color3.fromRGB(255, 215, 65),
        TextColor3 = Color3.fromRGB(18, 18, 18),
        Font = Enum.Font.GothamBlack
    };
    local v199 = Instance.new("TextButton");
    for v200, v201 in pairs(v198) do
        v199[v200] = v201;
    end;
    v199.Parent = v173;
    local v202 = Instance.new("UICorner");
    v202.CornerRadius = UDim.new(0, 7);
    v202.Parent = v199;
    v199.Activated:Connect(u114);
    u94 = v173;
    return v173;
end;
local function u204() --[[ Line: 795 ]]
    -- upvalues: u116 (copy), u4 (copy), u94 (ref), u95 (ref)
    u116();
    u4.Enabled = false;
    if u94 then
        u94.Visible = false;
    end;
    if u95 then
        u95.Visible = false;
    end;
end;
task.spawn(function() --[[ Name: tryAutoOpenRewardPrompt, Line 824 ]]
    -- upvalues: u104 (ref), u2 (copy), l__UnixTimestamp__9 (ref), u204 (copy), u4 (copy), u114 (copy)
    if u104 then
    else
        task.spawn(function() --[[ Line: 829 ]]
            -- upvalues: u2 (ref), l__UnixTimestamp__9 (ref), u204 (ref), u104 (ref), u4 (ref), u114 (ref)
            for v205 = 1, 6 do
                local v206;
                if u2 then
                    local v207;
                    v207, v206 = pcall(function() --[[ Line: 812 ]]
                        -- upvalues: u2 (ref)
                        return u2:InvokeServer();
                    end);
                    if not v207 then
                        warn(v206);
                        v206 = nil;
                    end;
                else
                    v206 = nil;
                end;
                if v206 then
                    l__UnixTimestamp__9 = v206.EndUnix or l__UnixTimestamp__9;
                    if v206.Active == false then
                        task.defer(u204);
                        return;
                    else
                        if v206.Owned ~= true then
                            u104 = true;
                            task.delay(1.25, function() --[[ Line: 840 ]]
                                -- upvalues: u4 (ref), u114 (ref)
                                if u4.Parent and u4.Enabled ~= false then
                                    u114();
                                end;
                            end);
                        end;
                        return;
                    end;
                end;
                if v205 < 6 then
                    task.wait(1.5);
                end;
            end;
        end);
    end;
end);
v28.Activated:Connect(u116);
u84.Activated:Connect(function() --[[ Line: 860 ]]
    -- upvalues: u99 (ref), u1 (copy), u84 (copy), u91 (copy), u57 (copy), u105 (copy), u110 (copy), u111 (copy), u94 (ref), u116 (copy), u4 (copy), u95 (ref)
    if u99 then
    elseif u1 then
        u99 = true;
        u110();
        local v208 = os.clock();
        local v209, v210 = pcall(function() --[[ Line: 885 ]]
            -- upvalues: u1 (ref)
            return u1:InvokeServer();
        end);
        local v211 = os.clock() - v208;
        if v211 < 2.4 then
            task.wait(2.4 - v211);
        end;
        u111();
        if v209 then
            if v210 and v210.Success then
                if v210.Code == "AlreadyOwned" then
                    u84.Text = "ALREADY OWNED";
                    u91.Text = "Already verified";
                    u57.Text = "This skin is already in your inventory.";
                else
                    u84.Text = "SKIN UNLOCKED";
                    u91.Text = "Like confirmed";
                    u57.Text = "Reward unlocked.";
                end;
                if u94 then
                    u94.Visible = true;
                    local v212 = u94:FindFirstChild("LikeRewardButton");
                    if v212 and v212:IsA("TextButton") then
                        v212.Text = "LIKE SKIN OWNED";
                        v212.Active = false;
                        v212.AutoButtonColor = false;
                        v212.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
                    end;
                end;
                u84.Active = false;
                u84.AutoButtonColor = false;
                u99 = false;
            else
                if v210 then
                    v210 = v210.Code;
                end;
                if v210 == "NotLiked" then
                    u84.Text = "LIKE NOT FOUND";
                    u91.Text = "Like not detected";
                    u57.Text = "Like the game first, then press again.";
                else
                    if v210 == "EventEnded" then
                        u84.Text = "EVENT ENDED";
                        u91.Text = "Reward expired";
                        u57.Text = "This reward is no longer available.";
                        task.wait(0.8);
                        u116();
                        u4.Enabled = false;
                        if u94 then
                            u94.Visible = false;
                        end;
                        if u95 then
                            u95.Visible = false;
                        end;
                        u99 = false;
                        return;
                    end;
                    u84.Text = "TRY AGAIN";
                    u91.Text = "Check failed";
                    u57.Text = "Verification was not completed.";
                end;
                task.wait(1.6);
                u99 = false;
                u105();
            end;
        else
            warn(v210);
            u84.Text = "TRY AGAIN";
            u91.Text = "Check failed";
            u57.Text = "The server did not confirm the like.";
            task.wait(1.5);
            u99 = false;
            u105();
        end;
    else
        u99 = true;
        u84.Active = false;
        u84.AutoButtonColor = false;
        u84.Text = "SERVER ERROR";
        u91.Text = "Check unavailable";
        u57.Text = "Server did not respond.";
        task.wait(1.4);
        u99 = false;
        u105();
    end;
end);
task.spawn(function() --[[ Name: connectLimitedButton, Line 965 ]]
    -- upvalues: u135 (copy), u203 (copy), u152 (copy), u169 (copy), u2 (copy), u94 (ref), u95 (ref)
    u135();
    local u213 = u203();
    u152();
    u169();
    if not u213 then
        warn("Lobby like reward prompt container not found");
    end;
    task.spawn(function() --[[ Line: 974 ]]
        -- upvalues: u2 (ref), u94 (ref), u95 (ref), u213 (copy)
        local v214;
        if u2 then
            local v215;
            v215, v214 = pcall(function() --[[ Line: 812 ]]
                -- upvalues: u2 (ref)
                return u2:InvokeServer();
            end);
            if not v215 then
                warn(v214);
                v214 = nil;
            end;
        else
            v214 = nil;
        end;
        if v214 then
            if v214.Active == false then
                if u94 then
                    u94.Visible = false;
                end;
                if u95 then
                    u95.Visible = false;
                end;
            else
                if v214.Owned == true and u213 then
                    local v216 = u213:FindFirstChild("LikeRewardButton");
                    if v216 and v216:IsA("TextButton") then
                        v216.Text = "LIKE SKIN OWNED";
                        v216.Active = false;
                        v216.AutoButtonColor = false;
                        v216.BackgroundColor3 = Color3.fromRGB(150, 150, 150);
                    end;
                end;
            end;
        end;
    end);
end);
task.spawn(v131);
if l__Workspace__6.CurrentCamera then
    l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 1004 ]]
        -- upvalues: u128 (copy)
        u128();
    end);
end;
l__Workspace__6:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 1008 ]]
    -- upvalues: l__Workspace__6 (copy), u128 (copy)
    if l__Workspace__6.CurrentCamera then
        l__Workspace__6.CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 1010 ]]
            -- upvalues: u128 (ref)
            u128();
        end);
    end;
    u128();
end);
task.spawn(function() --[[ Line: 1017 ]]
    -- upvalues: u4 (copy), l__UnixTimestamp__9 (ref), u116 (copy), u94 (ref), u95 (ref), u80 (copy)
    while u4.Parent do
        local v217 = l__UnixTimestamp__9 - os.time();
        if v217 <= 0 then
            u116();
            u4.Enabled = false;
            if u94 then
                u94.Visible = false;
            end;
            if u95 then
                u95.Visible = false;
                return;
            end;
            break;
        end;
        local v218 = u80;
        local v219 = math.max(0, v217);
        local v220 = math.floor(v219 / 86400);
        local v221 = v219 % 86400;
        local v222 = math.floor(v221 / 3600);
        local v223 = v221 % 3600;
        local v224 = math.floor(v223 / 60);
        v218.Text = "ENDS IN " .. string.format("%dd %02d:%02d:%02d", v220, v222, v224, v223 % 60);
        task.wait(1);
    end;
end);
task.spawn(function() --[[ Line: 1032 ]]
    -- upvalues: u84 (copy), u99 (ref), l__TweenService__4 (copy)
    while u84.Parent do
        if u99 then
            task.wait(0.1);
        else
            l__TweenService__4:Create(u84, TweenInfo.new(0.45), {
                BackgroundColor3 = Color3.fromRGB(255, 235, 95)
            }):Play();
            task.wait(0.45);
            l__TweenService__4:Create(u84, TweenInfo.new(0.45), {
                BackgroundColor3 = Color3.fromRGB(255, 215, 65)
            }):Play();
            task.wait(0.45);
        end;
    end;
end);