-- ClassName: ModuleScript
-- Roblox Path: game.ReplicatedStorage.Framework.GeneratedUI.GuiSpecParts.Gui_Shop_GoldValue_6

-- Decompiled with Potassium's decompiler.

return {
    Attributes = {},
    Children = {
        {
            Attributes = {},
            Children = {
                {
                    Attributes = {},
                    Children = {},
                    ClassName = "UIStroke",
                    Name = "UIStroke",
                    Properties = {
                        Thickness = 1.5,
                        Transparency = 0.5
                    }
                },
                {
                    Attributes = {},
                    Children = {},
                    ClassName = "UITextSizeConstraint",
                    Name = "UITextSizeConstraint",
                    Properties = {}
                }
            },
            ClassName = "TextLabel",
            Name = "Amount",
            Properties = {
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.new(1, 1, 1),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.new(0, 0, 0),
                BorderSizePixel = 0,
                Position = UDim2.new(0.355954975, 0, 0.500000179, 0),
                Size = UDim2.new(0.585849345, 0, 1.01747024, 0),
                Text = "Loading",
                TextColor3 = Color3.new(1, 0.90196079, 0.431372553),
                TextScaled = true,
                TextSize = 20,
                TextWrapped = true,
                TextXAlignment = Enum.TextXAlignment.Right,
                FontFace = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextStrokeTransparency = 1,
                TextYAlignment = Enum.TextYAlignment.Center
            }
        },
        {
            Attributes = {},
            Children = {
                {
                    Attributes = {},
                    Children = {},
                    ClassName = "UIAspectRatioConstraint",
                    Name = "UIAspectRatioConstraint",
                    Properties = {}
                },
                {
                    Attributes = {},
                    Children = {},
                    ClassName = "UISizeConstraint",
                    Name = "UISizeConstraint",
                    Properties = {
                        MaxSize = Vector2.new(30, 30),
                        MinSize = Vector2.new(0, 0)
                    }
                }
            },
            ClassName = "ImageLabel",
            Name = "ImageLabel",
            Properties = {
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundTransparency = 1,
                Image = "rbxassetid://11713337390",
                ImageColor3 = Color3.new(0, 0, 0),
                LayoutOrder = 2,
                Position = UDim2.new(0.889260292, 0, 0.910417259, 0),
                Size = UDim2.new(0.221479446, 0, 1.27280772, 0),
                ImageTransparency = 0,
                ScaleType = Enum.ScaleType.Stretch,
                SizeConstraint = Enum.SizeConstraint.RelativeXY,
                ZIndex = 1
            }
        },
        {
            Attributes = {},
            Children = {},
            ClassName = "UIListLayout",
            Name = "UIListLayout",
            Properties = {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Right,
                Padding = UDim.new(0, 3),
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center
            }
        },
        {
            Attributes = {},
            Children = {},
            ClassName = "UICorner",
            Name = "UICorner",
            Properties = {}
        }
    },
    ClassName = "Frame",
    Name = "GoldValue",
    Properties = {
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.new(0, 0, 0),
        BackgroundTransparency = 0.550000011920929,
        BorderColor3 = Color3.new(0, 0, 0),
        BorderSizePixel = 0,
        Position = UDim2.new(0.996004403, 0, 0.401050478, 0),
        Size = UDim2.new(0.196030185, 0, 0.0790980086, 0)
    }
};