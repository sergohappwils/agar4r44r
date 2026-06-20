-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.FriendInviteController

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__PlayerGui__3 = l__Players__1.LocalPlayer:WaitForChild("PlayerGui");
local l__Framework__4 = l__ReplicatedStorage__2:WaitForChild("Framework", 20);
l__Framework__4 = l__Framework__4;
local u1;
if l__Framework__4 then
    u1 = l__Framework__4:WaitForChild("FriendInviteRemote", 20);
else
    u1 = l__Framework__4;
end;
if u1 and not u1:IsA("RemoteEvent") then
    u1 = nil;
end;
local u2 = nil;
local u3 = nil;
local u4 = nil;
local u5 = nil;
local u6 = nil;
local u7 = nil;
local u8 = 0;
local u9 = 0;
local u10 = setmetatable({}, {
    __mode = "k"
});
local function u18(p11, p12, p13, p14) --[[ Line: 51 ]]
    local v15 = Instance.new("TextButton");
    v15.Name = p12;
    v15.Size = UDim2.new(0.5, -5, 0, 34);
    v15.BackgroundColor3 = p14;
    v15.BorderSizePixel = 0;
    v15.Font = Enum.Font.GothamBold;
    v15.Text = p13;
    v15.TextColor3 = Color3.fromRGB(255, 255, 255);
    v15.TextScaled = true;
    v15.Parent = p11;
    v15:SetAttribute("SfxKind", "Click");
    local v16 = Instance.new("UICorner");
    v16.CornerRadius = UDim.new(0, 7);
    v16.Parent = v15;
    local v17 = Instance.new("UITextSizeConstraint");
    v17.MaxTextSize = 14;
    v17.MinTextSize = 8;
    v17.Parent = v15;
    return v15;
end;
local function u27() --[[ Line: 68 ]]
    -- upvalues: u2 (ref), l__PlayerGui__3 (copy), u3 (ref), u4 (ref), u5 (ref), u18 (copy), u6 (ref), u1 (ref), u7 (ref)
    if u2 then
    else
        u2 = Instance.new("ScreenGui");
        u2.Name = "FriendInviteRequestsGui";
        u2.ResetOnSpawn = false;
        u2.IgnoreGuiInset = true;
        u2.DisplayOrder = 995;
        u2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
        u2.Parent = l__PlayerGui__3;
        u3 = Instance.new("Frame");
        u3.Name = "Prompt";
        u3.AnchorPoint = Vector2.new(1, 0);
        u3.Position = UDim2.new(1, -18, 0, 92);
        u3.Size = UDim2.fromOffset(300, 116);
        u3.BackgroundColor3 = Color3.fromRGB(71, 71, 71);
        u3.BorderSizePixel = 0;
        u3.Visible = false;
        u3.Parent = u2;
        local v19 = u3;
        local v20 = Instance.new("UICorner");
        v20.CornerRadius = UDim.new(0, 10);
        v20.Parent = v19;
        local v21 = Instance.new("UIStroke");
        v21.Color = Color3.fromRGB(104, 119, 255);
        v21.Transparency = 0.2;
        v21.Thickness = 1;
        v21.Parent = u3;
        local v22 = Instance.new("TextLabel");
        v22.Name = "Title";
        v22.Position = UDim2.fromOffset(12, 9);
        v22.Size = UDim2.new(1, -24, 0, 20);
        v22.BackgroundTransparency = 1;
        v22.Font = Enum.Font.GothamBold;
        v22.Text = "Friend request";
        v22.TextColor3 = Color3.fromRGB(238, 240, 247);
        v22.TextScaled = true;
        v22.TextXAlignment = Enum.TextXAlignment.Left;
        v22.Parent = u3;
        local v23 = Instance.new("UITextSizeConstraint");
        v23.MaxTextSize = 15;
        v23.MinTextSize = 9;
        v23.Parent = v22;
        u4 = Instance.new("TextLabel");
        u4.Name = "Text";
        u4.Position = UDim2.fromOffset(12, 32);
        u4.Size = UDim2.new(1, -24, 0, 34);
        u4.BackgroundTransparency = 1;
        u4.Font = Enum.Font.Gotham;
        u4.Text = "";
        u4.TextColor3 = Color3.fromRGB(200, 204, 216);
        u4.TextScaled = true;
        u4.TextWrapped = true;
        u4.TextXAlignment = Enum.TextXAlignment.Left;
        u4.Parent = u3;
        local v24 = u4;
        local v25 = Instance.new("UITextSizeConstraint");
        v25.MaxTextSize = 13;
        v25.MinTextSize = 8;
        v25.Parent = v24;
        local v26 = Instance.new("Frame");
        v26.Name = "Buttons";
        v26.Position = UDim2.fromOffset(12, 72);
        v26.Size = UDim2.new(1, -24, 0, 34);
        v26.BackgroundTransparency = 1;
        v26.Parent = u3;
        u5 = u18(v26, "Accept", "Accept", Color3.fromRGB(91, 184, 116));
        u5.Position = UDim2.fromOffset(0, 0);
        u6 = u18(v26, "Decline", "Decline", Color3.fromRGB(217, 83, 93));
        u6.Position = UDim2.new(0.5, 5, 0, 0);
        u5.Activated:Connect(function() --[[ Line: 137 ]]
            -- upvalues: u1 (ref), u7 (ref), u3 (ref)
            if u1 and u7 then
                u1:FireServer({
                    Action = "Respond",
                    Accepted = true,
                    SenderUserId = u7
                });
            end;
            u3.Visible = false;
        end);
        u6.Activated:Connect(function() --[[ Line: 148 ]]
            -- upvalues: u1 (ref), u7 (ref), u3 (ref)
            if u1 and u7 then
                u1:FireServer({
                    Action = "Respond",
                    Accepted = false,
                    SenderUserId = u7
                });
            end;
            u3.Visible = false;
        end);
    end;
