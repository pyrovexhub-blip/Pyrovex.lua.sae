
--==================================================
-- PYROVEX HUB - ADVANCED TOP LOADING EFFECT
-- BLUE x RED x BLACK x PURPLE
-- 5 SECONDS | PREMIUM ANIMATED LOADER
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local LogoAsset = "rbxthumb://type=Asset&id=97950138094007&w=420&h=420"

local Old = PlayerGui:FindFirstChild("PyrovexTopLoader")
if Old then Old:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PyrovexTopLoader"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = PlayerGui

local function New(class,props,parent)
    local object = Instance.new(class)

    for property,value in pairs(props or {}) do
        object[property] = value
    end

    object.Parent = parent
    return object
end

local function Tween(obj,properties,duration,style,direction)
    local tween = TweenService:Create(
        obj,
        TweenInfo.new(
            duration or 0.25,
            style or Enum.EasingStyle.Quart,
            direction or Enum.EasingDirection.Out
        ),
        properties
    )

    tween:Play()
    return tween
end

local Main = New("Frame",{
    Name = "LoadingContainer",
    Size = UDim2.fromOffset(340,62),
    Position = UDim2.new(0.5,0,0,-85),
    AnchorPoint = Vector2.new(0.5,0),
    BackgroundColor3 = Color3.fromRGB(10,12,23),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 10
},ScreenGui)

New("UICorner",{
    CornerRadius = UDim.new(0,13)
},Main)

local MainStroke = New("UIStroke",{
    Color = Color3.fromRGB(90,105,210),
    Thickness = 1.3,
    Transparency = 0.1
},Main)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(12,18,35)),
        ColorSequenceKeypoint.new(0.5,Color3.fromRGB(15,12,28)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(28,12,25))
    }),
    Rotation = 15
},Main)

-- OUTER GLOW

local Glow = New("Frame",{
    Name = "Glow",
    Size = UDim2.new(1,-12,0,2),
    Position = UDim2.fromOffset(6,0),
    BackgroundColor3 = Color3.fromRGB(80,120,255),
    BorderSizePixel = 0,
    ZIndex = 12
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Glow)

New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,130,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(120,65,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(230,45,100)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,65,65))
    })
},Glow)

-- SETTINGS EMOJI

local Settings = New("TextLabel",{
    Name = "SettingsIcon",
    Size = UDim2.fromOffset(32,32),
    Position = UDim2.fromOffset(11,10),
    BackgroundTransparency = 1,
    Text = "⚙️",
    TextSize = 24,
    Font = Enum.Font.GothamBold,
    TextColor3 = Color3.fromRGB(255,255,255),
    ZIndex = 15
},Main)

task.spawn(function()
    while ScreenGui.Parent and Settings.Parent do
        local rotate = Tween(
            Settings,
            {Rotation = Settings.Rotation + 360},
            1.35,
            Enum.EasingStyle.Linear
        )

        rotate.Completed:Wait()
    end
end)

-- TITLE

local Title = New("TextLabel",{
    Name = "Title",
    Position = UDim2.fromOffset(51,8),
    Size = UDim2.new(1,-115,0,17),
    BackgroundTransparency = 1,
    Text = "PYROVEX HUB",
    TextColor3 = Color3.fromRGB(245,248,255),
    TextSize = 11,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBlack,
    ZIndex = 15
},Main)

-- STATUS

local Status = New("TextLabel",{
    Name = "Status",
    Position = UDim2.fromOffset(51,25),
    Size = UDim2.new(1,-105,0,15),
    BackgroundTransparency = 1,
    Text = "Initializing loader...",
    TextColor3 = Color3.fromRGB(150,165,195),
    TextSize = 8,
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamMedium,
    ZIndex = 15
},Main)

-- PERCENTAGE

local Percentage = New("TextLabel",{
    Name = "Percentage",
    Position = UDim2.new(1,-54,0,24),
    Size = UDim2.fromOffset(43,16),
    BackgroundTransparency = 1,
    Text = "0%",
    TextColor3 = Color3.fromRGB(150,190,255),
    TextSize = 9,
    TextXAlignment = Enum.TextXAlignment.Right,
    Font = Enum.Font.GothamBold,
    ZIndex = 15
},Main)

