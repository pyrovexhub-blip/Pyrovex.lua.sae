-- Pyrovex Hub - Game Verification System
local SupportedGameID = 1234567890 -- <<< PALITAN ITO ng totoong Place ID ng Steal an Egg

-- Kunin ang kasalukuyang Place ID ng laro
local currentPlaceId = game.PlaceId

if currentPlaceId == SupportedGameID then
    -- DITO ILALAGAY ANG BUONG SCRIPT NG STEAL AN EGG
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Pyrovex Hub",
        Text = "Script executed successfully! Enjoy hacking.",
        Duration = 5
    })
    
    print("Welcome to Pyrovex Hub - Steal an Egg Script Loaded.")
    
    -- [Ilagay ang iyong Anti-AFK, Spawner, o Bypass code dito]
    
else
    -- KUNG HINDI "STEAL AN EGG" ANG LARO, LALABAS ANG NOTIFICATION NA ITO
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Pyrovex Hub Error",
        Text = "Not Supported Game! This script is only for Steal an Egg.",
        Duration = 7
    })
    
    warn("Pyrovex Hub: Execution blocked. Unsupported game detected.")
end

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

local Blue = Color3.fromRGB(55, 115, 255)
local Purple = Color3.fromRGB(145, 65, 255)
local Dark = Color3.fromRGB(18, 17, 29)
local TextColor = Color3.fromRGB(240, 237, 255)
local Red = Color3.fromRGB(255, 65, 90)
local Muted = Color3.fromRGB(145, 140, 165)

local GradientColors = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Purple),
    ColorSequenceKeypoint.new(0.35, Blue),
    ColorSequenceKeypoint.new(0.7, Color3.fromRGB(30, 30, 65)),
    ColorSequenceKeypoint.new(1, Purple)
})

local Gui = Instance.new("ScreenGui")
Gui.Name = "PremiumBadgePanel"
Gui.ResetOnSpawn = false
Gui.DisplayOrder = 100
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

local function Corner(Object, Radius)
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, Radius)
    C.Parent = Object
    return C
end

local function GradientOutline(Object, Thickness)
    local S = Instance.new("UIStroke")
    S.Thickness = Thickness
    S.Color = Purple
    S.Parent = Object

    local G = Instance.new("UIGradient")
    G.Color = GradientColors
    G.Parent = S

    TweenService:Create(
        G,
        TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, -1),
        {Rotation = 360}
    ):Play()

    TweenService:Create(
        S,
        TweenInfo.new(1.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true),
        {Transparency = 0.4}
    ):Play()

    return S
end

local function AddTextGradient(Label)
    local Gradient = Instance.new("UIGradient")
    Gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
        ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200, 180, 255)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(130, 170, 255))
    })
    Gradient.Rotation = 45
    Gradient.Parent = Label

    local Stroke = Instance.new("UIStroke")
    Stroke.Thickness = 0.4
    Stroke.Color = Purple
    Stroke.Transparency = 0.75
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
    B.TextColor3 = Color3.new(1, 1, 1)
    B.TextSize = 11
    B.Font = Enum.Font.GothamBold
    B.AutoButtonColor = false
    B.Parent = Parent
    Corner(B, 8)
    return B
end

-- MAIN PANEL
local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(190, 210)
Main.Position = UDim2.new(0.5, -95, 0.5, -105)
Main.BackgroundColor3 = Dark
Main.BorderSizePixel = 0
Main.Active = true
Main.Parent = Gui
Corner(Main, 12)
GradientOutline(Main, 1.6)

-- LOGO
local Logo = Instance.new("Frame")
Logo.Size = UDim2.fromOffset(23, 23)
Logo.Position = UDim2.fromOffset(9, 5)
Logo.BackgroundColor3 = Purple
Logo.BorderSizePixel = 0
Logo.Parent = Main
Corner(Logo, 7)

local LogoGradient = Instance.new("UIGradient")
LogoGradient.Color = ColorSequence.new(Blue, Purple)
LogoGradient.Rotation = 45
LogoGradient.Parent = Logo

local LogoText = NewLabel(
    Logo,
    "P",
    UDim2.fromScale(1, 1),
    UDim2.fromOffset(0, 0),
    16,
    Enum.Font.GothamBlack
)

