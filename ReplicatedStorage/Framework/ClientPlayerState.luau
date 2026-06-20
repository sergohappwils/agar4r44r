-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.ClientPlayerState

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__3 = l__Players__1.LocalPlayer;
local l__PlayerStateNetwork__4 = l__ReplicatedStorage__2:WaitForChild("Framework"):WaitForChild("PlayerStateNetwork");
local l__GetSnapshot__5 = l__PlayerStateNetwork__4:WaitForChild("GetSnapshot");
local l__StateDelta__6 = l__PlayerStateNetwork__4:WaitForChild("StateDelta");
local u1 = {};
local u2 = {};
local u3 = {};
local u4 = {};
local u5 = {};
local u6 = {};
local u7 = {};
local u8 = {};
local function u13(p9) --[[ Line: 39 ]]
    local v10 = {};
    local l__gmatch__7 = string.gmatch;
    local v11;
    if p9 == nil or (p9 == "" or p9 == "DataStats") then
        v11 = "";
    else
        v11 = tostring(p9);
        if string.sub(v11, 1, 10) == "DataStats." then
            v11 = string.sub(v11, 11);
        end;
    end;
    for v12 in l__gmatch__7(v11, "[^%.]+") do
        if v12 ~= "" then
            table.insert(v10, v12);
        end;
    end;
    return v10;
end;
local function u15(p14) --[[ Line: 49 ]]
    return {
        _ClassName = p14 or "Folder",
        _Attributes = {},
        _Children = {}
    };
end;
local function u21(p16, p17, p18) --[[ Line: 68 ]]
    -- upvalues: u13 (copy), u15 (copy)
    if not p16 then
        return nil;
    end;
    for _, v19 in ipairs((u13(p17))) do
        local v20 = p16._Children[v19];
        if not v20 then
            if not p18 then
                return nil;
            end;
            v20 = u15("Folder");
            p16._Children[v19] = v20;
        end;
        p16 = v20;
    end;
    return p16;
end;
local function u26(p22) --[[ Line: 88 ]]
    local v23 = {};
    for v24, v25 in pairs(p22 or {}) do
        v23[v24] = v25;
    end;
    return v23;
end;
local function u36(p27, p28, p29) --[[ Line: 96 ]]
    -- upvalues: u5 (copy)
    local v30 = tostring(p27);
    local v31 = ":";
    local v32;
    if p28 == nil or (p28 == "" or p28 == "DataStats") then
        v32 = "";
    else
        v32 = tostring(p28);
        if string.sub(v32, 1, 10) == "DataStats." then
            v32 = string.sub(v32, 11);
        end;
    end;
    local v33 = v30 .. v31 .. v32;
    local v34 = u5[v33];
    if not v34 then
        v34 = {};
        u5[v33] = v34;
    end;
    local v35 = v34[p29];
    if not v35 then
        v35 = Instance.new("BindableEvent");
        v34[p29] = v35;
    end;
    return v35.Event;
end;
local function u53(p37, p38, p39) --[[ Line: 137 ]]
    -- upvalues: u8 (copy), u5 (copy), u53 (copy)
    local v40 = tostring(p37);
    local v41 = ":";
    local v42;
    if p38 == nil or (p38 == "" or p38 == "DataStats") then
        v42 = "";
    else
        v42 = tostring(p38);
        if string.sub(v42, 1, 10) == "DataStats." then
            v42 = string.sub(v42, 11);
        end;
    end;
    local v43 = u8[v40 .. v41 .. v42];
    if v43 then
        v43:Fire(nil);
    end;
    for v44 in pairs(p39._Attributes or {}) do
        local v45 = tostring(p37);
        local v46 = ":";
        local v47;
        if p38 == nil or (p38 == "" or p38 == "DataStats") then
            v47 = "";
        else
            v47 = tostring(p38);
            if string.sub(v47, 1, 10) == "DataStats." then
                v47 = string.sub(v47, 11);
            end;
        end;
        local v48 = v45 .. v46 .. v47;
        local v49 = u8[v48];
        if v49 then
            v49:Fire(v44);
        end;
        if v44 then
            local v50 = u5[v48];
            if v50 then
                v50 = v50[v44];
            end;
            if v50 then
                v50:Fire();
            end;
        end;
    end;
    for v51, v52 in pairs(p39._Children or {}) do
        u53(p37, p38 == "" and v51 and v51 or p38 .. "." .. v51, v52);
    end;
