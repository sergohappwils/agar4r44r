-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.GeneratedUI.GeneratedGuiRuntime

-- Decompiled with Potassium's decompiler.

local v1 = {};
local function u8(u2, p3) --[[ Line: 5 ]]
    if type(p3) == "table" then
        for u4, u5 in pairs(p3) do
            local v6, v7 = pcall(function() --[[ Line: 11 ]]
                -- upvalues: u2 (copy), u4 (copy), u5 (copy)
                u2[u4] = u5;
            end);
            if not v6 then
                warn(string.format("[GeneratedGuiRuntime] Could not set %s.%s: %s", u2:GetFullName(), u4, (tostring(v7))));
            end;
        end;
    end;
end;
local function u13(u9, p10) --[[ Line: 20 ]]
    if type(p10) == "table" then
        for u11, u12 in pairs(p10) do
            pcall(function() --[[ Line: 26 ]]
                -- upvalues: u9 (copy), u11 (copy), u12 (copy)
                u9:SetAttribute(u11, u12);
            end);
        end;
    end;
end;
local function u20(p14, p15) --[[ Line: 32 ]]
    -- upvalues: u8 (copy), u13 (copy), u20 (copy)
    local u16 = tostring(p14.ClassName or "Folder");
    local v17, v18 = pcall(function() --[[ Line: 34 ]]
        -- upvalues: u16 (copy)
        return Instance.new(u16);
    end);
    if not (v17 and v18) then
        warn("[GeneratedGuiRuntime] Could not create " .. u16);
        return nil;
    end;
    v18.Name = tostring(p14.Name or u16);
    u8(v18, p14.Properties);
    u13(v18, p14.Attributes);
    v18.Parent = p15;
    local l__Children__1 = p14.Children;
    if type(l__Children__1) == "table" then
        for _, v19 in ipairs(l__Children__1) do
            if type(v19) == "table" then
                u20(v19, v18);
            end;
        end;
    end;
    return v18;
end;
function v1.Build(p21, p22, p23) --[[ Line: 59 ]]
    -- upvalues: u20 (copy)
    if p23 then
        p23 = p23.DestroyExisting == true;
    end;
    local v24 = {};
    for _, v25 in ipairs(p22) do
        local v26 = tostring(v25.Name or "");
        local v27;
        if v26 == "" then
            v27 = u20(v25, p21);
            if v27 then
                table.insert(v24, v27);
            end;
        else
            local v28 = p21:FindFirstChild(v26);
            if v28 and p23 then
                v28:Destroy();
                v27 = u20(v25, p21);
                if v27 then
                    table.insert(v24, v27);
                end;
            end;
            if not v28 then
                v27 = u20(v25, p21);
                if v27 then
                    table.insert(v24, v27);
                end;
            end;
            table.insert(v24, v28);
        end;
    end;
    return v24;
end;
return v1;