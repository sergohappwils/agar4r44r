-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.PlayerProfilePopupClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__StarterGui__2 = game:GetService("StarterGui");
local l__UserInputService__3 = game:GetService("UserInputService");
local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
local l__PlayerGui__5 = l__LocalPlayer__4:WaitForChild("PlayerGui");
local v1 = l__PlayerGui__5:FindFirstChild("AgaricOpenPlayerProfile");
if v1 and not v1:IsA("BindableEvent") then
    v1:Destroy();
    v1 = nil;
end;
if not v1 then
    v1 = Instance.new("BindableEvent");
    v1.Name = "AgaricOpenPlayerProfile";
    v1.Parent = l__PlayerGui__5;
end;
local u2 = Instance.new("ScreenGui");
u2.Name = "AgaricPlayerProfileGui";
u2.ResetOnSpawn = false;
u2.IgnoreGuiInset = true;
u2.DisplayOrder = 10050;
u2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
u2.Parent = l__PlayerGui__5;
local u3 = Instance.new("Frame");
u3.Name = "ProfilePanel";
u3.Size = UDim2.fromOffset(286, 178);
u3.BackgroundColor3 = Color3.fromRGB(32, 34, 40);
u3.BackgroundTransparency = 0.03;
u3.BorderSizePixel = 0;
u3.Visible = false;
u3.ZIndex = 100;
u3.Parent = u2;
local v4 = Instance.new("UICorner");
v4.CornerRadius = UDim.new(0, 8);
v4.Parent = u3;
local v5 = Instance.new("UIStroke");
v5.Color = Color3.fromRGB(86, 90, 104);
v5.Transparency = 0.25;
v5.Thickness = 1;
v5.Parent = u3;
local u6 = Instance.new("ImageLabel");
u6.Name = "Avatar";
u6.Size = UDim2.fromOffset(58, 58);
u6.Position = UDim2.fromOffset(14, 14);
u6.BackgroundColor3 = Color3.fromRGB(20, 22, 27);
u6.BorderSizePixel = 0;
u6.Image = "";
u6.ZIndex = u3.ZIndex + 1;
u6.Parent = u3;
local v7 = Instance.new("UICorner");
v7.CornerRadius = UDim.new(1, 0);
v7.Parent = u6;
local u8 = Instance.new("TextLabel");
u8.Name = "DisplayName";
u8.Size = UDim2.new(1, -112, 0, 30);
u8.Position = UDim2.fromOffset(84, 15);
u8.BackgroundTransparency = 1;
u8.Font = Enum.Font.GothamBold;
u8.Text = "Player";
u8.TextColor3 = Color3.fromRGB(255, 255, 255);
u8.TextSize = 18;
u8.TextXAlignment = Enum.TextXAlignment.Left;
u8.TextTruncate = Enum.TextTruncate.AtEnd;
u8.ZIndex = u3.ZIndex + 1;
u8.Parent = u3;
local u9 = Instance.new("TextLabel");
u9.Name = "Username";
u9.Size = UDim2.new(1, -112, 0, 24);
u9.Position = UDim2.fromOffset(84, 44);
u9.BackgroundTransparency = 1;
u9.Font = Enum.Font.GothamMedium;
u9.Text = "@Player";
u9.TextColor3 = Color3.fromRGB(184, 190, 205);
u9.TextSize = 14;
u9.TextXAlignment = Enum.TextXAlignment.Left;
u9.TextTruncate = Enum.TextTruncate.AtEnd;
u9.ZIndex = u3.ZIndex + 1;
u9.Parent = u3;
local v10 = Instance.new("TextButton");
v10.Name = "Close";
v10.Size = UDim2.fromOffset(30, 30);
v10.Position = UDim2.new(1, -38, 0, 10);
v10.BackgroundColor3 = Color3.fromRGB(48, 50, 58);
v10.BorderSizePixel = 0;
v10.AutoButtonColor = true;
v10.Font = Enum.Font.GothamBold;
v10.Text = "X";
v10.TextColor3 = Color3.fromRGB(220, 224, 235);
v10.TextSize = 14;
v10.ZIndex = u3.ZIndex + 2;
v10.Parent = u3;
local v11 = Instance.new("UICorner");
v11.CornerRadius = UDim.new(0, 6);
v11.Parent = v10;
local u12 = Instance.new("TextLabel");
u12.Name = "Status";
u12.Size = UDim2.new(1, -28, 0, 38);
u12.Position = UDim2.fromOffset(14, 82);
u12.BackgroundTransparency = 1;
u12.Font = Enum.Font.Gotham;
u12.Text = "";
u12.TextColor3 = Color3.fromRGB(190, 195, 208);
u12.TextSize = 13;
u12.TextWrapped = true;
u12.TextXAlignment = Enum.TextXAlignment.Left;
u12.TextYAlignment = Enum.TextYAlignment.Top;
u12.ZIndex = u3.ZIndex + 1;
u12.Parent = u3;
local u13 = Instance.new("TextButton");
u13.Name = "AddFriend";
u13.Size = UDim2.new(1, -28, 0, 38);
u13.Position = UDim2.new(0, 14, 1, -52);
u13.BackgroundColor3 = Color3.fromRGB(72, 162, 96);
u13.BorderSizePixel = 0;
u13.AutoButtonColor = true;
u13.Font = Enum.Font.GothamBold;
u13.Text = "Add Friend";
u13.TextColor3 = Color3.fromRGB(255, 255, 255);
u13.TextSize = 15;
u13.ZIndex = u3.ZIndex + 1;
u13.Parent = u3;
local v14 = Instance.new("UICorner");
v14.CornerRadius = UDim.new(0, 7);
v14.Parent = u13;
local u15 = nil;
local u16 = nil;
local function u19(p17, p18) --[[ Line: 162 ]]
    -- upvalues: u13 (copy)
    u13.Text = p18;
    u13.Active = p17;
    u13.AutoButtonColor = p17;
    u13.BackgroundColor3 = p17 and Color3.fromRGB(72, 162, 96) or Color3.fromRGB(62, 64, 72);
    u13.TextColor3 = p17 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(168, 173, 186);
