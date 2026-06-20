-- ClassName: LocalScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Gameplay.ControlSettingsClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__UserInputService__3 = game:GetService("UserInputService");
game:GetService("GuiService");
local l__HttpService__4 = game:GetService("HttpService");
local l__LocalPlayer__5 = l__Players__1.LocalPlayer;
local l__PlayerGui__6 = l__LocalPlayer__5:WaitForChild("PlayerGui");
local l__Network__7 = l__ReplicatedStorage__2:WaitForChild("Gameplay"):WaitForChild("Network");
local l__UpdateControlSettings__8 = l__Network__7:WaitForChild("UpdateControlSettings", 30);
local l__Input_Action__9 = l__Network__7:WaitForChild("Input_Action", 30);
local l__EquipItemEvent__10 = l__Network__7:WaitForChild("EquipItemEvent", 30);
local l__Framework__11 = l__ReplicatedStorage__2:WaitForChild("Framework");
local l__ClientPlayerState__12 = require(l__Framework__11:WaitForChild("ClientPlayerState"));
local l__GameDatabase__13 = require(l__Framework__11:WaitForChild("GameDatabase"));
if l__UpdateControlSettings__8 and l__UpdateControlSettings__8:IsA("RemoteFunction") then
    local u1 = {
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
    };
    local u2 = {
        {
            Id = "Split",
            Label = "Split",
            Help = "Splits your current cells toward your pointer."
        },
        {
            Id = "Feed",
            Label = "Feed",
            Help = "Hold to eject mass toward your pointer."
        },
        {
            Id = "Freeze",
            Label = "Freeze",
            Help = "Toggles your cells between moving and frozen."
        },
        {
            Id = "DoubleSplit",
            Label = "Double split",
            Help = "Runs two quick splits. One cell can become four."
        },
        {
            Id = "TripleSplit",
            Label = "Triple split",
            Help = "Runs three quick splits. One cell can become eight."
        },
        {
            Id = "Respawn",
            Label = "Respawn",
            Help = "Respawns somewhere else while your size is below 5,000."
        },
        {
            Id = "Menu",
            Label = "Menu",
            Help = "Toggles the main menu."
        },
        {
            Id = "FixedMouse",
            Label = "Fixed mouse",
            Help = "Locks your movement aim to the current mouse screen position."
        },
        {
            Id = "CycleControlledBlob",
            Label = "Switch cell",
            Help = "Multi Account only: switches which cell follows your pointer."
        },
        {
            Id = "BotFeed",
            Label = "Bot feed",
            Help = "Hold to make active bots eject mass."
        },
        {
            Id = "BotSplit",
            Label = "Bot split",
            Help = "Orders active bots to split."
        },
        {
            Id = "BotFreeze",
            Label = "Bot freeze",
            Help = "Toggles active bots between moving and frozen."
        },
        {
            Id = "Slot1",
            Label = "Ability slot 1",
            Help = "Uses ability slot 1."
        },
        {
            Id = "Slot2",
            Label = "Ability slot 2",
            Help = "Uses ability slot 2."
        },
        {
            Id = "Slot3",
            Label = "Ability slot 3",
            Help = "Uses ability slot 3."
        },
        {
            Id = "Slot4",
            Label = "Ability slot 4",
            Help = "Uses ability slot 4."
        },
        {
            Id = "Slot5",
            Label = "Ability slot 5",
            Help = "Uses ability slot 5."
        },
        {
            Id = "Slot6",
            Label = "Ability slot 6",
            Help = "Uses ability slot 6."
        },
        {
            Id = "Slot7",
            Label = "Ability slot 7",
            Help = "Uses ability slot 7."
        },
        {
            Id = "Slot8",
            Label = "Ability slot 8",
            Help = "Uses ability slot 8."
        },
        {
            Id = "Slot9",
            Label = "Ability slot 9",
            Help = "Uses ability slot 9."
        },
        {
            Id = "Slot10",
            Label = "Ability slot 10",
            Help = "Uses ability slot 10."
        }
    };
    local u3 = {
        BtnZoomOut = "Zoom -",
        BtnZoomIn = "Zoom +",
        BtnSplit = "Split",
        BtnFeed = "Feed",
        BtnFreeze = "Freeze",
        BtnAutoFeed = "Feed lock",
        BtnBotSplit = "Bot split",
        BtnBotFeed = "Bot feed",
        BtnBotFreeze = "Bot freeze",
        BtnDoubleSplit = "Double split",
        BtnTripleSplit = "Triple split",
        BtnRespawn = "Respawn"
    };
    local u4 = {
        BtnDoubleSplit = {
            Text = "2X",
            Action = "DoubleSplit",
            Position = UDim2.new(1, -335, 1, -58),
            Size = UDim2.new(0, 54, 0, 42),
            Color = Color3.fromRGB(255, 160, 60)
        },
        BtnTripleSplit = {
            Text = "3X",
            Action = "TripleSplit",
            Position = UDim2.new(1, -335, 1, -108),
            Size = UDim2.new(0, 54, 0, 42),
            Color = Color3.fromRGB(255, 115, 60)
        },
        BtnRespawn = {
            Text = "RESP",
            Action = "Respawn",
            Position = UDim2.new(1, -335, 1, -158),
            Size = UDim2.new(0, 54, 0, 42),
            Color = Color3.fromRGB(170, 230, 255)
        }
    };
    local u5 = {
        BtnZoomOut = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(0, 142, 0, 82),
            Size = UDim2.new(0, 40, 0, 40),
            Color = Color3.fromRGB(150, 150, 150)
        },
        BtnZoomIn = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(0, 192, 0, 82),
            Size = UDim2.new(0, 40, 0, 40),
            Color = Color3.fromRGB(150, 150, 150)
        },
        BtnSplit = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(1, -160, 1, -70),
            Size = UDim2.new(0, 90, 0, 90),
            Color = Color3.fromRGB(255, 150, 50)
        },
        BtnFeed = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(1, -70, 1, -160),
            Size = UDim2.new(0, 75, 0, 75),
            Color = Color3.fromRGB(255, 200, 50)
        },
        BtnFreeze = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(1, -70, 1, -70),
            Size = UDim2.new(0, 70, 0, 70),
            Color = Color3.fromRGB(50, 170, 255)
        },
        BtnAutoFeed = {
            Alpha = 1,
            Visible = true,
            Position = UDim2.new(1, -150, 1, -160),
            Size = UDim2.new(0, 65, 0, 65),
            Color = Color3.fromRGB(120, 255, 50)
        },
        BtnBotFeed = {
            Alpha = 1,
            Visible = false,
            Position = UDim2.new(1, -262, 1, -70),
            Size = UDim2.new(0, 62, 0, 44),
            Color = Color3.fromRGB(255, 220, 80)
        },
        BtnBotSplit = {
            Alpha = 1,
            Visible = false,
            Position = UDim2.new(1, -220, 1, -126),
            Size = UDim2.new(0, 62, 0, 44),
            Color = Color3.fromRGB(255, 120, 70)
        },
        BtnBotFreeze = {
            Alpha = 1,
            Visible = false,
            Position = UDim2.new(1, -304, 1, -126),
            Size = UDim2.new(0, 62, 0, 44),
            Color = Color3.fromRGB(80, 200, 255)
        }
    };
    local u6 = { "#FFFFFF", "#000000" };
    local u7 = Color3.fromRGB(255, 85, 0);
    Color3.fromRGB(20, 20, 20);
    local u8 = Color3.fromRGB(47, 47, 47);
    local u9 = Color3.fromRGB(185, 185, 185);
    local u10 = Color3.fromRGB(245, 245, 245);
    local u11 = {};
    local u12 = nil;
    local u13 = nil;
    local u14 = nil;
    local u15 = nil;
    local u16 = nil;
    local u17 = nil;
    local u18 = {};
    local u19 = nil;
    local u20 = nil;
    local u21 = nil;
    local u22 = nil;
    local u23 = nil;
    local u24 = nil;
    local u25 = {};
    local u26 = nil;
    local u27 = nil;
    local u28 = false;
    local u29 = false;
    local function u33(u30) --[[ Line: 170 ]]
        -- upvalues: u26 (ref), l__UpdateControlSettings__8 (copy)
        if not u26 then
            return {
                Ok = false,
                Message = "Settings are still loading."
            };
        end;
        local v31, v32 = pcall(function() --[[ Line: 174 ]]
            -- upvalues: l__UpdateControlSettings__8 (ref), u30 (copy)
            return l__UpdateControlSettings__8:InvokeServer(u30);
        end);
        return (not v31 or type(v32) ~= "table") and {
            Ok = false,
            Message = "Settings are not available."
        } or v32;
    end;
    local function u40(p34, p35, p36) --[[ Line: 226 ]]
        -- upvalues: u10 (copy)
        local v37 = Instance.new("TextButton");
        v37.BackgroundColor3 = p36 or Color3.fromRGB(75, 75, 75);
        v37.BorderSizePixel = 0;
        v37.Text = p35;
        v37.AutoButtonColor = true;
        v37.Parent = p34;
        local v38 = Instance.new("UICorner");
        v38.CornerRadius = UDim.new(0, 5);
        v38.Parent = v37;
        v37.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
        v37.TextColor3 = u10;
        v37.TextSize = 14;
        v37.TextWrapped = true;
        v37.TextScaled = true;
        local v39 = Instance.new("UITextSizeConstraint");
        v39.MinTextSize = 8;
        v39.MaxTextSize = 14;
        v39.Parent = v37;
        return v37;
    end;
    local function u48() --[[ Line: 242 ]]
        -- upvalues: u11 (copy), u1 (copy), u26 (ref)
        for v41, v42 in pairs(u11) do
            if v42 and v42.Parent then
                local v43 = "Bind_" .. v41;
                local v44 = u1[v41] or "";
                local v45 = u26;
                if v45 then
                    v45 = v45:GetAttribute(v43);
                end;
                if v45 ~= nil and v45 ~= "" then
                    v44 = v45;
                end;
                local v46 = tostring(v44) or "";
                local v47 = tostring(v46);
                v42.Text = ({
                    Space = "Space",
                    One = "1",
                    Two = "2",
                    Three = "3",
                    Four = "4",
                    Five = "5",
                    Six = "6",
                    Seven = "7",
                    Eight = "8",
                    Nine = "9",
                    Zero = "0"
                })[v47] or v47;
            end;
        end;
    end;
    local function u54(u49) --[[ Line: 250 ]]
        -- upvalues: u13 (ref), u11 (copy), u12 (ref), l__UserInputService__3 (copy), u48 (copy), u33 (copy)
        if u13 then
            u13:Disconnect();
            u13 = nil;
        end;
        local v50 = u11[u49];
        if v50 then
            v50.Text = "Press key";
        end;
        if u12 then
            u12.Text = tostring("Press a keyboard key. Escape cancels.");
        end;
        u13 = l__UserInputService__3.InputBegan:Connect(function(p51) --[[ Line: 260 ]]
            -- upvalues: u13 (ref), u48 (ref), u12 (ref), u33 (ref), u49 (copy)
            if p51.UserInputType == Enum.UserInputType.Keyboard then
                if u13 then
                    u13:Disconnect();
                    u13 = nil;
                end;
                if p51.KeyCode == Enum.KeyCode.Escape then
                    u48();
                    if u12 then
                        u12.Text = tostring("Keybind change cancelled.");
                    end;
                else
                    local v52 = u33({
                        Action = "SetBind",
                        BindAction = u49,
                        Key = p51.KeyCode.Name
                    });
                    local v53 = v52.Message or (v52.Ok and "Keybind saved." or "Could not save keybind.");
                    if u12 then
                        u12.Text = tostring(v53 or "");
                    end;
                    u48();
                end;
            end;
        end);
    end;
    local function u61(p55, p56) --[[ Line: 290 ]]
        local u57;
        if type(p55) == "string" then
            local v58 = string.upper(string.gsub(p55, "#", ""));
            if string.match(v58, "^%x%x%x%x%x%x$") then
                u57 = "#" .. v58;
            else
                u57 = nil;
            end;
        else
            u57 = nil;
        end;
        if not u57 then
            return p56 or Color3.fromRGB(255, 255, 255);
        end;
        local v59, v60 = pcall(function() --[[ Line: 295 ]]
            -- upvalues: u57 (copy)
            return Color3.fromHex((string.sub(u57, 2)));
        end);
        return v59 and v60 and v60 or (p56 or Color3.fromRGB(255, 255, 255));
    end;
    local function u65(p62) --[[ Line: 318 ]]
        local v63 = tonumber(p62);
        if not v63 then
            return tostring(p62 or "");
        end;
        local v64 = math.floor(v63);
        return tostring(v64):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "");
    end;
    local function u69(u66, p67) --[[ Line: 364 ]]
        -- upvalues: l__LocalPlayer__5 (copy)
        if u66 and p67 then
            if p67.TypeSkin == "Async" and p67.Fetch then
                p67.Fetch(l__LocalPlayer__5.UserId, function(p68) --[[ Line: 369 ]]
                    -- upvalues: u66 (copy)
                    if u66 and u66.Parent then
                        u66.Image = p68;
                    end;
                end);
            elseif p67.ImageId then
                u66.Image = p67.ImageId;
            else
                u66.Image = "";
            end;
        end;
    end;
    local function u70() --[[ Line: 381 ]]
        -- upvalues: u29 (ref), u27 (ref)
        if u29 then
        else
            u29 = true;
            task.defer(function() --[[ Line: 386 ]]
                -- upvalues: u29 (ref), u27 (ref)
                u29 = false;
                if u27 then
                    u27();
                end;
            end);
        end;
    end;
    local function u74(p71) --[[ Line: 394 ]]
        -- upvalues: u70 (copy), u29 (ref), u27 (ref)
        if p71 then
            p71.AttributeChanged:Connect(u70);
            for _, v72 in ipairs(p71:GetChildren()) do
                if v72:IsA("Configuration") then
                    v72.AttributeChanged:Connect(u70);
                end;
            end;
            p71.ChildAdded:Connect(function(p73) --[[ Line: 404 ]]
                -- upvalues: u70 (ref), u29 (ref), u27 (ref)
                if p73:IsA("Configuration") then
                    p73.AttributeChanged:Connect(u70);
                end;
                if u29 then
                else
                    u29 = true;
                    task.defer(function() --[[ Line: 386 ]]
                        -- upvalues: u29 (ref), u27 (ref)
                        u29 = false;
                        if u27 then
                            u27();
                        end;
                    end);
                end;
            end);
            p71.ChildRemoved:Connect(u70);
        end;
    end;
    local function u76() --[[ Line: 413 ]]
        -- upvalues: u28 (ref), l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy), u74 (copy), u29 (ref), u27 (ref)
        if u28 then
        else
            u28 = true;
            for _, u75 in ipairs({
                "Inventory",
                "Gamepasses",
                "Equipped.Titles",
                "Equipped.ChatTitles",
                "Equipped.PassiveBoosts",
                "Settings"
            }) do
                task.spawn(function() --[[ Line: 419 ]]
                    -- upvalues: l__ClientPlayerState__12 (ref), u75 (copy), l__LocalPlayer__5 (ref), u74 (ref), u29 (ref), u27 (ref)
                    u74((l__ClientPlayerState__12.WaitForProxy(u75, l__LocalPlayer__5, 10)));
                    if u29 then
                    else
                        u29 = true;
                        task.defer(function() --[[ Line: 386 ]]
                            -- upvalues: u29 (ref), u27 (ref)
                            u29 = false;
                            if u27 then
                                u27();
                            end;
                        end);
                    end;
                end);
            end;
        end;
    end;
    local function u94() --[[ Line: 427 ]]
        -- upvalues: l__GameDatabase__13 (copy), l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy)
        local v77 = {};
        for v78, l__Type__14 in pairs(l__GameDatabase__13.Items or {}) do
            local v80;
            if type(l__Type__14) == "table" and l__Type__14.InventoryHidden ~= true then
                local v81;
                if l__Type__14 then
                    v81 = l__Type__14.Type;
                else
                    v81 = l__Type__14;
                end;
                local v82 = v81 == "Skins" and "Skin" or ((v81 == "Accessory" or (v81 == "Accessories" or (v81 == "Hat" or v81 == "Hats"))) and "Accessory" or (v81 == "Abilities" and "Ability" or (v81 == "Cases" and "Case" or v81)));
                if v82 == "Title" or (v82 == "ChatTitle" or (v82 == "NameColor" or v82 == "PassiveBoost")) then
                    local v83 = l__ClientPlayerState__12.GetProxy("Inventory", l__LocalPlayer__5);
                    if v83 then
                        v83 = v83:FindFirstChild(v78);
                    end;
                    local v84;
                    if v83 then
                        local v85 = v83:GetAttribute("Amount");
                        v84 = v85 == nil and 1 or (tonumber(v85) or 0);
                    else
                        v84 = 0;
                    end;
                    if v84 > 0 then
                        v80 = true;
                    else
                        local v86;
                        if l__Type__14 then
                            v86 = l__Type__14.SubscriptionBound;
                        else
                            v86 = l__Type__14;
                        end;
                        if type(v86) == "string" and v86 ~= "" then
                            local v87 = l__ClientPlayerState__12.GetProxy("Gamepasses", l__LocalPlayer__5);
                            if v87 == nil then
                                v80 = false;
                            else
                                v80 = v87:GetAttribute(v86) == true;
                            end;
                        else
                            v80 = false;
                        end;
                    end;
                else
                    v80 = false;
                end;
            else
                v80 = false;
            end;
            if v80 then
                local v88 = {
                    Key = v78,
                    Data = l__Type__14
                };
                if l__Type__14 then
                    local l__Type__14 = l__Type__14.Type;
                end;
                v88.Type = l__Type__14 == "Skins" and "Skin" or ((l__Type__14 == "Accessory" or (l__Type__14 == "Accessories" or (l__Type__14 == "Hat" or l__Type__14 == "Hats"))) and "Accessory" or (l__Type__14 == "Abilities" and "Ability" or (l__Type__14 == "Cases" and "Case" or l__Type__14)));
                table.insert(v77, v88);
            end;
        end;
        local u89 = {
            PassiveBoost = 1,
            ChatTitle = 2,
            Title = 3,
            NameColor = 4
        };
        table.sort(v77, function(p90, p91) --[[ Line: 444 ]]
            -- upvalues: u89 (copy)
            local v92 = u89[p90.Type] or 99;
            local v93 = u89[p91.Type] or 99;
            if v92 == v93 then
                return tostring(p90.Data.Name or p90.Key) < tostring(p91.Data.Name or p91.Key);
            else
                return v92 < v93;
            end;
        end);
        return v77;
    end;
    local function u107(p95, p96, p97) --[[ Line: 455 ]]
        -- upvalues: l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy)
        if p97 == "Title" then
            return "Clan title";
        end;
        if p97 == "ChatTitle" then
            return "Chat title";
        end;
        if p97 == "NameColor" then
            return "Nickname color";
        end;
        if p97 ~= "PassiveBoost" then
            return tostring(p97 or "Perk");
        end;
        local v98 = l__ClientPlayerState__12.GetProxy("Inventory", l__LocalPlayer__5);
        if v98 then
            v98 = v98:FindFirstChild(p95);
        end;
        if v98 then
            local v99 = v98:GetAttribute("Amount");
            if v99 ~= nil then
                local _ = tonumber(v99) or 0;
            end;
        else
            v98 = nil;
        end;
        if p96 then
            p96 = p96.SubscriptionBound;
        end;
        local v100;
        if type(p96) == "string" and p96 ~= "" then
            local v101 = l__ClientPlayerState__12.GetProxy("Gamepasses", l__LocalPlayer__5);
            if v101 == nil then
                v100 = false;
            else
                v100 = v101:GetAttribute(p96) == true;
            end;
        else
            v100 = false;
        end;
        local v102 = v98 and tonumber(v98:GetAttribute("ExpiresAt")) or 0;
        if v102 <= 0 or v100 then
            return "Passive boost";
        end;
        local v103 = v102 - os.time();
        local v104 = math.floor(v103);
        local v105 = math.max(0, v104);
        local v106 = math.floor(v105 / 60);
        return v105 > 0 and string.format("Passive %d:%02d", v106, v105 % 60) or "Expired";
    end;
    local function u131(p108, p109, p110) --[[ Line: 477 ]]
        -- upvalues: u26 (ref), l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy)
        local v111 = u26;
        local v112 = l__ClientPlayerState__12.GetProxy("Inventory", l__LocalPlayer__5);
        if v112 then
            v112 = v112:FindFirstChild(p108);
        end;
        local v113;
        if v112 then
            local v114 = v112:GetAttribute("Amount");
            v113 = v114 == nil and 1 or (tonumber(v114) or 0);
        else
            v113 = 0;
        end;
        local v115;
        if v113 > 0 then
            v115 = true;
        else
            local v116;
            if p109 then
                v116 = p109.SubscriptionBound;
            else
                v116 = p109;
            end;
            if type(v116) == "string" and v116 ~= "" then
                local v117 = l__ClientPlayerState__12.GetProxy("Gamepasses", l__LocalPlayer__5);
                if v117 == nil then
                    v115 = false;
                else
                    v115 = v117:GetAttribute(v116) == true;
                end;
            else
                v115 = false;
            end;
        end;
        if not v115 then
            return "LOCKED", Color3.fromRGB(95, 95, 95), Color3.new(1, 1, 1), false;
        end;
        if p110 == "Title" then
            local v118 = l__ClientPlayerState__12.GetProxy("Equipped.Titles", l__LocalPlayer__5);
            if v118 then
                v118 = v118:GetAttribute("Slot1") == p108;
            end;
            return v118 and "UNEQUIP" or "EQUIP", v118 and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(55, 135, 220), v118 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), true;
        end;
        if p110 == "ChatTitle" then
            local v119 = l__ClientPlayerState__12.GetProxy("Equipped.ChatTitles", l__LocalPlayer__5);
            if v119 then
                v119 = v119:GetAttribute("Slot1") == p108;
            end;
            return v119 and "UNEQUIP" or "EQUIP", v119 and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(40, 120, 200), v119 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), true;
        end;
        if p110 == "NameColor" then
            if v111 then
                v111 = v111:GetAttribute("NicknameColor");
            end;
            local v120;
            if type(v111) == "string" then
                local v121 = string.upper(string.gsub(v111, "#", ""));
                if string.match(v121, "^%x%x%x%x%x%x$") then
                    v120 = "#" .. v121;
                else
                    v120 = nil;
                end;
            else
                v120 = nil;
            end;
            local l__Color__15 = p109.Color;
            local v122;
            if type(l__Color__15) == "string" then
                local v123 = string.upper(string.gsub(l__Color__15, "#", ""));
                if string.match(v123, "^%x%x%x%x%x%x$") then
                    v122 = "#" .. v123;
                else
                    v122 = nil;
                end;
            else
                v122 = nil;
            end;
            local v124;
            if v120 == nil or v122 == nil then
                v124 = false;
            else
                v124 = v120 == v122;
            end;
            return v124 and "APPLIED" or "APPLY", v124 and Color3.fromRGB(95, 95, 95) or Color3.fromRGB(55, 135, 220), Color3.new(1, 1, 1), not v124;
        end;
        if p110 ~= "PassiveBoost" then
            return "OWNED", Color3.fromRGB(95, 95, 95), Color3.new(1, 1, 1), false;
        end;
        local v125 = l__ClientPlayerState__12.GetProxy("Inventory", l__LocalPlayer__5);
        if v125 then
            v125 = v125:FindFirstChild(p108);
        end;
        if v125 then
            local v126 = v125:GetAttribute("Amount");
            if v126 ~= nil then
                local _ = tonumber(v126) or 0;
            end;
        else
            v125 = nil;
        end;
        if p109 then
            p109 = p109.SubscriptionBound;
        end;
        local v127;
        if type(p109) == "string" and p109 ~= "" then
            local v128 = l__ClientPlayerState__12.GetProxy("Gamepasses", l__LocalPlayer__5);
            if v128 == nil then
                v127 = false;
            else
                v127 = v128:GetAttribute(p109) == true;
            end;
        else
            v127 = false;
        end;
        local v129 = v125 and tonumber(v125:GetAttribute("ExpiresAt")) or 0;
        if v129 > 0 and (v129 <= os.time() and not v127) then
            return "EXPIRED", Color3.fromRGB(95, 95, 95), Color3.new(1, 1, 1), false;
        end;
        local v130 = l__ClientPlayerState__12.GetProxy("Equipped.PassiveBoosts", l__LocalPlayer__5);
        if v130 then
            v130 = v130:GetAttribute(p108) == true;
        end;
        return v130 and "DISABLE" or "ENABLE", v130 and Color3.fromRGB(220, 220, 220) or Color3.fromRGB(70, 170, 80), v130 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1), true;
    end;
    local function u142(p132, p133, p134) --[[ Line: 509 ]]
        -- upvalues: u61 (copy)
        local v135 = Instance.new("TextLabel");
        v135.Name = "FallbackSymbol";
        v135.Position = UDim2.new(0, 8, 0, 8);
        v135.Size = UDim2.new(1, -16, 0, 42);
        v135.BackgroundColor3 = Color3.fromRGB(36, 42, 52);
        v135.BorderSizePixel = 0;
        v135.TextColor3 = Color3.new(1, 1, 1);
        v135.Font = Enum.Font.GothamBlack;
        v135.TextScaled = true;
        v135.Parent = p132;
        local v136 = Instance.new("UICorner");
        v136.CornerRadius = UDim.new(0, 6);
        v136.Parent = v135;
        local v137 = Instance.new("UITextSizeConstraint");
        v137.MinTextSize = 8;
        v137.MaxTextSize = 24;
        v137.Parent = v135;
        if p134 == "Title" or p134 == "ChatTitle" then
            v135.Text = tostring(p133.TitleText or (p133.ChatTitleText or "TITLE"));
            v135.TextColor3 = Color3.fromRGB(255, 216, 90);
            local v138 = p133.TitleColor or p133.ChatTitleColor;
            local v139;
            if type(v138) == "string" then
                local v140 = string.upper(string.gsub(v138, "#", ""));
                if string.match(v140, "^%x%x%x%x%x%x$") then
                    v139 = "#" .. v140;
                else
                    v139 = nil;
                end;
            else
                v139 = nil;
            end;
            if v139 then
                v135.TextColor3 = u61(v139, v135.TextColor3);
            end;
        else
            if p134 == "NameColor" then
                v135.Text = "Aa";
                v135.TextColor3 = u61(p133.Color, Color3.fromRGB(255, 255, 255));
                return;
            end;
            if p134 == "PassiveBoost" then
                v135.Text = "x" .. tostring(p133.Multiplier or 2);
                v135.TextColor3 = Color3.fromRGB(125, 211, 252);
                return;
            end;
            local v141 = tostring(p133.Name or "?");
            v135.Text = string.sub(v141, 1, 2);
        end;
    end;
    local function u174(p143, p144) --[[ Line: 543 ]]
        -- upvalues: u10 (copy), u8 (copy), u9 (copy), u27 (ref), u94 (copy), l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy), u69 (copy), u142 (copy), u65 (copy), u107 (copy), u131 (copy), u40 (copy), l__EquipItemEvent__10 (copy), u12 (ref), u70 (copy), u76 (copy)
        local v145 = Instance.new("TextLabel");
        v145.Name = "PerksTitle";
        v145.Size = UDim2.new(1, -12, 0, 26);
        v145.BackgroundTransparency = 1;
        v145.Text = "Perks";
        v145.TextXAlignment = Enum.TextXAlignment.Left;
        v145.LayoutOrder = p144;
        v145.Parent = p143;
        v145.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
        v145.TextColor3 = u10;
        v145.TextSize = 18;
        v145.TextWrapped = true;
        v145.TextScaled = true;
        local v146 = Instance.new("UITextSizeConstraint");
        v146.MinTextSize = 8;
        v146.MaxTextSize = 18;
        v146.Parent = v145;
        local u147 = Instance.new("Frame");
        u147.Name = "PerksGrid";
        u147.Size = UDim2.new(1, -12, 0, 0);
        u147.BackgroundTransparency = 1;
        u147.LayoutOrder = p144 + 1;
        u147.Parent = p143;
        local u148 = Instance.new("UIGridLayout");
        u148.SortOrder = Enum.SortOrder.LayoutOrder;
        u148.CellSize = UDim2.new(0.5, -5, 0, 132);
        u148.CellPadding = UDim2.fromOffset(6, 6);
        u148.Parent = u147;
        local u149 = Instance.new("TextLabel");
        u149.Name = "PerksEmpty";
        u149.Size = UDim2.new(1, -12, 0, 34);
        u149.BackgroundColor3 = u8;
        u149.BorderSizePixel = 0;
        u149.Text = "No owned perks yet.";
        u149.TextColor3 = u9;
        u149.LayoutOrder = p144 + 2;
        u149.Visible = false;
        u149.Parent = p143;
        local v150 = Instance.new("UICorner");
        v150.CornerRadius = UDim.new(0, 5);
        v150.Parent = u149;
        u149.Font = Enum.Font.Gotham;
        u149.TextColor3 = u10;
        u149.TextSize = 13;
        u149.TextWrapped = true;
        u149.TextScaled = true;
        local v151 = Instance.new("UITextSizeConstraint");
        v151.MinTextSize = 8;
        v151.MaxTextSize = 13;
        v151.Parent = u149;
        u148:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Name: updateGridHeight, Line 580 ]]
            -- upvalues: u148 (copy), u147 (copy)
            u147.Size = UDim2.new(1, -12, 0, u148.AbsoluteContentSize.Y);
        end);
        u27 = function() --[[ Line: 586 ]]
            -- upvalues: u147 (copy), u94 (ref), u149 (copy), l__ClientPlayerState__12 (ref), l__LocalPlayer__5 (ref), u69 (ref), u142 (ref), u65 (ref), u10 (ref), u107 (ref), u9 (ref), u131 (ref), u40 (ref), l__EquipItemEvent__10 (ref), u12 (ref), u70 (ref), u148 (copy)
            if u147.Parent then
                for _, v152 in ipairs(u147:GetChildren()) do
                    if v152:GetAttribute("PerkCard") == true then
                        v152:Destroy();
                    end;
                end;
                local v153 = u94();
                u149.Visible = #v153 == 0;
                u147.Visible = #v153 > 0;
                for v154, v155 in ipairs(v153) do
                    local l__Key__16 = v155.Key;
                    local l__Data__17 = v155.Data;
                    local l__Type__18 = v155.Type;
                    local v156 = l__ClientPlayerState__12.GetProxy("Inventory", l__LocalPlayer__5);
                    if v156 then
                        v156 = v156:FindFirstChild(l__Key__16);
                    end;
                    local v157;
                    if v156 then
                        local v158 = v156:GetAttribute("Amount");
                        v157 = v158 == nil and 1 or (tonumber(v158) or 0);
                    else
                        v157 = 0;
                    end;
                    local v159 = Instance.new("Frame");
                    v159.Name = l__Key__16;
                    v159:SetAttribute("PerkCard", true);
                    v159.LayoutOrder = v154;
                    v159.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
                    v159.BorderSizePixel = 0;
                    v159.Parent = u147;
                    local v160 = Instance.new("UICorner");
                    v160.CornerRadius = UDim.new(0, 6);
                    v160.Parent = v159;
                    local v161 = Instance.new("ImageLabel");
                    v161.Name = "Icon";
                    v161.Position = UDim2.new(0, 8, 0, 8);
                    v161.Size = UDim2.new(1, -16, 0, 42);
                    v161.BackgroundTransparency = 1;
                    v161.ScaleType = Enum.ScaleType.Fit;
                    v161.Parent = v159;
                    u69(v161, l__Data__17);
                    if v161.Image == "" then
                        v161.Visible = false;
                        u142(v159, l__Data__17, l__Type__18);
                    end;
                    if v157 > 1 then
                        local v162 = Instance.new("TextLabel");
                        v162.Name = "Amount";
                        v162.Position = UDim2.new(0, 7, 0, 7);
                        v162.Size = UDim2.fromOffset(38, 18);
                        v162.BackgroundColor3 = Color3.fromRGB(22, 22, 22);
                        v162.Text = "x" .. u65(v157);
                        v162.TextColor3 = Color3.new(1, 1, 1);
                        v162.Font = Enum.Font.GothamBold;
                        v162.TextScaled = true;
                        v162.Parent = v159;
                        local v163 = Instance.new("UICorner");
                        v163.CornerRadius = UDim.new(0, 4);
                        v163.Parent = v162;
                        local v164 = Instance.new("UITextSizeConstraint");
                        v164.MinTextSize = 8;
                        v164.MaxTextSize = 11;
                        v164.Parent = v162;
                    end;
                    local v165 = Instance.new("TextLabel");
                    v165.Name = "Name";
                    v165.Position = UDim2.new(0, 7, 0, 54);
                    v165.Size = UDim2.new(1, -14, 0, 24);
                    v165.BackgroundTransparency = 1;
                    v165.Text = tostring(l__Data__17.Name or l__Key__16);
                    v165.TextXAlignment = Enum.TextXAlignment.Center;
                    v165.TextTruncate = Enum.TextTruncate.AtEnd;
                    v165.Parent = v159;
                    v165.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                    v165.TextColor3 = u10;
                    v165.TextSize = 12;
                    v165.TextWrapped = true;
                    v165.TextScaled = true;
                    local v166 = Instance.new("UITextSizeConstraint");
                    v166.MinTextSize = 8;
                    v166.MaxTextSize = 12;
                    v166.Parent = v165;
                    local v167 = Instance.new("TextLabel");
                    v167.Name = "Meta";
                    v167.Position = UDim2.new(0, 7, 0, 76);
                    v167.Size = UDim2.new(1, -14, 0, 20);
                    v167.BackgroundTransparency = 1;
                    v167.Text = u107(l__Key__16, l__Data__17, l__Type__18);
                    v167.TextColor3 = u9;
                    v167.TextXAlignment = Enum.TextXAlignment.Center;
                    v167.Parent = v159;
                    v167.Font = Enum.Font.Gotham;
                    v167.TextColor3 = u10;
                    v167.TextSize = 10;
                    v167.TextWrapped = true;
                    v167.TextScaled = true;
                    local v168 = Instance.new("UITextSizeConstraint");
                    v168.MinTextSize = 8;
                    v168.MaxTextSize = 10;
                    v168.Parent = v167;
                    local v169, v170, v171, v172 = u131(l__Key__16, l__Data__17, l__Type__18);
                    local u173 = u40(v159, v169, v170);
                    u173.Name = "Action";
                    u173.Position = UDim2.new(0, 8, 1, -32);
                    u173.Size = UDim2.new(1, -16, 0, 24);
                    u173.TextColor3 = v171;
                    u173.Active = v172;
                    u173.AutoButtonColor = v172;
                    u173.MouseButton1Click:Connect(function() --[[ Line: 675 ]]
                        -- upvalues: u173 (copy), l__EquipItemEvent__10 (ref), u12 (ref), l__Key__16 (copy), u70 (ref)
                        if u173.Active then
                            if l__EquipItemEvent__10 and l__EquipItemEvent__10:IsA("RemoteEvent") then
                                l__EquipItemEvent__10:FireServer(l__Key__16);
                                if u12 then
                                    u12.Text = tostring("Perk updated.");
                                end;
                                task.delay(0.25, u70);
                            else
                                if u12 then
                                    u12.Text = tostring("Perk controls are not ready.");
                                end;
                            end;
                        end;
                    end);
                end;
                u147.Size = UDim2.new(1, -12, 0, u148.AbsoluteContentSize.Y);
            end;
        end;
        u76();
        u27();
    end;
    local function u179() --[[ Line: 695 ]]
        -- upvalues: u26 (ref), l__HttpService__4 (copy), u25 (ref)
        local v175 = u26;
        if v175 then
            v175 = v175:GetAttribute("MobileControlsJson");
        end;
        local u176 = tostring((v175 == nil or v175 == "") and "{}" or v175);
        local v177, v178 = pcall(function() --[[ Line: 697 ]]
            -- upvalues: l__HttpService__4 (ref), u176 (copy)
            return l__HttpService__4:JSONDecode(u176);
        end);
        if v177 and type(v178) == "table" then
            u25 = v178;
        else
            u25 = {};
        end;
        return u25;
    end;
    local function u200(p180, p181) --[[ Line: 723 ]]
        -- upvalues: l__UserInputService__3 (copy), u61 (copy)
        if type(p181) == "table" and p180 then
            p180.AnchorPoint = Vector2.new(0.5, 0.5);
            local l__CurrentCamera__19 = workspace.CurrentCamera;
            local v182 = l__CurrentCamera__19 and l__CurrentCamera__19.ViewportSize or Vector2.new(1280, 720);
            local v183 = tonumber(p181.X) or (p180.AbsolutePosition.X + p180.AbsoluteSize.X * 0.5) / v182.X;
            local v184 = math.clamp(v183, 0.02, 0.98);
            local v185 = tonumber(p181.Y) or (p180.AbsolutePosition.Y + p180.AbsoluteSize.Y * 0.5) / v182.Y;
            local v186 = math.clamp(v185, 0.02, 0.98);
            if l__UserInputService__3.TouchEnabled and (p180.Name == "BtnZoomOut" or p180.Name == "BtnZoomIn") then
                local v187 = 82 / math.max(1, v182.Y);
                local v188 = math.clamp(v187, 0.16, 0.25);
                v186 = math.max(v186, v188);
                if p180.Name == "BtnZoomOut" then
                    local v189 = 142 / math.max(1, v182.X);
                    local v190 = math.clamp(v189, 0.16, 0.32);
                    v184 = math.max(v184, v190);
                else
                    local v191 = 192 / math.max(1, v182.X);
                    local v192 = math.clamp(v191, 0.22, 0.4);
                    v184 = math.max(v184, v192);
                end;
            end;
            local v193 = tonumber(p181.W) or p180.AbsoluteSize.X;
            local v194 = math.clamp(v193, 34, 180);
            local v195 = tonumber(p181.H) or p180.AbsoluteSize.Y;
            local v196 = math.clamp(v195, 28, 180);
            p180.Position = UDim2.fromScale(v184, v186);
            p180.Size = UDim2.fromOffset(v194, v196);
            p180.Visible = p181.Visible ~= false;
            local v197 = tonumber(p181.Alpha) or p180.BackgroundTransparency;
            p180.BackgroundTransparency = math.clamp(v197, 0, 1);
            local v198 = u61(p181.Color, p180.TextColor3);
            p180.TextColor3 = v198;
            p180.BackgroundColor3 = v198;
            local v199 = p180:FindFirstChildOfClass("UIStroke");
            if v199 then
                v199.Color = v198;
            end;
        end;
    end;
    local function u210(p201) --[[ Line: 754 ]]
        local l__Parent__20 = p201.Parent;
        local l__CurrentCamera__21 = workspace.CurrentCamera;
        local v202 = l__CurrentCamera__21 and l__CurrentCamera__21.ViewportSize or Vector2.new(1280, 720);
        local v203;
        if l__Parent__20 and l__Parent__20:IsA("GuiObject") then
            v203 = l__Parent__20.AbsoluteSize;
        else
            v203 = v202;
        end;
        local v204 = math.max(v203.X, v202.X, 1);
        local v205 = math.max(v203.Y, v202.Y, 1);
        local v206 = p201.Position.X.Scale + p201.Position.X.Offset / v204;
        local v207 = p201.Position.Y.Scale + p201.Position.Y.Offset / v205;
        local v208 = v206 + (0.5 - p201.AnchorPoint.X) * p201.AbsoluteSize.X / v204;
        local v209 = v207 + (0.5 - p201.AnchorPoint.Y) * p201.AbsoluteSize.Y / v205;
        return math.clamp(v208, 0.02, 0.98), math.clamp(v209, 0.02, 0.98);
    end;
    local function u225(p211, p212, p213, p214, p215, p216, u217, p218) --[[ Line: 770 ]]
        -- upvalues: l__Input_Action__9 (copy)
        local v219 = p211:FindFirstChild(p212);
        if v219 and v219:IsA("TextButton") then
            return v219;
        end;
        local v220 = Instance.new("TextButton");
        v220.Name = p212;
        v220.AnchorPoint = Vector2.new(0.5, 0.5);
        v220.Position = p214;
        v220.Size = p215;
        v220.BackgroundColor3 = p216;
        v220.BackgroundTransparency = 1;
        v220.TextColor3 = p216;
        v220.Text = p213;
        v220.TextScaled = true;
        v220.Font = Enum.Font.GothamBlack;
        v220.BorderSizePixel = 0;
        v220.Parent = p211;
        local v221 = Instance.new("UICorner");
        v221.CornerRadius = UDim.new(0, 14);
        v221.Parent = v220;
        local v222 = Instance.new("UIStroke");
        v222.Color = p216;
        v222.Thickness = 3;
        v222.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
        v222.Parent = v220;
        v220:SetAttribute("ControlSettingsExtra", true);
        if not p218 then
            v220.MouseButton1Click:Connect(function() --[[ Line: 807 ]]
                -- upvalues: l__Input_Action__9 (ref), u217 (copy)
                l__Input_Action__9:FireServer(u217);
            end);
            return v220;
        end;
        v220.InputBegan:Connect(function(p223) --[[ Line: 796 ]]
            -- upvalues: l__Input_Action__9 (ref), u217 (copy)
            if p223.UserInputType == Enum.UserInputType.Touch or p223.UserInputType == Enum.UserInputType.MouseButton1 then
                l__Input_Action__9:FireServer(u217 .. "_Start");
            end;
        end);
        v220.InputEnded:Connect(function(p224) --[[ Line: 801 ]]
            -- upvalues: l__Input_Action__9 (ref), u217 (copy)
            if p224.UserInputType == Enum.UserInputType.Touch or p224.UserInputType == Enum.UserInputType.MouseButton1 then
                l__Input_Action__9:FireServer(u217 .. "_Stop");
            end;
        end);
        return v220;
    end;
    local function u232(p226) --[[ Line: 814 ]]
        -- upvalues: l__PlayerGui__6 (copy), u4 (copy), u25 (ref), u225 (copy)
        local v227 = l__PlayerGui__6:FindFirstChild("MobileAgaricControls");
        if not v227 then
            return nil;
        end;
        for v228, v229 in pairs(u4) do
            local v230 = v227:FindFirstChild(v228);
            local v231 = u25[v228];
            if p226 or type(v231) == "table" and (v231.Visible ~= false and v231.Added == true) then
                u225(v227, v228, v229.Text, v229.Position, v229.Size, v229.Color, v229.Action, false);
            elseif v230 and v230:GetAttribute("ControlSettingsExtra") then
                v230:Destroy();
            end;
        end;
        return v227;
    end;
    local function u240() --[[ Line: 831 ]]
        -- upvalues: l__PlayerGui__6 (copy), u5 (copy), u4 (copy)
        local v233 = l__PlayerGui__6:FindFirstChild("MobileAgaricControls");
        if v233 then
            for v234, v235 in pairs(u5) do
                local v236 = v233:FindFirstChild(v234);
                if v236 and v236:IsA("TextButton") then
                    v236.AnchorPoint = Vector2.new(0.5, 0.5);
                    v236.Position = v235.Position;
                    v236.Size = v235.Size;
                    v236.TextColor3 = v235.Color;
                    v236.BackgroundColor3 = v235.Color;
                    v236.BackgroundTransparency = v235.Alpha;
                    v236.Visible = v235.Visible;
                    local v237 = v236:FindFirstChildOfClass("UIStroke");
                    if v237 then
                        v237.Color = v235.Color;
                    end;
                end;
            end;
            for v238 in pairs(u4) do
                local v239 = v233:FindFirstChild(v238);
                if v239 and v239:GetAttribute("ControlSettingsExtra") then
                    v239:Destroy();
                end;
            end;
        end;
    end;
    local function u248() --[[ Line: 860 ]]
        -- upvalues: u179 (copy), u232 (copy), u3 (copy), u200 (copy), u25 (ref), u61 (copy)
        u179();
        local v241 = u232(false);
        if v241 then
            for v242 in pairs(u3) do
                local v243 = v241:FindFirstChild(v242);
                if v243 and v243:IsA("TextButton") then
                    u200(v243, u25[v242]);
                end;
            end;
            local v244 = v241:FindFirstChild("JoystickBase");
            if v244 and (v244:IsA("Frame") and type(u25.JoystickBase) == "table") then
                local l__JoystickBase__22 = u25.JoystickBase;
                local v245 = tonumber(l__JoystickBase__22.W) or v244.AbsoluteSize.X;
                local v246 = math.clamp(v245, 60, 180);
                v244.Size = UDim2.fromOffset(v246, v246);
                local v247 = tonumber(l__JoystickBase__22.Alpha) or v244.BackgroundTransparency;
                v244.BackgroundTransparency = math.clamp(v247, 0, 1);
                v244.BackgroundColor3 = u61(l__JoystickBase__22.Color, v244.BackgroundColor3);
            end;
        end;
    end;
    local function u254() --[[ Line: 882 ]]
        -- upvalues: u232 (copy), u3 (copy), u210 (copy), u25 (ref), u4 (copy)
        local v249 = u232(false);
        if v249 then
            for v250 in pairs(u3) do
                local v251 = v249:FindFirstChild(v250);
                if v251 and v251:IsA("TextButton") then
                    local v252, v253 = u210(v251);
                    u25[v250] = {
                        X = v252,
                        Y = v253,
                        W = math.floor(v251.AbsoluteSize.X + 0.5),
                        H = math.floor(v251.AbsoluteSize.Y + 0.5),
                        Color = "#" .. v251.TextColor3:ToHex(),
                        Alpha = v251.BackgroundTransparency,
                        Visible = v251.Visible,
                        Added = u4[v250] ~= nil and true or nil
                    };
                end;
            end;
        end;
    end;
    local function u278() --[[ Line: 912 ]]
        -- upvalues: u18 (copy), u17 (ref), u232 (copy), u12 (ref), u3 (copy), u210 (copy), u7 (copy), u10 (copy), u14 (ref), u254 (copy), l__HttpService__4 (copy), u25 (ref), u33 (copy), l__UserInputService__3 (copy)
        for _, v255 in ipairs(u18) do
            v255:Disconnect();
        end;
        table.clear(u18);
        if u17 then
            for _, v256 in ipairs(u17:GetChildren()) do
                v256:Destroy();
            end;
            local v257 = u232(false);
            if v257 then
                local l__CurrentCamera__23 = workspace.CurrentCamera;
                local u258 = l__CurrentCamera__23 and l__CurrentCamera__23.ViewportSize or Vector2.new(1280, 720);
                for v259, u260 in pairs(u3) do
                    local u261 = v257:FindFirstChild(v259);
                    if u261 and u261:IsA("TextButton") then
                        local u262 = Instance.new("TextButton");
                        u262.Name = "Handle_" .. v259;
                        u262.AnchorPoint = Vector2.new(0.5, 0.5);
                        local v263, v264 = u210(u261);
                        u262.Position = UDim2.fromOffset(v263 * u258.X, v264 * u258.Y);
                        u262.Size = UDim2.fromOffset(u261.AbsoluteSize.X, u261.AbsoluteSize.Y);
                        u262.BackgroundColor3 = u7;
                        u262.BackgroundTransparency = 0.55;
                        u262.BorderSizePixel = 0;
                        u262.Text = u260;
                        u262.ZIndex = 20;
                        u262.Parent = u17;
                        local v265 = Instance.new("UICorner");
                        v265.CornerRadius = UDim.new(0, 8);
                        v265.Parent = u262;
                        u262.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                        u262.TextColor3 = u10;
                        u262.TextSize = 11;
                        u262.TextWrapped = true;
                        u262.TextScaled = true;
                        local v266 = Instance.new("UITextSizeConstraint");
                        v266.MinTextSize = 8;
                        v266.MaxTextSize = 11;
                        v266.Parent = u262;
                        local v267 = Instance.new("UIStroke");
                        v267.Color = Color3.new(1, 1, 1);
                        v267.Thickness = 1.5;
                        v267.Parent = u262;
                        local u268 = nil;
                        local u269 = nil;
                        local u270 = nil;
                        table.insert(u18, u262.InputBegan:Connect(function(p271) --[[ Line: 951 ]]
                            -- upvalues: u14 (ref), u261 (copy), u269 (ref), u270 (ref), u262 (copy), u268 (ref), u260 (copy), u12 (ref)
                            if p271.UserInputType == Enum.UserInputType.Touch or p271.UserInputType == Enum.UserInputType.MouseButton1 then
                                u14 = u261;
                                u269 = Vector2.new(p271.Position.X, p271.Position.Y);
                                u270 = Vector2.new(u262.Position.X.Offset, u262.Position.Y.Offset);
                                u268 = p271;
                                local v272 = "Editing " .. u260 .. ". Drag it, then adjust size/color/transparency.";
                                if u12 then
                                    u12.Text = tostring(v272 or "");
                                end;
                            end;
                        end));
                        table.insert(u18, u262.InputEnded:Connect(function(p273) --[[ Line: 960 ]]
                            -- upvalues: u268 (ref), u254 (ref), l__HttpService__4 (ref), u25 (ref), u33 (ref), u12 (ref)
                            if p273 == u268 then
                                u268 = nil;
                                u254();
                                local v274 = u33({
                                    Action = "SetMobileControls",
                                    Layout = l__HttpService__4:JSONEncode(u25)
                                }).Message or "Mobile controls saved.";
                                if u12 then
                                    u12.Text = tostring(v274 or "");
                                end;
                            end;
                        end));
                        table.insert(u18, l__UserInputService__3.InputChanged:Connect(function(p275) --[[ Line: 967 ]]
                            -- upvalues: u268 (ref), u269 (ref), u270 (ref), u258 (copy), u262 (copy), u261 (copy)
                            if p275 == u268 and (u269 and u270) then
                                local v276 = Vector2.new(p275.Position.X, p275.Position.Y) - u269;
                                local v277 = Vector2.new(math.clamp(u270.X + v276.X, 18, u258.X - 18), (math.clamp(u270.Y + v276.Y, 18, u258.Y - 18)));
                                u262.Position = UDim2.fromOffset(v277.X, v277.Y);
                                u261.AnchorPoint = Vector2.new(0.5, 0.5);
                                u261.Position = UDim2.fromScale(v277.X / u258.X, v277.Y / u258.Y);
                            end;
                        end));
                    end;
                end;
            else
                if u12 then
                    u12.Text = tostring("Mobile controls appear after touch controls are created.");
                end;
            end;
        end;
    end;
    local function u285() --[[ Line: 980 ]]
        -- upvalues: u232 (copy), u12 (ref), u3 (copy), u210 (copy), u14 (ref), u254 (copy), l__HttpService__4 (copy), u25 (ref), u33 (copy), u278 (copy)
        local v279 = u232(false);
        if v279 then
            for v280 in pairs(u3) do
                local v281 = v279:FindFirstChild(v280);
                if v281 and v281:IsA("TextButton") then
                    local v282, v283 = u210(v281);
                    v281.AnchorPoint = Vector2.new(0.5, 0.5);
                    v281.Position = UDim2.fromScale(math.clamp(1 - v282, 0.02, 0.98), v283);
                end;
            end;
            u14 = nil;
            u254();
            local v284 = u33({
                Action = "SetMobileControls",
                Layout = l__HttpService__4:JSONEncode(u25)
            }).Message or "Mobile controls saved.";
            if u12 then
                u12.Text = tostring(v284 or "");
            end;
            u278();
            if u12 then
                u12.Text = tostring("Mobile controls mirrored.");
            end;
        else
            if u12 then
                u12.Text = tostring("Mobile controls appear after touch controls are created.");
            end;
        end;
    end;
    local function u293(p286, p287) --[[ Line: 1003 ]]
        -- upvalues: u14 (ref), u12 (ref), u254 (copy), l__HttpService__4 (copy), u25 (ref), u33 (copy), u278 (copy)
        local v288 = u14;
        if v288 and v288.Parent then
            if p286 == "Size" then
                local v289 = math.clamp(v288.AbsoluteSize.X + p287, 34, 180);
                local v290 = v288.AbsoluteSize.Y / math.max(v288.AbsoluteSize.X, 1);
                local v291 = math.max(v290, 0.45);
                v288.Size = UDim2.fromOffset(v289, (math.clamp(v289 * v291, 28, 180)));
            elseif p286 == "Alpha" then
                v288.BackgroundTransparency = math.clamp(v288.BackgroundTransparency + p287, 0, 1);
            end;
            u254();
            local v292 = u33({
                Action = "SetMobileControls",
                Layout = l__HttpService__4:JSONEncode(u25)
            }).Message or "Mobile controls saved.";
            if u12 then
                u12.Text = tostring(v292 or "");
            end;
            u278();
        else
            if u12 then
                u12.Text = tostring("Select a mobile button first.");
            end;
        end;
    end;
    local function u301(p294) --[[ Line: 1021 ]]
        -- upvalues: u14 (ref), u12 (ref), u61 (copy), u254 (copy), l__HttpService__4 (copy), u25 (ref), u33 (copy), u278 (copy)
        local v295 = u14;
        local v296;
        if type(p294) == "string" then
            local v297 = string.upper(string.gsub(p294, "#", ""));
            if string.match(v297, "^%x%x%x%x%x%x$") then
                v296 = "#" .. v297;
            else
                v296 = nil;
            end;
        else
            v296 = nil;
        end;
        if v295 and v295.Parent then
            if v296 then
                local v298 = u61(v296, v295.TextColor3);
                v295.TextColor3 = v298;
                v295.BackgroundColor3 = v298;
                local v299 = v295:FindFirstChildOfClass("UIStroke");
                if v299 then
                    v299.Color = v298;
                end;
                u254();
                local v300 = u33({
                    Action = "SetMobileControls",
                    Layout = l__HttpService__4:JSONEncode(u25)
                }).Message or "Mobile controls saved.";
                if u12 then
                    u12.Text = tostring(v300 or "");
                end;
                u278();
            else
                if u12 then
                    u12.Text = tostring("Use a color like #44AAFF.");
                end;
            end;
        else
            if u12 then
                u12.Text = tostring("Select a mobile button first.");
            end;
        end;
    end;
    local function u351(p302, p303, u304) --[[ Line: 1044 ]]
        -- upvalues: l__PlayerGui__6 (copy), u10 (copy), u40 (copy), u7 (copy), u61 (copy), l__UserInputService__3 (copy)
        local v305 = l__PlayerGui__6:FindFirstChild("ControlColorPicker");
        if v305 then
            v305:Destroy();
        end;
        local u306 = Instance.new("ScreenGui");
        u306.Name = "ControlColorPicker";
        u306.ResetOnSpawn = false;
        u306.IgnoreGuiInset = true;
        u306.ZIndexBehavior = Enum.ZIndexBehavior.Global;
        u306.DisplayOrder = 120;
        u306.Parent = l__PlayerGui__6;
        local v307 = Instance.new("TextButton");
        v307.Size = UDim2.fromScale(1, 1);
        v307.BackgroundColor3 = Color3.new(0, 0, 0);
        v307.BackgroundTransparency = 0.45;
        v307.Text = "";
        v307.ZIndex = 100;
        v307.Parent = u306;
        local v308 = Instance.new("Frame");
        v308.AnchorPoint = Vector2.new(0.5, 0.5);
        v308.Position = UDim2.fromScale(0.5, 0.5);
        v308.Size = UDim2.new(0.88, 0, 0.7, 0);
        v308.BackgroundColor3 = Color3.fromRGB(26, 26, 26);
        v308.BorderSizePixel = 0;
        v308.ZIndex = 101;
        v308.Parent = v307;
        local v309 = Instance.new("UICorner");
        v309.CornerRadius = UDim.new(0, 8);
        v309.Parent = v308;
        local v310 = Instance.new("UISizeConstraint");
        v310.MinSize = Vector2.new(260, 270);
        v310.MaxSize = Vector2.new(380, 430);
        v310.Parent = v308;
        local v311 = Instance.new("TextLabel");
        v311.BackgroundTransparency = 1;
        v311.Position = UDim2.new(0.05, 0, 0.03, 0);
        v311.Size = UDim2.new(0.76, 0, 0.1, 0);
        v311.Text = p302 or "Pick color";
        v311.TextXAlignment = Enum.TextXAlignment.Left;
        v311.ZIndex = 102;
        v311.Parent = v308;
        v311.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
        v311.TextColor3 = u10;
        v311.TextSize = 20;
        v311.TextWrapped = true;
        v311.TextScaled = true;
        local v312 = Instance.new("UITextSizeConstraint");
        v312.MinTextSize = 8;
        v312.MaxTextSize = 20;
        v312.Parent = v311;
        local v313 = u40(v308, "X", Color3.fromRGB(125, 45, 45));
        v313.Position = UDim2.new(0.84, 0, 0.035, 0);
        v313.Size = UDim2.new(0.11, 0, 0.09, 0);
        v313.ZIndex = 102;
        v313.MouseButton1Click:Connect(function() --[[ Line: 1095 ]]
            -- upvalues: u306 (copy)
            u306:Destroy();
        end);
        local v314 = Instance.new("Frame");
        v314.Position = UDim2.new(0.05, 0, 0.17, 0);
        v314.Size = UDim2.new(0.72, -8, 0.58, 0);
        v314.BackgroundTransparency = 1;
        v314.ZIndex = 102;
        v314.Parent = v308;
        local u315 = Instance.new("TextButton");
        u315.Size = UDim2.fromScale(1, 1);
        u315.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
        u315.BorderSizePixel = 0;
        u315.AutoButtonColor = false;
        u315.Text = "";
        u315.ZIndex = 102;
        u315.Parent = v314;
        local v316 = Instance.new("UICorner");
        v316.CornerRadius = UDim.new(0, 5);
        v316.Parent = u315;
        local v317 = Instance.new("Frame");
        v317.Size = UDim2.fromScale(1, 1);
        v317.BackgroundColor3 = Color3.new(1, 1, 1);
        v317.BorderSizePixel = 0;
        v317.ZIndex = 103;
        v317.Parent = u315;
        local v318 = Instance.new("UICorner");
        v318.CornerRadius = UDim.new(0, 5);
        v318.Parent = v317;
        local v319 = Instance.new("UIGradient");
        v319.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) });
        v319.Parent = v317;
        local v320 = Instance.new("Frame");
        v320.Size = UDim2.fromScale(1, 1);
        v320.BackgroundColor3 = Color3.new(0, 0, 0);
        v320.BorderSizePixel = 0;
        v320.ZIndex = 104;
        v320.Parent = u315;
        local v321 = Instance.new("UICorner");
        v321.CornerRadius = UDim.new(0, 5);
        v321.Parent = v320;
        local v322 = Instance.new("UIGradient");
        v322.Rotation = 90;
        v322.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) });
        v322.Parent = v320;
        local u323 = Instance.new("Frame");
        u323.AnchorPoint = Vector2.new(0.5, 0.5);
        u323.Size = UDim2.fromOffset(14, 14);
        u323.BackgroundColor3 = Color3.new(1, 1, 1);
        u323.ZIndex = 106;
        u323.Parent = u315;
        local v324 = Instance.new("UICorner");
        v324.CornerRadius = UDim.new(0, 10);
        v324.Parent = u323;
        local v325 = Instance.new("UIStroke");
        v325.Color = Color3.new(0, 0, 0);
        v325.Thickness = 2;
        v325.Parent = u323;
        local u326 = Instance.new("TextButton");
        u326.Position = UDim2.new(0.8, 0, 0.17, 0);
        u326.Size = UDim2.new(0.15, 0, 0.58, 0);
        u326.BackgroundColor3 = Color3.new(1, 1, 1);
        u326.BorderSizePixel = 0;
        u326.AutoButtonColor = false;
        u326.Text = "";
        u326.ZIndex = 102;
        u326.Parent = v308;
        local v327 = Instance.new("UICorner");
        v327.CornerRadius = UDim.new(0, 5);
        v327.Parent = u326;
        local v328 = Instance.new("UIGradient");
        v328.Rotation = 90;
        local v329 = {};
        for v330 = 0, 10 do
            table.insert(v329, ColorSequenceKeypoint.new(v330 / 10, Color3.fromHSV(v330 / 10, 1, 1)));
        end;
        v328.Color = ColorSequence.new(v329);
        v328.Parent = u326;
        local u331 = Instance.new("Frame");
        u331.AnchorPoint = Vector2.new(0.5, 0.5);
        u331.Position = UDim2.fromScale(0.5, 0);
        u331.Size = UDim2.new(1, 8, 0, 8);
        u331.BackgroundColor3 = Color3.new(1, 1, 1);
        u331.ZIndex = 106;
        u331.Parent = u326;
        local v332 = Instance.new("UIStroke");
        v332.Color = Color3.new(0, 0, 0);
        v332.Thickness = 2;
        v332.Parent = u331;
        local u333 = u40(v308, "Apply", u7);
        u333.Position = UDim2.new(0.05, 0, 0.8, 0);
        u333.Size = UDim2.new(0.9, 0, 0.12, 0);
        u333.ZIndex = 102;
        local u334, u335, u336 = u61(p303, Color3.new(1, 1, 1)):ToHSV();
        local u337 = false;
        local u338 = false;
        local function u341() --[[ Line: 1192 ]]
            -- upvalues: u334 (ref), u335 (ref), u336 (ref), u315 (copy), u323 (copy), u331 (copy), u333 (copy)
            local v339 = Color3.fromHSV(u334, u335, u336);
            u315.BackgroundColor3 = Color3.fromHSV(u334, 1, 1);
            u323.Position = UDim2.fromScale(u335, 1 - u336);
            u331.Position = UDim2.fromScale(0.5, u334);
            u333.BackgroundColor3 = v339;
            u333.Text = "Apply #" .. v339:ToHex();
            local v340;
            if u336 > 0.68 then
                v340 = u335 < 0.55;
            else
                v340 = false;
            end;
            u333.TextColor3 = v340 and Color3.new(0, 0, 0) or Color3.new(1, 1, 1);
        end;
        local function u343(p342) --[[ Line: 1203 ]]
            -- upvalues: u315 (copy), u335 (ref), u336 (ref), u341 (copy)
            if u315.AbsoluteSize.X <= 0 or u315.AbsoluteSize.Y <= 0 then
            else
                u335 = math.clamp((p342.X - u315.AbsolutePosition.X) / u315.AbsoluteSize.X, 0, 1);
                u336 = 1 - math.clamp((p342.Y - u315.AbsolutePosition.Y) / u315.AbsoluteSize.Y, 0, 1);
                u341();
            end;
        end;
        u315.InputBegan:Connect(function(p344) --[[ Line: 1220 ]]
            -- upvalues: u337 (ref), u343 (copy)
            if p344.UserInputType == Enum.UserInputType.MouseButton1 or p344.UserInputType == Enum.UserInputType.Touch then
                u337 = true;
                u343(p344.Position);
            end;
        end);
        u326.InputBegan:Connect(function(p345) --[[ Line: 1226 ]]
            -- upvalues: u338 (ref), u326 (copy), u334 (ref), u341 (copy)
            if p345.UserInputType == Enum.UserInputType.MouseButton1 or p345.UserInputType == Enum.UserInputType.Touch then
                u338 = true;
                local l__Position__24 = p345.Position;
                if u326.AbsoluteSize.Y <= 0 then
                    return;
                end;
                u334 = math.clamp((l__Position__24.Y - u326.AbsolutePosition.Y) / u326.AbsoluteSize.Y, 0, 1);
                u341();
            end;
        end);
        local u347 = l__UserInputService__3.InputChanged:Connect(function(p346) --[[ Line: 1232 ]]
            -- upvalues: u337 (ref), u343 (copy), u338 (ref), u326 (copy), u334 (ref), u341 (copy)
            if p346.UserInputType == Enum.UserInputType.MouseMovement or p346.UserInputType == Enum.UserInputType.Touch then
                if u337 then
                    u343(p346.Position);
                    return;
                end;
                if u338 then
                    local l__Position__25 = p346.Position;
                    if u326.AbsoluteSize.Y <= 0 then
                        return;
                    end;
                    u334 = math.clamp((l__Position__25.Y - u326.AbsolutePosition.Y) / u326.AbsoluteSize.Y, 0, 1);
                    u341();
                end;
            end;
        end);
        local u349 = l__UserInputService__3.InputEnded:Connect(function(p348) --[[ Line: 1241 ]]
            -- upvalues: u337 (ref), u338 (ref)
            if p348.UserInputType == Enum.UserInputType.MouseButton1 or p348.UserInputType == Enum.UserInputType.Touch then
                u337 = false;
                u338 = false;
            end;
        end);
        u306.Destroying:Connect(function() --[[ Line: 1247 ]]
            -- upvalues: u347 (copy), u349 (copy)
            u347:Disconnect();
            u349:Disconnect();
        end);
        u333.MouseButton1Click:Connect(function() --[[ Line: 1251 ]]
            -- upvalues: u334 (ref), u335 (ref), u336 (ref), u304 (copy), u306 (copy)
            local v350 = "#" .. Color3.fromHSV(u334, u335, u336):ToHex();
            if type(u304) == "function" then
                u304(v350);
            end;
            u306:Destroy();
        end);
        u341();
    end;
    local function u359(p352) --[[ Line: 1262 ]]
        -- upvalues: u4 (copy), l__PlayerGui__6 (copy), u12 (ref), u25 (ref), u225 (copy), u200 (copy), u14 (ref), l__HttpService__4 (copy), u33 (copy), u278 (copy), u3 (copy)
        local v353 = u4[p352];
        local v354 = l__PlayerGui__6:FindFirstChild("MobileAgaricControls");
        if v353 and v354 then
            local v355 = p352 == "BtnDoubleSplit" and 0.24 or (p352 == "BtnTripleSplit" and 0.38 or 0.52);
            u25[p352] = {
                Y = 0.72,
                Alpha = 1,
                Visible = true,
                Added = true,
                X = v355,
                W = v353.Size.X.Offset,
                H = v353.Size.Y.Offset,
                Color = "#" .. v353.Color:ToHex()
            };
            local v356 = u225(v354, p352, v353.Text, UDim2.fromScale(v355, 0.72), v353.Size, v353.Color, v353.Action, false);
            u200(v356, u25[p352]);
            u14 = v356;
            local v357 = u33({
                Action = "SetMobileControls",
                Layout = l__HttpService__4:JSONEncode(u25)
            }).Message or "Mobile controls saved.";
            if u12 then
                u12.Text = tostring(v357 or "");
            end;
            u278();
            local v358 = "Added " .. tostring(u3[p352] or "button") .. ".";
            if u12 then
                u12.Text = tostring(v358 or "");
            end;
        else
            if u12 then
                u12.Text = tostring("Mobile controls are not ready yet.");
            end;
        end;
    end;
    local function u410() --[[ Line: 1289 ]]
        -- upvalues: u15 (ref), l__PlayerGui__6 (copy), u17 (ref), u16 (ref), u10 (copy), u12 (ref), l__UserInputService__3 (copy), u8 (copy), u40 (copy), u285 (copy), u7 (copy), u14 (ref), u351 (copy), u301 (copy), u293 (copy), u254 (copy), l__HttpService__4 (copy), u25 (ref), u33 (copy), u278 (copy), u359 (copy), u240 (copy), u18 (copy), u9 (copy)
        if u15 then
            return u15;
        end;
        u15 = Instance.new("ScreenGui");
        u15.Name = "MobileControlEditor";
        u15.ResetOnSpawn = false;
        u15.IgnoreGuiInset = true;
        pcall(function() --[[ Line: 1297 ]]
            -- upvalues: u15 (ref)
            u15.ScreenInsets = Enum.ScreenInsets.None;
        end);
        u15.ZIndexBehavior = Enum.ZIndexBehavior.Global;
        u15.DisplayOrder = 80;
        u15.Enabled = false;
        u15.Parent = l__PlayerGui__6;
        u17 = Instance.new("Folder");
        u17.Name = "Handles";
        u17.Parent = u15;
        u16 = Instance.new("Frame");
        u16.Name = "Panel";
        u16.AnchorPoint = Vector2.new(0, 0);
        u16.Position = UDim2.fromOffset(8, 72);
        u16.Size = UDim2.new(0, 132, 0, 226);
        u16.BackgroundColor3 = Color3.fromRGB(18, 18, 18);
        u16.BackgroundTransparency = 0.06;
        u16.BorderSizePixel = 0;
        u16.ZIndex = 50;
        u16.Parent = u15;
        local v360 = u16;
        local v361 = Instance.new("UICorner");
        v361.CornerRadius = UDim.new(0, 8);
        v361.Parent = v360;
        local v362 = Instance.new("TextButton");
        v362.Name = "MoveHandle";
        v362.AutoButtonColor = false;
        v362.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
        v362.BackgroundTransparency = 0.05;
        v362.BorderSizePixel = 0;
        v362.Position = UDim2.new(0, 8, 0, 8);
        v362.Size = UDim2.new(1, -16, 0, 30);
        v362.TextXAlignment = Enum.TextXAlignment.Center;
        v362.Active = true;
        v362.Text = "Drag panel";
        v362.Parent = u16;
        local v363 = Instance.new("UICorner");
        v363.CornerRadius = UDim.new(0, 5);
        v363.Parent = v362;
        v362.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
        v362.TextColor3 = u10;
        v362.TextSize = 11;
        v362.TextWrapped = true;
        v362.TextScaled = true;
        local v364 = Instance.new("UITextSizeConstraint");
        v364.MinTextSize = 8;
        v364.MaxTextSize = 11;
        v364.Parent = v362;
        local u365 = nil;
        local u366 = nil;
        local u367 = nil;
        v362.InputBegan:Connect(function(p368) --[[ Name: beginPanelDrag, Line 1339 ]]
            -- upvalues: u365 (ref), u366 (ref), u367 (ref), u16 (ref), u12 (ref)
            if p368.UserInputType == Enum.UserInputType.Touch or p368.UserInputType == Enum.UserInputType.MouseButton1 then
                u365 = p368;
                u366 = Vector2.new(p368.Position.X, p368.Position.Y);
                u367 = Vector2.new(u16.Position.X.Offset, u16.Position.Y.Offset);
                if u12 then
                    u12.Text = tostring("Move the editor panel.");
                end;
            end;
        end);
        v362.InputEnded:Connect(function(p369) --[[ Line: 1348 ]]
            -- upvalues: u365 (ref)
            if p369 == u365 then
                u365 = nil;
            end;
        end);
        l__UserInputService__3.InputChanged:Connect(function(p370) --[[ Line: 1353 ]]
            -- upvalues: u365 (ref), u366 (ref), u367 (ref), u16 (ref)
            if p370 == u365 and (u366 and u367) then
                local l__CurrentCamera__26 = workspace.CurrentCamera;
                local v371 = l__CurrentCamera__26 and l__CurrentCamera__26.ViewportSize or Vector2.new(1280, 720);
                local v372 = u367 + (Vector2.new(p370.Position.X, p370.Position.Y) - u366);
                local l__X__27 = u16.AbsoluteSize.X;
                local l__Y__28 = u16.AbsoluteSize.Y;
                local l__X__29 = v372.X;
                local v373 = math.max(8, v371.X - l__X__27 - 8);
                local v374 = math.clamp(l__X__29, 8, v373);
                local l__Y__30 = v372.Y;
                local v375 = math.max(8, v371.Y - l__Y__28 - 8);
                local v376 = math.clamp(l__Y__30, 8, v375);
                u16.Position = UDim2.fromOffset(v374, v376);
            end;
        end);
        local v377 = Instance.new("TextBox");
        v377.Name = "ColorBox";
        v377.Position = UDim2.new(0, -1000, 0, 0);
        v377.Size = UDim2.new(0, 1, 0, 1);
        v377.BackgroundColor3 = u8;
        v377.BorderSizePixel = 0;
        v377.Text = "#FF9632";
        v377.ClearTextOnFocus = false;
        v377.Visible = false;
        v377.Parent = u16;
        local v378 = Instance.new("UICorner");
        v378.CornerRadius = UDim.new(0, 5);
        v378.Parent = v377;
        v377.Font = Enum.Font.Gotham;
        v377.TextColor3 = u10;
        v377.TextSize = 14;
        v377.TextWrapped = true;
        v377.TextScaled = true;
        local v379 = Instance.new("UITextSizeConstraint");
        v379.MinTextSize = 8;
        v379.MaxTextSize = 14;
        v379.Parent = v377;
        local v380 = u40(u16, "Mirror", Color3.fromRGB(70, 70, 70));
        v380.Name = "MirrorMobileLayout";
        v380.Position = UDim2.new(0, 8, 0, 44);
        v380.Size = UDim2.new(1, -16, 0, 24);
        v380.MouseButton1Click:Connect(u285);
        local v381 = u40(u16, "Color", u7);
        v381.Position = UDim2.new(0, 8, 0, 72);
        v381.Size = UDim2.new(0.48, -10, 0, 22);
        v381.MouseButton1Click:Connect(function() --[[ Line: 1388 ]]
            -- upvalues: u14 (ref), u12 (ref), u351 (ref), u301 (ref)
            local v382 = u14;
            if v382 and v382.Parent then
                u351("Button color", "#" .. v382.TextColor3:ToHex(), function(p383) --[[ Line: 1394 ]]
                    -- upvalues: u301 (ref)
                    u301(p383);
                end);
            else
                if u12 then
                    u12.Text = tostring("Select a mobile button first.");
                end;
            end;
        end);
        local v384 = u40(u16, "Size -", Color3.fromRGB(70, 70, 70));
        v384.Position = UDim2.new(0, 8, 0, 100);
        v384.Size = UDim2.new(0.48, -10, 0, 22);
        v384.MouseButton1Click:Connect(function() --[[ Line: 1402 ]]
            -- upvalues: u293 (ref)
            u293("Size", -8);
        end);
        local v385 = u40(u16, "Size +", Color3.fromRGB(70, 70, 70));
        v385.Position = UDim2.new(0.52, 2, 0, 100);
        v385.Size = UDim2.new(0.48, -10, 0, 22);
        v385.MouseButton1Click:Connect(function() --[[ Line: 1409 ]]
            -- upvalues: u293 (ref)
            u293("Size", 8);
        end);
        local v386 = u40(u16, "Solid", Color3.fromRGB(70, 70, 70));
        v386.Position = UDim2.new(0, 8, 0, 128);
        v386.Size = UDim2.new(0.48, -10, 0, 22);
        v386.MouseButton1Click:Connect(function() --[[ Line: 1416 ]]
            -- upvalues: u14 (ref), u12 (ref), u254 (ref), l__HttpService__4 (ref), u25 (ref), u33 (ref), u278 (ref)
            local v387 = u14;
            if v387 and v387.Parent then
                v387.BackgroundTransparency = math.clamp(v387.BackgroundTransparency + -0.1, 0, 1);
                u254();
                local v388 = u33({
                    Action = "SetMobileControls",
                    Layout = l__HttpService__4:JSONEncode(u25)
                }).Message or "Mobile controls saved.";
                if u12 then
                    u12.Text = tostring(v388 or "");
                end;
                u278();
            elseif u12 then
                u12.Text = tostring("Select a mobile button first.");
            end;
        end);
        local v389 = u40(u16, "Clear", Color3.fromRGB(70, 70, 70));
        v389.Position = UDim2.new(0.52, 2, 0, 128);
        v389.Size = UDim2.new(0.48, -10, 0, 22);
        v389.MouseButton1Click:Connect(function() --[[ Line: 1423 ]]
            -- upvalues: u14 (ref), u12 (ref), u254 (ref), l__HttpService__4 (ref), u25 (ref), u33 (ref), u278 (ref)
            local v390 = u14;
            if v390 and v390.Parent then
                v390.BackgroundTransparency = math.clamp(v390.BackgroundTransparency + 0.1, 0, 1);
                u254();
                local v391 = u33({
                    Action = "SetMobileControls",
                    Layout = l__HttpService__4:JSONEncode(u25)
                }).Message or "Mobile controls saved.";
                if u12 then
                    u12.Text = tostring(v391 or "");
                end;
                u278();
            elseif u12 then
                u12.Text = tostring("Select a mobile button first.");
            end;
        end);
        local u392 = Instance.new("Frame");
        u392.Name = "AddMenu";
        u392.Position = UDim2.new(1, 6, 0, 72);
        u392.Size = UDim2.new(0, 118, 0, 84);
        u392.BackgroundColor3 = Color3.fromRGB(24, 24, 24);
        u392.BackgroundTransparency = 0.04;
        u392.BorderSizePixel = 0;
        u392.Visible = false;
        u392.ZIndex = 54;
        u392.Parent = u16;
        local v393 = Instance.new("UICorner");
        v393.CornerRadius = UDim.new(0, 7);
        v393.Parent = u392;
        local v394 = u40(u16, "Add", u7);
        v394.Name = "AddButtons";
        v394.Position = UDim2.new(0.52, 2, 0, 72);
        v394.Size = UDim2.new(0.48, -10, 0, 22);
        v394.MouseButton1Click:Connect(function() --[[ Line: 1443 ]]
            -- upvalues: u392 (copy)
            u392.Visible = not u392.Visible;
        end);
        local v395 = u40(u392, "2X", Color3.fromRGB(86, 86, 86));
        v395.Name = "AddDoubleSplit";
        v395.Position = UDim2.new(0, 7, 0, 7);
        v395.Size = UDim2.new(1, -14, 0, 20);
        v395.MouseButton1Click:Connect(function() --[[ Line: 1451 ]]
            -- upvalues: u359 (ref), u392 (copy)
            u359("BtnDoubleSplit");
            u392.Visible = false;
        end);
        local v396 = u40(u392, "3X", Color3.fromRGB(86, 86, 86));
        v396.Name = "AddTripleSplit";
        v396.Position = UDim2.new(0, 7, 0, 32);
        v396.Size = UDim2.new(1, -14, 0, 20);
        v396.MouseButton1Click:Connect(function() --[[ Line: 1460 ]]
            -- upvalues: u359 (ref), u392 (copy)
            u359("BtnTripleSplit");
            u392.Visible = false;
        end);
        local v397 = u40(u392, "RESP", Color3.fromRGB(86, 86, 86));
        v397.Name = "AddRespawn";
        v397.Position = UDim2.new(0, 7, 0, 57);
        v397.Size = UDim2.new(1, -14, 0, 20);
        v397.MouseButton1Click:Connect(function() --[[ Line: 1469 ]]
            -- upvalues: u359 (ref), u392 (copy)
            u359("BtnRespawn");
            u392.Visible = false;
        end);
        local v398 = u40(u16, "Reset", Color3.fromRGB(135, 72, 58));
        v398.Name = "ResetMobileLayout";
        v398.Position = UDim2.new(0, 8, 0, 156);
        v398.Size = UDim2.new(1, -16, 0, 22);
        v398.MouseButton1Click:Connect(function() --[[ Line: 1478 ]]
            -- upvalues: u25 (ref), u33 (ref), u240 (ref), u14 (ref), u12 (ref), u278 (ref)
            u25 = {};
            local v399 = u33({
                Action = "ResetMobileControls"
            });
            u240();
            u14 = nil;
            local v400 = v399.Message or "Mobile controls reset.";
            if u12 then
                u12.Text = tostring(v400 or "");
            end;
            u278();
        end);
        local v401 = u40(u16, "Save", Color3.fromRGB(60, 135, 84));
        v401.Name = "SaveAndClose";
        v401.Position = UDim2.new(0, 8, 0, 184);
        v401.Size = UDim2.new(0.48, -10, 0, 24);
        v401.MouseButton1Click:Connect(function() --[[ Line: 1491 ]]
            -- upvalues: u254 (ref), l__HttpService__4 (ref), u25 (ref), u33 (ref), u12 (ref), u18 (ref), u15 (ref)
            u254();
            local v402 = u33({
                Action = "SetMobileControls",
                Layout = l__HttpService__4:JSONEncode(u25)
            }).Message or "Mobile controls saved.";
            if u12 then
                u12.Text = tostring(v402 or "");
            end;
            for _, v403 in ipairs(u18) do
                v403:Disconnect();
            end;
            table.clear(u18);
            u15.Enabled = false;
        end);
        local v404 = u40(u16, "Close", u7);
        v404.Name = "CloseEditor";
        v404.Position = UDim2.new(0.52, 2, 0, 184);
        v404.Size = UDim2.new(0.48, -10, 0, 24);
        v404.MouseButton1Click:Connect(function() --[[ Line: 1502 ]]
            -- upvalues: u18 (ref), u15 (ref)
            for _, v405 in ipairs(u18) do
                v405:Disconnect();
            end;
            table.clear(u18);
            u15.Enabled = false;
        end);
        local v406 = Instance.new("TextLabel");
        v406.Name = "EditorHint";
        v406.BackgroundTransparency = 1;
        v406.Position = UDim2.new(0, 8, 0, 211);
        v406.Size = UDim2.new(1, -16, 0, 18);
        v406.Text = "Drag orange boxes.";
        v406.TextColor3 = u9;
        v406.Parent = u16;
        v406.Font = Enum.Font.Gotham;
        v406.TextColor3 = u10;
        v406.TextSize = 10;
        v406.TextWrapped = true;
        v406.TextScaled = true;
        local v407 = Instance.new("UITextSizeConstraint");
        v407.MinTextSize = 8;
        v407.MaxTextSize = 10;
        v407.Parent = v406;
        for _, v408 in ipairs(u16:GetDescendants()) do
            if v408:IsA("GuiObject") then
                v408.ZIndex = math.max(v408.ZIndex, 55);
            end;
        end;
        u392.ZIndex = 60;
        for _, v409 in ipairs(u392:GetDescendants()) do
            if v409:IsA("GuiObject") then
                v409.ZIndex = 61;
            end;
        end;
        return u15;
    end;
    local function u413() --[[ Line: 1532 ]]
        -- upvalues: u26 (ref), u12 (ref), l__PlayerGui__6 (copy), u232 (copy), u248 (copy), u410 (copy), u15 (ref), u278 (copy)
        if u26 then
            local v411 = l__PlayerGui__6:FindFirstChild("Gui");
            if v411 then
                v411 = v411:FindFirstChild("Menu");
            end;
            if v411 then
                v411.Visible = false;
            end;
            local v412 = l__PlayerGui__6:FindFirstChild("MobileAgaricControls");
            if v412 then
                v412.Enabled = true;
            end;
            u232(false);
            u248();
            u410();
            u15.Enabled = true;
            u278();
            if u12 then
                u12.Text = tostring("Drag buttons. Use Move to move the editor.");
            end;
        else
            if u12 then
                u12.Text = tostring("Settings are still loading.");
            end;
        end;
    end;
    local function u630() --[[ Line: 1554 ]]
        -- upvalues: l__PlayerGui__6 (copy), u11 (copy), u19 (ref), u20 (ref), u21 (ref), u22 (ref), u10 (copy), u9 (copy), u40 (copy), u26 (ref), u33 (copy), u12 (ref), u23 (ref), u24 (ref), u8 (copy), l__UserInputService__3 (copy), u7 (copy), u351 (copy), u48 (copy), u6 (copy), u61 (copy), u413 (copy), u174 (copy), u2 (copy), u1 (copy), u54 (copy)
        local l__Gui__31 = l__PlayerGui__6:WaitForChild("Gui", 30);
        if l__Gui__31 then
            local l__Menu__32 = l__Gui__31:WaitForChild("Menu", 30);
            if l__Menu__32 then
                l__Menu__32 = l__Menu__32:WaitForChild("Right", 30);
            end;
            if l__Menu__32 then
                l__Menu__32 = l__Menu__32:WaitForChild("Settings", 30);
            end;
            if l__Menu__32 then
                local l__PublicHiscoresSettings__33 = l__Menu__32:WaitForChild("PublicHiscoresSettings", 10);
                if not l__PublicHiscoresSettings__33 then
                    l__PublicHiscoresSettings__33 = Instance.new("Frame");
                    l__PublicHiscoresSettings__33.Name = "PublicHiscoresSettings";
                    l__PublicHiscoresSettings__33.Size = UDim2.fromScale(1, 1);
                    l__PublicHiscoresSettings__33.BackgroundTransparency = 1;
                    l__PublicHiscoresSettings__33.Parent = l__Menu__32;
                end;
                local v414 = l__PublicHiscoresSettings__33:FindFirstChild("ControlSettingsRoot");
                if v414 then
                    v414:Destroy();
                end;
                table.clear(u11);
                u19 = nil;
                u20 = nil;
                u21 = nil;
                u22 = nil;
                local v415 = Instance.new("Frame");
                v415.Name = "ControlSettingsRoot";
                v415.Position = UDim2.new(0.04, 0, 0.105, 0);
                v415.Size = UDim2.new(0.92, 0, 0.88, 0);
                v415.BackgroundTransparency = 1;
                v415.Parent = l__PublicHiscoresSettings__33;
                local u416 = Instance.new("ScrollingFrame");
                u416.Name = "ControlsScroll";
                u416.Size = UDim2.fromScale(1, 1);
                u416.BackgroundColor3 = Color3.fromRGB(12, 12, 12);
                u416.BackgroundTransparency = 0.18;
                u416.BorderSizePixel = 0;
                u416.ScrollBarThickness = 6;
                u416.CanvasSize = UDim2.fromOffset(0, 0);
                u416.ScrollingDirection = Enum.ScrollingDirection.Y;
                u416.Parent = v415;
                local v417 = Instance.new("UICorner");
                v417.CornerRadius = UDim.new(0, 5);
                v417.Parent = u416;
                local u418 = Instance.new("UIListLayout");
                u418.SortOrder = Enum.SortOrder.LayoutOrder;
                u418.Padding = UDim.new(0, 5);
                u418.Parent = u416;
                local v419 = Instance.new("UIPadding");
                v419.PaddingTop = UDim.new(0, 6);
                v419.PaddingLeft = UDim.new(0, 6);
                v419.PaddingRight = UDim.new(0, 6);
                v419.PaddingBottom = UDim.new(0, 8);
                v419.Parent = u416;
                u418:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 1615 ]]
                    -- upvalues: u416 (copy), u418 (copy)
                    u416.CanvasSize = UDim2.fromOffset(0, u418.AbsoluteContentSize.Y + 14);
                end);
                local v420 = Instance.new("TextLabel");
                v420.Name = "ControlsTitle";
                v420.Size = UDim2.new(1, -12, 0, 28);
                v420.BackgroundTransparency = 1;
                v420.Text = "Controls";
                v420.TextXAlignment = Enum.TextXAlignment.Left;
                v420.LayoutOrder = 1;
                v420.Parent = u416;
                v420.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                v420.TextColor3 = u10;
                v420.TextSize = 20;
                v420.TextWrapped = true;
                v420.TextScaled = true;
                local v421 = Instance.new("UITextSizeConstraint");
                v421.MinTextSize = 8;
                v421.MaxTextSize = 20;
                v421.Parent = v420;
                local v422 = Instance.new("TextLabel");
                v422.Name = "ControlsInfo";
                v422.Size = UDim2.new(1, -12, 0, 58);
                v422.BackgroundTransparency = 1;
                v422.Text = "Mouse or touch aim moves your cells toward the pointer. Rebind any action below, reset defaults, and customize mobile buttons from this panel.";
                v422.TextXAlignment = Enum.TextXAlignment.Left;
                v422.TextYAlignment = Enum.TextYAlignment.Top;
                v422.TextColor3 = u9;
                v422.LayoutOrder = 2;
                v422.Parent = u416;
                v422.Font = Enum.Font.Gotham;
                v422.TextColor3 = u10;
                v422.TextSize = 13;
                v422.TextWrapped = true;
                v422.TextScaled = true;
                local v423 = Instance.new("UITextSizeConstraint");
                v423.MinTextSize = 8;
                v423.MaxTextSize = 13;
                v423.Parent = v422;
                local v424 = l__PublicHiscoresSettings__33:FindFirstChild("HidePublicHiscores");
                if v424 and v424:IsA("TextButton") then
                    v424.Parent = u416;
                    v424.Size = UDim2.new(1, -12, 0, 36);
                    v424.Position = UDim2.new();
                    v424.LayoutOrder = 3;
                end;
                local u425 = u40(u416, "DISABLE TRADE", Color3.fromRGB(205, 75, 60));
                u425.Name = "TradeRequestsToggle";
                u425.Size = UDim2.new(1, -12, 0, 34);
                u425.LayoutOrder = 4;
                local v426 = u26;
                if v426 then
                    v426 = v426:GetAttribute("TradeRequestsEnabled");
                end;
                local u427 = ((v426 == nil or v426 == "") and true or v426) ~= false;
                u20 = function() --[[ Name: refreshTradeRequestsToggle, Line 1657 ]]
                    -- upvalues: u427 (ref), u26 (ref), u425 (copy)
                    local v428 = u26;
                    if v428 then
                        v428 = v428:GetAttribute("TradeRequestsEnabled");
                    end;
                    u427 = ((v428 == nil or v428 == "") and true or v428) ~= false;
                    local v429 = u427;
                    u425.Text = v429 and "DISABLE TRADE" or "ENABLE TRADE";
                    u425.BackgroundColor3 = v429 and Color3.fromRGB(205, 75, 60) or Color3.fromRGB(58, 145, 80);
                end;
                local v430 = u26;
                local v431 = v430;
                if v431 then
                    v431 = v430:GetAttribute("TradeRequestsEnabled");
                end;
                if ((v431 == nil or v431 == "") and true or v431) == false then
                    u427 = false;
                else
                    u427 = true;
                end;
                local v432 = u427;
                u425.Text = v432 and "DISABLE TRADE" or "ENABLE TRADE";
                u425.BackgroundColor3 = v432 and Color3.fromRGB(205, 75, 60) or Color3.fromRGB(58, 145, 80);
                u425.MouseButton1Click:Connect(function() --[[ Line: 1663 ]]
                    -- upvalues: u427 (ref), u26 (ref), u425 (copy), u33 (ref), u12 (ref)
                    local v433 = u427;
                    local v434 = not v433;
                    u427 = v434;
                    if u26 then
                        u26:SetAttribute("TradeRequestsEnabled", v434);
                    end;
                    u425.Text = v434 and "DISABLE TRADE" or "ENABLE TRADE";
                    u425.BackgroundColor3 = v434 and Color3.fromRGB(205, 75, 60) or Color3.fromRGB(58, 145, 80);
                    local v435 = u33({
                        Action = "SetTradeRequestsEnabled",
                        Enabled = v434
                    });
                    if not v435.Ok then
                        u427 = v433;
                        if u26 then
                            u26:SetAttribute("TradeRequestsEnabled", v433);
                        end;
                        u425.Text = v433 and "DISABLE TRADE" or "ENABLE TRADE";
                        u425.BackgroundColor3 = v433 and Color3.fromRGB(205, 75, 60) or Color3.fromRGB(58, 145, 80);
                    end;
                    local v436 = v435.Message or "Trade request settings saved.";
                    if u12 then
                        u12.Text = tostring(v436 or "");
                    end;
                end);
                local u437 = u40(u416, "Sound effects: ON", Color3.fromRGB(58, 112, 76));
                u437.Name = "SoundEffectsToggle";
                u437.Size = UDim2.new(1, -12, 0, 34);
                u437.LayoutOrder = 5;
                local v438 = u26;
                if v438 then
                    v438 = v438:GetAttribute("SfxEnabled");
                end;
                local u439 = ((v438 == nil or v438 == "") and true or v438) ~= false;
                u19 = function() --[[ Name: refreshSfxToggle, Line 1690 ]]
                    -- upvalues: u439 (ref), u26 (ref), u437 (copy)
                    local v440 = u26;
                    if v440 then
                        v440 = v440:GetAttribute("SfxEnabled");
                    end;
                    u439 = ((v440 == nil or v440 == "") and true or v440) ~= false;
                    local v441 = u439;
                    u437.Text = v441 and "Sound effects: ON" or "Sound effects: OFF";
                    u437.BackgroundColor3 = v441 and Color3.fromRGB(58, 112, 76) or Color3.fromRGB(130, 64, 54);
                end;
                local v442 = u26;
                if v442 then
                    v442 = v442:GetAttribute("SfxEnabled");
                end;
                if ((v442 == nil or v442 == "") and true or v442) == false then
                    u439 = false;
                else
                    u439 = true;
                end;
                local v443 = u439;
                u437.Text = v443 and "Sound effects: ON" or "Sound effects: OFF";
                u437.BackgroundColor3 = v443 and Color3.fromRGB(58, 112, 76) or Color3.fromRGB(130, 64, 54);
                u437.MouseButton1Click:Connect(function() --[[ Line: 1696 ]]
                    -- upvalues: u439 (ref), u26 (ref), u437 (copy), u33 (ref), u12 (ref)
                    local v444 = u439;
                    local v445 = not v444;
                    u439 = v445;
                    if u26 then
                        u26:SetAttribute("SfxEnabled", v445);
                    end;
                    u437.Text = v445 and "Sound effects: ON" or "Sound effects: OFF";
                    u437.BackgroundColor3 = v445 and Color3.fromRGB(58, 112, 76) or Color3.fromRGB(130, 64, 54);
                    local v446 = u33({
                        Action = "SetSfxEnabled",
                        Enabled = v445
                    });
                    if not v446.Ok then
                        u439 = v444;
                        if u26 then
                            u26:SetAttribute("SfxEnabled", v444);
                        end;
                        u437.Text = v444 and "Sound effects: ON" or "Sound effects: OFF";
                        u437.BackgroundColor3 = v444 and Color3.fromRGB(58, 112, 76) or Color3.fromRGB(130, 64, 54);
                    end;
                    local v447 = v446.Message or "Sound settings saved.";
                    if u12 then
                        u12.Text = tostring(v447 or "");
                    end;
                end);
                local u448 = u40(u416, "Minimap: ON", Color3.fromRGB(58, 88, 130));
                u448.Name = "MinimapToggle";
                u448.Size = UDim2.new(1, -12, 0, 34);
                u448.LayoutOrder = 6;
                local function u452(p449) --[[ Line: 1722 ]]
                    -- upvalues: l__PlayerGui__6 (ref)
                    l__PlayerGui__6:SetAttribute("MinimapEnabledOverride", p449);
                    local v450 = l__PlayerGui__6:FindFirstChild("AgaricMinimapGui");
                    if v450 and v450:IsA("ScreenGui") then
                        v450.Enabled = p449;
                        local v451 = v450:FindFirstChild("Minimap");
                        if v451 and v451:IsA("GuiObject") then
                            v451.Visible = p449;
                        end;
                    end;
                end;
                u21 = function() --[[ Name: refreshMinimapToggle, Line 1747 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u448 (copy), u26 (ref)
                    local v453 = l__PlayerGui__6:GetAttribute("MinimapEnabledOverride");
                    if v453 == nil then
                        local v454 = false;
                        local v455 = u26;
                        if v455 then
                            v455 = v455:GetAttribute("MinimapEnabled");
                        end;
                        if v455 ~= nil and v455 ~= "" then
                            v454 = v455;
                        end;
                        local v456 = v454 ~= false;
                        u448.Text = v456 and "Minimap: ON" or "Minimap: OFF";
                        u448.BackgroundColor3 = v456 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    else
                        local v457 = v453 ~= false;
                        u448.Text = v457 and "Minimap: ON" or "Minimap: OFF";
                        u448.BackgroundColor3 = v457 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    end;
                end;
                local v458 = l__PlayerGui__6:GetAttribute("MinimapEnabledOverride");
                if v458 == nil then
                    local v459 = false;
                    local v460 = u26;
                    if v460 then
                        v460 = v460:GetAttribute("MinimapEnabled");
                    end;
                    if v460 ~= nil and v460 ~= "" then
                        v459 = v460;
                    end;
                    local v461 = v459 ~= false;
                    u448.Text = v461 and "Minimap: ON" or "Minimap: OFF";
                    u448.BackgroundColor3 = v461 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                else
                    local v462 = v458 ~= false;
                    u448.Text = v462 and "Minimap: ON" or "Minimap: OFF";
                    u448.BackgroundColor3 = v462 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                end;
                u448.MouseButton1Click:Connect(function() --[[ Line: 1757 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u452 (copy), u448 (copy), u33 (ref), u12 (ref)
                    local v463 = l__PlayerGui__6:GetAttribute("MinimapEnabledOverride");
                    local v464;
                    if v463 == nil then
                        local v465 = false;
                        local v466 = u26;
                        if v466 then
                            v466 = v466:GetAttribute("MinimapEnabled");
                        end;
                        if v466 ~= nil and v466 ~= "" then
                            v465 = v466;
                        end;
                        v464 = v465 ~= false;
                    else
                        v464 = v463 ~= false;
                    end;
                    local v467 = not v464;
                    u452(v467);
                    u448.Text = v467 and "Minimap: ON" or "Minimap: OFF";
                    u448.BackgroundColor3 = v467 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    local v468 = u33({
                        Action = "SetMinimapEnabled",
                        Enabled = v467
                    });
                    if v468.Ok and u26 then
                        u26:SetAttribute("MinimapEnabled", v467);
                    end;
                    local v469 = v468.Message or "Minimap settings saved.";
                    if u12 then
                        u12.Text = tostring(v469 or "");
                    end;
                end);
                local u470 = u40(u416, "Screen music button: ON", Color3.fromRGB(58, 88, 130));
                u470.Name = "MusicButtonToggle";
                u470.Size = UDim2.new(1, -12, 0, 34);
                u470.LayoutOrder = 7;
                u22 = function() --[[ Name: refreshMusicToggle, Line 1793 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u470 (copy)
                    local v471 = l__PlayerGui__6:GetAttribute("MusicButtonEnabledOverride");
                    local v472;
                    if v471 == nil then
                        local v473 = false;
                        local v474 = u26;
                        if v474 then
                            v474 = v474:GetAttribute("ScreenMusicButtonEnabled");
                        end;
                        if v474 ~= nil and v474 ~= "" then
                            v473 = v474;
                        end;
                        v472 = v473 == true;
                    else
                        v472 = v471 ~= false;
                    end;
                    u470.Text = v472 and "Screen music button: ON" or "Screen music button: OFF";
                    u470.BackgroundColor3 = v472 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                end;
                local v475 = l__PlayerGui__6:GetAttribute("MusicButtonEnabledOverride");
                local v476;
                if v475 == nil then
                    local v477 = false;
                    local v478 = u26;
                    if v478 then
                        v478 = v478:GetAttribute("ScreenMusicButtonEnabled");
                    end;
                    if v478 ~= nil and v478 ~= "" then
                        v477 = v478;
                    end;
                    v476 = v477 == true;
                else
                    v476 = v475 ~= false;
                end;
                u470.Text = v476 and "Screen music button: ON" or "Screen music button: OFF";
                u470.BackgroundColor3 = v476 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                u470.MouseButton1Click:Connect(function() --[[ Line: 1798 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u470 (copy), u33 (ref), u12 (ref)
                    local v479 = l__PlayerGui__6:GetAttribute("MusicButtonEnabledOverride");
                    local v480;
                    if v479 == nil then
                        local v481 = false;
                        local v482 = u26;
                        if v482 then
                            v482 = v482:GetAttribute("ScreenMusicButtonEnabled");
                        end;
                        if v482 ~= nil and v482 ~= "" then
                            v481 = v482;
                        end;
                        v480 = v481 == true;
                    else
                        v480 = v479 ~= false;
                    end;
                    local v483 = not v480;
                    l__PlayerGui__6:SetAttribute("MusicButtonEnabledOverride", v483);
                    local v484 = l__PlayerGui__6:FindFirstChild("Gui");
                    if v484 then
                        v484 = v484:FindFirstChild("ModeMusicScreenButton", true);
                    end;
                    if v484 and v484:IsA("GuiObject") then
                        v484.Visible = v483;
                    end;
                    u470.Text = v483 and "Screen music button: ON" or "Screen music button: OFF";
                    u470.BackgroundColor3 = v483 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    local v485 = u33({
                        Action = "SetScreenMusicButtonEnabled",
                        Enabled = v483
                    });
                    if v485.Ok and u26 then
                        u26:SetAttribute("ScreenMusicButtonEnabled", v483);
                    end;
                    local v486 = v485.Message or "Music button settings saved.";
                    if u12 then
                        u12.Text = tostring(v486 or "");
                    end;
                end);
                local function u491(p487, p488) --[[ Line: 1809 ]]
                    -- upvalues: l__PlayerGui__6 (ref)
                    l__PlayerGui__6:SetAttribute(p487 .. "Override", p488);
                    local v489 = l__PlayerGui__6:FindFirstChild("MainScreenGui");
                    if v489 then
                        v489 = v489:FindFirstChild("Mass");
                    end;
                    local v490 = p487 == "FpsCounterEnabled" and "FPS" or "Ping";
                    if v489 then
                        v489 = v489:FindFirstChild(v490);
                    end;
                    if v489 and v489:IsA("GuiObject") then
                        v489.Visible = p488;
                    end;
                end;
                local u492 = u40(u416, "FPS counter: OFF", Color3.fromRGB(130, 64, 54));
                u492.Name = "FpsCounterToggle";
                u492.Size = UDim2.new(1, -12, 0, 34);
                u492.LayoutOrder = 8;
                u23 = function() --[[ Name: refreshFpsToggle, Line 1835 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u492 (copy)
                    local v493 = l__PlayerGui__6:GetAttribute("FpsCounterEnabledOverride");
                    local v494;
                    if v493 == nil then
                        local v495 = u26;
                        if v495 then
                            v495 = v495:GetAttribute("FpsCounterEnabled");
                        end;
                        if v495 == nil or v495 == "" then
                            v495 = false;
                        end;
                        v494 = v495 == true;
                    else
                        v494 = v493 ~= false;
                    end;
                    u492.Text = v494 and "FPS counter: ON" or "FPS counter: OFF";
                    u492.BackgroundColor3 = v494 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                end;
                local v496 = l__PlayerGui__6:GetAttribute("FpsCounterEnabledOverride");
                local v497;
                if v496 == nil then
                    local v498 = u26;
                    if v498 then
                        v498 = v498:GetAttribute("FpsCounterEnabled");
                    end;
                    if v498 == nil or v498 == "" then
                        v498 = false;
                    end;
                    v497 = v498 == true;
                else
                    v497 = v496 ~= false;
                end;
                u492.Text = v497 and "FPS counter: ON" or "FPS counter: OFF";
                u492.BackgroundColor3 = v497 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                u492.MouseButton1Click:Connect(function() --[[ Line: 1840 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u491 (copy), u492 (copy), u33 (ref), u12 (ref)
                    local v499 = l__PlayerGui__6:GetAttribute("FpsCounterEnabledOverride");
                    local v500;
                    if v499 == nil then
                        local v501 = u26;
                        if v501 then
                            v501 = v501:GetAttribute("FpsCounterEnabled");
                        end;
                        if v501 == nil or v501 == "" then
                            v501 = false;
                        end;
                        v500 = v501 == true;
                    else
                        v500 = v499 ~= false;
                    end;
                    local v502 = not v500;
                    u491("FpsCounterEnabled", v502);
                    u492.Text = v502 and "FPS counter: ON" or "FPS counter: OFF";
                    u492.BackgroundColor3 = v502 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    local v503 = u33({
                        Action = "SetFpsCounterEnabled",
                        Enabled = v502
                    });
                    if v503.Ok and u26 then
                        u26:SetAttribute("FpsCounterEnabled", v502);
                    end;
                    local v504 = v503.Message or "FPS counter settings saved.";
                    if u12 then
                        u12.Text = tostring(v504 or "");
                    end;
                end);
                local u505 = u40(u416, "Ping: ON", Color3.fromRGB(58, 88, 130));
                u505.Name = "PingCounterToggle";
                u505.Size = UDim2.new(1, -12, 0, 34);
                u505.LayoutOrder = 9;
                u24 = function() --[[ Name: refreshPingToggle, Line 1866 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u505 (copy)
                    local v506 = l__PlayerGui__6:GetAttribute("PingCounterEnabledOverride");
                    local v507;
                    if v506 == nil then
                        local v508 = u26;
                        if v508 then
                            v508 = v508:GetAttribute("PingCounterEnabled");
                        end;
                        v507 = ((v508 == nil or v508 == "") and true or v508) ~= false;
                    else
                        v507 = v506 ~= false;
                    end;
                    u505.Text = v507 and "Ping: ON" or "Ping: OFF";
                    u505.BackgroundColor3 = v507 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                end;
                local v509 = l__PlayerGui__6:GetAttribute("PingCounterEnabledOverride");
                local v510;
                if v509 == nil then
                    local v511 = u26;
                    if v511 then
                        v511 = v511:GetAttribute("PingCounterEnabled");
                    end;
                    v510 = ((v511 == nil or v511 == "") and true or v511) ~= false;
                else
                    v510 = v509 ~= false;
                end;
                u505.Text = v510 and "Ping: ON" or "Ping: OFF";
                u505.BackgroundColor3 = v510 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                u505.MouseButton1Click:Connect(function() --[[ Line: 1871 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u491 (copy), u505 (copy), u33 (ref), u12 (ref)
                    local v512 = l__PlayerGui__6:GetAttribute("PingCounterEnabledOverride");
                    local v513;
                    if v512 == nil then
                        local v514 = u26;
                        if v514 then
                            v514 = v514:GetAttribute("PingCounterEnabled");
                        end;
                        v513 = ((v514 == nil or v514 == "") and true or v514) ~= false;
                    else
                        v513 = v512 ~= false;
                    end;
                    local v515 = not v513;
                    u491("PingCounterEnabled", v515);
                    u505.Text = v515 and "Ping: ON" or "Ping: OFF";
                    u505.BackgroundColor3 = v515 and Color3.fromRGB(58, 88, 130) or Color3.fromRGB(130, 64, 54);
                    local v516 = u33({
                        Action = "SetPingCounterEnabled",
                        Enabled = v515
                    });
                    if v516.Ok and u26 then
                        u26:SetAttribute("PingCounterEnabled", v515);
                    end;
                    local v517 = v516.Message or "Ping counter settings saved.";
                    if u12 then
                        u12.Text = tostring(v517 or "");
                    end;
                end);
                local u518 = u40(u416, "Minimap side: Left", Color3.fromRGB(72, 72, 72));
                u518.Name = "MinimapSideToggle";
                u518.Size = UDim2.new(1, -12, 0, 34);
                u518.LayoutOrder = 10;
                local v519 = l__PlayerGui__6:GetAttribute("MinimapSideOverride");
                if not v519 then
                    local v520 = u26;
                    if v520 then
                        v520 = v520:GetAttribute("MinimapSide");
                    end;
                    v519 = (v520 == nil or v520 == "") and "Left" or v520;
                end;
                local v521 = tostring(v519) == "Right" and "Right" or "Left";
                u518.Text = "Minimap side: " .. v521;
                u518.BackgroundColor3 = v521 == "Left" and Color3.fromRGB(72, 88, 72) or Color3.fromRGB(72, 72, 98);
                u518.MouseButton1Click:Connect(function() --[[ Line: 1897 ]]
                    -- upvalues: l__PlayerGui__6 (ref), u26 (ref), u33 (ref), u12 (ref), u518 (copy)
                    local v522 = l__PlayerGui__6:GetAttribute("MinimapSideOverride");
                    if not v522 then
                        local v523 = u26;
                        if v523 then
                            v523 = v523:GetAttribute("MinimapSide");
                        end;
                        v522 = (v523 == nil or v523 == "") and "Left" or v523;
                    end;
                    local v524 = (tostring(v522) == "Right" and "Right" or "Left") == "Left" and "Right" or "Left";
                    l__PlayerGui__6:SetAttribute("MinimapSideOverride", v524);
                    if u26 then
                        u26:SetAttribute("MinimapSide", v524);
                    end;
                    local v525 = u33({
                        Action = "SetMinimapSide",
                        Side = v524
                    }).Message or "Minimap side saved.";
                    if u12 then
                        u12.Text = tostring(v525 or "");
                    end;
                    local v526 = l__PlayerGui__6:GetAttribute("MinimapSideOverride");
                    if not v526 then
                        local v527 = u26;
                        if v527 then
                            v527 = v527:GetAttribute("MinimapSide");
                        end;
                        v526 = (v527 == nil or v527 == "") and "Left" or v527;
                    end;
                    local v528 = tostring(v526) == "Right" and "Right" or "Left";
                    u518.Text = "Minimap side: " .. v528;
                    u518.BackgroundColor3 = v528 == "Left" and Color3.fromRGB(72, 88, 72) or Color3.fromRGB(72, 72, 98);
                end);
                local v529 = Instance.new("Frame");
                v529.Name = "MinimapSize";
                v529.Size = UDim2.new(1, -12, 0, 42);
                v529.BackgroundColor3 = u8;
                v529.BorderSizePixel = 0;
                v529.LayoutOrder = 11;
                v529.Parent = u416;
                local v530 = Instance.new("UICorner");
                v530.CornerRadius = UDim.new(0, 5);
                v530.Parent = v529;
                local v531 = Instance.new("TextLabel");
                v531.BackgroundTransparency = 1;
                v531.Position = UDim2.new(0, 8, 0, 0);
                v531.Size = UDim2.new(0.42, -8, 1, 0);
                v531.Text = "Minimap size";
                v531.TextXAlignment = Enum.TextXAlignment.Left;
                v531.Parent = v529;
                v531.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                v531.TextColor3 = u10;
                v531.TextSize = 13;
                v531.TextWrapped = true;
                v531.TextScaled = true;
                local v532 = Instance.new("UITextSizeConstraint");
                v532.MinTextSize = 8;
                v532.MaxTextSize = 13;
                v532.Parent = v531;
                local u533 = Instance.new("TextBox");
                u533.Name = "MinimapSizeBox";
                u533.Position = UDim2.new(0.44, 0, 0, 6);
                u533.Size = UDim2.new(0.28, 0, 1, -12);
                u533.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
                u533.BorderSizePixel = 0;
                u533.ClearTextOnFocus = false;
                local v534 = l__UserInputService__3.TouchEnabled and 150 or 180;
                local v535 = u26;
                if v535 then
                    v535 = v535:GetAttribute("MinimapSize");
                end;
                if v535 ~= nil and v535 ~= "" then
                    v534 = v535;
                end;
                local v536 = tonumber(v534) or (l__UserInputService__3.TouchEnabled and 150 or 180);
                local v537 = 56;
                local v538;
                if l__UserInputService__3.TouchEnabled then
                    local l__CurrentCamera__34 = workspace.CurrentCamera;
                    local v539 = l__CurrentCamera__34 and l__CurrentCamera__34.ViewportSize or Vector2.new(1280, 720);
                    local v540 = math.min(v539.X, v539.Y) * 0.32;
                    local v541 = math.floor(v540);
                    local v542 = math.min(170, v541);
                    v538 = math.max(120, v542);
                else
                    v538 = 180;
                end;
                local v543 = math.clamp(v536, v537, v538) + 0.5;
                local v544 = math.floor(v543);
                u533.Text = tostring(v544);
                u533.Parent = v529;
                local v545 = Instance.new("UICorner");
                v545.CornerRadius = UDim.new(0, 5);
                v545.Parent = u533;
                u533.Font = Enum.Font.Gotham;
                u533.TextColor3 = u10;
                u533.TextSize = 13;
                u533.TextWrapped = true;
                u533.TextScaled = true;
                local v546 = Instance.new("UITextSizeConstraint");
                v546.MinTextSize = 8;
                v546.MaxTextSize = 13;
                v546.Parent = u533;
                local v547 = u40(v529, "Set", u7);
                v547.Position = UDim2.new(0.75, 0, 0, 6);
                v547.Size = UDim2.new(0.23, 0, 1, -12);
                v547.MouseButton1Click:Connect(function() --[[ Line: 1933 ]]
                    -- upvalues: u533 (copy), u12 (ref), l__UserInputService__3 (ref), l__PlayerGui__6 (ref), u26 (ref), u33 (ref)
                    local v548 = tonumber(u533.Text);
                    if v548 then
                        local v549 = 56;
                        local v550;
                        if l__UserInputService__3.TouchEnabled then
                            local l__CurrentCamera__35 = workspace.CurrentCamera;
                            local v551 = l__CurrentCamera__35 and l__CurrentCamera__35.ViewportSize or Vector2.new(1280, 720);
                            local v552 = math.min(v551.X, v551.Y) * 0.32;
                            local v553 = math.floor(v552);
                            local v554 = math.min(170, v553);
                            v550 = math.max(120, v554);
                        else
                            v550 = 180;
                        end;
                        local v555 = math.clamp(v548, v549, v550) + 0.5;
                        local v556 = math.floor(v555);
                        u533.Text = tostring(v556);
                        l__PlayerGui__6:SetAttribute("MinimapSizeOverride", v556);
                        if u26 then
                            u26:SetAttribute("MinimapSize", v556);
                        end;
                        local v557 = u33({
                            Action = "SetMinimapSize",
                            Size = v556
                        }).Message or "Minimap size saved.";
                        if u12 then
                            u12.Text = tostring(v557 or "");
                        end;
                    else
                        if u12 then
                            u12.Text = tostring("Use size in pixels, for example 96.");
                        end;
                    end;
                end);
                local v558 = Instance.new("Frame");
                v558.Name = "MinimapTransparency";
                v558.Size = UDim2.new(1, -12, 0, 42);
                v558.BackgroundColor3 = u8;
                v558.BorderSizePixel = 0;
                v558.LayoutOrder = 12;
                v558.Parent = u416;
                local v559 = Instance.new("UICorner");
                v559.CornerRadius = UDim.new(0, 5);
                v559.Parent = v558;
                local v560 = Instance.new("TextLabel");
                v560.BackgroundTransparency = 1;
                v560.Position = UDim2.new(0, 8, 0, 0);
                v560.Size = UDim2.new(0.42, -8, 1, 0);
                v560.Text = "Minimap transparency";
                v560.TextXAlignment = Enum.TextXAlignment.Left;
                v560.Parent = v558;
                v560.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                v560.TextColor3 = u10;
                v560.TextSize = 13;
                v560.TextWrapped = true;
                v560.TextScaled = true;
                local v561 = Instance.new("UITextSizeConstraint");
                v561.MinTextSize = 8;
                v561.MaxTextSize = 13;
                v561.Parent = v560;
                local u562 = Instance.new("TextBox");
                u562.Name = "MinimapTransparencyBox";
                u562.Position = UDim2.new(0.44, 0, 0, 6);
                u562.Size = UDim2.new(0.28, 0, 1, -12);
                u562.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
                u562.BorderSizePixel = 0;
                u562.ClearTextOnFocus = false;
                local v563 = u26;
                if v563 then
                    v563 = v563:GetAttribute("MinimapTransparency");
                end;
                u562.Text = tostring((v563 == nil or v563 == "") and 0.56 or v563);
                u562.Parent = v558;
                local v564 = Instance.new("UICorner");
                v564.CornerRadius = UDim.new(0, 5);
                v564.Parent = u562;
                u562.Font = Enum.Font.Gotham;
                u562.TextColor3 = u10;
                u562.TextSize = 13;
                u562.TextWrapped = true;
                u562.TextScaled = true;
                local v565 = Instance.new("UITextSizeConstraint");
                v565.MinTextSize = 8;
                v565.MaxTextSize = 13;
                v565.Parent = u562;
                local v566 = u40(v558, "Set", u7);
                v566.Position = UDim2.new(0.75, 0, 0, 6);
                v566.Size = UDim2.new(0.23, 0, 1, -12);
                v566.MouseButton1Click:Connect(function() --[[ Line: 1974 ]]
                    -- upvalues: u562 (copy), u12 (ref), l__PlayerGui__6 (ref), u26 (ref), u33 (ref)
                    local v567 = tonumber(u562.Text);
                    if v567 then
                        if v567 > 1 then
                            v567 = v567 / 100;
                        end;
                        local v568 = math.clamp(v567, 0, 0.95);
                        u562.Text = string.format("%.2f", v568);
                        l__PlayerGui__6:SetAttribute("MinimapTransparencyOverride", v568);
                        if u26 then
                            u26:SetAttribute("MinimapTransparency", v568);
                        end;
                        local v569 = u33({
                            Action = "SetMinimapTransparency",
                            Transparency = v568
                        }).Message or "Minimap transparency saved.";
                        if u12 then
                            u12.Text = tostring(v569 or "");
                        end;
                    else
                        if u12 then
                            u12.Text = tostring("Use transparency from 0 to 1, or percent like 70.");
                        end;
                    end;
                end);
                local v570 = Instance.new("Frame");
                v570.Name = "MinimapColor";
                v570.Size = UDim2.new(1, -12, 0, 42);
                v570.BackgroundColor3 = u8;
                v570.BorderSizePixel = 0;
                v570.LayoutOrder = 13;
                v570.Parent = u416;
                local v571 = Instance.new("UICorner");
                v571.CornerRadius = UDim.new(0, 5);
                v571.Parent = v570;
                local v572 = Instance.new("TextLabel");
                v572.BackgroundTransparency = 1;
                v572.Position = UDim2.new(0, 8, 0, 0);
                v572.Size = UDim2.new(0.32, -8, 1, 0);
                v572.Text = "Minimap color";
                v572.TextXAlignment = Enum.TextXAlignment.Left;
                v572.Parent = v570;
                v572.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                v572.TextColor3 = u10;
                v572.TextSize = 13;
                v572.TextWrapped = true;
                v572.TextScaled = true;
                local v573 = Instance.new("UITextSizeConstraint");
                v573.MinTextSize = 8;
                v573.MaxTextSize = 13;
                v573.Parent = v572;
                local u574 = Instance.new("TextBox");
                u574.Name = "MinimapColorHex";
                u574.Position = UDim2.new(0.34, 0, 0, 6);
                u574.Size = UDim2.new(0.25, 0, 1, -12);
                u574.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
                u574.BorderSizePixel = 0;
                u574.ClearTextOnFocus = false;
                local v575 = u26;
                if v575 then
                    v575 = v575:GetAttribute("MinimapColor");
                end;
                u574.Text = tostring((v575 == nil or v575 == "") and "#202020" or v575);
                u574.Parent = v570;
                local v576 = Instance.new("UICorner");
                v576.CornerRadius = UDim.new(0, 5);
                v576.Parent = u574;
                u574.Font = Enum.Font.Gotham;
                u574.TextColor3 = u10;
                u574.TextSize = 13;
                u574.TextWrapped = true;
                u574.TextScaled = true;
                local v577 = Instance.new("UITextSizeConstraint");
                v577.MinTextSize = 8;
                v577.MaxTextSize = 13;
                v577.Parent = u574;
                local function u582(p578) --[[ Line: 2015 ]]
                    -- upvalues: u12 (ref), u574 (copy), l__PlayerGui__6 (ref), u26 (ref), u33 (ref)
                    local v579;
                    if type(p578) == "string" then
                        local v580 = string.upper(string.gsub(p578, "#", ""));
                        if string.match(v580, "^%x%x%x%x%x%x$") then
                            v579 = "#" .. v580;
                        else
                            v579 = nil;
                        end;
                    else
                        v579 = nil;
                    end;
                    if v579 then
                        u574.Text = v579;
                        l__PlayerGui__6:SetAttribute("MinimapColorOverride", v579);
                        if u26 then
                            u26:SetAttribute("MinimapColor", v579);
                        end;
                        local v581 = u33({
                            Action = "SetMinimapColor",
                            Color = v579
                        }).Message or "Minimap color saved.";
                        if u12 then
                            u12.Text = tostring(v581 or "");
                        end;
                    else
                        if u12 then
                            u12.Text = tostring("Use a color like #202020.");
                        end;
                    end;
                end;
                local v583 = u40(v570, "Pick", Color3.fromRGB(72, 72, 72));
                v583.Position = UDim2.new(0.61, 0, 0, 6);
                v583.Size = UDim2.new(0.17, 0, 1, -12);
                v583.MouseButton1Click:Connect(function() --[[ Line: 2027 ]]
                    -- upvalues: u351 (ref), u574 (copy), u582 (copy)
                    u351("Minimap color", u574.Text, u582);
                end);
                local v584 = u40(v570, "Set", u7);
                v584.Position = UDim2.new(0.8, 0, 0, 6);
                v584.Size = UDim2.new(0.18, 0, 1, -12);
                v584.MouseButton1Click:Connect(function() --[[ Line: 2033 ]]
                    -- upvalues: u574 (copy), u12 (ref), l__PlayerGui__6 (ref), u26 (ref), u33 (ref)
                    local l__Text__36 = u574.Text;
                    local v585;
                    if type(l__Text__36) == "string" then
                        local v586 = string.upper(string.gsub(l__Text__36, "#", ""));
                        if string.match(v586, "^%x%x%x%x%x%x$") then
                            v585 = "#" .. v586;
                        else
                            v585 = nil;
                        end;
                    else
                        v585 = nil;
                    end;
                    if v585 then
                        u574.Text = v585;
                        l__PlayerGui__6:SetAttribute("MinimapColorOverride", v585);
                        if u26 then
                            u26:SetAttribute("MinimapColor", v585);
                        end;
                        local v587 = u33({
                            Action = "SetMinimapColor",
                            Color = v585
                        }).Message or "Minimap color saved.";
                        if u12 then
                            u12.Text = tostring(v587 or "");
                        end;
                    elseif u12 then
                        u12.Text = tostring("Use a color like #202020.");
                    end;
                end);
                local v588 = u40(u416, "Reset keybinds", Color3.fromRGB(98, 98, 98));
                v588.Name = "ResetKeybinds";
                v588.Size = UDim2.new(1, -12, 0, 34);
                v588.LayoutOrder = 14;
                v588.MouseButton1Click:Connect(function() --[[ Line: 2041 ]]
                    -- upvalues: u33 (ref), u12 (ref), u48 (ref)
                    local v589 = u33({
                        Action = "ResetBinds"
                    }).Message or "Keybinds reset.";
                    if u12 then
                        u12.Text = tostring(v589 or "");
                    end;
                    u48();
                end);
                local v590 = Instance.new("Frame");
                v590.Name = "BackgroundColor";
                v590.Size = UDim2.new(1, -12, 0, 42);
                v590.BackgroundColor3 = u8;
                v590.BorderSizePixel = 0;
                v590.LayoutOrder = 15;
                v590.Parent = u416;
                local v591 = Instance.new("UICorner");
                v591.CornerRadius = UDim.new(0, 5);
                v591.Parent = v590;
                local v592 = Instance.new("TextLabel");
                v592.BackgroundTransparency = 1;
                v592.Position = UDim2.new(0, 8, 0, 0);
                v592.Size = UDim2.new(0.32, -8, 1, 0);
                v592.Text = "Background color";
                v592.TextXAlignment = Enum.TextXAlignment.Left;
                v592.Parent = v590;
                v592.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                v592.TextColor3 = u10;
                v592.TextSize = 13;
                v592.TextWrapped = true;
                v592.TextScaled = true;
                local v593 = Instance.new("UITextSizeConstraint");
                v593.MinTextSize = 8;
                v593.MaxTextSize = 13;
                v593.Parent = v592;
                local u594 = Instance.new("TextBox");
                u594.Name = "BackgroundHex";
                u594.Position = UDim2.new(0.34, 0, 0, 6);
                u594.Size = UDim2.new(0.25, 0, 1, -12);
                u594.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
                u594.BorderSizePixel = 0;
                u594.ClearTextOnFocus = false;
                local v595 = u26;
                if v595 then
                    v595 = v595:GetAttribute("BackgroundColor");
                end;
                u594.Text = tostring((v595 == nil or v595 == "") and "#FFFFFF" or v595);
                u594.Parent = v590;
                local v596 = Instance.new("UICorner");
                v596.CornerRadius = UDim.new(0, 5);
                v596.Parent = u594;
                u594.Font = Enum.Font.Gotham;
                u594.TextColor3 = u10;
                u594.TextSize = 13;
                u594.TextWrapped = true;
                u594.TextScaled = true;
                local v597 = Instance.new("UITextSizeConstraint");
                v597.MinTextSize = 8;
                v597.MaxTextSize = 13;
                v597.Parent = u594;
                local v598 = u40(v590, "Pick", Color3.fromRGB(72, 72, 72));
                v598.Name = "PickBackgroundColor";
                v598.Position = UDim2.new(0.61, 0, 0, 6);
                v598.Size = UDim2.new(0.17, 0, 1, -12);
                v598.MouseButton1Click:Connect(function() --[[ Line: 2081 ]]
                    -- upvalues: u351 (ref), u594 (copy), u33 (ref), u12 (ref)
                    u351("Background color", u594.Text, function(p599) --[[ Line: 2082 ]]
                        -- upvalues: u594 (ref), u33 (ref), u12 (ref)
                        u594.Text = p599;
                        local v600 = u33({
                            Action = "SetBackgroundColor",
                            Color = p599
                        }).Message or "Background color saved.";
                        if u12 then
                            u12.Text = tostring(v600 or "");
                        end;
                    end);
                end);
                local v601 = u40(v590, "Set", u7);
                v601.Name = "SetBackgroundColor";
                v601.Position = UDim2.new(0.8, 0, 0, 6);
                v601.Size = UDim2.new(0.18, 0, 1, -12);
                v601.MouseButton1Click:Connect(function() --[[ Line: 2093 ]]
                    -- upvalues: u594 (copy), u12 (ref), u33 (ref)
                    local l__Text__37 = u594.Text;
                    local v602;
                    if type(l__Text__37) == "string" then
                        local v603 = string.upper(string.gsub(l__Text__37, "#", ""));
                        if string.match(v603, "^%x%x%x%x%x%x$") then
                            v602 = "#" .. v603;
                        else
                            v602 = nil;
                        end;
                    else
                        v602 = nil;
                    end;
                    if v602 then
                        u594.Text = v602;
                        local v604 = u33({
                            Action = "SetBackgroundColor",
                            Color = v602
                        }).Message or "Background color saved.";
                        if u12 then
                            u12.Text = tostring(v604 or "");
                        end;
                    else
                        if u12 then
                            u12.Text = tostring("Use a color like #44AAFF.");
                        end;
                    end;
                end);
                local v605 = Instance.new("Frame");
                v605.Name = "BackgroundSwatches";
                v605.Size = UDim2.new(1, -12, 0, 34);
                v605.BackgroundTransparency = 1;
                v605.LayoutOrder = 16;
                v605.Parent = u416;
                local v606 = Instance.new("UIGridLayout");
                v606.SortOrder = Enum.SortOrder.LayoutOrder;
                v606.CellSize = UDim2.fromOffset(42, 28);
                v606.CellPadding = UDim2.fromOffset(4, 4);
                v606.Parent = v605;
                for v607, u608 in ipairs(u6) do
                    local v609 = Instance.new("TextButton");
                    v609.Name = "Swatch" .. v607;
                    v609.Size = UDim2.new(0, 28, 0, 28);
                    v609.BackgroundColor3 = u61(u608, Color3.new(1, 1, 1));
                    v609.BorderSizePixel = 0;
                    v609.Text = "";
                    v609.LayoutOrder = v607;
                    v609.Parent = v605;
                    local v610 = Instance.new("UICorner");
                    v610.CornerRadius = UDim.new(0, 5);
                    v610.Parent = v609;
                    v609.MouseButton1Click:Connect(function() --[[ Line: 2125 ]]
                        -- upvalues: u594 (copy), u608 (copy), u33 (ref), u12 (ref)
                        u594.Text = u608;
                        local v611 = u33({
                            Action = "SetBackgroundColor",
                            Color = u608
                        }).Message or "Background color saved.";
                        if u12 then
                            u12.Text = tostring(v611 or "");
                        end;
                    end);
                end;
                local v612 = u40(u416, "Edit mobile buttons", u7);
                v612.Name = "EditMobileButtons";
                v612.Size = UDim2.new(1, -12, 0, 34);
                v612.LayoutOrder = 17;
                v612.MouseButton1Click:Connect(u413);
                u174(u416, 18);
                local v613 = 30;
                for _, u614 in ipairs(u2) do
                    local v615 = Instance.new("Frame");
                    v615.Name = "Bind_" .. u614.Id;
                    v615.Size = UDim2.new(1, -12, 0, 50);
                    v615.BackgroundColor3 = u8;
                    v615.BorderSizePixel = 0;
                    v615.LayoutOrder = v613;
                    v615.Parent = u416;
                    local v616 = Instance.new("UICorner");
                    v616.CornerRadius = UDim.new(0, 5);
                    v616.Parent = v615;
                    local v617 = Instance.new("TextLabel");
                    v617.BackgroundTransparency = 1;
                    v617.Position = UDim2.new(0, 8, 0, 4);
                    v617.Size = UDim2.new(0.5, -8, 0, 20);
                    v617.Text = u614.Label;
                    v617.TextXAlignment = Enum.TextXAlignment.Left;
                    v617.Parent = v615;
                    v617.Font = Enum.Font.GothamBold or Enum.Font.Gotham;
                    v617.TextColor3 = u10;
                    v617.TextSize = 14;
                    v617.TextWrapped = true;
                    v617.TextScaled = true;
                    local v618 = Instance.new("UITextSizeConstraint");
                    v618.MinTextSize = 8;
                    v618.MaxTextSize = 14;
                    v618.Parent = v617;
                    local v619 = Instance.new("TextLabel");
                    v619.BackgroundTransparency = 1;
                    v619.Position = UDim2.new(0, 8, 0, 24);
                    v619.Size = UDim2.new(0.7, -8, 0, 22);
                    v619.Text = u614.Help;
                    v619.TextXAlignment = Enum.TextXAlignment.Left;
                    v619.TextColor3 = u9;
                    v619.Parent = v615;
                    v619.Font = Enum.Font.Gotham;
                    v619.TextColor3 = u10;
                    v619.TextSize = 11;
                    v619.TextWrapped = true;
                    v619.TextScaled = true;
                    local v620 = Instance.new("UITextSizeConstraint");
                    v620.MinTextSize = 8;
                    v620.MaxTextSize = 11;
                    v620.Parent = v619;
                    local v621 = u40;
                    local l__Id__38 = u614.Id;
                    local v622 = "Bind_" .. l__Id__38;
                    local v623 = u1[l__Id__38] or "";
                    local v624 = u26;
                    if v624 then
                        v624 = v624:GetAttribute(v622);
                    end;
                    if v624 ~= nil and v624 ~= "" then
                        v623 = v624;
                    end;
                    local v625 = tostring(v623) or "";
                    local v626 = tostring(v625);
                    local v627 = v621(v615, ({
                        Space = "Space",
                        One = "1",
                        Two = "2",
                        Three = "3",
                        Four = "4",
                        Five = "5",
                        Six = "6",
                        Seven = "7",
                        Eight = "8",
                        Nine = "9",
                        Zero = "0"
                    })[v626] or v626, Color3.fromRGB(72, 72, 72));
                    v627.Name = "Key";
                    v627.Position = UDim2.new(0.73, 0, 0, 8);
                    v627.Size = UDim2.new(0.25, 0, 1, -16);
                    v627.MouseButton1Click:Connect(function() --[[ Line: 2174 ]]
                        -- upvalues: u54 (ref), u614 (copy)
                        u54(u614.Id);
                    end);
                    u11[u614.Id] = v627;
                    v613 = v613 + 1;
                end;
                u12 = Instance.new("TextLabel");
                u12.Name = "ControlStatus";
                u12.Size = UDim2.new(1, -12, 0, 30);
                u12.BackgroundTransparency = 1;
                u12.Text = u26 and "Settings save automatically." or "Settings are loading...";
                u12.TextColor3 = u9;
                u12.LayoutOrder = 999;
                u12.Parent = u416;
                local v628 = u12;
                v628.Font = Enum.Font.Gotham;
                v628.TextColor3 = u10;
                v628.TextSize = 12;
                v628.TextWrapped = true;
                v628.TextScaled = true;
                local v629 = Instance.new("UITextSizeConstraint");
                v629.MinTextSize = 8;
                v629.MaxTextSize = 12;
                v629.Parent = v628;
                u48();
            end;
        end;
    end;
    local u631 = false;
    local function u633() --[[ Line: 2195 ]]
        -- upvalues: u631 (ref), u26 (ref), u1 (copy), u48 (copy), u248 (copy), u20 (ref), u19 (ref), u21 (ref), u22 (ref), u23 (ref), u24 (ref)
        if u631 or not u26 then
        else
            u631 = true;
            for v632 in pairs(u1) do
                u26:GetAttributeChangedSignal("Bind_" .. v632):Connect(u48);
            end;
            u26:GetAttributeChangedSignal("MobileControlsJson"):Connect(u248);
            u26:GetAttributeChangedSignal("TradeRequestsEnabled"):Connect(function() --[[ Line: 2204 ]]
                -- upvalues: u20 (ref)
                if u20 then
                    u20();
                end;
            end);
            u26:GetAttributeChangedSignal("SfxEnabled"):Connect(function() --[[ Line: 2209 ]]
                -- upvalues: u19 (ref)
                if u19 then
                    u19();
                end;
            end);
            u26:GetAttributeChangedSignal("MinimapEnabled"):Connect(function() --[[ Line: 2214 ]]
                -- upvalues: u21 (ref)
                if u21 then
                    u21();
                end;
            end);
            u26:GetAttributeChangedSignal("ScreenMusicButtonEnabled"):Connect(function() --[[ Line: 2219 ]]
                -- upvalues: u22 (ref)
                if u22 then
                    u22();
                end;
            end);
            u26:GetAttributeChangedSignal("FpsCounterEnabled"):Connect(function() --[[ Line: 2224 ]]
                -- upvalues: u23 (ref)
                if u23 then
                    u23();
                end;
            end);
            u26:GetAttributeChangedSignal("PingCounterEnabled"):Connect(function() --[[ Line: 2229 ]]
                -- upvalues: u24 (ref)
                if u24 then
                    u24();
                end;
            end);
        end;
    end;
    task.spawn(function() --[[ Line: 2236 ]]
        -- upvalues: u26 (ref), l__ClientPlayerState__12 (copy), l__LocalPlayer__5 (copy), u633 (copy), u76 (copy), u630 (copy), u248 (copy)
        u26 = l__ClientPlayerState__12.WaitForProxy("Settings", l__LocalPlayer__5, 10);
        u633();
        u76();
        u630();
        u248();
    end);
    u630();
    u248();
    l__PlayerGui__6.ChildAdded:Connect(function(p634) --[[ Line: 2246 ]]
        -- upvalues: u232 (copy), u248 (copy)
        if p634.Name == "MobileAgaricControls" then
            task.defer(function() --[[ Line: 2248 ]]
                -- upvalues: u232 (ref), u248 (ref)
                u232(false);
                u248();
            end);
        end;
    end);
else
    warn("[ControlSettings] UpdateControlSettings remote is missing.");
end;