-- PROGRESS BACKGROUND

local BarBG = New("Frame",{
    Name = "ProgressBackground",
    Size = UDim2.new(1,-22,0,5),
    Position = UDim2.fromOffset(11,48),
    BackgroundColor3 = Color3.fromRGB(32,35,53),
    BorderSizePixel = 0,
    ClipsDescendants = true,
    ZIndex = 15
},Main)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},BarBG)

-- PROGRESS BAR

local Bar = New("Frame",{
    Name = "ProgressBar",
    Size = UDim2.new(0,0,1,0),
    BackgroundColor3 = Color3.fromRGB(50,130,255),
    BorderSizePixel = 0,
    ZIndex = 16
},BarBG)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Bar)

local BarGradient = New("UIGradient",{
    Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0,Color3.fromRGB(0,145,255)),
        ColorSequenceKeypoint.new(0.35,Color3.fromRGB(100,80,255)),
        ColorSequenceKeypoint.new(0.7,Color3.fromRGB(190,55,160)),
        ColorSequenceKeypoint.new(1,Color3.fromRGB(255,55,70))
    }),
    Rotation = 0
},Bar)

-- MOVING SHINE

local Shine = New("Frame",{
    Name = "ProgressShine",
    Size = UDim2.new(0,45,1,0),
    Position = UDim2.new(0,0,0,0),
    BackgroundColor3 = Color3.fromRGB(255,255,255),
    BackgroundTransparency = 0.55,
    BorderSizePixel = 0,
    ZIndex = 17
},Bar)

New("UICorner",{
    CornerRadius = UDim.new(1,0)
},Shine)

New("UIGradient",{
    Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0,1),
        NumberSequenceKeypoint.new(0.5,0),
        NumberSequenceKeypoint.new(1,1)
    })
},Shine)

-- LOADING ENTRANCE

Tween(
    Main,
    {Position = UDim2.new(0.5,0,0,12)},
    0.75,
    Enum.EasingStyle.Quint,
    Enum.EasingDirection.Out
)

-- BORDER ANIMATION

task.spawn(function()
    while ScreenGui.Parent do
        Tween(MainStroke,{
            Transparency = 0.55,
            Color = Color3.fromRGB(180,65,160)
        },0.8)

        task.wait(0.8)

        if not ScreenGui.Parent then break end

        Tween(MainStroke,{
            Transparency = 0.1,
            Color = Color3.fromRGB(70,145,255)
        },0.8)

        task.wait(0.8)
    end
end)

-- SHINE ANIMATION

task.spawn(function()
    while ScreenGui.Parent and Shine.Parent do
        Shine.Position = UDim2.new(0,-45,0,0)

        local shineTween = Tween(
            Shine,
            {Position = UDim2.new(1,0,0,0)},
            0.75,
            Enum.EasingStyle.Linear
        )

        shineTween.Completed:Wait()
        task.wait(0.12)
    end
end)

-- LOADING STATUS

local LoadingMessages = {
    {Time = 0, Text = "Initializing Pyrovex Hub..."},
    {Time = 1, Text = "Preparing loader interface..."},
    {Time = 2, Text = "Loading script collection..."},
    {Time = 3, Text = "Setting up components..."},
    {Time = 4, Text = "Almost ready..."}
}

for _,message in ipairs(LoadingMessages) do
    task.delay(message.Time,function()
        if not ScreenGui.Parent then return end

        Tween(Status,{
            TextTransparency = 1
        },0.15)

        task.wait(0.15)

        if not ScreenGui.Parent then return end

        Status.Text = message.Text

        Tween(Status,{
            TextTransparency = 0
        },0.2)
    end)
end

-- EXACT 5 SECOND PROGRESS

local StartTime = os.clock()
local Duration = 5

local Progress = Tween(
    Bar,
    {Size = UDim2.new(1,0,1,0)},
    Duration,
    Enum.EasingStyle.Linear
)

Progress:Play()

while os.clock() - StartTime < Duration do
    if not ScreenGui.Parent then return end

    local elapsed = os.clock() - StartTime
    local percent = math.clamp(math.floor((elapsed / Duration) * 100),0,100)

    Percentage.Text = percent.."%"

    task.wait(0.04)