end;
local function u28(p20) --[[ Line: 170 ]]
    -- upvalues: u3 (copy)
    local l__CurrentCamera__6 = workspace.CurrentCamera;
    local v21;
    if l__CurrentCamera__6 then
        v21 = l__CurrentCamera__6.ViewportSize;
    else
        v21 = Vector2.new(1280, 720);
    end;
    local v22 = math.floor((p20 and p20.X or v21.X * 0.5) + 14);
    local v23 = math.max(8, v21.X - 286 - 8);
    local v24 = math.clamp(v22, 8, v23);
    local v25 = math.floor((p20 and p20.Y or v21.Y * 0.5) + 14);
    local v26 = math.max(8, v21.Y - 178 - 8);
    local v27 = math.clamp(v25, 8, v26);
    u3.Position = UDim2.fromOffset(v24, v27);
end;
local function u43(p29, p30, p31) --[[ Line: 187 ]]
    -- upvalues: u15 (ref), u16 (ref), l__Players__1 (copy), u28 (copy), u3 (copy), u8 (copy), u9 (copy), u6 (copy), u12 (copy), l__LocalPlayer__4 (copy), u13 (copy), u19 (copy)
    local u32 = tonumber(p29);
    if u32 then
        u15 = u32;
        u16 = l__Players__1:GetPlayerByUserId(u32);
        u28(p30);
        u3.Visible = true;
        local v33 = u16 and u16.DisplayName;
        if not v33 then
            local v34;
            if p31 then
                v34 = p31:GetAttribute("AgaricProfileDisplayName");
                if type(v34) ~= "string" or v34 == "" then
                    v34 = nil;
                end;
            else
                v34 = nil;
            end;
            v33 = v34 or "Player";
        end;
        local v35 = u16 and u16.Name;
        if not v35 then
            local v36;
            if p31 then
                v36 = p31:GetAttribute("AgaricProfileName");
                if type(v36) ~= "string" or v36 == "" then
                    v36 = nil;
                end;
            else
                v36 = nil;
            end;
            v35 = v36 or "";
        end;
        u8.Text = (v33 == "" or not v33) and "Player" or v33;
        u9.Text = v35 ~= "" and "@" .. v35 or "UserId " .. tostring(u32);
        u6.Image = "";
        u12.Text = "Roblox username and friend request.";
        if u16 == l__LocalPlayer__4 then
            u13.Text = "This is you";
            u13.Active = false;
            u13.AutoButtonColor = false;
            u13.BackgroundColor3 = Color3.fromRGB(62, 64, 72);
            u13.TextColor3 = Color3.fromRGB(168, 173, 186);
        elseif u16 then
            local v37, v38 = pcall(function() --[[ Line: 210 ]]
                -- upvalues: l__LocalPlayer__4 (ref), u32 (ref)
                return l__LocalPlayer__4:IsFriendsWith(u32);
            end);
            if v37 then
                v37 = v38 == true;
            end;
            u19(not v37, v37 and "Already Friend" or "Add Friend");
        else
            u13.Text = "Not in this server";
            u13.Active = false;
            u13.AutoButtonColor = false;
            u13.BackgroundColor3 = Color3.fromRGB(62, 64, 72);
            u13.TextColor3 = Color3.fromRGB(168, 173, 186);
            u12.Text = "Roblox only allows this friend prompt for players in the same server.";
        end;
        task.spawn(function() --[[ Line: 220 ]]
            -- upvalues: l__Players__1 (ref), u32 (ref), u15 (ref), u6 (ref)
            local v39, v40 = pcall(function() --[[ Line: 221 ]]
                -- upvalues: l__Players__1 (ref), u32 (ref)
                return l__Players__1:GetUserThumbnailAsync(u32, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100);
            end);
            if v39 and u15 == u32 then
                u6.Image = v40;
            end;
        end);
        if v35 == "" then
            task.spawn(function() --[[ Line: 230 ]]
                -- upvalues: l__Players__1 (ref), u32 (ref), u15 (ref), u9 (ref)
                local v41, v42 = pcall(function() --[[ Line: 231 ]]
                    -- upvalues: l__Players__1 (ref), u32 (ref)
                    return l__Players__1:GetNameFromUserIdAsync(u32);
                end);
                if v41 and u15 == u32 then
                    u9.Text = "@" .. tostring(v42);
                end;
            end);
        end;
    end;
