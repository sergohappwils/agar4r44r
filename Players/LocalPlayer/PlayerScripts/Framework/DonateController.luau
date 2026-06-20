-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Framework.DonateController

-- Decompiled with Potassium's decompiler.

local v1 = {};
local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__MarketplaceService__3 = game:GetService("MarketplaceService");
local l__LocalPlayer__4 = l__Players__1.LocalPlayer;
local l__Framework__5 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__DonationConfig__6 = require(l__Framework__5:WaitForChild("DonationConfig"));
local l__ClientPlayerState__7 = require(l__Framework__5:WaitForChild("ClientPlayerState"));
local u2 = false;
local u3 = {};
local u4 = {};
local u5 = Color3.fromRGB(0, 0, 0);
local u6 = Font.fromName("Montserrat", Enum.FontWeight.Bold);
local u7 = Color3.fromRGB(31, 31, 31);
local u8 = Color3.fromRGB(74, 74, 74);
local u9 = Color3.fromRGB(245, 245, 245);
local u10 = Color3.fromRGB(190, 195, 205);
local function u18(p11) --[[ Line: 30 ]]
    local v12 = tonumber(p11);
    if not v12 then
        return tostring(p11 or "");
    end;
    local v13 = math.floor(v12);
    local v14 = tostring(v13);
    local v15, v16, v17 = string.match(v14, "^([^%d]*%d)(%d*)(.-)$");
    return v15 .. v16:reverse():gsub("(%d%d%d)", "%1,"):reverse() .. v17;
end;
local function u24(p19, p20, p21) --[[ Line: 65 ]]
    -- upvalues: l__DonationConfig__6 (copy)
    for v22, v23 in ipairs(p20 or {}) do
        local l__Id__8 = v23.Id;
        if type(l__Id__8) == "string" and l__Id__8 ~= "" then
            p19[l__Id__8] = {
                Entry = v23,
                PurchaseType = p21
            };
        end;
        local l__CardName__9 = v23.CardName;
        if type(l__CardName__9) == "string" and l__CardName__9 ~= "" then
            p19[l__CardName__9] = {
                Entry = v23,
                PurchaseType = p21
            };
        end;
        if p21 == "DeveloperProduct" and p20 == l__DonationConfig__6.CurrencyProducts then
            p19["Gold" .. v22] = {
                Entry = v23,
                PurchaseType = p21
            };
        end;
    end;
end;
local function u26() --[[ Line: 92 ]]
    -- upvalues: u24 (copy), l__DonationConfig__6 (copy)
    local v25 = {};
    u24(v25, l__DonationConfig__6.CurrencyProducts, "DeveloperProduct");
    u24(v25, l__DonationConfig__6.Packs, "DeveloperProduct");
    u24(v25, l__DonationConfig__6.Subscriptions, "GamePass");
    u24(v25, l__DonationConfig__6.OtherProducts, "DeveloperProduct");
    return v25;
end;
local function u27() --[[ Line: 101 ]]
    -- upvalues: l__LocalPlayer__4 (copy)
    local l__Gui__10 = l__LocalPlayer__4:WaitForChild("PlayerGui"):WaitForChild("Gui", 30);
    if not l__Gui__10 then
        warn("DonateController: PlayerGui.Gui was not found");
        return nil;
    end;
    local l__Shop__11 = l__Gui__10:WaitForChild("Shop", 30);
    if not l__Shop__11 then
        warn("DonateController: Gui.Shop was not found");
        return nil;
    end;
    local l__Gold__12 = l__Shop__11:WaitForChild("Gold", 30);
    if l__Gold__12 then
        return l__Gold__12:FindFirstChild("ScrollFrame") or l__Gold__12:FindFirstChildWhichIsA("ScrollingFrame", true);
    end;
    warn("DonateController: Gui.Shop.Gold was not found");
    return nil;
end;
local function u31(p28) --[[ Line: 133 ]]
    local v29 = p28:FindFirstChild("Buy", true);
    local v30 = p28:FindFirstChild("BuyGui", true);
    if v29 and v29:IsA("GuiButton") then
        if not (v30 and (v30:IsA("TextLabel") or v30:IsA("TextButton"))) then
            v30 = v29;
        end;
        if v30 ~= v29 and v29:IsA("TextButton") then
            v29.Text = "";
        end;
        return v29, v30;
    elseif p28:IsA("GuiButton") then
        return p28, p28;
    else
        return nil, nil;
    end;
