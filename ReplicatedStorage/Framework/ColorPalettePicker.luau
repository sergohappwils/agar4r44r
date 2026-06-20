-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.ColorPalettePicker

-- Decompiled with Potassium's decompiler.

local u1 = {};
local l__Players__1 = game:GetService("Players");
local l__UserInputService__2 = game:GetService("UserInputService");
local u2 = {
    Color3.fromRGB(255, 255, 255),
    Color3.fromRGB(25, 25, 25),
    Color3.fromRGB(255, 85, 0),
    Color3.fromRGB(255, 209, 102),
    Color3.fromRGB(255, 77, 109),
    Color3.fromRGB(77, 150, 255),
    Color3.fromRGB(120, 255, 170),
    Color3.fromRGB(190, 120, 255),
    Color3.fromRGB(255, 120, 60),
    Color3.fromRGB(49, 160, 145)
};
local function u8(p3, p4, p5) --[[ Line: 35 ]]
    local v6 = Instance.new("TextButton");
    v6.BackgroundColor3 = p5 or Color3.fromRGB(45, 48, 58);
    v6.BorderSizePixel = 0;
    v6.AutoButtonColor = true;
    v6.Text = p4 or "";
    v6.TextColor3 = Color3.fromRGB(245, 247, 255);
    v6.Font = Enum.Font.GothamBold;
    v6.TextSize = 13;
    v6.Parent = p3;
    local v7 = Instance.new("UICorner");
    v7.CornerRadius = UDim.new(0, 7);
    v7.Parent = v6;
    return v6;
end;
local function u14(p9, p10, p11, p12) --[[ Line: 49 ]]
    local v13 = Instance.new("TextLabel");
    v13.BackgroundTransparency = 1;
    v13.Text = p10 or "";
    v13.TextColor3 = Color3.fromRGB(238, 241, 248);
    v13.Font = p12 and Enum.Font.GothamBold or Enum.Font.GothamMedium;
    v13.TextSize = p11 or 13;
    v13.TextXAlignment = Enum.TextXAlignment.Left;
    v13.TextYAlignment = Enum.TextYAlignment.Center;
    v13.Parent = p9;
    return v13;
end;
function u1.NormalizeHex(p15, p16) --[[ Line: 70 ]]
    -- upvalues: u1 (copy)
    if typeof(p15) == "Color3" then
        return u1.ColorToHex(p15);
    end;
    local v17 = tostring(p15 or ""):gsub("#", "");
    return not v17:match("^%x%x%x%x%x%x$") and (p16 or "#FFFFFF") or "#" .. string.upper(v17);
end;
function u1.HexToColor(p18, p19) --[[ Line: 81 ]]
    -- upvalues: u1 (copy)
    local v20 = u1.NormalizeHex(p18, u1.ColorToHex(p19 or Color3.fromRGB(255, 255, 255))):gsub("#", "");
    local l__fromRGB__3 = Color3.fromRGB;
    local v21 = v20:sub(1, 2);
    local v22 = tonumber(v21, 16) or 255;
    local v23 = v20:sub(3, 4);
    local v24 = tonumber(v23, 16) or 255;
    local v25 = v20:sub(5, 6);
    return l__fromRGB__3(v22, v24, tonumber(v25, 16) or 255);
end;
function u1.ColorToHex(p26) --[[ Line: 90 ]]
    if typeof(p26) ~= "Color3" then
        p26 = Color3.fromRGB(255, 255, 255);
    end;
    return string.format("#%02X%02X%02X", math.floor(p26.R * 255 + 0.5), math.floor(p26.G * 255 + 0.5), (math.floor(p26.B * 255 + 0.5)));