end;
local function u49(u44, u45) --[[ Line: 249 ]]
    -- upvalues: l__PlayerGui__5 (ref), l__LocalPlayer__4 (copy)
    local u46;
    if l__PlayerGui__5 and l__PlayerGui__5.Parent then
        u46 = l__PlayerGui__5;
    else
        l__PlayerGui__5 = l__LocalPlayer__4:FindFirstChildOfClass("PlayerGui") or l__LocalPlayer__4:FindFirstChild("PlayerGui");
        u46 = l__PlayerGui__5;
    end;
    if not u46 then
        return {};
    end;
    local v47, v48 = pcall(function() --[[ Line: 255 ]]
        -- upvalues: u46 (copy), u44 (copy), u45 (copy)
        return u46:GetGuiObjectsAtPosition(u44, u45);
    end);
    return (not v47 or type(v48) ~= "table") and {} or v48;
end;
local function u53(p50) --[[ Line: 264 ]]
    -- upvalues: l__PlayerGui__5 (ref), l__LocalPlayer__4 (copy), u2 (copy)
    local v51;
    if l__PlayerGui__5 and l__PlayerGui__5.Parent then
        v51 = l__PlayerGui__5;
    else
        l__PlayerGui__5 = l__LocalPlayer__4:FindFirstChildOfClass("PlayerGui") or l__LocalPlayer__4:FindFirstChild("PlayerGui");
        v51 = l__PlayerGui__5;
    end;
    while p50 and (p50 ~= u2 and p50 ~= v51) do
        local v52 = p50:GetAttribute("AgaricProfileUserId");
        if v52 ~= nil then
            return tonumber(v52), p50;
        end;
        p50 = p50.Parent;
    end;
    return nil, nil;
