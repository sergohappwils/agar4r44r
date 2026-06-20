-- ClassName: ModuleScript
-- Roblox Path: game.Players.9px9m20.PlayerScripts.PlayerModule.CameraModule.CameraInput

-- Decompiled with Potassium's decompiler.

local l__ContextActionService__1 = game:GetService("ContextActionService");
local l__UserInputService__2 = game:GetService("UserInputService");
local l__Players__3 = game:GetService("Players");
game:GetService("RunService");
local l__UserGameSettings__4 = UserSettings():GetService("UserGameSettings");
local l__VRService__5 = game:GetService("VRService");
local l__GuiService__6 = game:GetService("GuiService");
local l__CommonUtils__7 = script.Parent.Parent:WaitForChild("CommonUtils");
local l__FlagUtil__8 = require(l__CommonUtils__7:WaitForChild("FlagUtil"));
local u1 = l__FlagUtil__8.getUserFlag("UserPSSinkUnknownTouchEvents");
local v2 = l__FlagUtil__8.getUserFlag("UserPSTextboxResetCameraInput");
local v3 = l__FlagUtil__8.getUserFlag("UserFixVRCameraGamepadReset");
local l__LocalPlayer__9 = l__Players__3.LocalPlayer;
local l__Value__10 = Enum.ContextActionPriority.Medium.Value;
local u4 = Vector2.new(1, 0.77) * 0.06981317007977318 * 60;
local u5 = Vector2.new(1, 0.77) * 0.008726646259971648;
local u6 = Vector2.new(1, 0.77) * 0.12217304763960307;
local u7 = Vector2.new(1, 0.66) * 0.017453292519943295;
local u8 = Instance.new("BindableEvent");
local u9 = Instance.new("BindableEvent");
local l__Event__11 = u8.Event;
local l__Event__12 = u9.Event;
l__UserInputService__2.InputBegan:Connect(function(p10, p11) --[[ Line: 45 ]]
    -- upvalues: u8 (copy)
    if not p11 and p10.UserInputType == Enum.UserInputType.MouseButton2 then
        u8:Fire();
    end;
end);
l__UserInputService__2.InputEnded:Connect(function(p12, _) --[[ Line: 51 ]]
    -- upvalues: u9 (copy)
    if p12.UserInputType == Enum.UserInputType.MouseButton2 then
        u9:Fire();
    end;
end);
local function u16(p13) --[[ Line: 62 ]]
    local v14 = (math.abs(p13) - 0.1) / 0.9 * 2;
    local v15 = (math.exp(v14) - 1) / 6.38905609893065;
    return math.sign(p13) * math.clamp(v15, 0, 1);
end;
local function u20(p17) --[[ Line: 76 ]]
    local l__CurrentCamera__13 = workspace.CurrentCamera;
    if not l__CurrentCamera__13 then
        return p17;
    end;
    local v18 = l__CurrentCamera__13.CFrame:ToEulerAnglesYXZ();
    if p17.Y * v18 >= 0 then
        return p17;
    end;
    local v19 = (1 - (math.abs(v18) * 2 / 3.141592653589793) ^ 0.75) * 0.75 + 0.25;
    return Vector2.new(1, v19) * p17;
end;
local function u26(p21) --[[ Line: 102 ]]
    -- upvalues: l__LocalPlayer__9 (copy)
    local v22 = l__LocalPlayer__9:FindFirstChildOfClass("PlayerGui");
    if v22 then
        v22 = v22:FindFirstChild("TouchGui");
    end;
    local v23;
    if v22 then
        v23 = v22:FindFirstChild("TouchControlFrame");
    else
        v23 = v22;
    end;
    if v23 then
        v23 = v23:FindFirstChild("DynamicThumbstickFrame");
    end;
    if not v23 then
        return false;
    end;
    if not v22.Enabled then
        return false;
    end;
    local l__AbsolutePosition__14 = v23.AbsolutePosition;
    local v24 = l__AbsolutePosition__14 + v23.AbsoluteSize;
    local v25;
    if p21.X >= l__AbsolutePosition__14.X and (p21.Y >= l__AbsolutePosition__14.Y and p21.X <= v24.X) then
        v25 = p21.Y <= v24.Y;
    else
        v25 = false;
    end;
    return v25;
