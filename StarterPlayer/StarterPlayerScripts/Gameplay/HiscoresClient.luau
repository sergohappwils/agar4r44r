-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Gameplay.HiscoresClient

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__PlayerGui__3 = l__Players__1.LocalPlayer:WaitForChild("PlayerGui");
local l__Gameplay__4 = l__ReplicatedStorage__2:WaitForChild("Gameplay");
local l__Network__5 = l__Gameplay__4:WaitForChild("Network");
local l__GetPublicHiscores__6 = l__Network__5:WaitForChild("GetPublicHiscores", 30);
local l__PublicHiscoresUpdated__7 = l__Network__5:WaitForChild("PublicHiscoresUpdated", 30);
if l__GetPublicHiscores__6 then
    local l__Gui__8 = l__PlayerGui__3:WaitForChild("Gui", 30);
    if l__Gui__8 then
        local l__Menu__9 = l__Gui__8:WaitForChild("Menu", 30);
        if l__Menu__9 then
            local l__Right__10 = l__Menu__9:WaitForChild("Right", 30);
            if l__Right__10 then
                local l__Select__11 = l__Right__10:WaitForChild("Select", 10);
                local u1 = l__Right__10:FindFirstChild("Mods");
                local u2 = Color3.fromRGB(255, 85, 0);
                local u3 = Color3.fromRGB(88, 88, 88);
                local u4 = Color3.fromRGB(20, 20, 20);
                local u5 = Color3.fromRGB(45, 45, 45);
                local u6 = Color3.fromRGB(245, 245, 245);
                local v7 = Color3.fromRGB(180, 180, 180);
                local u8 = "Level";
                local u9 = false;
                local u10 = {};
                local u11 = {
                    Level = "level",
                    PlayerKills = "player kills",
                    PlayerBlobsEaten = "blobs eaten",
                    Mode = "mode"
                };
                local function u18(p12) --[[ Line: 53 ]]
                    local v13 = tonumber(p12) or 0;
                    if v13 >= 1000000000 then
                        return string.format("%.1fB", v13 / 1000000000);
                    end;
                    if v13 >= 1000000 then
                        return string.format("%.1fM", v13 / 1000000);
                    end;
                    if v13 < 1000 then
                        local v14 = math.floor(v13);
                        return tostring(v14);
                    end;
                    local v15 = math.floor(v13);
                    local v16 = tostring(v15);
                    local v17 = "";
                    while #v16 > 3 do
                        v17 = "," .. string.sub(v16, -3) .. v17;
                        v16 = string.sub(v16, 1, #v16 - 3);
                    end;
                    return v16 .. v17;
                end;
                local function v25(p19) --[[ Line: 118 ]]
                    -- upvalues: l__Right__10 (copy), u1 (copy), u4 (copy)
                    local v20 = l__Right__10:FindFirstChild(p19);
                    if v20 and v20:IsA("Frame") then
                        return v20;
                    end;
                    local v21 = Instance.new("Frame");
                    v21.Name = p19;
                    v21.AnchorPoint = Vector2.new(1, 0.5);
                    local v22;
                    if u1 then
                        v22 = u1.Position;
                    else
                        v22 = UDim2.new(1, 0, 0.564, 0);
                    end;
                    v21.Position = v22;
                    local v23;
                    if u1 then
                        v23 = u1.Size;
                    else
                        v23 = UDim2.new(1, 0, 0.871, 0);
                    end;
                    v21.Size = v23;
                    v21.BackgroundColor3 = u4;
                    v21.BackgroundTransparency = 0.15;
                    v21.BorderSizePixel = 0;
                    v21.Visible = false;
                    v21.Parent = l__Right__10;
                    local v24 = Instance.new("UICorner");
                    v24.CornerRadius = UDim.new(0, 6);
                    v24.Parent = v21;
                    return v21;
                end;
                local u26 = v25("Hiscores");
                local v27 = v25("Settings");
                local v28 = u26:FindFirstChild("PublicHiscoresRoot");
                if v28 then
                    v28:Destroy();
                end;
                local u29 = Instance.new("Frame");
                u29.Name = "PublicHiscoresRoot";
                u29.Size = UDim2.fromScale(1, 1);
                u29.BackgroundTransparency = 1;
                u29.Parent = u26;
                local v30 = Instance.new("TextLabel");
                v30.Name = "Title";
                v30.BackgroundTransparency = 1;
                v30.Position = UDim2.new(0.04, 0, 0.02, 0);
                v30.Size = UDim2.new(0.92, 0, 0.08, 0);
                v30.Text = "Hiscores";
                v30.TextXAlignment = Enum.TextXAlignment.Left;
                v30.Parent = u29;
                v30.Font = Enum.Font.GothamBold;
                v30.TextSize = 22;
                v30.TextColor3 = u6;
                v30.TextWrapped = true;
                v30.TextScaled = true;
                local v31 = Instance.new("UITextSizeConstraint");
                v31.MinTextSize = 8;
                v31.MaxTextSize = 22;
                v31.Parent = v30;
                local v32 = u29;
                local v33 = UDim2.new(0.04, 0, 0.13, 0);
                local v34 = UDim2.new(0.215, 0, 0.08, 0);
                local u35 = Instance.new("TextButton");
                u35.Name = "LevelTab";
                u35.Position = v33;
                u35.Size = v34;
                u35.BorderSizePixel = 0;
                u35.BackgroundColor3 = u3;
                u35.Text = "Level";
                u35.AutoButtonColor = true;
                u35.Parent = v32;
                u35.Font = Enum.Font.GothamBold;
                u35.TextSize = 16;
                u35.TextColor3 = u6;
                u35.TextWrapped = true;
                u35.TextScaled = true;
                local v36 = Instance.new("UITextSizeConstraint");
                v36.MinTextSize = 8;
                v36.MaxTextSize = 16;
                v36.Parent = u35;
                local v37 = Instance.new("UICorner");
                v37.CornerRadius = UDim.new(0, 5);
                v37.Parent = u35;
                local v38 = u29;
                local v39 = UDim2.new(0.275, 0, 0.13, 0);
                local v40 = UDim2.new(0.215, 0, 0.08, 0);
                local u41 = Instance.new("TextButton");
                u41.Name = "PlayerKillsTab";
                u41.Position = v39;
                u41.Size = v40;
                u41.BorderSizePixel = 0;
                u41.BackgroundColor3 = u3;
                u41.Text = "Kills";
                u41.AutoButtonColor = true;
                u41.Parent = v38;
                u41.Font = Enum.Font.GothamBold;
                u41.TextSize = 16;
                u41.TextColor3 = u6;
                u41.TextWrapped = true;
                u41.TextScaled = true;
                local v42 = Instance.new("UITextSizeConstraint");
                v42.MinTextSize = 8;
                v42.MaxTextSize = 16;
                v42.Parent = u41;
                local v43 = Instance.new("UICorner");
                v43.CornerRadius = UDim.new(0, 5);
                v43.Parent = u41;
                local v44 = u29;
                local v45 = UDim2.new(0.51, 0, 0.13, 0);
                local v46 = UDim2.new(0.215, 0, 0.08, 0);
                local u47 = Instance.new("TextButton");
                u47.Name = "PlayerBlobsEatenTab";
                u47.Position = v45;
                u47.Size = v46;
                u47.BorderSizePixel = 0;
                u47.BackgroundColor3 = u3;
                u47.Text = "Blobs";
                u47.AutoButtonColor = true;
                u47.Parent = v44;
                u47.Font = Enum.Font.GothamBold;
                u47.TextSize = 16;
                u47.TextColor3 = u6;
                u47.TextWrapped = true;
                u47.TextScaled = true;
                local v48 = Instance.new("UITextSizeConstraint");
                v48.MinTextSize = 8;
                v48.MaxTextSize = 16;
                v48.Parent = u47;
                local v49 = Instance.new("UICorner");
                v49.CornerRadius = UDim.new(0, 5);
                v49.Parent = u47;
                local v50 = u29;
                local v51 = UDim2.new(0.745, 0, 0.13, 0);
                local v52 = UDim2.new(0.215, 0, 0.08, 0);
                local u53 = Instance.new("TextButton");
                u53.Name = "ModeTab";
                u53.Position = v51;
                u53.Size = v52;
                u53.BorderSizePixel = 0;
                u53.BackgroundColor3 = u3;
                u53.Text = "Mode";
                u53.AutoButtonColor = true;
                u53.Parent = v50;
                u53.Font = Enum.Font.GothamBold;
                u53.TextSize = 16;
                u53.TextColor3 = u6;
                u53.TextWrapped = true;
                u53.TextScaled = true;
                local v54 = Instance.new("UITextSizeConstraint");
                v54.MinTextSize = 8;
                v54.MaxTextSize = 16;
                v54.Parent = u53;
                local v55 = Instance.new("UICorner");
                v55.CornerRadius = UDim.new(0, 5);
                v55.Parent = u53;
                local u56 = Instance.new("TextLabel");
                u56.Name = "ModeLabel";
                u56.BackgroundTransparency = 1;
                u56.Position = UDim2.new(0.04, 0, 0.225, 0);
                u56.Size = UDim2.new(0.92, 0, 0.055, 0);
                u56.Text = "Select a mode to see its best size board.";
                u56.TextColor3 = v7;
                u56.TextXAlignment = Enum.TextXAlignment.Left;
                u56.Parent = u29;
                u56.Font = Enum.Font.Gotham;
                u56.TextSize = 13;
                u56.TextColor3 = u6;
                u56.TextWrapped = true;
                u56.TextScaled = true;
                local v57 = Instance.new("UITextSizeConstraint");
                v57.MinTextSize = 8;
                v57.MaxTextSize = 13;
                v57.Parent = u56;
                local u58 = Instance.new("TextLabel");
                u58.Name = "YourScore";
                u58.BackgroundColor3 = Color3.fromRGB(38, 38, 38);
                u58.BackgroundTransparency = 0.08;
                u58.BorderSizePixel = 0;
                u58.Position = UDim2.new(0.04, 0, 0.285, 0);
                u58.Size = UDim2.new(0.92, 0, 0.055, 0);
                u58.Text = "Your score: loading...";
                u58.TextXAlignment = Enum.TextXAlignment.Left;
                u58.Parent = u29;
                local v59 = Instance.new("UICorner");
                v59.CornerRadius = UDim.new(0, 5);
                v59.Parent = u58;
                u58.Font = Enum.Font.GothamBold;
                u58.TextSize = 13;
                u58.TextColor3 = u6;
                u58.TextWrapped = true;
                u58.TextScaled = true;
                local v60 = Instance.new("UITextSizeConstraint");
                v60.MinTextSize = 8;
                v60.MaxTextSize = 13;
                v60.Parent = u58;
                local function v67(p61, p62) --[[ Line: 190 ]]
                    -- upvalues: u29 (ref)
                    local u63 = Instance.new("ScrollingFrame");
                    u63.Name = p61 .. "Entries";
                    u63.Position = UDim2.new(0.04, 0, 0.35, 0);
                    u63.Size = UDim2.new(0.92, 0, 0.58, 0);
                    u63.BackgroundColor3 = Color3.fromRGB(12, 12, 12);
                    u63.BackgroundTransparency = 0.2;
                    u63.BorderSizePixel = 0;
                    u63.CanvasSize = UDim2.fromOffset(0, 0);
                    u63.ScrollBarThickness = 6;
                    u63.ScrollingDirection = Enum.ScrollingDirection.Y;
                    u63.Visible = p62;
                    u63.Parent = u29;
                    local v64 = Instance.new("UICorner");
                    v64.CornerRadius = UDim.new(0, 5);
                    v64.Parent = u63;
                    local u65 = Instance.new("UIListLayout");
                    u65.SortOrder = Enum.SortOrder.LayoutOrder;
                    u65.Padding = UDim.new(0, 3);
                    u65.Parent = u63;
                    local v66 = Instance.new("UIPadding");
                    v66.PaddingTop = UDim.new(0, 4);
                    v66.PaddingLeft = UDim.new(0, 4);
                    v66.PaddingRight = UDim.new(0, 4);
                    v66.PaddingBottom = UDim.new(0, 4);
                    v66.Parent = u63;
                    u65:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 217 ]]
                        -- upvalues: u63 (copy), u65 (copy)
                        u63.CanvasSize = UDim2.fromOffset(0, u65.AbsoluteContentSize.Y + 10);
                    end);
                    return u63;
                end;
                local u68 = {
                    Level = v67("Level", true),
                    PlayerKills = v67("PlayerKills", false),
                    PlayerBlobsEaten = v67("PlayerBlobsEaten", false),
                    Mode = v67("Mode", false)
                };
                local u69 = Instance.new("TextLabel");
                u69.Name = "Status";
                u69.BackgroundTransparency = 1;
                u69.Position = UDim2.new(0.04, 0, 0.93, 0);
                u69.Size = UDim2.new(0.92, 0, 0.055, 0);
                u69.Text = "";
                u69.TextColor3 = v7;
                u69.Parent = u29;
                u69.Font = Enum.Font.Gotham;
                u69.TextSize = 12;
                u69.TextColor3 = u6;
                u69.TextWrapped = true;
                u69.TextScaled = true;
                local v70 = Instance.new("UITextSizeConstraint");
                v70.MinTextSize = 8;
                v70.MaxTextSize = 12;
                v70.Parent = u69;
                local v71 = v27:FindFirstChild("PublicHiscoresSettings");
                if v71 then
                    v71:Destroy();
                end;
                local v72 = Instance.new("Frame");
                v72.Name = "PublicHiscoresSettings";
                v72.Size = UDim2.fromScale(1, 1);
                v72.BackgroundTransparency = 1;
                v72.Parent = v27;
                local v73 = Instance.new("TextLabel");
                v73.BackgroundTransparency = 1;
                v73.Position = UDim2.new(0.05, 0, 0.018, 0);
                v73.Size = UDim2.new(0.9, 0, 0.075, 0);
                v73.Text = "Settings";
                v73.TextXAlignment = Enum.TextXAlignment.Left;
                v73.Parent = v72;
                v73.Font = Enum.Font.GothamBold;
                v73.TextSize = 22;
                v73.TextColor3 = u6;
                v73.TextWrapped = true;
                v73.TextScaled = true;
                local v74 = Instance.new("UITextSizeConstraint");
                v74.MinTextSize = 8;
                v74.MaxTextSize = 22;
                v74.Parent = v73;
                local v75 = UDim2.new(0.05, 0, 0.105, 0);
                local v76 = UDim2.new(0.9, 0, 0.095, 0);
                local u77 = Instance.new("TextButton");
                u77.Name = "HidePublicHiscores";
                u77.Position = v75;
                u77.Size = v76;
                u77.BorderSizePixel = 0;
                u77.BackgroundColor3 = u3;
                u77.Text = "Public hiscores: Visible";
                u77.AutoButtonColor = true;
                u77.Parent = v72;
                u77.Font = Enum.Font.GothamBold;
                u77.TextSize = 16;
                u77.TextColor3 = u6;
                u77.TextWrapped = true;
                u77.TextScaled = true;
                local v78 = Instance.new("UITextSizeConstraint");
                v78.MinTextSize = 8;
                v78.MaxTextSize = 16;
                v78.Parent = u77;
                local v79 = Instance.new("UICorner");
                v79.CornerRadius = UDim.new(0, 5);
                v79.Parent = u77;
                u77.BackgroundColor3 = Color3.fromRGB(65, 65, 65);
                local v80 = Instance.new("TextLabel");
                v80.BackgroundTransparency = 1;
                v80.Position = UDim2.new(0.05, 0, 0.21, 0);
                v80.Size = UDim2.new(0.9, 0, 0.105, 0);
                v80.Text = "";
                v80.Visible = false;
                v80.TextColor3 = v7;
                v80.TextXAlignment = Enum.TextXAlignment.Left;
                v80.Parent = v72;
                v80.Font = Enum.Font.Gotham;
                v80.TextSize = 13;
                v80.TextColor3 = u6;
                v80.TextWrapped = true;
                v80.TextScaled = true;
                local v81 = Instance.new("UITextSizeConstraint");
                v81.MinTextSize = 8;
                v81.MaxTextSize = 13;
                v81.Parent = v80;
                local function u84(p82) --[[ Line: 273 ]]
                    -- upvalues: u10 (copy)
                    local v83 = u10[p82];
                    if not v83 then
                        v83 = {
                            Loaded = false,
                            Loading = false,
                            RequestKey = "",
                            StatusText = "",
                            PlayerScoreText = "Your score: loading...",
                            HasPlayerValue = false,
                            ModeLabelText = "Select a mode to see its best size board.",
                            Rows = {}
                        };
                        u10[p82] = v83;
                    end;
                    return v83;
                end;
                local function u88(p85) --[[ Line: 301 ]]
                    -- upvalues: u84 (copy)
                    local v86 = u84(p85);
                    for _, v87 in pairs(v86.Rows) do
                        if v87:IsA("Frame") then
                            v87.Visible = false;
                        end;
                    end;
                end;
                local function u94(p89, p90) --[[ Line: 310 ]]
                    -- upvalues: u84 (copy)
                    local v91 = u84(p89);
                    for v92, v93 in pairs(v91.Rows) do
                        if not p90[v92] and v93:IsA("Frame") then
                            v93.Visible = false;
                        end;
                    end;
                end;
                local function u106(p95, p96) --[[ Line: 319 ]]
                    -- upvalues: u84 (copy), u68 (copy), u6 (copy)
                    local l__Rows__12 = u84(p95).Rows;
                    local v97 = l__Rows__12[p96];
                    if v97 then
                        return v97;
                    end;
                    local v98 = Instance.new("Frame");
                    v98.Name = "Entry" .. tostring(p96);
                    v98.LayoutOrder = p96;
                    v98.Size = UDim2.new(1, -8, 0, 28);
                    v98.BorderSizePixel = 0;
                    v98.Visible = false;
                    v98.Parent = u68[p95] or u68.Level;
                    local v99 = Instance.new("UICorner");
                    v99.CornerRadius = UDim.new(0, 5);
                    v99.Parent = v98;
                    local v100 = Instance.new("TextLabel");
                    v100.Name = "Rank";
                    v100.BackgroundTransparency = 1;
                    v100.Position = UDim2.new(0, 4, 0, 0);
                    v100.Size = UDim2.new(0.15, -4, 1, 0);
                    v100.Parent = v98;
                    v100.Font = Enum.Font.GothamBold;
                    v100.TextSize = 14;
                    v100.TextColor3 = u6;
                    v100.TextWrapped = true;
                    v100.TextScaled = true;
                    local v101 = Instance.new("UITextSizeConstraint");
                    v101.MinTextSize = 8;
                    v101.MaxTextSize = 14;
                    v101.Parent = v100;
                    local v102 = Instance.new("TextLabel");
                    v102.Name = "PlayerName";
                    v102.BackgroundTransparency = 1;
                    v102.Position = UDim2.new(0.16, 0, 0, 0);
                    v102.Size = UDim2.new(0.55, 0, 1, 0);
                    v102.TextXAlignment = Enum.TextXAlignment.Left;
                    v102.TextTruncate = Enum.TextTruncate.AtEnd;
                    v102.Parent = v98;
                    v102.Font = Enum.Font.Gotham;
                    v102.TextSize = 14;
                    v102.TextColor3 = u6;
                    v102.TextWrapped = true;
                    v102.TextScaled = true;
                    local v103 = Instance.new("UITextSizeConstraint");
                    v103.MinTextSize = 8;
                    v103.MaxTextSize = 14;
                    v103.Parent = v102;
                    local v104 = Instance.new("TextLabel");
                    v104.Name = "Value";
                    v104.BackgroundTransparency = 1;
                    v104.Position = UDim2.new(0.72, 0, 0, 0);
                    v104.Size = UDim2.new(0.26, 0, 1, 0);
                    v104.TextXAlignment = Enum.TextXAlignment.Right;
                    v104.Parent = v98;
                    v104.Font = Enum.Font.GothamBold;
                    v104.TextSize = 14;
                    v104.TextColor3 = u6;
                    v104.TextWrapped = true;
                    v104.TextScaled = true;
                    local v105 = Instance.new("UITextSizeConstraint");
                    v105.MinTextSize = 8;
                    v105.MaxTextSize = 14;
                    v105.Parent = v104;
                    l__Rows__12[p96] = v98;
                    return v98;
                end;
                local function u117(p107, p108, p109, p110) --[[ Line: 373 ]]
                    -- upvalues: u106 (copy), u5 (copy)
                    local v111 = u106(p107, p108);
                    v111.LayoutOrder = p108;
                    local v112;
                    if p108 <= 3 then
                        v112 = Color3.fromRGB(78, 62, 36);
                    else
                        v112 = u5;
                    end;
                    if v111.BackgroundColor3 ~= v112 then
                        v111.BackgroundColor3 = v112;
                    end;
                    v111.Visible = true;
                    local v113 = v111:FindFirstChild("Rank");
                    local v114 = v111:FindFirstChild("PlayerName");
                    local v115 = v111:FindFirstChild("Value");
                    local v116 = "#" .. tostring(p108);
                    if v113 and v113.Text ~= v116 then
                        v113.Text = v116;
                    end;
                    if v114 and v114.Text ~= p109 then
                        v114.Text = p109;
                    end;
                    if v115 and v115.Text ~= p110 then
                        v115.Text = p110;
                    end;
                end;
                local function u124() --[[ Line: 407 ]]
                    -- upvalues: l__Gameplay__4 (copy)
                    local v118 = l__Gameplay__4:GetAttribute("ModeType") or "Official";
                    local v119 = tostring(v118);
                    local v120 = v119 ~= "Custom" and "Official" or v119;
                    local v121 = nil;
                    local v122;
                    if v120 == "Custom" then
                        v122 = l__Gameplay__4:GetAttribute("CustomModeId");
                        if type(v122) == "string" then
                            if v122 == "" then
                                v122 = v121;
                            end;
                        else
                            v122 = v121;
                        end;
                    else
                        v122 = v121;
                    end;
                    local v123 = v122 or l__Gameplay__4:GetAttribute("ModeId");
                    return {
                        ModeType = v120,
                        ModeId = v123,
                        ModeName = l__Gameplay__4:GetAttribute("ModeDisplayName") or v123
                    };
                end;
                local function u129() --[[ Line: 432 ]]
                    -- upvalues: l__Right__10 (copy), u124 (copy)
                    local v125 = l__Right__10:GetAttribute("SelectedModeType");
                    local v126 = l__Right__10:GetAttribute("SelectedModeId");
                    local v127 = l__Right__10:GetAttribute("SelectedModeName");
                    local v128 = u124();
                    return tostring(v128.ModeId or "") == "" and {
                        ModeType = v125,
                        ModeId = v126,
                        ModeName = v127
                    } or v128;
                end;
                local function u135() --[[ Line: 455 ]]
                    -- upvalues: l__GetPublicHiscores__6 (copy), u9 (ref), u77 (copy)
                    local u130 = {
                        Action = "GetSettings"
                    };
                    local v131, v132 = pcall(function() --[[ Line: 391 ]]
                        -- upvalues: l__GetPublicHiscores__6 (ref), u130 (copy)
                        return l__GetPublicHiscores__6:InvokeServer(u130);
                    end);
                    if not v131 or type(v132) ~= "table" then
                        v132 = nil;
                    end;
                    if v132 and v132.Ok then
                        u9 = v132.Hidden == true;
                        u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                        local v133 = u77;
                        local v134;
                        if u9 then
                            v134 = Color3.fromRGB(130, 64, 54);
                        else
                            v134 = Color3.fromRGB(58, 112, 76);
                        end;
                        v133.BackgroundColor3 = v134;
                    end;
                end;
                local function u138(p136, p137) --[[ Line: 463 ]]
                    -- upvalues: u18 (copy)
                    if p136 == "Level" then
                        return "Lv. " .. u18(p137);
                    else
                        return u18(p137);
                    end;
                end;
                local function u149(p139, p140) --[[ Line: 470 ]]
                    -- upvalues: u18 (copy)
                    if p139 == "Level" then
                        local v141 = "Your level: ";
                        local v142;
                        if p139 == "Level" then
                            v142 = "Lv. " .. u18(p140);
                        else
                            v142 = u18(p140);
                        end;
                        return v141 .. v142;
                    elseif p139 == "PlayerKills" then
                        local v143 = "Your kills: ";
                        local v144;
                        if p139 == "Level" then
                            v144 = "Lv. " .. u18(p140);
                        else
                            v144 = u18(p140);
                        end;
                        return v143 .. v144;
                    elseif p139 == "PlayerBlobsEaten" then
                        local v145 = "Your blobs eaten: ";
                        local v146;
                        if p139 == "Level" then
                            v146 = "Lv. " .. u18(p140);
                        else
                            v146 = u18(p140);
                        end;
                        return v145 .. v146;
                    else
                        local v147 = "Your mass: ";
                        local v148;
                        if p139 == "Level" then
                            v148 = "Lv. " .. u18(p140);
                        else
                            v148 = u18(p140);
                        end;
                        return v147 .. v148;
                    end;
                end;
                local function u156(p150) --[[ Line: 481 ]]
                    -- upvalues: u129 (copy)
                    local v151 = {
                        Action = "GetBoard",
                        Board = p150
                    };
                    if p150 == "Mode" then
                        local v152 = u129();
                        v151.ModeType = v152.ModeType;
                        v151.ModeId = v152.ModeId;
                        v151.ModeName = v152.ModeName;
                        local v153 = tostring(v152.ModeType or "Official");
                        local v154 = v153 ~= "Custom" and "Official" or v153;
                        local v155 = tostring(v152.ModeId or "Classic");
                        p150 = "Mode:" .. v154 .. ":" .. (v155 == "" and "Classic" or v155);
                    end;
                    return v151, p150;
                end;
                local u157 = nil;
                local u158 = {};
                local function u214(u159, u160, p161) --[[ Line: 533 ]]
                    -- upvalues: u84 (copy), u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u58 (copy), u56 (copy), u69 (copy), u149 (copy), u88 (copy), u158 (copy), u26 (copy), u157 (ref), u117 (copy), u138 (copy), u94 (copy)
                    local v162 = u84(u159);
                    if v162.RequestKey ~= u160 then
                        return;
                    end;
                    v162.Loading = false;
                    if not (p161 and p161.Ok) then
                        v162.StatusText = p161 and p161.Message or "Hiscores are not available.";
                        if u8 == u159 then
                            local v163 = u35;
                            local v164;
                            if u8 == "Level" then
                                v164 = u2;
                            else
                                v164 = u3;
                            end;
                            v163.BackgroundColor3 = v164;
                            local v165 = u41;
                            local v166;
                            if u8 == "PlayerKills" then
                                v166 = u2;
                            else
                                v166 = u3;
                            end;
                            v165.BackgroundColor3 = v166;
                            local v167 = u47;
                            local v168;
                            if u8 == "PlayerBlobsEaten" then
                                v168 = u2;
                            else
                                v168 = u3;
                            end;
                            v167.BackgroundColor3 = v168;
                            local v169 = u53;
                            local v170;
                            if u8 == "Mode" then
                                v170 = u2;
                            else
                                v170 = u3;
                            end;
                            v169.BackgroundColor3 = v170;
                            local v171 = u8;
                            for v172, v173 in pairs(u68) do
                                v173.Visible = v172 == v171;
                            end;
                            local v174 = u84(u8);
                            u58.Text = tostring(v174.PlayerScoreText or "Your score: loading...");
                            u56.Text = tostring(v174.ModeLabelText or "Select a mode to see its best size board.");
                            u69.Text = tostring(v174.StatusText or "");
                        end;
                        return;
                    end;
                    v162.Loaded = true;
                    local v175 = tostring(p161.Title or u159);
                    if p161.PlayerValue ~= nil then
                        v162.PlayerScoreText = u149(u159, tonumber(p161.PlayerValue) or 0);
                        v162.HasPlayerValue = true;
                    end;
                    if u159 == "Mode" then
                        v162.ModeLabelText = "Mode best size: " .. v175;
                    else
                        v162.ModeLabelText = "Top 20 public players by " .. string.lower(v175) .. ".";
                    end;
                    local l__Entries__13 = p161.Entries;
                    if type(l__Entries__13) ~= "table" or #l__Entries__13 == 0 then
                        u88(u159);
                        v162.StatusText = p161.Refreshing == true and "Updating hiscores..." or "No entries yet.";
                        if p161.Refreshing == true then
                            local u176 = u159 .. ":" .. u160;
                            local u177 = (u158[u176] or 0) + 1;
                            u158[u176] = u177;
                            task.delay(2, function() --[[ Line: 519 ]]
                                -- upvalues: u158 (ref), u176 (copy), u177 (copy), u26 (ref), u84 (ref), u159 (copy), u160 (copy), u157 (ref)
                                if u158[u176] == u177 and u26.Visible then
                                    if u84(u159).RequestKey == u160 then
                                        if u157 then
                                            u157(u159, true);
                                        end;
                                    end;
                                end;
                            end);
                        end;
                        if u8 == u159 then
                            local v178 = u35;
                            local v179;
                            if u8 == "Level" then
                                v179 = u2;
                            else
                                v179 = u3;
                            end;
                            v178.BackgroundColor3 = v179;
                            local v180 = u41;
                            local v181;
                            if u8 == "PlayerKills" then
                                v181 = u2;
                            else
                                v181 = u3;
                            end;
                            v180.BackgroundColor3 = v181;
                            local v182 = u47;
                            local v183;
                            if u8 == "PlayerBlobsEaten" then
                                v183 = u2;
                            else
                                v183 = u3;
                            end;
                            v182.BackgroundColor3 = v183;
                            local v184 = u53;
                            local v185;
                            if u8 == "Mode" then
                                v185 = u2;
                            else
                                v185 = u3;
                            end;
                            v184.BackgroundColor3 = v185;
                            local v186 = u8;
                            for v187, v188 in pairs(u68) do
                                v188.Visible = v187 == v186;
                            end;
                            local v189 = u84(u8);
                            u58.Text = tostring(v189.PlayerScoreText or "Your score: loading...");
                            u56.Text = tostring(v189.ModeLabelText or "Select a mode to see its best size board.");
                            u69.Text = tostring(v189.StatusText or "");
                        end;
                        return;
                    end;
                    local v190 = {};
                    local v191 = false;
                    for v192, v193 in ipairs(l__Entries__13) do
                        if v192 > 20 then
                            break;
                        end;
                        local v194 = tonumber(v193.Rank) or v192;
                        local v195 = tostring(v193.Name or "Player");
                        local v196 = tonumber(v193.Value) or 0;
                        v191 = v193.NamePending == true and true or v191;
                        v190[v194] = true;
                        u117(u159, v194, v195, u138(u159, v196));
                    end;
                    u94(u159, v190);
                    local v197;
                    if p161.Refreshing == true then
                        local v198 = math.min(#l__Entries__13, 20);
                        v197 = "Showing cached top " .. tostring(v198) .. ". Updating...";
                    else
                        local v199 = math.min(#l__Entries__13, 20);
                        v197 = "Showing top " .. tostring(v199) .. ".";
                    end;
                    v162.StatusText = v197;
                    if p161.Refreshing == true or v191 then
                        local u200 = u159 .. ":" .. u160;
                        local u201 = (u158[u200] or 0) + 1;
                        u158[u200] = u201;
                        task.delay(2, function() --[[ Line: 519 ]]
                            -- upvalues: u158 (ref), u200 (copy), u201 (copy), u26 (ref), u84 (ref), u159 (copy), u160 (copy), u157 (ref)
                            if u158[u200] == u201 and u26.Visible then
                                if u84(u159).RequestKey == u160 then
                                    if u157 then
                                        u157(u159, true);
                                    end;
                                end;
                            end;
                        end);
                    end;
                    if u8 == u159 then
                        local v202 = u35;
                        local v203;
                        if u8 == "Level" then
                            v203 = u2;
                        else
                            v203 = u3;
                        end;
                        v202.BackgroundColor3 = v203;
                        local v204 = u41;
                        local v205;
                        if u8 == "PlayerKills" then
                            v205 = u2;
                        else
                            v205 = u3;
                        end;
                        v204.BackgroundColor3 = v205;
                        local v206 = u47;
                        local v207;
                        if u8 == "PlayerBlobsEaten" then
                            v207 = u2;
                        else
                            v207 = u3;
                        end;
                        v206.BackgroundColor3 = v207;
                        local v208 = u53;
                        local v209;
                        if u8 == "Mode" then
                            v209 = u2;
                        else
                            v209 = u3;
                        end;
                        v208.BackgroundColor3 = v209;
                        local v210 = u8;
                        for v211, v212 in pairs(u68) do
                            v212.Visible = v211 == v210;
                        end;
                        local v213 = u84(u8);
                        u58.Text = tostring(v213.PlayerScoreText or "Your score: loading...");
                        u56.Text = tostring(v213.ModeLabelText or "Select a mode to see its best size board.");
                        u69.Text = tostring(v213.StatusText or "");
                    end;
                end;
                u157 = function(u215, p216) --[[ Line: 598 ]]
                    -- upvalues: u156 (copy), u84 (copy), u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u58 (copy), u56 (copy), u69 (copy), u11 (copy), u88 (copy), u214 (copy), l__GetPublicHiscores__6 (copy)
                    local u217, u218 = u156(u215);
                    local v219 = u84(u215);
                    local v220 = v219.RequestKey == u218;
                    if p216 or (v219.Loaded ~= true or (not v220 or v219.HasPlayerValue ~= true)) then
                        if v219.Loading == true and v220 then
                            if u8 == u215 then
                                local v221 = u35;
                                local v222;
                                if u8 == "Level" then
                                    v222 = u2;
                                else
                                    v222 = u3;
                                end;
                                v221.BackgroundColor3 = v222;
                                local v223 = u41;
                                local v224;
                                if u8 == "PlayerKills" then
                                    v224 = u2;
                                else
                                    v224 = u3;
                                end;
                                v223.BackgroundColor3 = v224;
                                local v225 = u47;
                                local v226;
                                if u8 == "PlayerBlobsEaten" then
                                    v226 = u2;
                                else
                                    v226 = u3;
                                end;
                                v225.BackgroundColor3 = v226;
                                local v227 = u53;
                                local v228;
                                if u8 == "Mode" then
                                    v228 = u2;
                                else
                                    v228 = u3;
                                end;
                                v227.BackgroundColor3 = v228;
                                local v229 = u8;
                                for v230, v231 in pairs(u68) do
                                    v231.Visible = v230 == v229;
                                end;
                                local v232 = u84(u8);
                                u58.Text = tostring(v232.PlayerScoreText or "Your score: loading...");
                                u56.Text = tostring(v232.ModeLabelText or "Select a mode to see its best size board.");
                                u69.Text = tostring(v232.StatusText or "");
                            end;
                        else
                            if v220 then
                                if v219.Loaded ~= true then
                                    v219.StatusText = "Loading...";
                                    v219.PlayerScoreText = "Your score: loading...";
                                    v219.HasPlayerValue = false;
                                    v219.ModeLabelText = u215 == "Mode" and "Mode best size: loading..." or "Top 20 public players by " .. (u11[u215] or string.lower(u215)) .. ".";
                                end;
                            else
                                v219.Loaded = false;
                                v219.PlayerScoreText = "Your score: loading...";
                                v219.HasPlayerValue = false;
                                v219.StatusText = "Loading...";
                                v219.ModeLabelText = u215 == "Mode" and "Mode best size: loading..." or "Top 20 public players by " .. (u11[u215] or string.lower(u215)) .. ".";
                                u88(u215);
                            end;
                            v219.RequestKey = u218;
                            v219.Loading = true;
                            if u8 == u215 then
                                local v233 = u35;
                                local v234;
                                if u8 == "Level" then
                                    v234 = u2;
                                else
                                    v234 = u3;
                                end;
                                v233.BackgroundColor3 = v234;
                                local v235 = u41;
                                local v236;
                                if u8 == "PlayerKills" then
                                    v236 = u2;
                                else
                                    v236 = u3;
                                end;
                                v235.BackgroundColor3 = v236;
                                local v237 = u47;
                                local v238;
                                if u8 == "PlayerBlobsEaten" then
                                    v238 = u2;
                                else
                                    v238 = u3;
                                end;
                                v237.BackgroundColor3 = v238;
                                local v239 = u53;
                                local v240;
                                if u8 == "Mode" then
                                    v240 = u2;
                                else
                                    v240 = u3;
                                end;
                                v239.BackgroundColor3 = v240;
                                local v241 = u8;
                                for v242, v243 in pairs(u68) do
                                    v243.Visible = v242 == v241;
                                end;
                                local v244 = u84(u8);
                                u58.Text = tostring(v244.PlayerScoreText or "Your score: loading...");
                                u56.Text = tostring(v244.ModeLabelText or "Select a mode to see its best size board.");
                                u69.Text = tostring(v244.StatusText or "");
                            end;
                            task.spawn(function() --[[ Line: 635 ]]
                                -- upvalues: u214 (ref), u215 (copy), u218 (copy), u217 (copy), l__GetPublicHiscores__6 (ref)
                                local v245 = u214;
                                local v246 = u215;
                                local v247 = u218;
                                local u248 = u217;
                                local v249, v250 = pcall(function() --[[ Line: 391 ]]
                                    -- upvalues: l__GetPublicHiscores__6 (ref), u248 (copy)
                                    return l__GetPublicHiscores__6:InvokeServer(u248);
                                end);
                                if not v249 or type(v250) ~= "table" then
                                    v250 = nil;
                                end;
                                v245(v246, v247, v250);
                            end);
                        end;
                    else
                        if u8 == u215 then
                            local v251 = u35;
                            local v252;
                            if u8 == "Level" then
                                v252 = u2;
                            else
                                v252 = u3;
                            end;
                            v251.BackgroundColor3 = v252;
                            local v253 = u41;
                            local v254;
                            if u8 == "PlayerKills" then
                                v254 = u2;
                            else
                                v254 = u3;
                            end;
                            v253.BackgroundColor3 = v254;
                            local v255 = u47;
                            local v256;
                            if u8 == "PlayerBlobsEaten" then
                                v256 = u2;
                            else
                                v256 = u3;
                            end;
                            v255.BackgroundColor3 = v256;
                            local v257 = u53;
                            local v258;
                            if u8 == "Mode" then
                                v258 = u2;
                            else
                                v258 = u3;
                            end;
                            v257.BackgroundColor3 = v258;
                            local v259 = u8;
                            for v260, v261 in pairs(u68) do
                                v261.Visible = v260 == v259;
                            end;
                            local v262 = u84(u8);
                            u58.Text = tostring(v262.PlayerScoreText or "Your score: loading...");
                            u56.Text = tostring(v262.ModeLabelText or "Select a mode to see its best size board.");
                            u69.Text = tostring(v262.StatusText or "");
                        end;
                    end;
                end;
                u35.MouseButton1Click:Connect(function() --[[ Line: 659 ]]
                    -- upvalues: u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u84 (copy), u58 (copy), u56 (copy), u69 (copy), u157 (ref)
                    u8 = "Level";
                    local v263 = u35;
                    local v264;
                    if u8 == "Level" then
                        v264 = u2;
                    else
                        v264 = u3;
                    end;
                    v263.BackgroundColor3 = v264;
                    local v265 = u41;
                    local v266;
                    if u8 == "PlayerKills" then
                        v266 = u2;
                    else
                        v266 = u3;
                    end;
                    v265.BackgroundColor3 = v266;
                    local v267 = u47;
                    local v268;
                    if u8 == "PlayerBlobsEaten" then
                        v268 = u2;
                    else
                        v268 = u3;
                    end;
                    v267.BackgroundColor3 = v268;
                    local v269 = u53;
                    local v270;
                    if u8 == "Mode" then
                        v270 = u2;
                    else
                        v270 = u3;
                    end;
                    v269.BackgroundColor3 = v270;
                    local v271 = u8;
                    for v272, v273 in pairs(u68) do
                        v273.Visible = v272 == v271;
                    end;
                    local v274 = u84(u8);
                    u58.Text = tostring(v274.PlayerScoreText or "Your score: loading...");
                    u56.Text = tostring(v274.ModeLabelText or "Select a mode to see its best size board.");
                    u69.Text = tostring(v274.StatusText or "");
                    if u157 then
                        u157(u8, false);
                    end;
                end);
                u41.MouseButton1Click:Connect(function() --[[ Line: 663 ]]
                    -- upvalues: u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u84 (copy), u58 (copy), u56 (copy), u69 (copy), u157 (ref)
                    u8 = "PlayerKills";
                    local v275 = u35;
                    local v276;
                    if u8 == "Level" then
                        v276 = u2;
                    else
                        v276 = u3;
                    end;
                    v275.BackgroundColor3 = v276;
                    local v277 = u41;
                    local v278;
                    if u8 == "PlayerKills" then
                        v278 = u2;
                    else
                        v278 = u3;
                    end;
                    v277.BackgroundColor3 = v278;
                    local v279 = u47;
                    local v280;
                    if u8 == "PlayerBlobsEaten" then
                        v280 = u2;
                    else
                        v280 = u3;
                    end;
                    v279.BackgroundColor3 = v280;
                    local v281 = u53;
                    local v282;
                    if u8 == "Mode" then
                        v282 = u2;
                    else
                        v282 = u3;
                    end;
                    v281.BackgroundColor3 = v282;
                    local v283 = u8;
                    for v284, v285 in pairs(u68) do
                        v285.Visible = v284 == v283;
                    end;
                    local v286 = u84(u8);
                    u58.Text = tostring(v286.PlayerScoreText or "Your score: loading...");
                    u56.Text = tostring(v286.ModeLabelText or "Select a mode to see its best size board.");
                    u69.Text = tostring(v286.StatusText or "");
                    if u157 then
                        u157(u8, false);
                    end;
                end);
                u47.MouseButton1Click:Connect(function() --[[ Line: 667 ]]
                    -- upvalues: u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u84 (copy), u58 (copy), u56 (copy), u69 (copy), u157 (ref)
                    u8 = "PlayerBlobsEaten";
                    local v287 = u35;
                    local v288;
                    if u8 == "Level" then
                        v288 = u2;
                    else
                        v288 = u3;
                    end;
                    v287.BackgroundColor3 = v288;
                    local v289 = u41;
                    local v290;
                    if u8 == "PlayerKills" then
                        v290 = u2;
                    else
                        v290 = u3;
                    end;
                    v289.BackgroundColor3 = v290;
                    local v291 = u47;
                    local v292;
                    if u8 == "PlayerBlobsEaten" then
                        v292 = u2;
                    else
                        v292 = u3;
                    end;
                    v291.BackgroundColor3 = v292;
                    local v293 = u53;
                    local v294;
                    if u8 == "Mode" then
                        v294 = u2;
                    else
                        v294 = u3;
                    end;
                    v293.BackgroundColor3 = v294;
                    local v295 = u8;
                    for v296, v297 in pairs(u68) do
                        v297.Visible = v296 == v295;
                    end;
                    local v298 = u84(u8);
                    u58.Text = tostring(v298.PlayerScoreText or "Your score: loading...");
                    u56.Text = tostring(v298.ModeLabelText or "Select a mode to see its best size board.");
                    u69.Text = tostring(v298.StatusText or "");
                    if u157 then
                        u157(u8, false);
                    end;
                end);
                u53.MouseButton1Click:Connect(function() --[[ Line: 671 ]]
                    -- upvalues: u8 (ref), u35 (copy), u2 (copy), u3 (copy), u41 (copy), u47 (copy), u53 (copy), u68 (copy), u84 (copy), u58 (copy), u56 (copy), u69 (copy), u157 (ref)
                    u8 = "Mode";
                    local v299 = u35;
                    local v300;
                    if u8 == "Level" then
                        v300 = u2;
                    else
                        v300 = u3;
                    end;
                    v299.BackgroundColor3 = v300;
                    local v301 = u41;
                    local v302;
                    if u8 == "PlayerKills" then
                        v302 = u2;
                    else
                        v302 = u3;
                    end;
                    v301.BackgroundColor3 = v302;
                    local v303 = u47;
                    local v304;
                    if u8 == "PlayerBlobsEaten" then
                        v304 = u2;
                    else
                        v304 = u3;
                    end;
                    v303.BackgroundColor3 = v304;
                    local v305 = u53;
                    local v306;
                    if u8 == "Mode" then
                        v306 = u2;
                    else
                        v306 = u3;
                    end;
                    v305.BackgroundColor3 = v306;
                    local v307 = u8;
                    for v308, v309 in pairs(u68) do
                        v309.Visible = v308 == v307;
                    end;
                    local v310 = u84(u8);
                    u58.Text = tostring(v310.PlayerScoreText or "Your score: loading...");
                    u56.Text = tostring(v310.ModeLabelText or "Select a mode to see its best size board.");
                    u69.Text = tostring(v310.StatusText or "");
                    if u157 then
                        u157(u8, false);
                    end;
                end);
                u77.MouseButton1Click:Connect(function() --[[ Line: 675 ]]
                    -- upvalues: u9 (ref), l__GetPublicHiscores__6 (copy), u77 (copy), u69 (copy), u157 (ref), u8 (ref)
                    local u311 = {
                        Action = "SetHidden",
                        Hidden = not u9
                    };
                    local v312, v313 = pcall(function() --[[ Line: 391 ]]
                        -- upvalues: l__GetPublicHiscores__6 (ref), u311 (copy)
                        return l__GetPublicHiscores__6:InvokeServer(u311);
                    end);
                    if not v312 or type(v313) ~= "table" then
                        v313 = nil;
                    end;
                    if v313 and v313.Ok then
                        u9 = v313.Hidden == true;
                        u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                        local v314 = u77;
                        local v315;
                        if u9 then
                            v315 = Color3.fromRGB(130, 64, 54);
                        else
                            v315 = Color3.fromRGB(58, 112, 76);
                        end;
                        v314.BackgroundColor3 = v315;
                        u69.Text = tostring(v313.Message or "Settings saved.");
                        if u157 then
                            u157(u8, true);
                        end;
                    else
                        u69.Text = v313 and v313.Message or "Settings are not ready.";
                    end;
                end);
                local u316 = 0;
                u26:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 701 ]]
                    -- upvalues: u26 (copy), u316 (ref), u129 (copy), u8 (ref), l__GetPublicHiscores__6 (copy), u9 (ref), u77 (copy), u157 (ref)
                    if u26.Visible then
                        u316 = u316 + 1;
                        local u317 = u316;
                        local u318 = false;
                        task.defer(function() --[[ Line: 691 ]]
                            -- upvalues: u317 (copy), u316 (ref), u26 (ref), u129 (ref), u8 (ref), l__GetPublicHiscores__6 (ref), u9 (ref), u77 (ref), u318 (copy), u157 (ref)
                            if u317 == u316 and u26.Visible then
                                local v319 = u129();
                                if v319.ModeId ~= nil and tostring(v319.ModeId) ~= "" then
                                    u8 = "Mode";
                                end;
                                local u320 = {
                                    Action = "GetSettings"
                                };
                                local v321, v322 = pcall(function() --[[ Line: 391 ]]
                                    -- upvalues: l__GetPublicHiscores__6 (ref), u320 (copy)
                                    return l__GetPublicHiscores__6:InvokeServer(u320);
                                end);
                                if not v321 or type(v322) ~= "table" then
                                    v322 = nil;
                                end;
                                if v322 and v322.Ok then
                                    u9 = v322.Hidden == true;
                                    u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                                    local v323 = u77;
                                    local v324;
                                    if u9 then
                                        v324 = Color3.fromRGB(130, 64, 54);
                                    else
                                        v324 = Color3.fromRGB(58, 112, 76);
                                    end;
                                    v323.BackgroundColor3 = v324;
                                end;
                                local v325 = u318 == true;
                                if u157 then
                                    u157(u8, v325);
                                end;
                            end;
                        end);
                    end;
                end);
                if l__Select__11 then
                    local v326 = l__Select__11:FindFirstChild("Hiscores");
                    if v326 and v326:IsA("TextButton") then
                        v326.MouseButton1Click:Connect(function() --[[ Line: 710 ]]
                            -- upvalues: u316 (ref), u26 (copy), u129 (copy), u8 (ref), l__GetPublicHiscores__6 (copy), u9 (ref), u77 (copy), u157 (ref)
                            u316 = u316 + 1;
                            local u327 = u316;
                            local u328 = false;
                            task.defer(function() --[[ Line: 691 ]]
                                -- upvalues: u327 (copy), u316 (ref), u26 (ref), u129 (ref), u8 (ref), l__GetPublicHiscores__6 (ref), u9 (ref), u77 (ref), u328 (copy), u157 (ref)
                                if u327 == u316 and u26.Visible then
                                    local v329 = u129();
                                    if v329.ModeId ~= nil and tostring(v329.ModeId) ~= "" then
                                        u8 = "Mode";
                                    end;
                                    local u330 = {
                                        Action = "GetSettings"
                                    };
                                    local v331, v332 = pcall(function() --[[ Line: 391 ]]
                                        -- upvalues: l__GetPublicHiscores__6 (ref), u330 (copy)
                                        return l__GetPublicHiscores__6:InvokeServer(u330);
                                    end);
                                    if not v331 or type(v332) ~= "table" then
                                        v332 = nil;
                                    end;
                                    if v332 and v332.Ok then
                                        u9 = v332.Hidden == true;
                                        u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                                        local v333 = u77;
                                        local v334;
                                        if u9 then
                                            v334 = Color3.fromRGB(130, 64, 54);
                                        else
                                            v334 = Color3.fromRGB(58, 112, 76);
                                        end;
                                        v333.BackgroundColor3 = v334;
                                    end;
                                    local v335 = u328 == true;
                                    if u157 then
                                        u157(u8, v335);
                                    end;
                                end;
                            end);
                        end);
                    end;
                    local v336 = l__Select__11:FindFirstChild("Settings");
                    if v336 and v336:IsA("TextButton") then
                        v336.MouseButton1Click:Connect(function() --[[ Line: 717 ]]
                            -- upvalues: u135 (copy)
                            task.defer(u135);
                        end);
                    end;
                end;
                local function v337() --[[ Line: 723 ]]
                    -- upvalues: u8 (ref), u26 (copy), u157 (ref)
                    if u8 == "Mode" and (u26.Visible and u157) then
                        u157(u8, false);
                    end;
                end;
                l__Right__10:GetAttributeChangedSignal("SelectedModeId"):Connect(v337);
                l__Right__10:GetAttributeChangedSignal("SelectedModeType"):Connect(v337);
                l__Right__10:GetAttributeChangedSignal("SelectedModeName"):Connect(v337);
                if l__PublicHiscoresUpdated__7 then
                    l__PublicHiscoresUpdated__7.OnClientEvent:Connect(function(p338) --[[ Line: 734 ]]
                        -- upvalues: u68 (copy), u84 (copy), u214 (copy)
                        if type(p338) == "table" and p338.Action == "BoardUpdated" then
                            local v339 = tostring(p338.Board or "");
                            if u68[v339] then
                                local l__Result__14 = p338.Result;
                                if type(l__Result__14) == "table" then
                                    local v340 = tostring(p338.RequestKey or v339);
                                    local v341 = u84(v339);
                                    if v341.RequestKey == "" or v341.RequestKey == v340 then
                                        v341.RequestKey = v340;
                                        v341.Loading = false;
                                        u214(v339, v340, l__Result__14);
                                    end;
                                end;
                            end;
                        end;
                    end);
                end;
                local v342;
                if u8 == "Level" then
                    v342 = u2;
                else
                    v342 = u3;
                end;
                u35.BackgroundColor3 = v342;
                local v343;
                if u8 == "PlayerKills" then
                    v343 = u2;
                else
                    v343 = u3;
                end;
                u41.BackgroundColor3 = v343;
                local v344;
                if u8 == "PlayerBlobsEaten" then
                    v344 = u2;
                else
                    v344 = u3;
                end;
                u47.BackgroundColor3 = v344;
                if u8 == "Mode" then
                    u3 = u2;
                end;
                u53.BackgroundColor3 = u3;
                u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                local v345;
                if u9 then
                    v345 = Color3.fromRGB(130, 64, 54);
                else
                    v345 = Color3.fromRGB(58, 112, 76);
                end;
                u77.BackgroundColor3 = v345;
                if u26.Visible then
                    u316 = u316 + 1;
                    local u346 = u316;
                    local u347 = true;
                    task.defer(function() --[[ Line: 691 ]]
                        -- upvalues: u346 (copy), u316 (ref), u26 (copy), u129 (copy), u8 (ref), l__GetPublicHiscores__6 (copy), u9 (ref), u77 (copy), u347 (copy), u157 (ref)
                        if u346 == u316 and u26.Visible then
                            local v348 = u129();
                            if v348.ModeId ~= nil and tostring(v348.ModeId) ~= "" then
                                u8 = "Mode";
                            end;
                            local u349 = {
                                Action = "GetSettings"
                            };
                            local v350, v351 = pcall(function() --[[ Line: 391 ]]
                                -- upvalues: l__GetPublicHiscores__6 (ref), u349 (copy)
                                return l__GetPublicHiscores__6:InvokeServer(u349);
                            end);
                            if not v350 or type(v351) ~= "table" then
                                v351 = nil;
                            end;
                            if v351 and v351.Ok then
                                u9 = v351.Hidden == true;
                                u77.Text = u9 and "Public hiscores: Hidden" or "Public hiscores: Visible";
                                local v352 = u77;
                                local v353;
                                if u9 then
                                    v353 = Color3.fromRGB(130, 64, 54);
                                else
                                    v353 = Color3.fromRGB(58, 112, 76);
                                end;
                                v352.BackgroundColor3 = v353;
                            end;
                            local v354 = u347 == true;
                            if u157 then
                                u157(u8, v354);
                            end;
                        end;
                    end);
                end;
            end;
        end;
    end;
else
    warn("[HiscoresClient] GetPublicHiscores remote is missing.");
end;