end;
local function u114(u54, p55) --[[ Line: 148 ]]
    -- upvalues: u3 (copy), u8 (copy), u6 (copy), u7 (copy), u2 (copy), u13 (copy), u26 (copy), u15 (copy), u21 (copy), u5 (copy), u36 (copy), u114 (copy)
    local u56;
    if p55 == nil or (p55 == "" or p55 == "DataStats") then
        u56 = "";
    else
        u56 = tostring(p55);
        if string.sub(u56, 1, 10) == "DataStats." then
            u56 = string.sub(u56, 11);
        end;
    end;
    local v57 = tostring(u54);
    local v58 = ":";
    local v59;
    if u56 == nil or (u56 == "" or u56 == "DataStats") then
        v59 = "";
    else
        v59 = tostring(u56);
        if string.sub(v59, 1, 10) == "DataStats." then
            v59 = string.sub(v59, 11);
        end;
    end;
    local v60 = v57 .. v58 .. v59;
    if u3[v60] then
        return u3[v60];
    end;
    local v61 = {
        Name = u56 == "" and "DataStats" or (string.match(u56, "[^%.]+$") or u56),
        ClassName = "Configuration"
    };
    local v62 = u8;
    local v63 = tostring(u54);
    local v64 = ":";
    local v65;
    if u56 == nil or (u56 == "" or u56 == "DataStats") then
        v65 = "";
    else
        v65 = tostring(u56);
        if string.sub(v65, 1, 10) == "DataStats." then
            v65 = string.sub(v65, 11);
        end;
    end;
    local v66 = v63 .. v64 .. v65;
    local v67 = v62[v66];
    if not v67 then
        v67 = Instance.new("BindableEvent");
        v62[v66] = v67;
    end;
    v61.AttributeChanged = v67.Event;
    local v68 = u6;
    local v69 = tostring(u54);
    local v70 = ":";
    local v71;
    if u56 == nil or (u56 == "" or u56 == "DataStats") then
        v71 = "";
    else
        v71 = tostring(u56);
        if string.sub(v71, 1, 10) == "DataStats." then
            v71 = string.sub(v71, 11);
        end;
    end;
    local v72 = v69 .. v70 .. v71;
    local v73 = v68[v72];
    if not v73 then
        v73 = Instance.new("BindableEvent");
        v68[v72] = v73;
    end;
    v61.ChildAdded = v73.Event;
    local v74 = u7;
    local v75 = tostring(u54);
    local v76 = ":";
    local v77;
    if u56 == nil or (u56 == "" or u56 == "DataStats") then
        v77 = "";
    else
        v77 = tostring(u56);
        if string.sub(v77, 1, 10) == "DataStats." then
            v77 = string.sub(v77, 11);
        end;
    end;
    local v78 = v75 .. v76 .. v77;
    local v79 = v74[v78];
    if not v79 then
        v79 = Instance.new("BindableEvent");
        v74[v78] = v79;
    end;
    v61.ChildRemoved = v79.Event;
    function v61.GetAttribute(_, p80) --[[ Line: 162 ]]
        -- upvalues: u2 (ref), u54 (copy), u56 (copy), u13 (ref)
        local v81 = u2[u54];
        local v82 = u56;
        if v81 then
            for _, v83 in ipairs((u13(v82))) do
                v81 = v81._Children[v83];
                if not v81 then
                    v81 = nil;
                    break;
                end;
            end;
        else
            v81 = nil;
        end;
        return v81 and v81._Attributes[p80] or nil;
    end;
    function v61.GetAttributes(_) --[[ Line: 168 ]]
        -- upvalues: u2 (ref), u54 (copy), u56 (copy), u13 (ref), u26 (ref)
        local v84 = u2[u54];
        local v85 = u56;
        if v84 then
            for _, v86 in ipairs((u13(v85))) do
                v84 = v84._Children[v86];
                if not v84 then
                    v84 = nil;
                    break;
                end;
            end;
        else
            v84 = nil;
        end;
        return v84 and u26(v84._Attributes) or {};
    end;
    function v61.SetAttribute(_, p87, p88) --[[ Line: 174 ]]
        -- upvalues: u2 (ref), u54 (copy), u15 (ref), u21 (ref), u56 (copy), u8 (ref), u5 (ref)
        local v89 = u2[u54];
        if not v89 then
            v89 = u15("Folder");
            u2[u54] = v89;
        end;
        local v90 = u21(v89, u56, true);
        if v90 and v90._Attributes[p87] ~= p88 then
            v90._Attributes[p87] = p88;
            local v91 = u56;
            local v92 = tostring(u54);
            local v93 = ":";
            local v94;
            if v91 == nil or (v91 == "" or v91 == "DataStats") then
                v94 = "";
            else
                v94 = tostring(v91);
                if string.sub(v94, 1, 10) == "DataStats." then
                    v94 = string.sub(v94, 11);
                end;
            end;
            local v95 = v92 .. v93 .. v94;
            local v96 = u8[v95];
            if v96 then
                v96:Fire(p87);
            end;
            if p87 then
                local v97 = u5[v95];
                if v97 then
                    v97 = v97[p87];
                end;
                if v97 then
                    v97:Fire();
                end;
            end;
        end;
    end;
    function v61.GetAttributeChangedSignal(_, p98) --[[ Line: 187 ]]
        -- upvalues: u36 (ref), u54 (copy), u56 (copy)
        return u36(u54, u56, p98);
    end;
    function v61.FindFirstChild(_, p99) --[[ Line: 191 ]]
        -- upvalues: u56 (copy), u2 (ref), u54 (copy), u13 (ref), u114 (ref)
        local v100 = u56 == "" and p99 and p99 or u56 .. "." .. p99;
        local v101 = u2[u54];
        if v101 then
            for _, v102 in ipairs((u13(v100))) do
                v101 = v101._Children[v102];
                if not v101 then
                    v101 = nil;
                    break;
                end;
            end;
        else
            v101 = nil;
        end;
        if v101 then
            return u114(u54, v100);
        else
            return nil;
        end;
    end;
    function v61.WaitForChild(p103, p104, p105) --[[ Line: 201 ]]
        local v106 = os.clock();
        local v107;
        while true do
            v107 = p103:FindFirstChild(p104);
            if v107 then
                break;
            end;
            task.wait(0.05);
            if p105 and p105 <= os.clock() - v106 then
                return nil;
            end;
        end;
        return v107;
    end;
    function v61.GetChildren(_) --[[ Line: 213 ]]
        -- upvalues: u2 (ref), u54 (copy), u56 (copy), u13 (ref), u114 (ref)
        local v108 = u2[u54];
        local v109 = u56;
        if v108 then
            for _, v110 in ipairs((u13(v109))) do
                v108 = v108._Children[v110];
                if not v108 then
                    v108 = nil;
                    break;
                end;
            end;
        else
            v108 = nil;
        end;
        local v111 = {};
        if v108 then
            for v112 in pairs(v108._Children) do
                table.insert(v111, u114(u54, u56 == "" and v112 and v112 or u56 .. "." .. v112));
            end;
        end;
        return v111;
    end;
    function v61.IsA(_, p113) --[[ Line: 225 ]]
        return (p113 == "Configuration" or p113 == "Folder") and true or p113 == "Instance";
    end;
    u3[v60] = v61;
    return v61;