end;
local function u35(p32, p33) --[[ Line: 189 ]]
    if p32 and (p32:IsA("TextLabel") or p32:IsA("TextButton")) then
        local v34 = p32:FindFirstChildOfClass("UITextSizeConstraint");
        if not v34 then
            v34 = Instance.new("UITextSizeConstraint");
            v34.Parent = p32;
        end;
        v34.MaxTextSize = p33;
    end;
end;
local function u39(p36) --[[ Line: 201 ]]
    -- upvalues: u35 (copy)
    for _, v37 in ipairs(p36:GetDescendants()) do
        if v37:IsA("TextLabel") or v37:IsA("TextButton") then
            local v38 = string.lower(v37.Name);
            u35(v37, (v38:find("buy") or v38:find("price")) and 16 or ((v38:find("desc") or (v38:find("info") or v38:find("subtitle"))) and 13 or 18));
        end;
    end;
end;
local function u44(p40, p41) --[[ Line: 216 ]]
    -- upvalues: u35 (copy)
    local l__Subtitle__13 = p41.Subtitle;
    if type(l__Subtitle__13) == "string" and l__Subtitle__13 ~= "" then
        local v42 = p40:FindFirstChild("Description", true);
        if not (v42 and (v42:IsA("TextLabel") or v42:IsA("TextButton"))) then
            v42 = nil;
        end;
        if not v42 then
            v42 = p40:FindFirstChild("Desc", true);
            if not (v42 and (v42:IsA("TextLabel") or v42:IsA("TextButton"))) then
                v42 = nil;
            end;
            if not v42 then
                v42 = p40:FindFirstChild("Info", true);
                if not (v42 and (v42:IsA("TextLabel") or v42:IsA("TextButton"))) then
                    v42 = nil;
                end;
                if not v42 then
                    v42 = p40:FindFirstChild("Subtitle", true);
                    if not (v42 and (v42:IsA("TextLabel") or v42:IsA("TextButton"))) then
                        v42 = nil;
                    end;
                end;
            end;
        end;
        if v42 then
            v42.Text = l__Subtitle__13;
            u35(v42, 13);
        else
            local v43 = p40:FindFirstChild("Header", true);
            if not (v43 and (v43:IsA("TextLabel") or v43:IsA("TextButton"))) then
                v43 = nil;
            end;
            if v43 and not string.find(v43.Text, l__Subtitle__13, 1, true) then
                v43.Text = tostring(p41.Title or v43.Text) .. "\n" .. l__Subtitle__13;
                u35(v43, 18);
            end;
        end;
    end;