end

Percentage.Text = "100%"
Status.Text = "Pyrovex Hub is ready!"

-- FINISH EFFECT

Tween(MainStroke,{
    Color = Color3.fromRGB(80,220,160),
    Transparency = 0
},0.2)

Tween(Bar,{
    BackgroundColor3 = Color3.fromRGB(60,220,150)
},0.2)

task.wait(0.25)

-- LOADING EXIT

Tween(Main,{
    Position = UDim2.new(0.5,0,0,-85),
    BackgroundTransparency = 1
},0.65,Enum.EasingStyle.Quint,Enum.EasingDirection.In)

Tween(Settings,{TextTransparency = 1},0.35)
Tween(Title,{TextTransparency = 1},0.35)
Tween(Status,{TextTransparency = 1},0.35)
Tween(Percentage,{TextTransparency = 1},0.35)
Tween(BarBG,{BackgroundTransparency = 1},0.35)
Tween(Glow,{BackgroundTransparency = 1},0.35)

task.wait(0.7)

if ScreenGui then
    ScreenGui:Destroy()
end

--==================================================
-- PYROVEX HUB | STEAL AN EGG
-- PREMIUM UI ENHANCEMENT
-- Original Panel Size: 190 x 210
-- Original Functions: Preserved
--==================================================

-- GAME VERIFICATION
local SupportedGameID = 107778070777162
local currentPlaceId = game.PlaceId

if currentPlaceId ~= SupportedGameID then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Pyrovex Hub Error",
        Text = "Not Supported Game! This script is only for Steal an Egg.",
        Duration = 7
    })
    warn("Pyrovex Hub: Execution blocked. Unsupported game detected.")
    return
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Pyrovex Hub",
    Text = "Script executed successfully! Enjoy hacking.",
    Duration = 5
})

print("Welcome to Pyrovex Hub - Steal an Egg Script Loaded.")

-- SERVICES
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Old = PlayerGui:FindFirstChild("PremiumBadgePanel")
if Old then Old:Destroy() end

local AdminEnabled = false
local AntiHitActive = false
local Billboard

--==================================================
-- PREMIUM COLOR SYSTEM
--==================================================

local Blue = Color3.fromRGB(55, 115, 255)
local Purple = Color3.fromRGB(145, 65, 255)
local Dark = Color3.fromRGB(18, 17, 29)
local TextColor = Color3.fromRGB(240, 237, 255)
local Red = Color3.fromRGB(255, 65, 90)
local Muted = Color3.fromRGB(145, 140, 165)

local DeepPurple = Color3.fromRGB(35, 20, 65)
local SoftPurple = Color3.fromRGB(100, 65, 180)
local DarkBlue = Color3.fromRGB(20, 35, 75)
local White = Color3.fromRGB(255, 255, 255)

local GradientColors = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Purple),
    ColorSequenceKeypoint.new(0.25, Blue),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(190, 85, 255)),
    ColorSequenceKeypoint.new(0.75, Blue),
    ColorSequenceKeypoint.new(1, Purple)
})

local TextGradientColors = ColorSequence.new({
    ColorSequenceKeypoint.new(0, White),
    ColorSequenceKeypoint.new(0.35, Color3.fromRGB(205, 185, 255)),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(125, 170, 255)),
    ColorSequenceKeypoint.new(1, White)
})

--==================================================
-- SCREEN GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "PremiumBadgePanel"
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 100
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--==================================================
-- UI ANIMATION HELPERS
--==================================================

local function Corner(Object, Radius)
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, Radius)
    C.Parent = Object
    return C
end

local function Tween(Object, Duration, Style, Properties, Direction)
    local Animation = TweenService:Create(
        Object,
        TweenInfo.new(
            Duration,
            Style or Enum.EasingStyle.Quint,
            Direction or Enum.EasingDirection.Out
        ),
        Properties
    )

    Animation:Play()
    return Animation
end

