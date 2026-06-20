-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.Gameplay.ClientPrediction

-- Decompiled with Potassium's decompiler.

local v1 = {};
local _ = math.abs;
local l__clamp__1 = math.clamp;
local l__max__2 = math.max;
local l__min__3 = math.min;
local l__sqrt__4 = math.sqrt;
local function u15(p2, p3, p4, p5, p6) --[[ Line: 38 ]]
    -- upvalues: l__clamp__1 (copy), l__max__2 (copy), l__sqrt__4 (copy)
    local v7 = l__clamp__1(p5 - p2.LastServerSampleAt, 0, p6.PlayerExtrapolateMaxAge);
    local v8 = p3 + (p2.MoveVx or 0) * v7;
    local v9 = p4 + (p2.MoveVy or 0) * v7;
    local v10 = v8 - p3;
    local v11 = v9 - p4;
    local v12 = l__max__2(24, (p2.Radius or 30) * p6.PlayerExtrapolateMaxRadiusMult);
    local v13 = v10 * v10 + v11 * v11;
    if v12 * v12 < v13 then
        local v14 = v12 / l__sqrt__4(v13);
        v10 = v10 * v14;
        v11 = v11 * v14;
    end;
    return p3 + v10, p4 + v11;
end;
local function u34(p16, p17, p18, p19, p20, p21, p22, p23) --[[ Line: 54 ]]
    -- upvalues: l__clamp__1 (copy), l__sqrt__4 (copy), l__max__2 (copy), l__min__3 (copy)
    local v24;
    if p16.Type == "PlayerBlob" then
        v24 = (p16.PlayerUid == p23 or p16.OwnerUid == p23) and true or p16.VisualUid == p23;
    else
        v24 = false;
    end;
    if v24 then
        local v25;
        if p16.IsFrozen == true or p16.ManualFrozen == true then
            v25 = true;
        elseif (tonumber(p20.LocalFreezePendingUntil) or 0) < p19 then
            v25 = false;
        else
            local l__ControlledAccountId__5 = p20.ControlledAccountId;
            v25 = (not l__ControlledAccountId__5 or l__ControlledAccountId__5 == "") and true or tostring(p16.PlayerUid or "") == tostring(l__ControlledAccountId__5);
        end;
        if not v25 then
            local l__PredictedTargetX__6 = p20.PredictedTargetX;
            local l__PredictedTargetY__7 = p20.PredictedTargetY;
            if type(l__PredictedTargetX__6) ~= "number" or (type(l__PredictedTargetY__7) ~= "number" or not p16.LastServerSampleAt) then
                return p17, p18;
            end;
            local v26 = l__clamp__1(p19 - p16.LastServerSampleAt, 0, p22.ClientPredictionMaxAge);
            if v26 <= 0 then
                return p17, p18;
            end;
            local v27 = l__PredictedTargetX__6 - p16.ServerX;
            local v28 = l__PredictedTargetY__7 - p16.ServerY;
            local v29 = v27 * v27 + v28 * v28;
            if v29 <= 1 then
                return p17, p18;
            end;
            local v30 = l__sqrt__4(v29);
            local v31 = tonumber(p21.BASE_SPEED) or 180;
            local v32 = tonumber(p21.START_RADIUS) or 100;
            local v33 = l__min__3(l__min__3(l__clamp__1(v31 * (v32 / l__min__3(l__max__2(p16.Radius or v32, 1), 316.22776601683796)), 40, 300) * p22.ClientPredictionSpeedScale * v26, v30), (l__max__2(18, (p16.Radius or 30) * p22.ClientPredictionMaxRadiusMult)));
            return p17 + v27 / v30 * v33, p18 + v28 / v30 * v33;
        end;
    end;
    return p17, p18;
end;
function v1.GetRenderTarget(p35, p36, p37, p38, p39, p40) --[[ Line: 82 ]]
    -- upvalues: u15 (copy), u34 (copy)
    local l__ServerX__8 = p35.ServerX;
    local l__ServerY__9 = p35.ServerY;
    local v41;
    if p35.IsFrozen == true or p35.ManualFrozen == true then
        v41 = true;
    elseif (tonumber(p37.LocalFreezePendingUntil) or 0) < p36 then
        v41 = false;
    else
        local l__ControlledAccountId__10 = p37.ControlledAccountId;
        v41 = (not l__ControlledAccountId__10 or l__ControlledAccountId__10 == "") and true or tostring(p35.PlayerUid or "") == tostring(l__ControlledAccountId__10);
    end;
    if not v41 then
        local v42;
        if p35.Type == "PlayerBlob" then
            v42 = (p35.PlayerUid == p38 or p35.OwnerUid == p38) and true or p35.VisualUid == p38;
        else
            v42 = false;
        end;
        if v42 then
            if p35.LastServerSampleAt == nil or p36 - p35.LastServerSampleAt > p40.PlayerExtrapolateMaxAge then
                v42 = false;
            else
                v42 = (p35.MoveVx or 0) ~= 0 and true or (p35.MoveVy or 0) ~= 0;
            end;
        end;
        if v42 then
            l__ServerX__8, l__ServerY__9 = u15(p35, l__ServerX__8, l__ServerY__9, p36, p40);
        end;
    end;
    local v43, v44 = u34(p35, l__ServerX__8, l__ServerY__9, p36, p37, p39, p40, p38);
    return v43, v44, p35.Radius;
end;
return v1;