end;
local v27 = {};
local u28 = {};
local u29 = 0;
local u30 = {
    Thumbstick2 = Vector2.new()
};
local u31 = {
    Left = 0,
    Right = 0,
    I = 0,
    O = 0
};
local u32 = {
    Wheel = 0,
    Pinch = 0,
    Movement = Vector2.new(),
    Pan = Vector2.new()
};
local u33 = {
    Pinch = 0,
    Move = Vector2.new()
};
local u34 = Instance.new("BindableEvent");
v27.gamepadZoomPress = u34.Event;
local u35;
if v3 then
    u35 = Instance.new("BindableEvent");
    v27.gamepadReset = u35.Event;
else
    u35 = l__VRService__5.VREnabled and Instance.new("BindableEvent") or nil;
    if l__VRService__5.VREnabled then
        v27.gamepadReset = u35.Event;
    end;
end;
function v27.getRotationActivated() --[[ Line: 179 ]]
    -- upvalues: u29 (ref), u30 (copy)
    return u29 > 0 and true or u30.Thumbstick2.Magnitude > 0;
end;
function v27.getRotation(p36, p37) --[[ Line: 183 ]]
    -- upvalues: l__UserGameSettings__4 (copy), u31 (copy), u30 (copy), u32 (copy), u20 (copy), u33 (copy), u4 (copy), u5 (copy), u6 (copy), u7 (copy)
    local v38 = Vector2.new(1, l__UserGameSettings__4:GetCameraYInvertValue());
    local v39 = Vector2.new(u31.Right - u31.Left, 0) * p36;
    local v40 = u30.Thumbstick2 * l__UserGameSettings__4.GamepadCameraSensitivity * p36;
    local l__Movement__15 = u32.Movement;
    local l__Pan__16 = u32.Pan;
    local v41 = u20(u33.Move);
    if p37 then
        v39 = Vector2.new();
    end;
    return (v39 * 2.0943951023931953 + v40 * u4 + l__Movement__15 * u5 + l__Pan__16 * u6 + v41 * u7) * v38;
end;
function v27.getZoomDelta() --[[ Line: 208 ]]
    -- upvalues: u31 (copy), u32 (copy), u33 (copy)
    return (u31.O - u31.I) * 0.1 + (-u32.Wheel + u32.Pinch) * 1 + -u33.Pinch * 0.04;
end;
local function u43(_, _, p42) --[[ Line: 216 ]]
    -- upvalues: u30 (copy), u16 (ref)
    local l__Position__17 = p42.Position;
    u30[p42.KeyCode.Name] = Vector2.new(u16(l__Position__17.X), -u16(l__Position__17.Y));
    return Enum.ContextActionResult.Pass;
end;
local function u46(_, p44, p45) --[[ Line: 232 ]]
    -- upvalues: u31 (copy)
    u31[p45.KeyCode.Name] = p44 == Enum.UserInputState.Begin and 1 or 0;
end;
local function u48(_, p47, _) --[[ Line: 236 ]]
    -- upvalues: u34 (copy)
    if p47 == Enum.UserInputState.Begin then
        u34:Fire();
    end;
end;
local function u50(_, p49, _) --[[ Line: 242 ]]
    -- upvalues: u35 (ref)
    if p49 == Enum.UserInputState.Begin then
        u35:Fire();
    end;
end;
local function u54() --[[ Line: 248 ]]
    -- upvalues: u30 (copy), u31 (copy), u32 (copy), u33 (copy), u29 (ref)
    for _, v51 in pairs({
        u30,
        u31,
        u32,
        u33
    }) do
        for v52, v53 in pairs(v51) do
            if type(v53) == "boolean" then
                v51[v52] = false;
            else
                v51[v52] = v51[v52] * 0;
            end;
        end;
    end;
    u29 = 0;
end;
local u55 = {};
local u56 = nil;
local u57 = nil;
local function u60(p58, p59) --[[ Line: 274 ]]
    -- upvalues: u56 (ref), u26 (copy), u29 (ref), u55 (ref)
    assert(p58.UserInputType == Enum.UserInputType.Touch);
    assert(p58.UserInputState == Enum.UserInputState.Begin);
    if u56 == nil and (u26(p58.Position) and not p59) then
        u56 = p58;
    else
        if not p59 then
            u29 = math.max(0, u29 + 1);
        end;
        u55[p58] = p59;
    end;