local function GradientOutline(Object, Thickness)
    local S = Instance.new("UIStroke")
    S.Thickness = Thickness
    S.Color = Purple
    S.Transparency = 0.1
    S.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    S.Parent = Object

    local G = Instance.new("UIGradient")
    G.Color = GradientColors
    G.Rotation = 0
    G.Parent = S

    TweenService:Create(
        G,
        TweenInfo.new(
            5,
            Enum.EasingStyle.Linear,
            Enum.EasingDirection.InOut,
            -1
        ),
        {Rotation = 360}
    ):Play()

    TweenService:Create(
        S,
        TweenInfo.new(
            1.8,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut,
            -1,
            true
        ),
        {Transparency = 0.55}
    ):Play()

    return S
end

local function AddTextGradient(Label)
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = TextGradientColors
    Gradient.Rotation = 0
    Gradient.Parent = Label

    TweenService:Create(
        Gradient,
        TweenInfo.new(
            6,
            Enum.EasingStyle.Sine,
            Enum.EasingDirection.InOut,
            -1,
            true
        ),
        {Rotation = 45}
    ):Play()

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 0.45
    Stroke.Color = Purple
    Stroke.Transparency = 0.72
    Stroke.Parent = Label

    return Gradient
end

local function NewLabel(Parent, Text, Size, Position, FontSize, Font, Color, AddHighlight)
    local L = Instance.new("TextLabel")
    L.BackgroundTransparency = 1
    L.Text = Text
    L.Size = Size
    L.Position = Position
    L.TextColor3 = Color or TextColor
    L.TextSize = FontSize
    L.Font = Font or Enum.Font.Gotham
    L.TextScaled = false
    L.RichText = false
    L.Parent = Parent

    if AddHighlight then
        AddTextGradient(L)
    end

    return L
end

local function NewButton(Parent, Text, Size, Position, Color)
    local B = Instance.new("TextButton")
    B.Size = Size
    B.Position = Position
    B.BackgroundColor3 = Color
    B.BorderSizePixel = 0
    B.Text = Text
    B.TextColor3 = White
    B.TextSize = 11
    B.Font = Enum.Font.GothamBold
    B.AutoButtonColor = false
    B.ClipsDescendants = true
    B.Parent = Parent

    Corner(B, 8)

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 0.8
    Stroke.Color = SoftPurple
    Stroke.Transparency = 0.65
    Stroke.Parent = B

    B.MouseEnter:Connect(function()
        Tween(B, 0.2, Enum.EasingStyle.Quint, {
            BackgroundColor3 = Color3.fromRGB(65, 43, 110)
        })

        Tween(Stroke, 0.2, Enum.EasingStyle.Quint, {
            Transparency = 0.1
        })
    end)

    B.MouseLeave:Connect(function()
        Tween(B, 0.2, Enum.EasingStyle.Quint, {
            BackgroundColor3 = Color
        })

        Tween(Stroke, 0.2, Enum.EasingStyle.Quint, {
            Transparency = 0.65
        })
    end)

    B.MouseButton1Down:Connect(function()
        Tween(B, 0.1, Enum.EasingStyle.Quad, {
            BackgroundColor3 = DeepPurple
        })
    end)

    B.MouseButton1Up:Connect(function()
        Tween(B, 0.15, Enum.EasingStyle.Back, {
            BackgroundColor3 = Color
        })
    end)

    return B
end

--==================================================
-- MAIN PANEL
-- ORIGINAL SIZE: 190 x 210
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(190, 210)
Main.Position = UDim2.new(0.5, -95, 0.5, -105)
Main.BackgroundColor3 = Dark
Main.BorderSizePixel = 0
Main.Active = true
Main.ClipsDescendants = false
Main.Parent = Gui

Corner(Main, 12)
GradientOutline(Main, 1.8)

local MainGradient = Instance.new("UIGradient")
MainGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(27, 19, 47)),
    ColorSequenceKeypoint.new(0.5, Dark),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(18, 27, 52))
})
MainGradient.Rotation = 35
MainGradient.Parent = Main

TweenService:Create(
    MainGradient,
    TweenInfo.new(
        8,
        Enum.EasingStyle.Sine,
        Enum.EasingDirection.InOut,
        -1,
        true
    ),
    {Rotation = 125}
):Play()

-- PANEL SHADOW
local Shadow = Instance.new("UIStroke")
Shadow.Thickness = 5
Shadow.Color = Purple
Shadow.Transparency = 0.88
Shadow.Parent = Main

--==================================================
-- LOGO
--==================================================