end;
local function u55(p45, p46) --[[ Line: 236 ]]
    -- upvalues: u7 (copy), u8 (copy), u9 (copy), u35 (copy), u10 (copy), u6 (copy)
    if p45 and type(p46) == "table" then
        local l__Parent__14 = p45.Parent;
        if l__Parent__14 and l__Parent__14:IsA("GuiObject") then
            l__Parent__14.Size = UDim2.new(l__Parent__14.Size.X.Scale, l__Parent__14.Size.X.Offset, 0, 230);
        end;
        p45.BackgroundColor3 = u7;
        p45.ClipsDescendants = true;
        (p45:FindFirstChildOfClass("UICorner") or Instance.new("UICorner", p45)).CornerRadius = UDim.new(0, 10);
        local v47 = p45:FindFirstChildOfClass("UIStroke") or Instance.new("UIStroke", p45);
        v47.Color = u8;
        v47.Thickness = 1;
        v47.Transparency = 0;
        local v48 = p45:FindFirstChild("Header", true);
        if not (v48 and (v48:IsA("TextLabel") or v48:IsA("TextButton"))) then
            v48 = nil;
        end;
        if v48 then
            v48.BackgroundTransparency = 1;
            v48.Position = UDim2.new(0, 16, 0, 14);
            v48.Size = UDim2.new(1, -32, 0, 30);
            v48.Text = tostring(p46.Title or v48.Text);
            v48.TextColor3 = u9;
            v48.TextXAlignment = Enum.TextXAlignment.Left;
            v48.TextYAlignment = Enum.TextYAlignment.Center;
            v48.Font = Enum.Font.GothamBlack;
            u35(v48, 22);
        end;
        local v49 = p45:FindFirstChild("Subtitle", true);
        if not (v49 and (v49:IsA("TextLabel") or v49:IsA("TextButton"))) then
            v49 = nil;
        end;
        if v49 then
            v49.BackgroundTransparency = 1;
            v49.Position = UDim2.new(0, 16, 0, 48);
            v49.Size = UDim2.new(1, -32, 0, 28);
            v49.Text = tostring(p46.Subtitle or "");
            v49.TextColor3 = u10;
            v49.TextXAlignment = Enum.TextXAlignment.Left;
            v49.TextYAlignment = Enum.TextYAlignment.Top;
            v49.Font = Enum.Font.GothamSemibold;
            v49.Visible = v49.Text ~= "";
            u35(v49, 12);
        end;
        local v50 = p45:FindFirstChild("Features", true);
        if not (v50 and (v50:IsA("TextLabel") or v50:IsA("TextButton"))) then
            v50 = nil;
        end;
        if v50 then
            local v51 = type(p46.Benefits) == "table" and (p46.Benefits or {}) or {};
            local v52 = {};
            for _, v53 in ipairs(v51) do
                if type(v53) == "string" and v53 ~= "" then
                    table.insert(v52, "• " .. v53);
                end;
            end;
            v50.Visible = true;
            v50.BackgroundTransparency = 1;
            v50.Position = UDim2.new(0, 16, 0, 84);
            v50.Size = UDim2.new(1, -32, 0, 88);
            v50.Text = table.concat(v52, "\n");
            v50.TextColor3 = u9;
            v50.TextXAlignment = Enum.TextXAlignment.Left;
            v50.TextYAlignment = Enum.TextYAlignment.Top;
            v50.Font = Enum.Font.GothamMedium;
            v50.TextWrapped = true;
            v50.LineHeight = 1.15;
            u35(v50, 13);
        end;
        local v54 = p45:FindFirstChild("BuyGui", true);
        if v54 and v54:IsA("GuiObject") then
            v54.Position = UDim2.new(0, 16, 1, -48);
            v54.Size = UDim2.new(1, -32, 0, 34);
            v54.BackgroundTransparency = 0;
            v54.BackgroundColor3 = Color3.fromRGB(0, 205, 80);
            if v54:IsA("TextLabel") or v54:IsA("TextButton") then
                v54.TextColor3 = Color3.fromRGB(5, 35, 18);
                v54.FontFace = u6;
                u35(v54, 16);
            end;
        end;
    end;
end;
local function u61() --[[ Line: 322 ]]
    -- upvalues: u4 (ref), l__ClientPlayerState__7 (copy), l__LocalPlayer__4 (copy), l__DonationConfig__6 (copy), u6 (copy), u5 (copy), u18 (copy)
    for v56 = #u4, 1, -1 do
        local v57 = u4[v56];
        local l__Button__15 = v57.Button;
        local l__TextObject__16 = v57.TextObject;
        local l__Entry__17 = v57.Entry;
        if l__Button__15 and l__Button__15.Parent then
            local v58 = l__ClientPlayerState__7.GetProxy("Gamepasses", l__LocalPlayer__4);
            if v58 then
                v58 = v58:GetAttribute(l__Entry__17.Id) == true;
            end;
            if v58 then
                if l__TextObject__16 and (l__TextObject__16:IsA("TextLabel") or l__TextObject__16:IsA("TextButton")) then
                    l__TextObject__16.Text = "OWNED";
                    if (("OWNED"):find(tostring(l__DonationConfig__6.RobuxIcon or "R$"), 1, true) ~= nil and true or ("OWNED"):match("^%s*R%$%s*[%d,]+") ~= nil) and (l__TextObject__16 and (l__TextObject__16:IsA("TextLabel") or l__TextObject__16:IsA("TextButton"))) then
                        l__TextObject__16.FontFace = u6;
                        l__TextObject__16.TextColor3 = u5;
                        l__TextObject__16.TextScaled = true;
                        l__TextObject__16.TextStrokeTransparency = 1;
                    end;
                end;
                if l__Button__15 then
                    l__Button__15.Active = false;
                    if l__Button__15:IsA("GuiButton") then
                        l__Button__15.AutoButtonColor = false;
                    end;
                end;
            else
                local v59 = string.format("%s %s", l__DonationConfig__6.RobuxIcon or "R$", (u18(l__Entry__17.Robux or 0)));
                if l__TextObject__16 and (l__TextObject__16:IsA("TextLabel") or l__TextObject__16:IsA("TextButton")) then
                    l__TextObject__16.Text = v59;
                    local v60;
                    if type(v59) == "string" then
                        v60 = v59:find(tostring(l__DonationConfig__6.RobuxIcon or "R$"), 1, true) ~= nil and true or v59:match("^%s*R%$%s*[%d,]+") ~= nil;
                    else
                        v60 = false;
                    end;
                    if v60 and (l__TextObject__16 and (l__TextObject__16:IsA("TextLabel") or l__TextObject__16:IsA("TextButton"))) then
                        l__TextObject__16.FontFace = u6;
                        l__TextObject__16.TextColor3 = u5;
                        l__TextObject__16.TextScaled = true;
                        l__TextObject__16.TextStrokeTransparency = 1;
                    end;
                end;
                if l__Button__15 then
                    l__Button__15.Active = true;
                    if l__Button__15:IsA("GuiButton") then
                        l__Button__15.AutoButtonColor = true;
                    end;
                end;
            end;
        else
            table.remove(u4, v56);
        end;
    end;
