-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.DonationConfig

-- Decompiled with Potassium's decompiler.

return {
    RobuxIcon = "R$",
    CurrencyProducts = {
        {
            Id = "Gold1",
            Title = "+10000",
            Robux = 10,
            ProductId = 3589817551,
            Grant = {
                Gold = 25000
            }
        },
        {
            Id = "Gold2",
            Title = "+100000",
            Robux = 100,
            ProductId = 3589818043,
            Grant = {
                Gold = 250000
            }
        },
        {
            Id = "Gold3",
            Title = "+1000000",
            Robux = 499,
            ProductId = 3589818312,
            Grant = {
                Gold = 1250000
            }
        },
        {
            Id = "Gold4",
            Title = "+2000000",
            Robux = 999,
            ProductId = 3589818622,
            Grant = {
                Gold = 2500000
            }
        },
        {
            Id = "Gold5",
            Title = "+16000000",
            Robux = 16000,
            ProductId = 3589818972,
            Grant = {
                Gold = 40000000
            }
        }
    },
    Packs = {
        {
            Id = "PremiumBundle",
            Title = "Premium Bundle",
            Robux = 799,
            ProductId = 0,
            Grant = {
                Gold = 250000,
                Items = {
                    {
                        Key = "PremiumCase",
                        Amount = 5
                    },
                    {
                        Key = "BossRespawnTicket",
                        Amount = 2
                    }
                }
            }
        },
        {
            Id = "TrueBlueBundle",
            Title = "True Blue Bundle",
            Robux = 1499,
            ProductId = 0,
            Grant = {
                Gold = 500000,
                Items = {
                    {
                        Key = "BlueLuckyCase",
                        Amount = 7
                    },
                    {
                        Key = "RaceRerollToken",
                        Amount = 3
                    }
                }
            }
        }
    },
    Subscriptions = {
        {
            Id = "GO",
            Title = "GO",
            Subtitle = "Lifetime chat title.",
            Robux = 39,
            GamePassId = 1831183117,
            ChatTitle = "GO",
            ChatTitleColor = "#86EFAC",
            ChatTitlePriority = 10,
            Benefits = { "GO chat title" },
            Grant = {
                Items = {
                    {
                        Key = "Title_GO",
                        Unique = true
                    }
                }
            }
        },
        {
            Id = "Plus",
            Title = "Plus",
            Subtitle = "Better progress and case opening.",
            Robux = 499,
            GamePassId = 1831689053,
            ChatTitle = "PLUS",
            ChatTitleColor = "#7DD3FC",
            ChatTitlePriority = 20,
            Benefits = { "PLUS chat title", "1.5x Mass Spawn", "Open 3 cases at once" },
            Grant = {
                Items = {
                    {
                        Key = "Title_Plus",
                        Unique = true
                    },
                    {
                        Key = "PassiveBoost_MassSpawn1_5x",
                        Unique = true
                    }
                }
            }
        },
        {
            Id = "Pro",
            Title = "Pro",
            Subtitle = "Maximum subscription bonuses.",
            Robux = 4399,
            GamePassId = 1832163095,
            ChatTitle = "PRO",
            ChatTitleColor = "#F0ABFC",
            ChatTitlePriority = 30,
            Benefits = { "PRO chat title", "x2 Mass Spawn", "Open all cases at once" },
            Grant = {
                Items = {
                    {
                        Key = "Title_Pro",
                        Unique = true
                    },
                    {
                        Key = "PassiveBoost_MassSpawn2x",
                        Unique = true
                    }
                }
            }
        }
    },
    OtherProducts = {
        {
            Id = "BossRespawn",
            Title = "Boss Respawn",
            Robux = 50,
            ProductId = 0,
            Grant = {
                Items = {
                    {
                        Key = "BossRespawnTicket",
                        Amount = 1
                    }
                }
            }
        },
        {
            Id = "LuckyCases",
            Title = "Lucky Cases",
            Robux = 149,
            ProductId = 0,
            Grant = {
                Items = {
                    {
                        Key = "LuckyCase",
                        Amount = 3
                    }
                }
            }
        },
        {
            Id = "RaceReroll",
            Title = "Race Reroll",
            Robux = 90,
            ProductId = 0,
            Grant = {
                Items = {
                    {
                        Key = "RaceRerollToken",
                        Amount = 1
                    }
                }
            }
        },
        {
            Id = "StatReset",
            Title = "Stat Reset",
            Robux = 75,
            ProductId = 0,
            Grant = {
                Items = {
                    {
                        Key = "StatResetToken",
                        Amount = 1
                    }
                }
            }
        }
    }
};