local Logo = Instance.new("Frame")
Logo.Size = UDim2.fromOffset(23, 23)
Logo.Position = UDim2.fromOffset(9, 5)
Logo.BackgroundColor3 = Purple
Logo.BorderSizePixel = 0
Logo.ZIndex = 3
Logo.Parent = Main

Corner(Logo, 7)

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = GradientColors
LogoGradient.Rotation = 45
LogoGradient.Parent = Logo

TweenService:Create(
    LogoGradient,
    TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 405}
):Play()

local LogoStroke = Instance.new("UIStroke")
LogoStroke.Thickness = 1
LogoStroke.Color = Color3.fromRGB(195, 150, 255)
LogoStroke.Transparency = 0.2
LogoStroke.Parent = Logo

local LogoText = NewLabel(
    Logo,
    "P",
    UDim2.fromScale(1, 1),
    UDim2.fromOffset(0, 0),
    16,
    Enum.Font.GothamBlack
)
LogoText.ZIndex = 4

--==================================================
-- HEADER
--==================================================

local Header = NewLabel(
    Main,
    "PYROVEX HUB",
    UDim2.new(1, -43, 0, 25),
    UDim2.fromOffset(37, 4),
    12,
    Enum.Font.GothamBlack,
    TextColor,
    true
)

Header.TextXAlignment = Enum.TextXAlignment.Left
Header.ZIndex = 3

-- HEADER DIVIDER
local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -18, 0, 1)
Divider.Position = UDim2.fromOffset(9, 31)
Divider.BackgroundColor3 = Color3.fromRGB(65, 60, 95)
Divider.BorderSizePixel = 0
Divider.Parent = Main

local DividerGradient = Instance.new("UIGradient")
DividerGradient.Color = GradientColors
DividerGradient.Parent = Divider

TweenService:Create(
    DividerGradient,
    TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Offset = Vector2.new(1, 0)}
):Play()

--==================================================
-- ADMIN BADGE FUNCTION
--==================================================

local function UpdateBadge()
    local Character = Player.Character
    if not Character then return end

    local Head = Character:FindFirstChild("Head")
    if not Head then return end

    if Billboard then
        Billboard:Destroy()
        Billboard = nil
    end

    if not AdminEnabled then return end

    Billboard = Instance.new("BillboardGui")
    Billboard.Name = "PremiumOverheadBadge"
    Billboard.Size = UDim2.fromOffset(150, 30)
    Billboard.StudsOffset = Vector3.new(0, 3.2, 0)
    Billboard.AlwaysOnTop = true
    Billboard.MaxDistance = 200
    Billboard.Adornee = Head
    Billboard.Parent = PlayerGui

    local Container = Instance.new("Frame")
    Container.Size = UDim2.fromScale(1, 1)
    Container.BackgroundTransparency = 1
    Container.Parent = Billboard

    local Layout = Instance.new("UIListLayout")
    Layout.FillDirection = Enum.FillDirection.Horizontal
    Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    Layout.VerticalAlignment = Enum.VerticalAlignment.Center
    Layout.Padding = UDim.new(0, 5)
    Layout.Parent = Container

    local Admin = NewLabel(
        Container,
        "ADMIN",
        UDim2.fromOffset(65, 25),
        UDim2.fromOffset(0, 0),
        17,
        Enum.Font.GothamBlack,
        Red,
        true
    )

    Admin.TextStrokeColor3 = Color3.fromRGB(35, 8, 15)
    Admin.TextStrokeTransparency = 0.15
    Admin.LayoutOrder = 1

    local Verified = NewLabel(
        Container,
        utf8.char(0xE000),
        UDim2.fromOffset(22, 25),
        UDim2.fromOffset(0, 0),
        19,
        Enum.Font.GothamBold,
        Blue,
        true
    )

    Verified.LayoutOrder = 2
end

--==================================================
-- ADMIN BADGE TOGGLE
--==================================================

local AdminRow = Instance.new("Frame")
AdminRow.Size = UDim2.new(1, -18, 0, 26)
AdminRow.Position = UDim2.fromOffset(9, 36)
AdminRow.BackgroundTransparency = 1
AdminRow.Parent = Main

