-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.ClientIntegrityProbe

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__3 = l__Players__1.LocalPlayer;
local l__Gameplay__4 = l__ReplicatedStorage__2:WaitForChild("Gameplay");
local l__SharedGameplay__5 = require(l__Gameplay__4:WaitForChild("SharedGameplay"));
local l__Network__6 = l__Gameplay__4:WaitForChild("Network");
local l__NetworkNames__7 = l__SharedGameplay__5.NetworkNames;
local u1 = l__Network__6:WaitForChild(l__NetworkNames__7.AntiCheatReport);
local v2 = l__Network__6:WaitForChild(l__NetworkNames__7.AntiCheatChallenge);
local u3 = l__Network__6:WaitForChild(l__NetworkNames__7.AntiCheatResponse);
local u4 = {};
local u5 = {
    "darkdex",
    "dex explorer",
    "infinite yield",
    "remotespy",
    "remote spy",
    "hydroxide",
    "script hub",
    "synapse",
    "krnl",
    "fluxus",
    "executor",
    "cmdbar",
    "iy_admin"
};
local u6 = {
    "getgenv",
    "identifyexecutor",
    "syn",
    "KRNL_LOADED",
    "fluxus",
    "hookfunction",
    "hookmetamethod",
    "getrawmetatable",
    "setreadonly",
    "newcclosure",
    "getconnections",
    "firetouchinterest",
    "getnilinstances",
    "getgc",
    "islclosure",
    "iscclosure",
    "queue_on_teleport",
    "readfile",
    "writefile",
    "isfile"
};
local function u10(p7) --[[ Line: 63 ]]
    local v8 = 5381;
    for v9 = 1, #p7 do
        v8 = (v8 * 33 + string.byte(p7, v9)) % 2147483647;
    end;
    return v8;
end;
local function u13(p11, p12) --[[ Line: 71 ]]
    -- upvalues: u10 (copy), l__LocalPlayer__3 (copy)
    return u10(p12 .. ":" .. tostring(p11) .. ":" .. tostring(l__LocalPlayer__3.UserId) .. ":AgaricIntegrity26");
end;
local function u15(u14) --[[ Line: 75 ]]
    -- upvalues: u1 (copy)
    pcall(function() --[[ Line: 76 ]]
        -- upvalues: u1 (ref), u14 (copy)
        u1:FireServer(u14);
    end);
end;
local function u16() --[[ Line: 81 ]]
    -- upvalues: u15 (copy)
    u15({
        Kind = "Surface",
        Surface = "ClientIntegrity",
        Version = 1
    });
end;
local function u22(p17, p18) --[[ Line: 89 ]]
    -- upvalues: u4 (copy), u15 (copy)
    local v19 = p17 .. ":" .. p18;
    local v20 = os.clock();
    local v21 = u4[v19];
    if v21 and v20 - v21 < 120 then
    else
        u4[v19] = v20;
        u15({
            Kind = "Signal",
            Code = p17,
            Detail = p18
        });
    end;
end;
local function u29(u23) --[[ Line: 104 ]]
    local v27, v28 = pcall(function() --[[ Line: 105 ]]
        -- upvalues: u23 (copy)
        local v24 = getfenv();
        local v25 = rawget(v24, u23);
        if v25 == nil then
            local v26 = rawget(_G, u23);
            if v26 == nil then
                if type(shared) == "table" then
                    return rawget(shared, u23);
                else
                    return nil;
                end;
            else
                return v26;
            end;
        else
            return v25;
        end;
    end);
    if v27 then
        return v28;
    else
        return nil;
    end;
end;
local function u32() --[[ Line: 130 ]]
    -- upvalues: u6 (copy), u29 (copy), u22 (copy)
    for _, v30 in ipairs(u6) do
        local v31 = u29(v30);
        if v31 ~= nil then
            u22("ExecutorGlobal", v30 .. "=" .. typeof(v31));
            return;
        end;
    end;
end;
local function u36(p33) --[[ Line: 140 ]]
    -- upvalues: u5 (copy), u22 (copy)
    local v34 = string.lower(p33.Name);
    for _, v35 in ipairs(u5) do
        if string.find(v34, v35, 1, true) then
            u22("SuspiciousGui", p33:GetFullName());
            return true;
        end;
    end;
    return false;
end;
local function u42(p37) --[[ Line: 151 ]]
    -- upvalues: u36 (copy)
    if p37 then
        local v38 = { p37 };
        local v39 = 0;
        while #v38 > 0 and v39 < 120 do
            local v40 = v38[#v38];
            v38[#v38] = nil;
            v39 = v39 + 1;
            if u36(v40) then
                return;
            end;
            for _, v41 in ipairs(v40:GetChildren()) do
                v38[#v38 + 1] = v41;
            end;
            if v39 % 25 == 0 then
                task.wait();
            end;
        end;
    end;
end;
local function u46() --[[ Line: 177 ]]
    -- upvalues: l__LocalPlayer__3 (copy), u22 (copy)
    local v43 = l__LocalPlayer__3:FindFirstChild("PlayerScripts");
    if v43 then
        local v44 = v43:FindFirstChild("Gameplay");
        local v45 = v43:FindFirstChild("Framework");
        if v44 then
            v44 = v44:FindFirstChild("ClientGameplay");
        end;
        if v45 then
            v45 = v45:FindFirstChild("ClientIntegrityProbe");
        end;
        if v44 then
            if v44:IsA("LocalScript") and v44.Disabled then
                u22("ProtectedScriptDisabled", "ClientGameplay");
            end;
        else
            u22("ProtectedScriptMissing", "ClientGameplay");
        end;
        if v45 then
            if v45:IsA("LocalScript") and v45.Disabled then
                u22("ProtectedScriptDisabled", "ClientIntegrityProbe");
            end;
        else
            u22("ProtectedScriptMissing", "ClientIntegrityProbe");
        end;
    else
        u22("ProtectedScriptMissing", "PlayerScripts");
    end;
end;
local function u47() --[[ Line: 202 ]]
    -- upvalues: u16 (copy), u32 (copy), u46 (copy), u42 (copy), l__LocalPlayer__3 (copy)
    u16();
    u32();
    u46();
    u42(l__LocalPlayer__3:FindFirstChild("PlayerGui"));
    u42(l__LocalPlayer__3:FindFirstChild("PlayerScripts"));
end;
v2.OnClientEvent:Connect(function(p48) --[[ Line: 210 ]]
    -- upvalues: u22 (copy), u13 (copy), u3 (copy)
    if type(p48) == "table" then
        local u49 = tonumber(p48.Id);
        local v50 = tostring(p48.Seed or "");
        if u49 and v50 ~= "" then
            local u51 = u13(u49, v50);
            pcall(function() --[[ Line: 224 ]]
                -- upvalues: u3 (ref), u49 (copy), u51 (copy)
                u3:FireServer(u49, u51, {
                    Surface = "ClientIntegrity"
                });
            end);
        else
            u22("UnexpectedClientState", "bad challenge body");
        end;
    else
        u22("UnexpectedClientState", "bad challenge payload");
    end;
end);
u15({
    Kind = "Hello",
    Surface = "ClientIntegrity",
    Version = 1
});
u16();
task.spawn(function() --[[ Line: 236 ]]
    -- upvalues: u47 (copy), u22 (copy)
    task.wait(2 + math.random());
    while true do
        local v52, v53 = pcall(u47);
        if not v52 then
            u22("IntegrityError", (tostring(v53)));
        end;
        task.wait(35 + math.random() * 20);
    end;
end);