end;
function u1.Refresh(p115) --[[ Line: 294 ]]
    -- upvalues: l__LocalPlayer__3 (copy), l__GetSnapshot__5 (copy), u2 (copy), u53 (copy)
    local u116;
    if typeof(p115) == "Instance" and p115:IsA("Player") then
        u116 = p115.UserId;
    else
        u116 = tonumber(p115) or l__LocalPlayer__3 and l__LocalPlayer__3.UserId or 0;
    end;
    local v117, v118 = pcall(function() --[[ Line: 296 ]]
        -- upvalues: l__GetSnapshot__5 (ref), u116 (copy)
        return l__GetSnapshot__5:InvokeServer(u116);
    end);
    if not v117 or type(v118) ~= "table" then
        return false;
    end;
    if type(v118) == "table" then
        u2[u116] = v118;
        u53(u116, "", v118);
    end;
    return true;
end;
function u1.GetProxy(p119, p120) --[[ Line: 317 ]]
    -- upvalues: l__LocalPlayer__3 (copy), u2 (copy), u4 (copy), u1 (copy), u114 (copy)
    local u121;
    if typeof(p120) == "Instance" and p120:IsA("Player") then
        u121 = p120.UserId;
    else
        u121 = tonumber(p120) or (l__LocalPlayer__3 and l__LocalPlayer__3.UserId or 0);
    end;
    if not (u2[u121] or u4[u121]) then
        u4[u121] = true;
        task.defer(function() --[[ Line: 311 ]]
            -- upvalues: u1 (ref), u121 (copy), u4 (ref)
            u1.Refresh(u121);
            u4[u121] = nil;
        end);
    end;
    local v122 = u114;
    local v123;
    if p119 == nil or (p119 == "" or p119 == "DataStats") then
        v123 = "";
    else
        v123 = tostring(p119);
        if string.sub(v123, 1, 10) == "DataStats." then
            v123 = string.sub(v123, 11);
        end;
    end;
    return v122(u121, v123);