local AdminLabel = NewLabel(
    AdminRow,
    "Admin Badge",
    UDim2.new(1, -55, 1, 0),
    UDim2.fromOffset(0, 0),
    11,
    Enum.Font.GothamSemibold,
    TextColor,
    true
)

AdminLabel.TextXAlignment = Enum.TextXAlignment.Left

local AdminToggle = NewButton(
    AdminRow,
    "",
    UDim2.fromOffset(37, 19),
    UDim2.new(1, -37, 0.5, -9),
    Color3.fromRGB(48, 47, 63)
)

Corner(AdminToggle, 20)

local AdminKnob = Instance.new("Frame")
AdminKnob.Size = UDim2.fromOffset(13, 13)
AdminKnob.Position = UDim2.fromOffset(3, 3)
AdminKnob.BackgroundColor3 = White
AdminKnob.BorderSizePixel = 0
AdminKnob.Parent = AdminToggle

Corner(AdminKnob, 20)

local AdminKnobStroke = Instance.new("UIStroke")
AdminKnobStroke.Thickness = 0.8
AdminKnobStroke.Color = Color3.fromRGB(210, 190, 255)
AdminKnobStroke.Transparency = 0.3
AdminKnobStroke.Parent = AdminKnob

AdminToggle.Activated:Connect(function()
    AdminEnabled = not AdminEnabled

    Tween(AdminToggle, 0.4, Enum.EasingStyle.Quint, {
        BackgroundColor3 = AdminEnabled and Purple or Color3.fromRGB(48, 47, 63)
    })

    Tween(AdminKnob, 0.4, Enum.EasingStyle.Back, {
        Position = AdminEnabled and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
    })

    UpdateBadge()
end)

--==================================================
-- ANTI HIT TOGGLE
--==================================================

local AntiHitRow = Instance.new("Frame")
AntiHitRow.Size = UDim2.new(1, -18, 0, 26)
AntiHitRow.Position = UDim2.fromOffset(9, 68)
AntiHitRow.BackgroundTransparency = 1
AntiHitRow.Parent = Main

local AntiHitLabel = NewLabel(
    AntiHitRow,
    "Anti Hit",
    UDim2.new(1, -55, 1, 0),
    UDim2.fromOffset(0, 0),
    11,
    Enum.Font.GothamSemibold,
    TextColor,
    true
)

AntiHitLabel.TextXAlignment = Enum.TextXAlignment.Left

local AntiHitToggle = NewButton(
    AntiHitRow,
    "",
    UDim2.fromOffset(37, 19),
    UDim2.new(1, -37, 0.5, -9),
    Color3.fromRGB(48, 47, 63)
)

Corner(AntiHitToggle, 20)

local AntiHitKnob = Instance.new("Frame")
AntiHitKnob.Size = UDim2.fromOffset(13, 13)
AntiHitKnob.Position = UDim2.fromOffset(3, 3)
AntiHitKnob.BackgroundColor3 = White
AntiHitKnob.BorderSizePixel = 0
AntiHitKnob.Parent = AntiHitToggle

Corner(AntiHitKnob, 20)

local AntiHitKnobStroke = Instance.new("UIStroke")
AntiHitKnobStroke.Thickness = 0.8
AntiHitKnobStroke.Color = Color3.fromRGB(210, 190, 255)
AntiHitKnobStroke.Transparency = 0.3
AntiHitKnobStroke.Parent = AntiHitKnob

AntiHitToggle.Activated:Connect(function()
    AntiHitActive = not AntiHitActive

    Tween(AntiHitToggle, 0.4, Enum.EasingStyle.Quint, {
        BackgroundColor3 = AntiHitActive and Purple or Color3.fromRGB(48, 47, 63)
    })

    Tween(AntiHitKnob, 0.4, Enum.EasingStyle.Back, {
        Position = AntiHitActive and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
    })

    print("🛡️ Anti Hit:", AntiHitActive and "ON" or "OFF")
end)

--==================================================
-- ANTI AFK LOCKED
--==================================================

local AntiAfkRow = Instance.new("Frame")
AntiAfkRow.Size = UDim2.new(1, -18, 0, 26)
AntiAfkRow.Position = UDim2.fromOffset(9, 100)
AntiAfkRow.BackgroundTransparency = 1
AntiAfkRow.Parent = Main

