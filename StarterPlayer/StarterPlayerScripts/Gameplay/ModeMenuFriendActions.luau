-- ClassName: ModuleScript
-- Roblox Path: game.StarterPlayer.StarterPlayerScripts.Gameplay.ModeMenuFriendActions

-- Decompiled with Potassium's decompiler.

return {
    InviteRobloxFriend = function(u1, p2) --[[ Name: InviteRobloxFriend, Line 12 ]]
        local l__LocalPlayer__1 = u1.LocalPlayer;
        local l__SocialService__2 = u1.SocialService;
        if l__LocalPlayer__1 and l__SocialService__2 then
            local u3 = tonumber(p2);
            if u3 then
                u3 = math.floor(u3);
                if u3 <= 0 or u3 == l__LocalPlayer__1.UserId then
                    u3 = nil;
                end;
            end;
            local l__ShowNotification__3 = u1.ShowNotification;
            if type(l__ShowNotification__3) == "function" then
                l__ShowNotification__3("Opening Roblox invite...", false, nil);
            end;
            task.spawn(function() --[[ Line: 28 ]]
                -- upvalues: u3 (ref), l__SocialService__2 (copy), l__LocalPlayer__1 (copy), u1 (copy)
                local v4, v5 = pcall(function() --[[ Line: 29 ]]
                    -- upvalues: u3 (ref), l__SocialService__2 (ref), l__LocalPlayer__1 (ref)
                    if u3 then
                        return l__SocialService__2:CanSendGameInviteAsync(l__LocalPlayer__1, u3);
                    else
                        return l__SocialService__2:CanSendGameInviteAsync(l__LocalPlayer__1);
                    end;
                end);
                if not v4 and u3 then
                    v4, v5 = pcall(function() --[[ Line: 36 ]]
                        -- upvalues: l__SocialService__2 (ref), l__LocalPlayer__1 (ref)
                        return l__SocialService__2:CanSendGameInviteAsync(l__LocalPlayer__1);
                    end);
                end;
                if v4 and v5 == true then
                    local u6 = Instance.new("ExperienceInviteOptions");
                    u6.PromptMessage = u3 and "Invite this friend to Agaric.io" or "Invite friends to Agaric.io";
                    u6.LaunchData = "FriendInvite:" .. tostring(l__LocalPlayer__1.UserId);
                    if u3 then
                        u6.InviteUser = u3;
                    end;
                    if not pcall(function() --[[ Line: 52 ]]
                        -- upvalues: l__SocialService__2 (ref), l__LocalPlayer__1 (ref), u6 (copy)
                        l__SocialService__2:PromptGameInvite(l__LocalPlayer__1, u6);
                    end) then
                        local l__ShowNotification__4 = u1.ShowNotification;
                        if type(l__ShowNotification__4) == "function" then
                            l__ShowNotification__4("Could not open Roblox invite.", true, nil);
                        end;
                    end;
                else
                    local l__ShowNotification__5 = u1.ShowNotification;
                    if type(l__ShowNotification__5) == "function" then
                        l__ShowNotification__5("Roblox invite is not available for this account or platform.", true, nil);
                    end;
                end;
            end);
        end;
    end,
    PromptExperienceNotifications = function(u7) --[[ Name: PromptExperienceNotifications, Line 61 ]]
        local l__ShowNotification__6 = u7.ShowNotification;
        if type(l__ShowNotification__6) == "function" then
            l__ShowNotification__6("Opening Roblox Notify...", false, nil);
        end;
        task.spawn(function() --[[ Line: 63 ]]
            -- upvalues: u7 (copy)
            local l__ExperienceNotificationService__7 = game:GetService("ExperienceNotificationService");
            local v8, v9 = pcall(function() --[[ Line: 65 ]]
                -- upvalues: l__ExperienceNotificationService__7 (copy)
                return l__ExperienceNotificationService__7:CanPromptOptInAsync();
            end);
            if v8 then
                if v9 == true then
                    if not pcall(function() --[[ Line: 77 ]]
                        -- upvalues: l__ExperienceNotificationService__7 (copy)
                        l__ExperienceNotificationService__7:PromptOptIn();
                    end) then
                        local l__ShowNotification__8 = u7.ShowNotification;
                        if type(l__ShowNotification__8) == "function" then
                            l__ShowNotification__8("Could not open Roblox Notify.", true, nil);
                        end;
                    end;
                else
                    local l__ShowNotification__9 = u7.ShowNotification;
                    if type(l__ShowNotification__9) == "function" then
                        l__ShowNotification__9("Roblox Notify is already enabled or not available for this account.", false, nil);
                    end;
                end;
            else
                local l__ShowNotification__10 = u7.ShowNotification;
                if type(l__ShowNotification__10) == "function" then
                    l__ShowNotification__10("Roblox Notify is not available right now.", true, nil);
                end;
            end;
        end);
    end,
    SetSpawnNearFriendTarget = function(p10, p11) --[[ Name: SetSpawnNearFriendTarget, Line 86 ]]
        local l__LocalPlayer__11 = p10.LocalPlayer;
        local l__Network__12 = p10.Network;
        local l__NetworkNames__13 = p10.NetworkNames;
        if l__LocalPlayer__11 and (l__Network__12 and type(l__NetworkNames__13) == "table") then
            local v12 = tonumber(p11);
            if v12 and (v12 > 0 and v12 ~= l__LocalPlayer__11.UserId) then
                local v13 = math.floor(v12);
                if tonumber(l__LocalPlayer__11:GetAttribute("SpawnNearFriendUserId")) == v13 then
                    v13 = nil;
                end;
                l__Network__12:WaitForChild(l__NetworkNames__13.SetSpawnNearFriend):FireServer(v13);
                l__LocalPlayer__11:SetAttribute("SpawnNearFriendUserId", v13);
                if v13 then
                    local l__ShowNotification__14 = p10.ShowNotification;
                    if type(l__ShowNotification__14) == "function" then
                        l__ShowNotification__14("Spawn near friend enabled.", false, nil);
                    end;
                else
                    local l__ShowNotification__15 = p10.ShowNotification;
                    if type(l__ShowNotification__15) == "function" then
                        l__ShowNotification__15("Spawn near friend disabled.", false, nil);
                    end;
                end;
                local l__FriendRequestUi__16 = p10.FriendRequestUi;
                if type(l__FriendRequestUi__16) == "table" then
                    l__FriendRequestUi__16.RenderSignature = "";
                    if type(l__FriendRequestUi__16.RenderCache) == "function" then
                        l__FriendRequestUi__16.RenderCache(true);
                    end;
                end;
            end;
        end;
    end
};