end;
function u1.Open(p27) --[[ Line: 95 ]]
    -- upvalues: l__Players__1 (copy), u14 (copy), u8 (copy), u1 (copy), u2 (copy), l__UserInputService__2 (copy)
    local u28 = p27 or {};
    local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
    local v29;
    if l__LocalPlayer__4 then
        v29 = l__LocalPlayer__4:WaitForChild("PlayerGui");
    else
        v29 = nil;
    end;
    if not v29 then
        return nil;
    end;
    local v30 = tostring(u28.GuiName or "SharedColorPalettePicker");
    local v31 = not u28.AllowMultiple and v29:FindFirstChild(v30);
    if v31 then
        v31:Destroy();
    end;
    local u32 = Instance.new("ScreenGui");
    u32.Name = v30;
    u32.ResetOnSpawn = false;
    u32.IgnoreGuiInset = true;
    u32.DisplayOrder = tonumber(u28.DisplayOrder) or 1000000001;
    u32.ZIndexBehavior = Enum.ZIndexBehavior.Global;
    u32.Parent = v29;
    local v33 = Instance.new("TextButton");
    v33.Size = UDim2.fromScale(1, 1);
    v33.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    v33.BackgroundTransparency = 0.42;
    v33.BorderSizePixel = 0;
    v33.Text = "";
    v33.AutoButtonColor = false;
    v33.ZIndex = 100;
    v33.Parent = u32;
    local v34 = Instance.new("Frame");
    v34.AnchorPoint = Vector2.new(0.5, 0.5);
    v34.Position = UDim2.fromScale(0.5, 0.5);
    v34.Size = UDim2.new(0.88, 0, 0.72, 0);
    v34.BackgroundColor3 = Color3.fromRGB(26, 26, 26);
    v34.BorderSizePixel = 0;
    v34.ZIndex = 101;
    v34.Parent = v33;
    local v35 = Instance.new("UICorner");
    v35.CornerRadius = UDim.new(0, 8);
    v35.Parent = v34;
    local v36 = Color3.fromRGB(255, 255, 255);
    local v37 = Instance.new("UIStroke");
    v37.Color = v36 or Color3.fromRGB(255, 255, 255);
    v37.Transparency = 0.82;
    v37.Thickness = 1;
    v37.Parent = v34;
    local v38 = Instance.new("UISizeConstraint");
    v38.MinSize = Vector2.new(280, 300);
    v38.MaxSize = Vector2.new(390, 455);
    v38.Parent = v34;
    local v39 = u14(v34, tostring(u28.Title or "Pick color"), 20, true);
    v39.Position = UDim2.new(0.05, 0, 0.03, 0);
    v39.Size = UDim2.new(0.76, 0, 0.09, 0);
    v39.ZIndex = 102;
    local v40 = u8(v34, "X", Color3.fromRGB(125, 45, 45));
    v40.Position = UDim2.new(0.84, 0, 0.035, 0);
    v40.Size = UDim2.new(0.11, 0, 0.08, 0);
    v40.ZIndex = 102;
    v40.MouseButton1Click:Connect(function() --[[ Line: 153 ]]
        -- upvalues: u32 (copy)
        u32:Destroy();
    end);
    local v41 = Instance.new("Frame");
    v41.Position = UDim2.new(0.05, 0, 0.16, 0);
    v41.Size = UDim2.new(0.72, -8, 0.5, 0);
    v41.BackgroundTransparency = 1;
    v41.ZIndex = 102;
    v41.Parent = v34;
    local u42 = Instance.new("TextButton");
    u42.Size = UDim2.fromScale(1, 1);
    u42.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
    u42.BorderSizePixel = 0;
    u42.AutoButtonColor = false;
    u42.Text = "";
    u42.ZIndex = 102;
    u42.Parent = v41;
    local v43 = Instance.new("UICorner");
    v43.CornerRadius = UDim.new(0, 5);
    v43.Parent = u42;
    local v44 = Instance.new("Frame");
    v44.Size = UDim2.fromScale(1, 1);
    v44.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    v44.BorderSizePixel = 0;
    v44.ZIndex = 103;
    v44.Parent = u42;
    local v45 = Instance.new("UICorner");
    v45.CornerRadius = UDim.new(0, 5);
    v45.Parent = v44;
    local v46 = Instance.new("UIGradient");
    v46.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) });
    v46.Parent = v44;
    local v47 = Instance.new("Frame");
    v47.Size = UDim2.fromScale(1, 1);
    v47.BackgroundColor3 = Color3.fromRGB(0, 0, 0);
    v47.BorderSizePixel = 0;
    v47.ZIndex = 104;
    v47.Parent = u42;
    local v48 = Instance.new("UICorner");
    v48.CornerRadius = UDim.new(0, 5);
    v48.Parent = v47;
    local v49 = Instance.new("UIGradient");
    v49.Rotation = 90;
    v49.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) });
    v49.Parent = v47;
    local u50 = Instance.new("Frame");
    u50.AnchorPoint = Vector2.new(0.5, 0.5);
    u50.Size = UDim2.fromOffset(14, 14);
    u50.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    u50.ZIndex = 106;
    u50.Parent = u42;
    local v51 = Instance.new("UICorner");
    v51.CornerRadius = UDim.new(0, 10);
    v51.Parent = u50;
    local v52 = Color3.fromRGB(0, 0, 0);
    local v53 = Instance.new("UIStroke");
    v53.Color = v52 or Color3.fromRGB(255, 255, 255);
    v53.Transparency = 0;
    v53.Thickness = 2;
    v53.Parent = u50;
    local u54 = Instance.new("TextButton");
    u54.Position = UDim2.new(0.8, 0, 0.16, 0);
    u54.Size = UDim2.new(0.15, 0, 0.5, 0);
    u54.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    u54.BorderSizePixel = 0;
    u54.AutoButtonColor = false;
    u54.Text = "";
    u54.ZIndex = 102;
    u54.Parent = v34;
    local v55 = Instance.new("UICorner");
    v55.CornerRadius = UDim.new(0, 5);
    v55.Parent = u54;
    local v56 = Instance.new("UIGradient");
    v56.Rotation = 90;
    local v57 = {};
    for v58 = 0, 10 do
        table.insert(v57, ColorSequenceKeypoint.new(v58 / 10, Color3.fromHSV(v58 / 10, 1, 1)));
    end;
    v56.Color = ColorSequence.new(v57);
    v56.Parent = u54;
    local u59 = Instance.new("Frame");
    u59.AnchorPoint = Vector2.new(0.5, 0.5);
    u59.Position = UDim2.fromScale(0.5, 0);
    u59.Size = UDim2.new(1, 8, 0, 8);
    u59.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    u59.ZIndex = 106;
    u59.Parent = u54;
    local v60 = Color3.fromRGB(0, 0, 0);
    local v61 = Instance.new("UIStroke");
    v61.Color = v60 or Color3.fromRGB(255, 255, 255);
    v61.Transparency = 0;
    v61.Thickness = 2;
    v61.Parent = u59;
    local v62 = Instance.new("Frame");
    v62.Position = UDim2.new(0.05, 0, 0.7, 0);
    v62.Size = UDim2.new(0.9, 0, 0.1, 0);
    v62.BackgroundTransparency = 1;
    v62.ZIndex = 102;
    v62.Parent = v34;
    local v63 = Instance.new("UIGridLayout");
    v63.CellSize = UDim2.fromOffset(26, 24);
    v63.CellPadding = UDim2.fromOffset(5, 5);
    v63.SortOrder = Enum.SortOrder.LayoutOrder;
    v63.Parent = v62;
    local u64 = u8(v34, "Apply", Color3.fromRGB(255, 85, 0));
    u64.Position = UDim2.new(0.05, 0, 0.84, 0);
    u64.Size = UDim2.new(0.9, 0, 0.1, 0);
    u64.ZIndex = 102;
    local v65;
    if typeof(u28.InitialColor) == "Color3" then
        v65 = u28.InitialColor;
    else
        v65 = u1.HexToColor(u28.InitialHex or u28.InitialColor, Color3.fromRGB(255, 255, 255));
    end;
    local u66, u67, u68 = v65:ToHSV();
    local function u72(p69) --[[ Line: 260 ]]
        -- upvalues: u66 (ref), u67 (ref), u68 (ref), u42 (copy), u50 (copy), u59 (copy), u64 (copy), u1 (ref), u28 (ref)
        local v70 = Color3.fromHSV(u66, u67, u68);
        u42.BackgroundColor3 = Color3.fromHSV(u66, 1, 1);
        u50.Position = UDim2.fromScale(u67, 1 - u68);
        u59.Position = UDim2.fromScale(0.5, u66);
        u64.BackgroundColor3 = v70;
        u64.Text = "Apply " .. u1.ColorToHex(v70);
        local v71;
        if u68 > 0.68 then
            v71 = u67 < 0.55;
        else
            v71 = false;
        end;
        u64.TextColor3 = v71 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255);
        if p69 and type(u28.OnChanged) == "function" then
            u28.OnChanged(v70, u1.ColorToHex(v70));
        end;
    end;
    local u73 = u68;
    local u74 = u67;
    local u75 = u66;
    local u76 = false;
    local u77 = false;
    for _, u78 in ipairs(u2) do
        local v79 = u8(v62, "", u78);
        v79.ZIndex = 103;
        v79.MouseButton1Click:Connect(function() --[[ Line: 282 ]]
            -- upvalues: u78 (copy), u75 (ref), u74 (ref), u73 (ref), u72 (copy)
            local v80, v81, v82 = u78:ToHSV();
            u75 = v80;
            u74 = v81;
            u73 = v82;
            u72(true);
        end);
    end;
    local function u84(p83) --[[ Line: 287 ]]
        -- upvalues: u42 (copy), u74 (ref), u73 (ref), u72 (copy)
        if u42.AbsoluteSize.X <= 0 or u42.AbsoluteSize.Y <= 0 then
        else
            u74 = math.clamp((p83.X - u42.AbsolutePosition.X) / u42.AbsoluteSize.X, 0, 1);
            u73 = 1 - math.clamp((p83.Y - u42.AbsolutePosition.Y) / u42.AbsoluteSize.Y, 0, 1);
            u72(true);
        end;
    end;
    u42.InputBegan:Connect(function(p85) --[[ Line: 304 ]]
        -- upvalues: u76 (ref), u84 (copy)
        if p85.UserInputType == Enum.UserInputType.MouseButton1 or p85.UserInputType == Enum.UserInputType.Touch then
            u76 = true;
            u84(p85.Position);
        end;
    end);
    u54.InputBegan:Connect(function(p86) --[[ Line: 310 ]]
        -- upvalues: u77 (ref), u54 (copy), u75 (ref), u72 (copy)
        if p86.UserInputType == Enum.UserInputType.MouseButton1 or p86.UserInputType == Enum.UserInputType.Touch then
            u77 = true;
            local l__Position__5 = p86.Position;
            if u54.AbsoluteSize.Y <= 0 then
                return;
            end;
            u75 = math.clamp((l__Position__5.Y - u54.AbsolutePosition.Y) / u54.AbsoluteSize.Y, 0, 1);
            u72(true);
        end;
    end);
    local u88 = l__UserInputService__2.InputChanged:Connect(function(p87) --[[ Line: 317 ]]
        -- upvalues: u76 (ref), u84 (copy), u77 (ref), u54 (copy), u75 (ref), u72 (copy)
        if p87.UserInputType == Enum.UserInputType.MouseMovement or p87.UserInputType == Enum.UserInputType.Touch then
            if u76 then
                u84(p87.Position);
                return;
            end;
            if u77 then
                local l__Position__6 = p87.Position;
                if u54.AbsoluteSize.Y <= 0 then
                    return;
                end;
                u75 = math.clamp((l__Position__6.Y - u54.AbsolutePosition.Y) / u54.AbsoluteSize.Y, 0, 1);
                u72(true);
            end;
        end;
    end);
    local u90 = l__UserInputService__2.InputEnded:Connect(function(p89) --[[ Line: 326 ]]
        -- upvalues: u76 (ref), u77 (ref)
        if p89.UserInputType == Enum.UserInputType.MouseButton1 or p89.UserInputType == Enum.UserInputType.Touch then
            u76 = false;
            u77 = false;
        end;
    end);
    u32.Destroying:Connect(function() --[[ Line: 332 ]]
        -- upvalues: u88 (copy), u90 (copy)
        u88:Disconnect();
        u90:Disconnect();
    end);
    u64.MouseButton1Click:Connect(function() --[[ Line: 337 ]]
        -- upvalues: u75 (ref), u74 (ref), u73 (ref), u28 (ref), u1 (ref), u32 (copy)
        local v91 = Color3.fromHSV(u75, u74, u73);
        if type(u28.OnPicked) == "function" then
            u28.OnPicked(v91, u1.ColorToHex(v91));
        end;
        u32:Destroy();
    end);
    u72(false);
    return u32;
end;
return u1;