end;
function u1.HasSnapshot(p124) --[[ Line: 323 ]]
    -- upvalues: u2 (copy), l__LocalPlayer__3 (copy)
    local v125 = u2;
    local v126;
    if typeof(p124) == "Instance" and p124:IsA("Player") then
        v126 = p124.UserId;
    else
        v126 = tonumber(p124) or (l__LocalPlayer__3 and l__LocalPlayer__3.UserId or 0);
    end;
    return v125[v126] ~= nil;
end;
function u1.WaitForProxy(p127, p128, p129) --[[ Line: 327 ]]
    -- upvalues: l__LocalPlayer__3 (copy), u2 (copy), u4 (copy), u1 (copy), u13 (copy), u114 (copy)
    local u130;
    if typeof(p128) == "Instance" and p128:IsA("Player") then
        u130 = p128.UserId;
    else
        u130 = tonumber(p128) or (l__LocalPlayer__3 and l__LocalPlayer__3.UserId or 0);
    end;
    local v131 = os.clock();
    if not (u2[u130] or u4[u130]) then
        u4[u130] = true;
        task.defer(function() --[[ Line: 311 ]]
            -- upvalues: u1 (ref), u130 (copy), u4 (ref)
            u1.Refresh(u130);
            u4[u130] = nil;
        end);
    end;
    while true do
        local v132 = u2[u130];
        if v132 then
            for _, v133 in ipairs((u13(p127))) do
                v132 = v132._Children[v133];
                if not v132 then
                    v132 = nil;
                end;
            end;
        else
            v132 = nil;
        end;
        if v132 then
            local v134 = u114;
            local v135;
            if p127 == nil or (p127 == "" or p127 == "DataStats") then
                v135 = "";
            else
                v135 = tostring(p127);
                if string.sub(v135, 1, 10) == "DataStats." then
                    v135 = string.sub(v135, 11);
                end;
            end;
            return v134(u130, v135);
        end;
        task.wait(0.05);
        if p129 and p129 <= os.clock() - v131 then
            return nil;
        end;
    end;
end;
function u1.GetAttribute(p136, p137, p138) --[[ Line: 341 ]]
    -- upvalues: u1 (copy)
    return u1.GetProxy(p136, p138):GetAttribute(p137);
end;
function u1.OnChanged(p139, p140, p141) --[[ Line: 346 ]]
    -- upvalues: l__LocalPlayer__3 (copy), u1 (copy)
    local v142;
    if typeof(p141) == "Instance" and p141:IsA("Player") then
        v142 = p141.UserId;
    else
        v142 = tonumber(p141) or (l__LocalPlayer__3 and l__LocalPlayer__3.UserId or 0);
    end;
    return u1.GetProxy(p139, v142).AttributeChanged:Connect(p140);