-- TITLE
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

local Divider = Instance.new("Frame")
Divider.Size = UDim2.new(1, -18, 0, 1)
Divider.Position = UDim2.fromOffset(9, 31)
Divider.BackgroundColor3 = Color3.fromRGB(65, 60, 95)
Divider.BorderSizePixel = 0
Divider.Parent = Main

-- ADMIN BADGE
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

-- ADMIN BADGE TOGGLE
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
AdminKnob.BackgroundColor3 = Color3.fromRGB(245, 245, 255)
AdminKnob.BorderSizePixel = 0
AdminKnob.Parent = AdminToggle
Corner(AdminKnob, 20)

AdminToggle.Activated:Connect(function()
    AdminEnabled = not AdminEnabled
    TweenService:Create(AdminToggle, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        BackgroundColor3 = AdminEnabled and Purple or Color3.fromRGB(48, 47, 63)
    }):Play()
    TweenService:Create(AdminKnob, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Position = AdminEnabled and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
    }):Play()
    UpdateBadge()
end)

-- ANTI HIT TOGGLE
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
AntiHitKnob.BackgroundColor3 = Color3.fromRGB(245, 245, 255)
AntiHitKnob.BorderSizePixel = 0
AntiHitKnob.Parent = AntiHitToggle
Corner(AntiHitKnob, 20)

AntiHitToggle.Activated:Connect(function()
    AntiHitActive = not AntiHitActive
    TweenService:Create(AntiHitToggle, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
        BackgroundColor3 = AntiHitActive and Purple or Color3.fromRGB(48, 47, 63)
    }):Play()
    TweenService:Create(AntiHitKnob, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Position = AntiHitActive and UDim2.fromOffset(21, 3) or UDim2.fromOffset(3, 3)
    }):Play()
    print("🛡️ Anti Hit:", AntiHitActive and "ON" or "OFF")
end)

-- ANTI AFK (LOCKED/PREMIUM — NO TOGGLE, NO HIGHLIGHT)
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

-- SPEED AMOUNT INPUT
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
GradientOutline(SpeedBox, 1.2)

-- NUMBERS ONLY
SpeedBox:GetPropertyChangedSignal("Text"):Connect(function()
    local CleanText = SpeedBox.Text:gsub("%D", "")
    if SpeedBox.Text ~= CleanText then
        SpeedBox.Text = CleanText
    end
end)

-- APPLY SPEED BUTTON
local ApplySpeed = NewButton(
    Main,
    "Apply Speed",
    UDim2.new(1, -18, 0, 27),
    UDim2.fromOffset(9, 165),
    Color3.fromRGB(30, 27, 53)
)
ApplySpeed.TextSize = 11
GradientOutline(ApplySpeed, 1.3)

ApplySpeed.MouseEnter:Connect(function()
    TweenService:Create(ApplySpeed, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(47, 39, 83)
    }):Play()
end)

ApplySpeed.MouseLeave:Connect(function()
    TweenService:Create(ApplySpeed, TweenInfo.new(0.2), {
        BackgroundColor3 = Color3.fromRGB(30, 27, 53)
    }):Play()
end)

-- ANTI-HIT FUNCTION
_G.AntiHitActive = false

if _G.AntiHitConnection then _G.AntiHitConnection:Disconnect() end

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
                        local touchInterest = hazard:FindFirstChildWhichIsA("TouchTransmitter") or hazard:FindFirstChild("TouchInterest")
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

-- SAFE BYPASS SPEED LOOP
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
                rootPart.CFrame = rootPart.CFrame + Vector3.new(velocityBoost.X, 0, velocityBoost.Z)
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

-- DRAG SYSTEM
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

    UserInputService.InputChanged:Connect(function(Input)
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

-- RESPAWN SUPPORT
Player.CharacterAdded:Connect(function()
    task.wait(1)
    UpdateBadge()
    if _G.BypassActive then
        UpdateSpeedSystem()
    end
end)

-- INITIALIZE
_G.SafeBypassSpeed = 0
_G.BypassActive = false
print("💎 PYROVEX HUB Loaded — Recommended Speed: 280")
print("🔒 Anti AFK — Premium Feature Locked")