end;
local function u31(p28, p29) --[[ Line: 160 ]]
    -- upvalues: u27 (copy), u7 (ref), u8 (ref), u4 (ref), u3 (ref)
    u27();
    u7 = tonumber(p28);
    u8 = u8 + 1;
    local u30 = u8;
    u4.Text = tostring(p29 or "Friend") .. " sent you an in-game request.";
    u3.Visible = true;
    task.delay(15, function() --[[ Line: 167 ]]
        -- upvalues: u3 (ref), u8 (ref), u30 (copy)
        if u3 and u8 == u30 then
            u3.Visible = false;
        end;
    end);
end;
local function u33() --[[ Line: 174 ]]
    -- upvalues: u9 (ref), u1 (ref)
    local v32 = os.clock();
    if v32 - u9 < 1.5 then
    else
        u9 = v32;
        if u1 then
            u1:FireServer({
                Action = "PingServerFriends"
            });
        end;
    end;
end;
local function v35(p34) --[[ Line: 185 ]]
    -- upvalues: u10 (copy), u33 (copy)
    if u10[p34] or not p34:IsA("GuiButton") then
    elseif p34.Name == "ModeFriendsButton" or p34.Name == "Friend" then
        u10[p34] = true;
        p34.Activated:Connect(u33);
    end;
end;
local function u40(p36) --[[ Line: 24 ]]
    -- upvalues: l__Framework__4 (copy)
    local v37 = l__Framework__4;
    if v37 then
        v37 = l__Framework__4:FindFirstChild("PromptHandler");
    end;
    if v37 and v37:IsA("ModuleScript") then
        local v38, v39 = pcall(require, v37);
        if v38 and (v39 and type(v39.ShowNotification) == "function") then
            v39.ShowNotification("Warning", p36);
            return;
        end;
    end;
    warn(p36);
end;
for _, v41 in ipairs(l__PlayerGui__3:GetDescendants()) do
    if not u10[v41] then
        if v41:IsA("GuiButton") then
            if v41.Name == "ModeFriendsButton" or v41.Name == "Friend" then
                u10[v41] = true;
                v41.Activated:Connect(u33);
            end;
        end;
    end;
end;
l__PlayerGui__3.DescendantAdded:Connect(v35);
if u1 then
    u1.OnClientEvent:Connect(function(p42) --[[ Line: 202 ]]
        -- upvalues: u31 (copy), u40 (copy)
        if typeof(p42) == "table" then
            local v43 = tostring(p42.Action or "");
            if v43 == "Incoming" then
                u31(p42.SenderUserId, p42.SenderName);
            elseif v43 == "Response" then
                local v44 = tostring(p42.ResponderName or "Friend");
                if p42.Accepted == true then
                    u40(v44 .. " accepted your in-game request.");
                else
                    u40(v44 .. " declined your in-game request.");
                end;
            else
                if v43 == "Notice" then
                    u40((tostring(p42.Text or "")));
                end;
            end;
        end;
    end);
end;