local AntiAfkLabel = NewLabel(
    AntiAfkRow,
    "Anti AFK  🔒",
    UDim2.new(1, -55, 1, 0),
    UDim2.fromOffset(0, 0),
    11,
    Enum.Font.GothamSemibold,
    Muted,
    false
)

AntiAfkLabel.TextXAlignment = Enum.TextXAlignment.Left

--==================================================
-- SPEED INPUT
--==================================================

local SpeedBox = Instance.new("TextBox")
SpeedBox.Name = "SpeedAmount"
SpeedBox.Size = UDim2.new(1, -18, 0, 25)
SpeedBox.Position = UDim2.fromOffset(9, 132)
SpeedBox.BackgroundColor3 = Color3.fromRGB(25, 24, 42)
SpeedBox.BorderSizePixel = 0
SpeedBox.PlaceholderText = "Enter Speed Amount"
SpeedBox.PlaceholderColor3 = Muted
SpeedBox.Text = ""
SpeedBox.TextColor3 = TextColor
SpeedBox.TextSize = 10
SpeedBox.Font = Enum.Font.GothamMedium
SpeedBox.ClearTextOnFocus = false
SpeedBox.TextXAlignment = Enum.TextXAlignment.Center
SpeedBox.Parent = Main

Corner(SpeedBox, 7)

local SpeedGradient = Instance.new("UIGradient")
SpeedGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(29, 22, 50)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(25, 24, 42)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 32, 60))
})
SpeedGradient.Rotation = 0
SpeedGradient.Parent = SpeedBox

GradientOutline(SpeedBox, 1.3)

SpeedBox.Focused:Connect(function()
    Tween(SpeedBox, 0.25, Enum.EasingStyle.Quint, {
        BackgroundColor3 = Color3.fromRGB(40, 30, 68)
    })
end)

SpeedBox.FocusLost:Connect(function()
    Tween(SpeedBox, 0.25, Enum.EasingStyle.Quint, {
        BackgroundColor3 = Color3.fromRGB(25, 24, 42)
    })
end)

-- NUMBERS ONLY
SpeedBox:GetPropertyChangedSignal("Text"):Connect(function()
    local CleanText = SpeedBox.Text:gsub("%D", "")
    if SpeedBox.Text ~= CleanText then
        SpeedBox.Text = CleanText
    end
end)

--==================================================
-- APPLY SPEED BUTTON
--==================================================

local ApplySpeed = NewButton(
    Main,
    "Apply Speed",
    UDim2.new(1, -18, 0, 27),
    UDim2.fromOffset(9, 165),
    Color3.fromRGB(30, 27, 53)
)

ApplySpeed.TextSize = 11
ApplySpeed.Font = Enum.Font.GothamBold

local ApplyGradient = Instance.new("UIGradient")
ApplyGradient.Color = GradientColors
ApplyGradient.Rotation = 0
ApplyGradient.Transparency = NumberSequence.new({
    NumberSequenceKeypoint.new(0, 0.75),
    NumberSequenceKeypoint.new(0.5, 0.9),
    NumberSequenceKeypoint.new(1, 0.75)
})
ApplyGradient.Parent = ApplySpeed

TweenService:Create(
    ApplyGradient,
    TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
    {Rotation = 360}
):Play()

GradientOutline(ApplySpeed, 1.4)

ApplySpeed.MouseEnter:Connect(function()
    Tween(ApplySpeed, 0.2, Enum.EasingStyle.Quint, {
        BackgroundColor3 = Color3.fromRGB(47, 39, 83)
    })
end)

ApplySpeed.MouseLeave:Connect(function()
    Tween(ApplySpeed, 0.2, Enum.EasingStyle.Quint, {
        BackgroundColor3 = Color3.fromRGB(30, 27, 53)
    })
end)

--==================================================
-- ANTI-HIT FUNCTION
-- ORIGINAL LOGIC PRESERVED
--==================================================

_G.AntiHitActive = false

if _G.AntiHitConnection then
    _G.AntiHitConnection:Disconnect()
end