end;
local function u62(p61, _) --[[ Line: 294 ]]
    -- upvalues: u56 (ref), u55 (ref), u57 (ref), u29 (ref)
    assert(p61.UserInputType == Enum.UserInputType.Touch);
    assert(p61.UserInputState == Enum.UserInputState.End);
    if p61 == u56 then
        u56 = nil;
    end;
    if u55[p61] == false then
        u57 = nil;
        u29 = math.max(0, u29 - 1);
    end;
    u55[p61] = nil;
end;
local function u70(p63, p64) --[[ Line: 313 ]]
    -- upvalues: u56 (ref), u55 (ref), u1 (copy), u33 (copy), u57 (ref)
    assert(p63.UserInputType == Enum.UserInputType.Touch);
    assert(p63.UserInputState == Enum.UserInputState.Change);
    if p63 == u56 then
    else
        if u55[p63] == nil then
            if u1 then
                u55[p63] = true;
            else
                u55[p63] = p64;
            end;
        end;
        local v65 = {};
        for v66, v67 in pairs(u55) do
            if not v67 then
                table.insert(v65, v66);
            end;
        end;
        if #v65 == 1 and u55[p63] == false then
            local l__Delta__18 = p63.Delta;
            local v68 = u33;
            v68.Move = v68.Move + Vector2.new(l__Delta__18.X, l__Delta__18.Y);
        end;
        if #v65 == 2 then
            local l__Magnitude__19 = (v65[1].Position - v65[2].Position).Magnitude;
            if u57 then
                local v69 = u33;
                v69.Pinch = v69.Pinch + (l__Magnitude__19 - u57);
            end;
            u57 = l__Magnitude__19;
        else
            u57 = nil;
        end;
    end;
end;
local function u71() --[[ Line: 361 ]]
    -- upvalues: u55 (ref), u56 (ref), u57 (ref), u29 (ref)
    u55 = {};
    u56 = nil;
    u57 = nil;
    u29 = 0;
end;
local function u76(p72, p73, p74, p75) --[[ Line: 369 ]]
    -- upvalues: u32 (copy)
    if not p75 then
        u32.Wheel = p72;
        u32.Pan = p73;
        u32.Pinch = -p74;
    end;
end;
local function u79(p77, p78) --[[ Line: 377 ]]
    -- upvalues: u60 (ref), u29 (ref)
    if p77.UserInputType == Enum.UserInputType.Touch then
        u60(p77, p78);
    else
        if p77.UserInputType == Enum.UserInputType.MouseButton2 and not p78 then
            u29 = math.max(0, u29 + 1);
        end;
    end;
end;
local function u82(p80, p81) --[[ Line: 386 ]]
    -- upvalues: u70 (ref), u32 (copy)
    if p80.UserInputType == Enum.UserInputType.Touch then
        u70(p80, p81);
    else
        if p80.UserInputType == Enum.UserInputType.MouseMovement then
            local l__Delta__20 = p80.Delta;
            u32.Movement = Vector2.new(l__Delta__20.X, l__Delta__20.Y);
        end;
    end;
end;
local function u85(p83, p84) --[[ Line: 395 ]]
    -- upvalues: u62 (ref), u29 (ref)
    if p83.UserInputType == Enum.UserInputType.Touch then
        u62(p83, p84);
    else
        if p83.UserInputType == Enum.UserInputType.MouseButton2 then
            u29 = math.max(0, u29 - 1);
        end;
    end;
