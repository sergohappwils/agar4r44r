-- ClassName: LocalScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Framework.GeneratedGuiBootstrap

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
local l__ReplicatedStorage__2 = game:GetService("ReplicatedStorage");
local l__PlayerGui__3 = l__Players__1.LocalPlayer:WaitForChild("PlayerGui");
local l__GeneratedUI__4 = l__ReplicatedStorage__2:WaitForChild("Framework"):WaitForChild("GeneratedUI");
local l__GuiFeatureFlags__5 = require(l__GeneratedUI__4:WaitForChild("GuiFeatureFlags"));
if l__GuiFeatureFlags__5.UseGeneratedStarterGui == true then
    local l__GuiSpec__6 = require(l__GeneratedUI__4:WaitForChild("GuiSpec"));
    require(l__GeneratedUI__4:WaitForChild("GeneratedGuiRuntime")).Build(l__PlayerGui__3, l__GuiSpec__6, {
        DestroyExisting = l__GuiFeatureFlags__5.DestroyExistingGeneratedTargets == true
    });
end;