end;
local function u69(u62, p63, u64) --[[ Line: 341 ]]
    -- upvalues: l__DonationConfig__6 (copy), u6 (copy), u5 (copy), u18 (copy), l__MarketplaceService__3 (copy), l__LocalPlayer__4 (copy)
    local v65;
    if p63 == "GamePass" then
        v65 = tonumber(u62.GamePassId);
    else
        v65 = tonumber(u62.ProductId);
    end;
    if v65 and v65 > 0 then
        if p63 == "GamePass" then
            l__MarketplaceService__3:PromptGamePassPurchase(l__LocalPlayer__4, v65);
        else
            l__MarketplaceService__3:PromptProductPurchase(l__LocalPlayer__4, v65);
        end;
    else
        warn("DonateController: missing purchase id for", u62.Id or u62.Title);
        if u64 and (u64:IsA("TextLabel") or u64:IsA("TextButton")) then
            u64.Text = "SET ID";
            if (("SET ID"):find(tostring(l__DonationConfig__6.RobuxIcon or "R$"), 1, true) ~= nil and true or ("SET ID"):match("^%s*R%$%s*[%d,]+") ~= nil) and (u64 and (u64:IsA("TextLabel") or u64:IsA("TextButton"))) then
                u64.FontFace = u6;
                u64.TextColor3 = u5;
                u64.TextScaled = true;
                u64.TextStrokeTransparency = 1;
            end;
        end;
        task.delay(1.5, function() --[[ Line: 352 ]]
            -- upvalues: u64 (copy), u62 (copy), l__DonationConfig__6 (ref), u18 (ref), u6 (ref), u5 (ref)
            if u64 and u64.Parent then
                local v66 = u64;
                local v67 = string.format("%s %s", l__DonationConfig__6.RobuxIcon or "R$", (u18(u62.Robux or 0)));
                if v66 and (v66:IsA("TextLabel") or v66:IsA("TextButton")) then
                    v66.Text = v67;
                    local v68;
                    if type(v67) == "string" then
                        v68 = v67:find(tostring(l__DonationConfig__6.RobuxIcon or "R$"), 1, true) ~= nil and true or v67:match("^%s*R%$%s*[%d,]+") ~= nil;
                    else
                        v68 = false;
                    end;
                    if v68 and v66 then
                        if not (v66:IsA("TextLabel") or v66:IsA("TextButton")) then
                            return;
                        end;
                        v66.FontFace = u6;
                        v66.TextColor3 = u5;
                        v66.TextScaled = true;
                        v66.TextStrokeTransparency = 1;
                    end;
                end;
            end;
        end);
    end;
