-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.GameDatabase

-- Decompiled with Potassium's decompiler.

local l__Players__1 = game:GetService("Players");
return {
    TypeLimits = {
        Accessory = 10,
        Skin = 5,
        Ability = 10,
        Title = 1,
        NameColor = 1
    },
    Items = {
        Title_Champion = {
            Name = "Clan Champion Title",
            Description = "Clan reward title shown above your blob.",
            Type = "Title",
            Price = "Owned",
            InventoryOnly = true,
            TitleText = "CHAMPION",
            TitleColor = "#7DD3FC"
        },
        Title_GamepassSupporter = {
            Name = "Supporter Chat Title",
            Description = "Chat title reward.",
            Type = "ChatTitle",
            Price = "Owned",
            InventoryOnly = true,
            ChatTitleText = "SUPPORTER",
            ChatTitleColor = "#F472B6"
        },
        Title_GO = {
            Name = "GO Chat Title",
            Description = "GO subscription chat title.",
            Type = "ChatTitle",
            Price = "Owned",
            InventoryOnly = true,
            TradeLocked = true,
            SubscriptionBound = "GO",
            ChatTitleText = "GO",
            ChatTitleColor = "#86EFAC"
        },
        Title_Plus = {
            Name = "Plus Chat Title",
            Description = "Plus subscription chat title.",
            Type = "ChatTitle",
            Price = "Owned",
            InventoryOnly = true,
            TradeLocked = true,
            SubscriptionBound = "Plus",
            ChatTitleText = "PLUS",
            ChatTitleColor = "#7DD3FC"
        },
        Title_Pro = {
            Name = "Pro Chat Title",
            Description = "Pro subscription chat title.",
            Type = "ChatTitle",
            Price = "Owned",
            InventoryOnly = true,
            TradeLocked = true,
            SubscriptionBound = "Pro",
            ChatTitleText = "PRO",
            ChatTitleColor = "#F0ABFC"
        },
        NameColor_Gold = {
            Name = "Gold Name",
            Description = "Paint your nickname gold.",
            Type = "NameColor",
            Price = "Owned",
            InventoryOnly = true,
            Color = "#FFD85A"
        },
        NameColor_Cyan = {
            Name = "Cyan Name",
            Description = "Paint your nickname cyan.",
            Type = "NameColor",
            Price = "Owned",
            InventoryOnly = true,
            Color = "#7DD3FC"
        },
        NameColor_Pink = {
            Name = "Pink Name",
            Description = "Paint your nickname pink.",
            Type = "NameColor",
            Price = "Owned",
            InventoryOnly = true,
            Color = "#F472B6"
        },
        PassiveBoost_MassSpawn1_5x = {
            Name = "1.5x Mass Spawn",
            Description = "Plus subscription boost. Toggle it on to spawn with 1.5x mass.",
            Type = "PassiveBoost",
            Price = "Owned",
            InventoryOnly = true,
            TradeLocked = true,
            SubscriptionBound = "Plus",
            BoostType = "SpawnMassMultiplier",
            Multiplier = 1.5
        },
        PassiveBoost_MassSpawn2x = {
            Name = "x2 Mass Spawn",
            Description = "PRO subscription boost. Toggle it on to spawn with double mass.",
            Type = "PassiveBoost",
            Price = "Owned",
            InventoryOnly = true,
            TradeLocked = true,
            SubscriptionBound = "Pro",
            BoostType = "SpawnMassMultiplier",
            Multiplier = 2
        },
        Merge = {
            Name = "Merge",
            Description = "",
            ImageId = "rbxassetid://105142089333769",
            Type = "Ability",
            Price = 30000
        },
        Speed = {
            Name = "Speed",
            Description = "",
            ImageId = "rbxassetid://118640499559215",
            Type = "Ability",
            Price = 12000
        },
        Spike = {
            Name = "Spike",
            Description = "",
            ImageId = "rbxassetid://91836576350283",
            Type = "Ability",
            Price = 30000
        },
        Spawner = {
            Name = "Spawner",
            Description = "",
            ImageId = "rbxassetid://107648441182956",
            Type = "Ability",
            Price = 30000
        },
        FreezeFood = {
            Name = "FreezeFood",
            Description = "",
            ImageId = "rbxassetid://120014132919241",
            Type = "Ability",
            Price = 25000
        },
        Mass1000 = {
            Name = "Mass1000",
            Description = "",
            ImageId = "rbxassetid://97140855194617",
            Type = "Ability",
            Price = 2000
        },
        RobloxAvatar = {
            Name = "Roblox Avatar",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Free",
            NeedsRounding = true,
            TypeSkin = "Async",
            Fetch = function(u1, u2) --[[ Name: Fetch, Line 172 ]]
                -- upvalues: l__Players__1 (copy)
                task.spawn(function() --[[ Line: 173 ]]
                    -- upvalues: l__Players__1 (ref), u1 (copy), u2 (copy)
                    local v3, v4 = l__Players__1:GetUserThumbnailAsync(tonumber(u1), Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
                    if v4 then
                        u2(v3);
                    end;
                end);
            end
        },
        AvatarBust = {
            Name = "Avatar Bust",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Free",
            TypeSkin = "Async",
            NeedsRounding = true,
            Fetch = function(u5, u6) --[[ Name: Fetch, Line 195 ]]
                -- upvalues: l__Players__1 (copy)
                task.spawn(function() --[[ Line: 196 ]]
                    -- upvalues: l__Players__1 (ref), u5 (copy), u6 (copy)
                    local v7, v8 = l__Players__1:GetUserThumbnailAsync(tonumber(u5), Enum.ThumbnailType.AvatarBust, Enum.ThumbnailSize.Size420x420);
                    if v8 then
                        u6(v7);
                    end;
                end);
            end
        },
        AvatarFull = {
            Name = "Full Avatar",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Free",
            TypeSkin = "Async",
            NeedsRounding = true,
            Fetch = function(u9, u10) --[[ Name: Fetch, Line 216 ]]
                -- upvalues: l__Players__1 (copy)
                task.spawn(function() --[[ Line: 217 ]]
                    -- upvalues: l__Players__1 (ref), u9 (copy), u10 (copy)
                    local v11, v12 = l__Players__1:GetUserThumbnailAsync(tonumber(u9), Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size420x420);
                    if v12 then
                        u10(v11);
                    end;
                end);
            end
        },
        Speed_Effect = {
            Name = "",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Effect",
            TypeSkin = "Static",
            ImageId = "rbxassetid://94579991010946"
        },
        Freeze_Effect = {
            Name = "",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Effect",
            TypeSkin = "Static",
            ImageId = "rbxassetid://89945662021532"
        },
        Merge_Effect = {
            Name = "",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Effect",
            TypeSkin = "Static",
            ImageId = "rbxassetid://89869000110102"
        },
        RockFlame = {
            Name = "Flame",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://129413543227993"
        },
        BlackFlame = {
            Name = "Black Flame",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 2000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://97572109643540"
        },
        EvilHorns = {
            Name = "Evil Horns",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://132893764207061"
        },
        AngelHalo = {
            Name = "Angel Halo",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://131513258190422"
        },
        GoldenCrown = {
            Name = "Golden Crown",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 2000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://93064273803728"
        },
        CatEars1 = {
            Name = "Cat Ears",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://121320520455773"
        },
        CatEars2 = {
            Name = "Cat Ears 2",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://89103345820605"
        },
        Clouds = {
            Name = "Clouds",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 3000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://118126324532621"
        },
        Bread = {
            Name = "Bread",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 400000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://108754051145311"
        },
        Cap = {
            Name = "Cap",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://77178321615032"
        },
        PurpleLightning = {
            Name = "Purple Lightning",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 3000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://120615619709687"
        },
        LeafyHat = {
            Name = "Leafy Hat",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 750000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://71033007013513"
        },
        WhiteLeafyHat = {
            Name = "White Leafy Hat",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 3000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://118066324273627"
        },
        ShortBeard = {
            Name = "Short Beard",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://140054478042711"
        },
        CatWhiskers = {
            Name = "Cat Whiskers",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://133120772550979"
        },
        CircleSaw = {
            Name = "Circle Saw",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://71558816056255"
        },
        WhiteMysteryMask = {
            Name = "White Mystery Mask",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Accessory",
            Price = 1000000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://91562599271430"
        },
        Like = {
            Name = "Like",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://107966257715719"
        },
        Rock = {
            Name = "Rock",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 2500,
            TypeSkin = "Static",
            ImageId = "rbxassetid://103552525716985"
        },
        Donut = {
            Name = "Donut",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 5000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://139715191732729"
        },
        FireWhirpool = {
            Name = "Fire Whirpool",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://95109183941953"
        },
        Binary = {
            Name = "Binary",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 100000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://71197019534070"
        },
        UnitedStates = {
            Name = "United States",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://118241603057492"
        },
        Brazil = {
            Name = "Brazil",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://107930399656119"
        },
        Philipines = {
            Name = "Philipines",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://98464581072396"
        },
        Mexico = {
            Name = "Mexico",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://134817557311892"
        },
        China = {
            Name = "China",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://105918526070621"
        },
        Germany = {
            Name = "Germany",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://123249200500687"
        },
        France = {
            Name = "France",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://79428902198585"
        },
        India = {
            Name = "India",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://122804964925136"
        },
        Spain = {
            Name = "Spain",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://121869772432237"
        },
        Ukraine = {
            Name = "Ukraine",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://107367992338093"
        },
        Poland = {
            Name = "Poland",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://99378951085979"
        },
        Russia = {
            Name = "Russia",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://95243780390000"
        },
        Watermelon = {
            Name = "Watermelon",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://118693059980333"
        },
        Earth = {
            Name = "Earth",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://76834126364898"
        },
        Sun = {
            Name = "Sun",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://131720672529595"
        },
        Space = {
            Name = "Space",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://129333738300902"
        },
        FootBall = {
            Name = "FootBall",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://140175226606167"
        },
        BasketBall = {
            Name = "BasketBall",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://110033136466933"
        },
        Orange = {
            Name = "Orange",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://109501025002037"
        },
        Clock = {
            Name = "Clock",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://106302054426153"
        },
        BlueScreen = {
            Name = "Blue Screen",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://90650708168750"
        },
        Doggie = {
            Name = "Doggie",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = 1000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://139049406224206"
        },
        Lvl200 = {
            Name = "Lvl 200 SSS+",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 200,
            TypeSkin = "Static",
            ImageId = "rbxassetid://128274783393140"
        },
        Lvl150 = {
            Name = "Lvl 150 SSS",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 150,
            TypeSkin = "Static",
            ImageId = "rbxassetid://138022531983818"
        },
        Lvl100 = {
            Name = "Lvl 100 SS+",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 100,
            TypeSkin = "Static",
            ImageId = "rbxassetid://95871292100504"
        },
        Lvl90 = {
            Name = "Lvl 90 SS",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 90,
            TypeSkin = "Static",
            ImageId = "rbxassetid://75150262177678"
        },
        Lvl80 = {
            Name = "Lvl 80 S+",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 80,
            TypeSkin = "Static",
            ImageId = "rbxassetid://122810044850290"
        },
        Lvl70 = {
            Name = "Lvl 70 S",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 70,
            TypeSkin = "Static",
            ImageId = "rbxassetid://120816339849082"
        },
        Lvl60 = {
            Name = "Lvl 60 A+",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 60,
            TypeSkin = "Static",
            ImageId = "rbxassetid://86141902492755"
        },
        Lvl50 = {
            Name = "Lvl 50 A",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 50,
            TypeSkin = "Static",
            ImageId = "rbxassetid://100442004371292"
        },
        Lvl40 = {
            Name = "Lvl 40 B",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 40,
            TypeSkin = "Static",
            ImageId = "rbxassetid://114852757782501"
        },
        Lvl30 = {
            Name = "Lvl 30 C",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 30,
            TypeSkin = "Static",
            ImageId = "rbxassetid://106672447187179"
        },
        Lvl20 = {
            Name = "Lvl 20 D",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 20,
            TypeSkin = "Static",
            ImageId = "rbxassetid://138421094191933"
        },
        Lvl10 = {
            Name = "Lvl 10 E",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 10,
            TypeSkin = "Static",
            ImageId = "rbxassetid://90091886271523"
        },
        Lvl0 = {
            Name = "Lvl 0 F Class",
            Description = "",
            LeaderstatsDisabled = true,
            Type = "Skin",
            Price = "Lvl",
            Lvl = 0,
            TypeSkin = "Static",
            ImageId = "rbxassetid://119767670581087"
        },
        BetaCase = {
            Name = "Beta Case",
            Description = "",
            TotalStats = true,
            Type = "Case",
            Price = 10000,
            TypeSkin = "Static",
            ImageId = "rbxassetid://139243374862397"
        },
        StaticBloom = {
            Name = "Static Bloom",
            Description = "",
            TotalStats = true,
            Demand = 0.35,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://71896102527432"
        },
        ScanlineGhost = {
            Name = "Scanline Ghost",
            Description = "",
            TotalStats = true,
            Demand = 0.45,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://78040553387164"
        },
        PacketLoss = {
            Name = "Packet Loss",
            Description = "",
            TotalStats = true,
            Demand = 1,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://102536954079379"
        },
        MemoryLeak = {
            Name = "Memory Leak",
            Description = "",
            TotalStats = true,
            Demand = 1.3,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://136458499496946"
        },
        BlueScreenCore = {
            Name = "Blue Screen Core",
            Description = "",
            TotalStats = true,
            Demand = 0.7,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://128091083620524"
        },
        ErrorSignal = {
            Name = "Error Signal",
            Description = "",
            TotalStats = true,
            Demand = 1,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://136188220991681"
        },
        WireframeGrid = {
            Name = "Wireframe Grid",
            Description = "",
            TotalStats = true,
            Demand = 0.85,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://121658771272472"
        },
        PixelCrash = {
            Name = "Pixel Crash",
            Description = "",
            TotalStats = true,
            Demand = 0.55,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://110640337192085"
        },
        FinalBug = {
            Name = "Final Bug",
            Description = "",
            TotalStats = true,
            Demand = 1.2,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://113843287783339"
        },
        UnstableCore = {
            Name = "Unstable Core",
            Description = "",
            TotalStats = true,
            Demand = 1.1,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://104268848354908"
        },
        CorruptedBeta = {
            Name = "Corrupted Beta",
            Description = "",
            TotalStats = true,
            Demand = 1.15,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://81633154952459"
        },
        BuggedSignal = {
            Name = "Bugged Signal",
            Description = "",
            TotalStats = true,
            Demand = 1.05,
            Type = "Skin",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://97921223559762"
        },
        DreamyMoonAura = {
            Name = "Dreamy Moon Aura",
            Description = "",
            TotalStats = true,
            Demand = 1.15,
            Type = "Accessory",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://104416690424338"
        },
        PastelCatEars = {
            Name = "Pastel Cat Ears",
            Description = "",
            TotalStats = true,
            Demand = 1.2,
            Type = "Accessory",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://102109934812842"
        },
        CorruptedHalo = {
            Name = "Corrupted Halo",
            Description = "",
            TotalStats = true,
            Demand = 1.3,
            Type = "Accessory",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://94498306851958"
        },
        VoidGlitchHorns = {
            Name = "Void Glitch Horns",
            Description = "",
            TotalStats = true,
            Demand = 1.45,
            Type = "Accessory",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://73921496327388"
        },
        ScarletDataRift = {
            Name = "Scarlet Data Rift",
            Description = "",
            TotalStats = true,
            Demand = 1.6,
            Type = "Accessory",
            Price = "Owned",
            TypeSkin = "Static",
            ImageId = "rbxassetid://82133615722022"
        }
    },
    BotPacks = {
        Bots10_1h = {
            Name = "10 Bots 1h",
            Description = "10 bots, 20 mass, 1 hour.",
            Type = "BotPack",
            Price = 75000,
            BotCount = 10,
            BotMass = 20,
            DurationSeconds = 3600
        },
        Bots25_1h = {
            Name = "25 Bots 1h",
            Description = "25 bots, 20 mass, 1 hour.",
            Type = "BotPack",
            Price = 150000,
            BotCount = 25,
            BotMass = 20,
            DurationSeconds = 3600
        },
        Bots50_1h = {
            Name = "50 Bots 1h",
            Description = "50 bots, 20 mass, 1 hour.",
            Type = "BotPack",
            Price = 275000,
            BotCount = 50,
            BotMass = 20,
            DurationSeconds = 3600
        }
    },
    Cases = {
        BetaCase = {
            {
                ItemId = "StaticBloom",
                Amount = 1,
                Chance = 0.43932008944
            },
            {
                ItemId = "ScanlineGhost",
                Amount = 1,
                Chance = 0.252
            },
            {
                ItemId = "PixelCrash",
                Amount = 1,
                Chance = 0.121
            },
            {
                ItemId = "BlueScreenCore",
                Amount = 1,
                Chance = 0.0605
            },
            {
                ItemId = "WireframeGrid",
                Amount = 1,
                Chance = 0.0305
            },
            {
                ItemId = "ErrorSignal",
                Amount = 1,
                Chance = 0.0155
            },
            {
                ItemId = "UnstableCore",
                Amount = 1,
                Chance = 0.016666666666666666
            },
            {
                ItemId = "FinalBug",
                Amount = 1,
                Chance = 0.013333333333333334
            },
            {
                ItemId = "MemoryLeak",
                Amount = 1,
                Chance = 0.011764705882352941
            },
            {
                ItemId = "PacketLoss",
                Amount = 1,
                Chance = 0.010526315789473684
            },
            {
                ItemId = "BuggedSignal",
                Amount = 1,
                Chance = 0.005
            },
            {
                ItemId = "CorruptedBeta",
                Amount = 1,
                Chance = 0.0025
            },
            {
                ItemId = "DreamyMoonAura",
                Amount = 1,
                Chance = 0.01
            },
            {
                ItemId = "PastelCatEars",
                Amount = 1,
                Chance = 0.005555555555555556
            },
            {
                ItemId = "CorruptedHalo",
                Amount = 1,
                Chance = 0.0033333333333333335
            },
            {
                ItemId = "VoidGlitchHorns",
                Amount = 1,
                Chance = 0.0016666666666666668
            },
            {
                ItemId = "ScarletDataRift",
                Amount = 1,
                Chance = 0.0008333333333333334
            }
        }
    }
};