end;
local function u60(p54, p55) --[[ Line: 277 ]]
    -- upvalues: u49 (copy), u3 (copy), u53 (copy)
    local v56 = u49(p54, p55);
    for _, v57 in ipairs(v56) do
        if v57:IsDescendantOf(u3) then
            return nil, nil;
        end;
        local v58, v59 = u53(v57);
        if v58 then
            return v58, v59;
        end;
    end;
    return nil, nil;
end;
local function u65(p61, p62) --[[ Line: 291 ]]
    -- upvalues: u49 (copy), u3 (copy)
    local v63 = u49(p61, p62);
    for _, v64 in ipairs(v63) do
        if v64:IsDescendantOf(u3) then
            return true;
        end;
    end;
    return false;
end;
u13.MouseButton1Click:Connect(function() --[[ Line: 301 ]]
    -- upvalues: u16 (ref), u12 (copy), l__LocalPlayer__4 (copy), l__StarterGui__2 (copy)
    local u66 = u16;
    if u66 and u66.Parent then
        if u66 == l__LocalPlayer__4 then
            u12.Text = "This is your account.";
        elseif pcall(function() --[[ Line: 313 ]]
            -- upvalues: l__StarterGui__2 (ref), u66 (copy)
            l__StarterGui__2:SetCore("PromptSendFriendRequest", u66);
        end) then
            u12.Text = "Roblox friend request prompt opened.";
        else
            u12.Text = "Trying Roblox friend request prompt...";
            task.delay(0.4, function() --[[ Line: 323 ]]
                -- upvalues: u16 (ref), u66 (copy), l__StarterGui__2 (ref), u12 (ref)
                if u16 == u66 then
                    u12.Text = pcall(function() --[[ Line: 313 ]]
                        -- upvalues: l__StarterGui__2 (ref), u66 (ref)
                        l__StarterGui__2:SetCore("PromptSendFriendRequest", u66);
                    end) and "Roblox friend request prompt opened." or "Roblox friend request prompt is unavailable right now.";
                end;
            end);
        end;
    else
        u12.Text = "Player must be in this server.";
    end;
end);
v10.MouseButton1Click:Connect(function() --[[ Line: 333 ]]
    -- upvalues: u3 (copy)
    u3.Visible = false;
end);
v1.Event:Connect(function(p67) --[[ Line: 337 ]]
    -- upvalues: l__UserInputService__3 (copy), u43 (copy)
    if typeof(p67) == "table" then
        local l__Position__7 = p67.Position;
        if typeof(l__Position__7) ~= "Vector2" then
            local v68 = l__UserInputService__3:GetMouseLocation();
            l__Position__7 = Vector2.new(v68.X, v68.Y);
        end;
        u43(p67.UserId, l__Position__7, nil);
    else
        local v69 = l__UserInputService__3:GetMouseLocation();
        u43(p67, Vector2.new(v69.X, v69.Y), nil);
    end;
end);
l__UserInputService__3.InputBegan:Connect(function(p70, p71) --[[ Line: 351 ]]
    -- upvalues: u3 (copy), u65 (copy), u60 (copy), u43 (copy)
    if p70.UserInputType == Enum.UserInputType.MouseButton1 or p70.UserInputType == Enum.UserInputType.Touch then
        local l__X__8 = p70.Position.X;
        local l__Y__9 = p70.Position.Y;
        if u3.Visible and u65(l__X__8, l__Y__9) then
        else
            local v72, v73 = u60(l__X__8, l__Y__9);
            if v72 then
                u43(v72, Vector2.new(l__X__8, l__Y__9), v73);
            else
                if u3.Visible and not p71 then
                    u3.Visible = false;
                end;
            end;
        end;
    end;
end);