end;
local function u80(p70, p71) --[[ Line: 367 ]]
    -- upvalues: u31 (copy), u39 (copy), u35 (copy), u44 (copy), u55 (copy), l__DonationConfig__6 (copy), u18 (copy), u6 (copy), u5 (copy), u4 (ref), l__ClientPlayerState__7 (copy), l__LocalPlayer__4 (copy), u61 (copy), u69 (copy), u3 (copy)
    local l__Entry__18 = p71.Entry;
    local l__PurchaseType__19 = p71.PurchaseType;
    local v72, u73 = u31(p70);
    if v72 then
        u39(p70);
        local v74 = p70:FindFirstChild("Header", true);
        if not (v74 and (v74:IsA("TextLabel") or v74:IsA("TextButton"))) then
            v74 = nil;
        end;
        if v74 and (l__Entry__18.Title and v74.Text == "") then
            v74.Text = l__Entry__18.Title;
        end;
        if v74 then
            u35(v74, 18);
        end;
        u44(p70, l__Entry__18);
        if l__PurchaseType__19 == "GamePass" then
            u55(p70, l__Entry__18);
        end;
        local v75 = string.format("%s %s", l__DonationConfig__6.RobuxIcon or "R$", (u18(l__Entry__18.Robux or 0)));
        if u73 and (u73:IsA("TextLabel") or u73:IsA("TextButton")) then
            u73.Text = v75;
            local v76;
            if type(v75) == "string" then
                v76 = v75:find(tostring(l__DonationConfig__6.RobuxIcon or "R$"), 1, true) ~= nil and true or v75:match("^%s*R%$%s*[%d,]+") ~= nil;
            else
                v76 = false;
            end;
            if v76 and (u73 and (u73:IsA("TextLabel") or u73:IsA("TextButton"))) then
                u73.FontFace = u6;
                u73.TextColor3 = u5;
                u73.TextScaled = true;
                u73.TextStrokeTransparency = 1;
            end;
        end;
        u35(u73, 16);
        if l__PurchaseType__19 == "GamePass" then
            table.insert(u4, {
                Button = v72,
                TextObject = u73,
                Entry = l__Entry__18
            });
        end;
        if not v72:GetAttribute("DonateControllerBound") then
            v72:SetAttribute("DonateControllerBound", true);
            local v79 = v72.Activated:Connect(function() --[[ Line: 404 ]]
                -- upvalues: l__PurchaseType__19 (copy), l__Entry__18 (copy), l__ClientPlayerState__7 (ref), l__LocalPlayer__4 (ref), u61 (ref), u69 (ref), u73 (copy)
                if l__PurchaseType__19 == "GamePass" then
                    local v77 = l__Entry__18;
                    local v78 = l__ClientPlayerState__7.GetProxy("Gamepasses", l__LocalPlayer__4);
                    if v78 then
                        v78 = v78:GetAttribute(v77.Id) == true;
                    end;
                    if v78 then
                        u61();
                        return;
                    end;
                end;
                u69(l__Entry__18, l__PurchaseType__19, u73);
            end);
            table.insert(u3, v79);
        end;
    else
        warn("DonateController: Buy button was not found for", p70:GetFullName());
    end;
end;
local function u86(p81) --[[ Line: 415 ]]
    -- upvalues: u26 (copy), u4 (ref), u80 (copy), u61 (copy)
    if p81 then
        local v82 = u26();
        u4 = {};
        for v83, v84 in pairs(v82) do
            local v85 = p81:FindFirstChild(v83, true);
            if v85 then
                u80(v85, v84);
            end;
        end;
        u61();
    end;
end;
function v1.Init() --[[ Line: 448 ]]
    -- upvalues: u2 (ref), u86 (copy), u27 (copy), l__ClientPlayerState__7 (copy), l__LocalPlayer__4 (copy), u61 (copy), u3 (copy), l__MarketplaceService__3 (copy)
    if u2 then
        u86((u27()));
    else
        u2 = true;
        task.spawn(function() --[[ Line: 456 ]]
            -- upvalues: u86 (ref), u27 (ref), l__ClientPlayerState__7 (ref), l__LocalPlayer__4 (ref), u61 (ref), u3 (ref)
            u86((u27()));
            task.spawn(function() --[[ Line: 434 ]]
                -- upvalues: l__ClientPlayerState__7 (ref), l__LocalPlayer__4 (ref), u61 (ref), u3 (ref)
                local v87 = l__ClientPlayerState__7.WaitForProxy("Gamepasses", l__LocalPlayer__4, 30);
                if v87 then
                    local v88 = v87.AttributeChanged:Connect(function() --[[ Line: 440 ]]
                        -- upvalues: u61 (ref)
                        u61();
                    end);
                    table.insert(u3, v88);
                    u61();
                end;
            end);
        end);
        local v91 = l__MarketplaceService__3.PromptGamePassPurchaseFinished:Connect(function(p89, _, p90) --[[ Line: 461 ]]
            -- upvalues: l__LocalPlayer__4 (ref), u61 (ref)
            if p89 == l__LocalPlayer__4 and p90 then
                task.delay(0.25, u61);
            end;
        end);
        table.insert(u3, v91);
    end;
end;
function v1.Destroy() --[[ Line: 468 ]]
    -- upvalues: u3 (copy), u4 (ref), u2 (ref)
    for _, v92 in ipairs(u3) do
        v92:Disconnect();
    end;
    table.clear(u3);
    table.clear(u4);
    u2 = false;
end;
return v1;