_G.AntiHitConnection = RunService.Stepped:Connect(function()
    if not _G.AntiHitActive then return end

    local character = Player.Character

    if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
        for _, part in pairs(character:GetChildren()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
            end
        end

        pcall(function()
            local hazards = Workspace:FindFirstChild("Guards")
                or Workspace:FindFirstChild("Monsters")
                or Workspace:FindFirstChild("Traps")
                or Workspace:FindFirstChild("Obstacles")

            if hazards then
                for _, hazard in pairs(hazards:GetDescendants()) do
                    if hazard:IsA("BasePart") then
                        local touchInterest = hazard:FindFirstChildWhichIsA("TouchTransmitter")
                            or hazard:FindFirstChild("TouchInterest")

                        if touchInterest then
                            touchInterest:Destroy()
                        end

                        hazard.CanCollide = false
                    end
                end
            end
        end)
    end
end)

print("🛡️ Custom Anti-Hit / God-Mode Function Loaded Successfully!")

--==================================================
-- SAFE BYPASS SPEED LOOP
-- ORIGINAL LOGIC PRESERVED
--==================================================

_G.UltimateSpeedConnection = nil

local function UpdateSpeedSystem()
    if _G.UltimateSpeedConnection then
        _G.UltimateSpeedConnection:Disconnect()
    end


        if not _G.BypassActive then return end

    _G.UltimateSpeedConnection = RunService.Heartbeat:Connect(function(deltaTime)
        if not _G.BypassActive then return end

        local character = Player.Character
        local rootPart = character and character:FindFirstChild("HumanoidRootPart")
        local humanoid = character and character:FindFirstChild("Humanoid")

        if rootPart and humanoid and humanoid.Health > 0 then
            if humanoid.MoveDirection.Magnitude > 0 then
                local velocityBoost = humanoid.MoveDirection * (_G.SafeBypassSpeed * deltaTime)

                rootPart.CFrame = rootPart.CFrame + Vector3.new(
                    velocityBoost.X,
                    0,
                    velocityBoost.Z
                )

                rootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
            end
        end
    end)
end

-- APPLY SPEED BUTTON CLICK
ApplySpeed.Activated:Connect(function()
    local input = SpeedBox.Text
    local speedAmount = tonumber(input)

    if speedAmount and speedAmount > 0 then
        _G.SafeBypassSpeed = speedAmount
        _G.BypassActive = true
        UpdateSpeedSystem()

        print("💎 Speed Updated! Current Speed: " .. tostring(_G.SafeBypassSpeed))
    else
        _G.BypassActive = false

        if _G.UltimateSpeedConnection then
            _G.UltimateSpeedConnection:Disconnect()
            _G.UltimateSpeedConnection = nil
        end

        print("Speed Disabled — enter a number to enable")
    end
end)

--==================================================
-- DRAG SYSTEM
--==================================================

local function MakeDraggable(Object, Handle)
    local Dragging = false
    local DragStart
    local StartPosition
    local DragInput

    Handle.InputBegan:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseButton1
            or Input.UserInputType == Enum.UserInputType.Touch then

            Dragging = true
            DragStart = Input.Position
            StartPosition = Object.Position

            Input.Changed:Connect(function()
                if Input.UserInputState == Enum.UserInputState.End then
                    Dragging = false
                end
            end)
        end
    end)

    Handle.InputChanged:Connect(function(Input)
        if Input.UserInputType == Enum.UserInputType.MouseMovement
            or Input.UserInputType == Enum.UserInputType.Touch then

            DragInput = Input
        end
    end)

    UserInputService.InputChanged:Connect(function()
        if Dragging and DragInput then
            local Delta = DragInput.Position - DragStart

            Object.Position = UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        end
    end)
end

MakeDraggable(Main, Header)

--==================================================
-- RESPAWN SUPPORT
--==================================================

Player.CharacterAdded:Connect(function()
    task.wait(1)

    UpdateBadge()

    if _G.BypassActive then
        UpdateSpeedSystem()
    end
end)

--==================================================
-- INITIALIZE
--==================================================

_G.SafeBypassSpeed = 0
_G.BypassActive = false

print("💎 PYROVEX HUB Loaded — Recommended Speed: 280")
print("🔒 Anti AFK — Premium Feature Locked")
print("✨ Premium UI Enhancement Loaded Successfully!")