end;
l__StateDelta__6.OnClientEvent:Connect(function(p143) --[[ Name: applyDelta, Line 241 ]]
    -- upvalues: u2 (copy), u15 (copy), u53 (copy), u21 (copy), u8 (copy), u5 (copy), u6 (copy), u114 (copy), u13 (copy), u7 (copy)
    if type(p143) ~= "table" then
        return;
    end;
    local v144 = tonumber(p143.UserId);
    if not v144 then
        return;
    end;
    if not u2[v144] then
        u2[v144] = u15("Folder");
    end;
    local l__Path__8 = p143.Path;
    local v145;
    if l__Path__8 == nil or (l__Path__8 == "" or l__Path__8 == "DataStats") then
        v145 = "";
    else
        v145 = tostring(l__Path__8);
        if string.sub(v145, 1, 10) == "DataStats." then
            v145 = string.sub(v145, 11);
        end;
    end;
    local l__ParentPath__9 = p143.ParentPath;
    local v146;
    if l__ParentPath__9 == nil or (l__ParentPath__9 == "" or l__ParentPath__9 == "DataStats") then
        v146 = "";
    else
        v146 = tostring(l__ParentPath__9);
        if string.sub(v146, 1, 10) == "DataStats." then
            v146 = string.sub(v146, 11);
        end;
    end;
    local v147 = u2[v144];
    if p143.Kind == "Snapshot" then
        local l__Root__10 = p143.Root;
        if type(l__Root__10) == "table" then
            u2[v144] = l__Root__10;
            u53(v144, "", l__Root__10);
            return;
        else
            return;
        end;
    end;
    if p143.Kind == "Attribute" then
        local v148 = u21(v147, v145, true);
        if v148 and v148._Attributes[p143.Attribute] ~= p143.Value then
            v148._Attributes[p143.Attribute] = p143.Value;
            local l__Attribute__11 = p143.Attribute;
            local v149 = tostring(v144);
            local v150 = ":";
            local v151;
            if v145 == nil or (v145 == "" or v145 == "DataStats") then
                v151 = "";
            else
                v151 = tostring(v145);
                if string.sub(v151, 1, 10) == "DataStats." then
                    v151 = string.sub(v151, 11);
                end;
            end;
            local v152 = v149 .. v150 .. v151;
            local v153 = u8[v152];
            if v153 then
                v153:Fire(l__Attribute__11);
            end;
            if l__Attribute__11 then
                local v154 = u5[v152];
                if v154 then
                    v154 = v154[l__Attribute__11];
                end;
                if v154 then
                    v154:Fire();
                end;
            end;
        end;
    elseif p143.Kind == "ChildAdded" then
        local v155 = u21(v147, v146, true);
        if v155 and p143.ChildName then
            v155._Children[p143.ChildName] = p143.Node or u15("Folder");
            local v156 = u6;
            local v157 = tostring(v144);
            local v158 = ":";
            local v159;
            if v146 == nil or (v146 == "" or v146 == "DataStats") then
                v159 = "";
            else
                v159 = tostring(v146);
                if string.sub(v159, 1, 10) == "DataStats." then
                    v159 = string.sub(v159, 11);
                end;
            end;
            local v160 = v156[v157 .. v158 .. v159];
            if v160 then
                v160:Fire((u114(v144, v146 == "" and p143.ChildName or v146 .. "." .. p143.ChildName)));
            end;
            local v161 = tostring(v144);
            local v162 = ":";
            local v163;
            if v146 == nil or (v146 == "" or v146 == "DataStats") then
                v163 = "";
            else
                v163 = tostring(v146);
                if string.sub(v163, 1, 10) == "DataStats." then
                    v163 = string.sub(v163, 11);
                end;
            end;
            local v164 = u8[v161 .. v162 .. v163];
            if v164 then
                v164:Fire(nil);
            end;
        end;
    elseif p143.Kind == "ChildRemoved" then
        if v147 then
            for _, v165 in ipairs((u13(v146))) do
                v147 = v147._Children[v165];
                if not v147 then
                    v147 = nil;
                    break;
                end;
            end;
        else
            v147 = nil;
        end;
        if v147 and p143.ChildName then
            local v166 = u114(v144, v146 == "" and p143.ChildName or v146 .. "." .. p143.ChildName);
            v147._Children[p143.ChildName] = nil;
            local v167 = u7;
            local v168 = tostring(v144);
            local v169 = ":";
            local v170;
            if v146 == nil or (v146 == "" or v146 == "DataStats") then
                v170 = "";
            else
                v170 = tostring(v146);
                if string.sub(v170, 1, 10) == "DataStats." then
                    v170 = string.sub(v170, 11);
                end;
            end;
            local v171 = v167[v168 .. v169 .. v170];
            if v171 then
                v171:Fire(v166);
            end;
            local v172 = tostring(v144);
            local v173 = ":";
            local v174;
            if v146 == nil or (v146 == "" or v146 == "DataStats") then
                v174 = "";
            else
                v174 = tostring(v146);
                if string.sub(v174, 1, 10) == "DataStats." then
                    v174 = string.sub(v174, 11);
                end;
            end;
            local v175 = u8[v172 .. v173 .. v174];
            if v175 then
                v175:Fire(nil);
            end;
        end;
    end;
end);
if l__LocalPlayer__3 then
    task.defer(function() --[[ Line: 355 ]]
        -- upvalues: u1 (copy), l__LocalPlayer__3 (copy)
        u1.Refresh(l__LocalPlayer__3.UserId);
    end);
end;
return u1;