end;
local u86 = false;
function v27.setInputEnabled(p87) --[[ Line: 406 ]]
    -- upvalues: u86 (ref), u54 (copy), u71 (ref), l__ContextActionService__1 (copy), u43 (copy), l__Value__10 (copy), u46 (copy), l__VRService__5 (copy), u50 (copy), u48 (copy), u28 (ref), l__UserInputService__2 (copy), u79 (copy), u82 (copy), u85 (copy), u76 (copy), l__GuiService__6 (copy)
    if u86 == p87 then
    else
        u86 = p87;
        u54();
        u71();
        if u86 then
            l__ContextActionService__1:BindActionAtPriority("RbxCameraThumbstick", u43, false, l__Value__10, Enum.KeyCode.Thumbstick2);
            l__ContextActionService__1:BindActionAtPriority("RbxCameraKeypress", u46, false, l__Value__10, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O);
            if l__VRService__5.VREnabled then
                l__ContextActionService__1:BindAction("RbxCameraGamepadReset", u50, false, Enum.KeyCode.ButtonL3);
            end;
            l__ContextActionService__1:BindAction("RbxCameraGamepadZoom", u48, false, Enum.KeyCode.ButtonR3);
            table.insert(u28, l__UserInputService__2.InputBegan:Connect(u79));
            table.insert(u28, l__UserInputService__2.InputChanged:Connect(u82));
            table.insert(u28, l__UserInputService__2.InputEnded:Connect(u85));
            table.insert(u28, l__UserInputService__2.PointerAction:Connect(u76));
            table.insert(u28, l__GuiService__6.MenuOpened:connect(u71));
        else
            l__ContextActionService__1:UnbindAction("RbxCameraThumbstick");
            l__ContextActionService__1:UnbindAction("RbxCameraMouseMove");
            l__ContextActionService__1:UnbindAction("RbxCameraMouseWheel");
            l__ContextActionService__1:UnbindAction("RbxCameraKeypress");
            l__ContextActionService__1:UnbindAction("RbxCameraGamepadZoom");
            if l__VRService__5.VREnabled then
                l__ContextActionService__1:UnbindAction("RbxCameraGamepadReset");
            end;
            for _, v88 in pairs(u28) do
                v88:Disconnect();
            end;
            u28 = {};
        end;
    end;
end;
function v27.getInputEnabled() --[[ Line: 475 ]]
    -- upvalues: u86 (ref)
    return u86;
end;
function v27.resetInputForFrameEnd() --[[ Line: 479 ]]
    -- upvalues: u32 (copy), u33 (copy)
    u32.Movement = Vector2.new();
    u33.Move = Vector2.new();
    u33.Pinch = 0;
    u32.Wheel = 0;
    u32.Pan = Vector2.new();
    u32.Pinch = 0;
end;
l__UserInputService__2.WindowFocused:Connect(u54);
l__UserInputService__2.WindowFocusReleased:Connect(u54);
if v2 then
    l__UserInputService__2.TextBoxFocusReleased:Connect(u54);
end;
local u89 = false;
local u90 = false;
local u91 = 0;
function v27.getHoldPan() --[[ Line: 503 ]]
    -- upvalues: u89 (ref)
    return u89;
end;
function v27.getTogglePan() --[[ Line: 507 ]]
    -- upvalues: u90 (ref)
    return u90;
end;
function v27.getPanning() --[[ Line: 511 ]]
    -- upvalues: u90 (ref), u89 (ref)
    return u90 or u89;
end;
function v27.setTogglePan(p92) --[[ Line: 515 ]]
    -- upvalues: u90 (ref)
    u90 = p92;
end;
local u93 = false;
local u94 = nil;
local u95 = nil;
function v27.enableCameraToggleInput() --[[ Line: 523 ]]
    -- upvalues: u93 (ref), u89 (ref), u90 (ref), u94 (ref), u95 (ref), l__Event__11 (ref), u91 (ref), l__Event__12 (ref), l__UserInputService__2 (copy)
    if u93 then
    else
        u93 = true;
        u89 = false;
        u90 = false;
        if u94 then
            u94:Disconnect();
        end;
        if u95 then
            u95:Disconnect();
        end;
        u94 = l__Event__11:Connect(function() --[[ Line: 540 ]]
            -- upvalues: u89 (ref), u91 (ref)
            u89 = true;
            u91 = tick();
        end);
        u95 = l__Event__12:Connect(function() --[[ Line: 545 ]]
            -- upvalues: u89 (ref), u91 (ref), u90 (ref), l__UserInputService__2 (ref)
            u89 = false;
            if tick() - u91 < 0.3 and (u90 or l__UserInputService__2:GetMouseDelta().Magnitude < 2) then
                u90 = not u90;
            end;
        end);
    end;
end;
function v27.disableCameraToggleInput() --[[ Line: 553 ]]
    -- upvalues: u93 (ref), u94 (ref), u95 (ref)
    if u93 then
        u93 = false;
        if u94 then
            u94:Disconnect();
            u94 = nil;
        end;
        if u95 then
            u95:Disconnect();
            u95 = nil;
        end;
    end;
end;
return v27;