-- EZZZZZZZZZZZZZZZZZZZZZZZZ LUNDEV WAS HERE.

local Kavo = {}

local tween = game:GetService("TweenService")
local tweeninfo = TweenInfo.new
local input = game:GetService("UserInputService")
local run = game:GetService("RunService")

local Utility = {}
local Objects = {}
function Kavo:DraggingEnabled(frame, parent)
  parent = parent or frame

  -- stolen from wally or kiriot, kek
  local dragging = false
  local dragInput, mousePos, framePos

  frame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
      dragging = true
      mousePos = input.Position
      framePos = parent.Position

      input.Changed:Connect(function()
        if input.UserInputState == Enum.UserInputState.End then
          dragging = false
        end
      end)
    end
  end)

  frame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
      dragInput = input
    end
  end)

  input.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
      local delta     = input.Position - mousePos
      parent.Position = UDim2.new(framePos.X.Scale, framePos.X.Offset + delta.X, framePos.Y.Scale,
        framePos.Y.Offset + delta.Y)
    end
  end)
end

function Utility:TweenObject(obj, properties, duration, ...)
  tween:Create(obj, tweeninfo(duration, ...), properties):Play()
end

-- Utility function to play click sound
local function playClickSound()
  local sound = Instance.new("Sound")
  sound.SoundId = ""
  sound.Volume = 0.5
  sound.Parent = game:GetService("SoundService")
  sound:Play()
  sound.Ended:Connect(function()
    sound:Destroy()
  end)
end

local themes = {
  SchemeColor = Color3.fromRGB(74, 99, 135),
  Background = Color3.fromRGB(36, 37, 43),
  Header = Color3.fromRGB(28, 29, 34),
  TextColor = Color3.fromRGB(255, 255, 255),
  ElementColor = Color3.fromRGB(32, 32, 38)
}
local themeStyles = {
  DarkTheme = {
    SchemeColor = Color3.fromRGB(64, 64, 64),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
  },
  LightTheme = {
    SchemeColor = Color3.fromRGB(150, 150, 150),
    Background = Color3.fromRGB(255, 255, 255),
    Header = Color3.fromRGB(200, 200, 200),
    TextColor = Color3.fromRGB(0, 0, 0),
    ElementColor = Color3.fromRGB(224, 224, 224)
  },
  BloodTheme = {
    SchemeColor = Color3.fromRGB(227, 27, 27),
    Background = Color3.fromRGB(10, 10, 10),
    Header = Color3.fromRGB(5, 5, 5),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 20)
  },
  GrapeTheme = {
    SchemeColor = Color3.fromRGB(166, 71, 214),
    Background = Color3.fromRGB(64, 50, 71),
    Header = Color3.fromRGB(36, 28, 41),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(74, 58, 84)
  },
  Ocean = {
    SchemeColor = Color3.fromRGB(86, 76, 251),
    Background = Color3.fromRGB(26, 32, 58),
    Header = Color3.fromRGB(38, 45, 71),
    TextColor = Color3.fromRGB(200, 200, 200),
    ElementColor = Color3.fromRGB(38, 45, 71)
  },
  Midnight = {
    SchemeColor = Color3.fromRGB(26, 189, 158),
    Background = Color3.fromRGB(44, 62, 82),
    Header = Color3.fromRGB(57, 81, 105),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(52, 74, 95)
  },
  Sentinel = {
    SchemeColor = Color3.fromRGB(230, 35, 69),
    Background = Color3.fromRGB(32, 32, 32),
    Header = Color3.fromRGB(24, 24, 24),
    TextColor = Color3.fromRGB(119, 209, 138),
    ElementColor = Color3.fromRGB(24, 24, 24)
  },
  Synapse = {
    SchemeColor = Color3.fromRGB(46, 48, 43),
    Background = Color3.fromRGB(13, 15, 12),
    Header = Color3.fromRGB(36, 38, 35),
    TextColor = Color3.fromRGB(152, 99, 53),
    ElementColor = Color3.fromRGB(24, 24, 24)
  },
  Serpent = {
    SchemeColor = Color3.fromRGB(0, 166, 58),
    Background = Color3.fromRGB(31, 41, 43),
    Header = Color3.fromRGB(22, 29, 31),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(22, 29, 31)
  },
  -- 11 more themes below
  Forest = {
    SchemeColor = Color3.fromRGB(34, 139, 34),
    Background = Color3.fromRGB(24, 34, 24),
    Header = Color3.fromRGB(20, 30, 20),
    TextColor = Color3.fromRGB(220, 255, 220),
    ElementColor = Color3.fromRGB(30, 50, 30)
  },
  Sunset = {
    SchemeColor = Color3.fromRGB(255, 94, 77),
    Background = Color3.fromRGB(255, 195, 113),
    Header = Color3.fromRGB(255, 159, 67),
    TextColor = Color3.fromRGB(80, 40, 20),
    ElementColor = Color3.fromRGB(255, 159, 67)
  },
  Sky = {
    SchemeColor = Color3.fromRGB(135, 206, 250),
    Background = Color3.fromRGB(176, 224, 230),
    Header = Color3.fromRGB(70, 130, 180),
    TextColor = Color3.fromRGB(0, 0, 64),
    ElementColor = Color3.fromRGB(176, 224, 230)
  },
  Lemon = {
    SchemeColor = Color3.fromRGB(255, 247, 0),
    Background = Color3.fromRGB(255, 255, 204),
    Header = Color3.fromRGB(255, 255, 153),
    TextColor = Color3.fromRGB(128, 128, 0),
    ElementColor = Color3.fromRGB(255, 255, 153)
  },
  Rose = {
    SchemeColor = Color3.fromRGB(255, 102, 178),
    Background = Color3.fromRGB(255, 228, 225),
    Header = Color3.fromRGB(255, 182, 193),
    TextColor = Color3.fromRGB(128, 0, 64),
    ElementColor = Color3.fromRGB(255, 182, 193)
  },
  Coffee = {
    SchemeColor = Color3.fromRGB(111, 78, 55),
    Background = Color3.fromRGB(60, 40, 30),
    Header = Color3.fromRGB(80, 60, 50),
    TextColor = Color3.fromRGB(255, 230, 200),
    ElementColor = Color3.fromRGB(80, 60, 50)
  },
  Ice = {
    SchemeColor = Color3.fromRGB(173, 216, 230),
    Background = Color3.fromRGB(224, 255, 255),
    Header = Color3.fromRGB(176, 224, 230),
    TextColor = Color3.fromRGB(0, 64, 128),
    ElementColor = Color3.fromRGB(176, 224, 230)
  },
  Gold = {
    SchemeColor = Color3.fromRGB(255, 215, 0),
    Background = Color3.fromRGB(255, 248, 220),
    Header = Color3.fromRGB(238, 232, 170),
    TextColor = Color3.fromRGB(128, 96, 0),
    ElementColor = Color3.fromRGB(238, 232, 170)
  },
  Cyber = {
    SchemeColor = Color3.fromRGB(0, 255, 255),
    Background = Color3.fromRGB(10, 10, 30),
    Header = Color3.fromRGB(20, 20, 40),
    TextColor = Color3.fromRGB(0, 255, 255),
    ElementColor = Color3.fromRGB(20, 20, 40)
  },
  Peach = {
    SchemeColor = Color3.fromRGB(255, 203, 164),
    Background = Color3.fromRGB(255, 229, 180),
    Header = Color3.fromRGB(255, 218, 185),
    TextColor = Color3.fromRGB(120, 80, 40),
    ElementColor = Color3.fromRGB(255, 218, 185)
  },
  Lavender = {
    SchemeColor = Color3.fromRGB(181, 126, 220),
    Background = Color3.fromRGB(230, 230, 250),
    Header = Color3.fromRGB(216, 191, 216),
    TextColor = Color3.fromRGB(80, 60, 120),
    ElementColor = Color3.fromRGB(216, 191, 216)
  }
}
local oldTheme = ""

local SettingsT = {

}

local Name = "KavoConfig.JSON"

local function generateLibName()
    -- Create a more robust random name
    local chars = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
                  "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
                  "0","1","2","3","4","5","6","7","8","9"}
    local str = ""
    for i = 1, 20 do
        str = str .. chars[math.random(1, #chars)]
    end
    return str
end

local LibName = generateLibName()

-- Add error handling for Settings
pcall(function()
    if not pcall(function() readfile(Name) end) then
        writefile(Name, game:service('HttpService'):JSONEncode(SettingsT))
        Settings = game:service('HttpService'):JSONDecode(readfile(Name))
    else
        Settings = game:service('HttpService'):JSONDecode(readfile(Name))
    end
end)

function Kavo:ToggleUI()
    if not LibName then return end

    if game.CoreGui:FindFirstChild(LibName) then
        game.CoreGui[LibName].Enabled = not game.CoreGui[LibName].Enabled
    end
end

function Kavo.CreateLib(kavName, themeList)
    kavName = kavName or "Library"

    -- Validate theme
    if type(themeList) == "string" then
        themeList = themeStyles[themeList] or themes
    elseif type(themeList) ~= "table" then
        themeList = themes
    end

    -- Validate theme properties
    if not themeList.SchemeColor then themeList.SchemeColor = themes.SchemeColor end
    if not themeList.Background then themeList.Background = themes.Background end
    if not themeList.Header then themeList.Header = themes.Header end
    if not themeList.TextColor then themeList.TextColor = themes.TextColor end
    if not themeList.ElementColor then themeList.ElementColor = themes.ElementColor end


  themeList = themeList or {}
  local selectedTab
  kavName = kavName or "Library"
  table.insert(Kavo, kavName)
  for i, v in pairs(game.CoreGui:GetChildren()) do
    if v:IsA("ScreenGui") and v.Name == kavName then
      v:Destroy()
    end
  end
  local ScreenGui = Instance.new("ScreenGui")
  local Main = Instance.new("Frame")
  local MainCorner = Instance.new("UICorner")
  local MainHeader = Instance.new("Frame")
  local headerCover = Instance.new("UICorner")
  local coverup = Instance.new("Frame")
  local title = Instance.new("TextLabel")
  local close = Instance.new("ImageButton")
  local MainSide = Instance.new("Frame")
  local sideCorner = Instance.new("UICorner")
  local coverup_2 = Instance.new("Frame")
  local tabFrames = Instance.new("Frame")
  local tabListing = Instance.new("UIListLayout")
  local pages = Instance.new("Frame")
  local Pages = Instance.new("Folder")
  local infoContainer = Instance.new("Frame")

  local blurFrame = Instance.new("Frame")

  Kavo:DraggingEnabled(MainHeader, Main)

  blurFrame.Name = "blurFrame"
  blurFrame.Parent = pages
  blurFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
  blurFrame.BackgroundTransparency = 1
  blurFrame.BorderSizePixel = 0
  blurFrame.Position = UDim2.new(-0.0222222228, 0, -0.0371747203, 0)
  blurFrame.Size = UDim2.new(0, 376, 0, 289)
  blurFrame.ZIndex = 999

  ScreenGui.Parent = game.CoreGui
  ScreenGui.Name = LibName
  ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  ScreenGui.ResetOnSpawn = false

  -- Add floating minimize toggle button as a circular image
  local ToggleGui = Instance.new("ScreenGui")
  ToggleGui.Name = "KavoMinimizeToggle"
  ToggleGui.Parent = game.CoreGui
  ToggleGui.ResetOnSpawn = false

  local ToggleButton = Instance.new("ImageButton")
  ToggleButton.Size = UDim2.new(0, 40, 0, 40)
  ToggleButton.Position = UDim2.new(0, 10, 0, 10)
  ToggleButton.BackgroundColor3 = Color3.fromRGB(30, 144, 255)
  ToggleButton.Image = "rbxassetid://97689651711942" -- Updated image asset ID
  ToggleButton.Parent = ToggleGui
  ToggleButton.Active = true
  ToggleButton.Draggable = true

  -- Make it a circle
  local UICorner = Instance.new("UICorner")
  UICorner.CornerRadius = UDim.new(1, 0)
  UICorner.Parent = ToggleButton

  -- Add state tracking for header-only mode
local minimized = false
local originalPos = nil

function animateMain(open, headerOnly)
    if originalPos == nil then
        originalPos = Main.Position
    end

    local goal = {}
    if headerOnly then
        goal.Size = UDim2.new(0, 525, 0, 29)
        goal.Position = originalPos + UDim2.new(0, 0, 0, 144)
    elseif open then
        goal.Size = UDim2.new(0, 525, 0, 318)
        goal.Position = originalPos
        goal.BackgroundTransparency = 0
    else
        goal.Size = UDim2.new(0, 0, 0, 0)
        goal.Position = UDim2.new(0.5, 0, 0.5, 0)
        goal.BackgroundTransparency = 1
    end

    local tween = game:GetService("TweenService"):Create(Main,
        TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
        goal
    )
    tween:Play()
    return tween
end

  ToggleButton.MouseButton1Click:Connect(function()
    if not ScreenGui.Enabled then
      ScreenGui.Enabled = true
      Main.Size = UDim2.new(0, 0, 0, 0)
      Main.Position = UDim2.new(0.5, 0, 0.5, 0)
      Main.BackgroundTransparency = 1
      animateMain(true)
    else
      local t = animateMain(false)
      t.Completed:Connect(function()
          ScreenGui.Enabled = false
      end)
    end
  end)

  Main.Name = "Main"
  Main.Parent = ScreenGui
  Main.BackgroundColor3 = themeList.Background
  Main.ClipsDescendants = true
  -- Center the GUI on the screen
  Main.Position = UDim2.new(0.5, -262, 0.5, -159)   -- (525/2=262, 318/2=159)
  Main.Size = UDim2.new(0, 525, 0, 318)

  MainCorner.CornerRadius = UDim.new(0, 4)
  MainCorner.Name = "MainCorner"
  MainCorner.Parent = Main

  MainHeader.Name = "MainHeader"
  MainHeader.Parent = Main
  MainHeader.BackgroundColor3 = themeList.Header
  Objects[MainHeader] = "BackgroundColor3"
  MainHeader.Size = UDim2.new(0, 525, 0, 29)
  headerCover.CornerRadius = UDim.new(0, 4)
  headerCover.Name = "headerCover"
  headerCover.Parent = MainHeader

  coverup.Name = "coverup"
  coverup.Parent = MainHeader
  coverup.BackgroundColor3 = themeList.Header
  Objects[coverup] = "BackgroundColor3"
  coverup.BorderSizePixel = 0
  coverup.Position = UDim2.new(0, 0, 0.758620679, 0)
  coverup.Size = UDim2.new(0, 525, 0, 7)

  title.Name = "title"
  title.Parent = MainHeader
  title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  title.BackgroundTransparency = 1.000
  title.BorderSizePixel = 0
  title.Position = UDim2.new(0.0171428565, 0, 0.344827592, 0)
  title.Size = UDim2.new(0, 204, 0, 8)
  title.Font = Enum.Font.Gotham
  title.RichText = true
  title.Text = kavName
  title.TextColor3 = Color3.fromRGB(245, 245, 245)
  title.TextSize = 16.000
  title.TextXAlignment = Enum.TextXAlignment.Left

  -- Custom close and minimize buttons with text
  local close = Instance.new("TextButton")
  close.Name = "close"
  close.Parent = MainHeader
  close.BackgroundTransparency = 1.000
  close.Position = UDim2.new(0.949, 0, 0.137, 0)
  close.Size = UDim2.new(0, 28, 0, 21)
  close.ZIndex = 2
  close.Text = "X"
  close.Font = Enum.Font.GothamBold
  close.TextColor3 = Color3.fromRGB(255, 80, 80)
  close.TextSize = 18
  close.MouseButton1Click:Connect(function()
    local dialog = Instance.new("Frame")
    dialog.Name = "CloseDialog"
    dialog.Parent = Main
    dialog.BackgroundColor3 = themeList.ElementColor
    dialog.Position = UDim2.new(0.5, -125, 0.5, -50)
    dialog.Size = UDim2.new(0, 250, 0, 100)
    dialog.ZIndex = 99

    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 6)
    UICorner.Parent = dialog

    local message = Instance.new("TextLabel")
    message.Parent = dialog
    message.BackgroundTransparency = 1
    message.Position = UDim2.new(0, 10, 0, 10)
    message.Size = UDim2.new(1, -20, 0, 40)
    message.Font = Enum.Font.GothamSemibold
    message.Text = "Are you sure you want to close?"
    message.TextColor3 = themeList.TextColor
    message.TextSize = 16

    local yes = Instance.new("TextButton")
    yes.Name = "Yes"
    yes.Parent = dialog
    yes.BackgroundColor3 = themeList.SchemeColor
    yes.Position = UDim2.new(0.1, 0, 0.6, 0)
    yes.Size = UDim2.new(0.35, 0, 0, 30)
    yes.Font = Enum.Font.GothamSemibold
    yes.Text = "Yes"
    yes.TextColor3 = Color3.fromRGB(255, 255, 255)
    yes.TextSize = 14

    local no = Instance.new("TextButton")
    no.Name = "No"
    no.Parent = dialog
    no.BackgroundColor3 = themeList.SchemeColor
    no.Position = UDim2.new(0.55, 0, 0.6, 0)
    no.Size = UDim2.new(0.35, 0, 0, 30)
    no.Font = Enum.Font.GothamSemibold
    no.Text = "No"
    no.TextColor3 = Color3.fromRGB(255, 255, 255)
    no.TextSize = 14

    Instance.new("UICorner", yes).CornerRadius = UDim.new(0, 4)
    Instance.new("UICorner", no).CornerRadius = UDim.new(0, 4)

    yes.MouseButton1Click:Connect(function()
        -- Close with animation
        minimized = false
        local t = animateMain(false)
        t.Completed:Wait()
        for _, gui in ipairs(game.CoreGui:GetChildren()) do
            if gui:IsA("ScreenGui") and (gui.Name == LibName or gui.Name == "KavoMinimizeToggle") then
                gui:Destroy()
            end
        end
    end)

    no.MouseButton1Click:Connect(function()
        dialog:Destroy()
    end)
  end)

  -- Add Minimize button next to Close with text
  local minimize = Instance.new("TextButton")
  minimize.Name = "minimize"
  minimize.Parent = MainHeader
  minimize.BackgroundTransparency = 1.000
  minimize.Position = UDim2.new(0.895, 0, 0.137, 0)
  minimize.Size = UDim2.new(0, 28, 0, 21)
  minimize.ZIndex = 2
  minimize.Text = "-"
  minimize.Font = Enum.Font.GothamBold
  minimize.TextColor3 = Color3.fromRGB(255, 255, 100)
  minimize.TextSize = 22
  minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    minimize.Text = minimized and "+" or "-"
    animateMain(true, minimized)
  end)

  MainSide.Name = "MainSide"
  MainSide.Parent = Main
  MainSide.BackgroundColor3 = themeList.Header
  Objects[MainSide] = "Header"
  MainSide.Position = UDim2.new(-7.4505806e-09, 0, 0.0911949649, 0)
  MainSide.Size = UDim2.new(0, 149, 0, 289)

  sideCorner.CornerRadius = UDim.new(0, 4)
  sideCorner.Name = "sideCorner"
  sideCorner.Parent = MainSide

  coverup_2.Name = "coverup"
  coverup_2.Parent = MainSide
  coverup_2.BackgroundColor3 = themeList.Header
  Objects[coverup_2] = "Header"
  coverup_2.BorderSizePixel = 0
  coverup_2.Position = UDim2.new(0.949939311, 0, 0, 0)
  coverup_2.Size = UDim2.new(0, 7, 0, 289)

  tabFrames.Name = "tabFrames"
  tabFrames.Parent = MainSide
  tabFrames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  tabFrames.BackgroundTransparency = 1.000
  tabFrames.Position = UDim2.new(0.0438990258, 0, -0.00066378375, 0)
  tabFrames.Size = UDim2.new(0, 135, 0, 283)

  tabListing.Name = "tabListing"
  tabListing.Parent = tabFrames
  tabListing.SortOrder = Enum.SortOrder.LayoutOrder

  pages.Name = "pages"
  pages.Parent = Main
  pages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  pages.BackgroundTransparency = 1.000
  pages.BorderSizePixel = 0
  pages.Position = UDim2.new(0.299047589, 0, 0.122641519, 0)
  pages.Size = UDim2.new(0, 360, 0, 269)

  Pages.Name = "Pages"
  Pages.Parent = pages

  infoContainer.Name = "infoContainer"
  infoContainer.Parent = Main
  infoContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
  infoContainer.BackgroundTransparency = 1.000
  infoContainer.BorderColor3 = Color3.fromRGB(27, 42, 53)
  infoContainer.ClipsDescendants = true
  infoContainer.Position = UDim2.new(0.299047619, 0, 0.874213815, 0)
  infoContainer.Size = UDim2.new(0, 368, 0, 33)


  coroutine.wrap(function()
    while wait() do
      Main.BackgroundColor3 = themeList.Background
      MainHeader.BackgroundColor3 = themeList.Header
      MainSide.BackgroundColor3 = themeList.Header
      coverup_2.BackgroundColor3 = themeList.Header
      coverup.BackgroundColor3 = themeList.Header
    end
  end)()

  function Kavo:ChangeColor(prope, color)
    if prope == "Background" then
      themeList.Background = color
    elseif prope == "SchemeColor" then
      themeList.SchemeColor = color
    elseif prope == "Header" then
      themeList.Header = color
    elseif prope == "TextColor" then
      themeList.TextColor = color
    elseif prope == "ElementColor" then
      themeList.ElementColor = color
    end
  end

  local Tabs = {}

  local first = true

  function Tabs:NewTab(tabName, iconId)
    tabName = tabName or "Tab"
    local tabButton = Instance.new("TextButton")
    local UICorner = Instance.new("UICorner")
    local page = Instance.new("ScrollingFrame")
    local pageListing = Instance.new("UIListLayout")

    local function UpdateSize()
      local cS = pageListing.AbsoluteContentSize

      game.TweenService:Create(page, TweenInfo.new(0.15, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
        CanvasSize = UDim2.new(0, cS.X, 0, cS.Y)
      }):Play()
    end

    page.Name = "Page"
    page.Parent = Pages
    page.Active = true
    page.BackgroundColor3 = themeList.Background
    page.BorderSizePixel = 0
    page.Position = UDim2.new(0, 0, -0.00371747208, 0)
    page.Size = UDim2.new(1, 0, 1, 0)
    page.ScrollBarThickness = 5
    page.Visible = false
    page.ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15,
      themeList.SchemeColor.b * 255 - 28)

    pageListing.Name = "pageListing"
    pageListing.Parent = page
    pageListing.SortOrder = Enum.SortOrder.LayoutOrder
    pageListing.Padding = UDim.new(0, 5)

    tabButton.Name = tabName .. "TabButton"
    tabButton.Parent = tabFrames
    tabButton.BackgroundColor3 = themeList.SchemeColor
    Objects[tabButton] = "SchemeColor"
    tabButton.Size = UDim2.new(0, 135, 0, 28)
    tabButton.AutoButtonColor = false
    tabButton.Font = Enum.Font.Gotham
    tabButton.Text = tabName
    tabButton.TextColor3 = themeList.TextColor
    Objects[tabButton] = "TextColor3"
    tabButton.TextSize = 14.000
    tabButton.BackgroundTransparency = 1

    -- Add icon if provided
    if iconId then
        local icon = Instance.new("ImageLabel")
        icon.Name = "icon"
        icon.Parent = tabButton
        icon.BackgroundTransparency = 1
        icon.Position = UDim2.new(0, 5, 0.5, -8)
        icon.Size = UDim2.new(0, 16, 0, 16)
        icon.Image = Icons[iconId] or iconId

        -- Adjust text position
        tabButton.Text = "    " .. tabName
    end

    if first then
      first = false
      page.Visible = true
      tabButton.BackgroundTransparency = 0
      UpdateSize()
    else
      page.Visible = false
      tabButton.BackgroundTransparency = 1
    end

    UICorner.CornerRadius = UDim.new(0, 5)
    UICorner.Parent = tabButton
    table.insert(Tabs, tabName)

    UpdateSize()
    page.ChildAdded:Connect(UpdateSize)
    page.ChildRemoved:Connect(UpdateSize)

    tabButton.MouseButton1Click:Connect(function()
           -- Play sound on tab select
      UpdateSize()
      for i, v in next, Pages:GetChildren() do
        v.Visible = false
      end
      page.Visible = true
      for i, v in next, tabFrames:GetChildren() do
        if v:IsA("TextButton") then
          if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
            Utility:TweenObject(v, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
          end
          if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
            Utility:TweenObject(v, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
          end
          Utility:TweenObject(v, { BackgroundTransparency = 1 }, 0.2)
        end
      end
      if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
        Utility:TweenObject(tabButton, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
      end
      if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
        Utility:TweenObject(tabButton, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
      end
      Utility:TweenObject(tabButton, { BackgroundTransparency = 0 }, 0.2)
    end)
    local Sections = {}
    local focusing = false
    local viewDe = false

    coroutine.wrap(function()
      while wait() do
        page.BackgroundColor3 = themeList.Background
        page.ScrollBarImageColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 16, themeList.SchemeColor.g * 255 - 15,
          themeList.SchemeColor.b * 255 - 28)
        tabButton.TextColor3 = themeList.TextColor
        tabButton.BackgroundColor3 = themeList.SchemeColor
      end
    end)()

    function Sections:NewSection(secName, hidden)
      secName = secName or "Section"
      local sectionFunctions = {}
      local modules = {}
      hidden = hidden or false
      local sectionFrame = Instance.new("Frame")
      local sectionlistoknvm = Instance.new("UIListLayout")
      local sectionHead = Instance.new("Frame")
      local sHeadCorner = Instance.new("UICorner")
      local sectionName = Instance.new("TextLabel")
      local sectionInners = Instance.new("Frame")
      local sectionElListing = Instance.new("UIListLayout")

      if hidden then
        sectionHead.Visible = false
      else
        sectionHead.Visible = true
      end

      sectionFrame.Name = "sectionFrame"
      sectionFrame.Parent = page
      sectionFrame.BackgroundColor3 = themeList.Background       --36, 37, 43
      sectionFrame.BorderSizePixel = 0

      sectionlistoknvm.Name = "sectionlistoknvm"
      sectionlistoknvm.Parent = sectionFrame
      sectionlistoknvm.SortOrder = Enum.SortOrder.LayoutOrder
      sectionlistoknvm.Padding = UDim.new(0, 5)

      for i, v in pairs(sectionInners:GetChildren()) do
        while wait() do
          if v:IsA("Frame") or v:IsA("TextButton") then
            function size(pro)
              if pro == "Size" then
                UpdateSize()
                updateSectionFrame()
              end
            end

            v.Changed:Connect(size)
          end
        end
      end
      sectionHead.Name = "sectionHead"
      sectionHead.Parent = sectionFrame
      sectionHead.BackgroundColor3 = themeList.SchemeColor
      Objects[sectionHead] = "BackgroundColor3"
      sectionHead.Size = UDim2.new(0, 352, 0, 33)

      sHeadCorner.CornerRadius = UDim.new(0, 4)
      sHeadCorner.Name = "sHeadCorner"
      sHeadCorner.Parent = sectionHead

      sectionName.Name = "sectionName"
      sectionName.Parent = sectionHead
      sectionName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      sectionName.BackgroundTransparency = 1.000
      sectionName.BorderColor3 = Color3.fromRGB(27, 42, 53)
      sectionName.Position = UDim2.new(0.0198863633, 0, 0, 0)
      sectionName.Size = UDim2.new(0.980113626, 0, 1, 0)
      sectionName.Font = Enum.Font.Gotham
      sectionName.Text = secName
      sectionName.RichText = true
      sectionName.TextColor3 = themeList.TextColor
      Objects[sectionName] = "TextColor3"
      sectionName.TextSize = 14.000
      sectionName.TextXAlignment = Enum.TextXAlignment.Left
      if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
        Utility:TweenObject(sectionName, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
      end
      if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
        Utility:TweenObject(sectionName, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
      end

      sectionInners.Name = "sectionInners"
      sectionInners.Parent = sectionFrame
      sectionInners.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
      sectionInners.BackgroundTransparency = 1.000
      sectionInners.Position = UDim2.new(0, 0, 0.190751448, 0)

      sectionElListing.Name = "sectionElListing"
      sectionElListing.Parent = sectionInners
      sectionElListing.SortOrder = Enum.SortOrder.LayoutOrder
      sectionElListing.Padding = UDim.new(0, 3)


      coroutine.wrap(function()
        while wait() do
          sectionFrame.BackgroundColor3 = themeList.Background
          sectionHead.BackgroundColor3 = themeList.SchemeColor
          tabButton.TextColor3 = themeList.TextColor
          tabButton.BackgroundColor3 = themeList.SchemeColor
          sectionName.TextColor3 = themeList.TextColor
        end
      end)()

      local function updateSectionFrame()
        local innerSc = sectionElListing.AbsoluteContentSize
        sectionInners.Size = UDim2.new(1, 0, 0, innerSc.Y)
        local frameSc = sectionlistoknvm.AbsoluteContentSize
        sectionFrame.Size = UDim2.new(0, 352, 0, frameSc.Y)
      end
      updateSectionFrame()
      UpdateSize()
      local Elements = {}
      function Elements:NewButton(bname, tipINf, callback)
        showLogo = showLogo or true
        local ButtonFunction = {}
        tipINf = tipINf or "Tip: Clicking this nothing will happen!"
        bname = bname or "Click Me!"
        callback = callback or function() end

        local buttonElement = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local btnInfo = Instance.new("TextLabel")
        local viewInfo = Instance.new("ImageButton")
        local touch = Instance.new("ImageLabel")
        local Sample = Instance.new("ImageLabel")

        table.insert(modules, bname)

        buttonElement.Name = bname
        buttonElement.Parent = sectionInners
        buttonElement.BackgroundColor3 = themeList.ElementColor
        buttonElement.ClipsDescendants = true
        buttonElement.Size = UDim2.new(0, 352, 0, 33)
        buttonElement.AutoButtonColor = false
        buttonElement.Font = Enum.Font.SourceSans
        buttonElement.Text = ""
        buttonElement.TextColor3 = Color3.fromRGB(0, 0, 0)
        buttonElement.TextSize = 14.000
        Objects[buttonElement] = "BackgroundColor3"

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = buttonElement

        viewInfo.Name = "viewInfo"
        viewInfo.Parent = buttonElement
        viewInfo.BackgroundTransparency = 1.000
        viewInfo.LayoutOrder = 9
        viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
        viewInfo.Size = UDim2.new(0, 23, 0, 23)
        viewInfo.ZIndex = 2
        viewInfo.Image = "rbxassetid://3926305904"
        viewInfo.ImageColor3 = themeList.SchemeColor
        Objects[viewInfo] = "ImageColor3"
        viewInfo.ImageRectOffset = Vector2.new(764, 764)
        viewInfo.ImageRectSize = Vector2.new(36, 36)

        Sample.Name = "Sample"
        Sample.Parent = buttonElement
        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sample.BackgroundTransparency = 1.000
        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
        Sample.ImageColor3 = themeList.SchemeColor
        Objects[Sample] = "ImageColor3"
        Sample.ImageTransparency = 0.600

        local moreInfo = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")

        moreInfo.Name = "TipMore"
        moreInfo.Parent = infoContainer
        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17,
          themeList.SchemeColor.b * 255 - 13)
        moreInfo.Position = UDim2.new(0, 0, 2, 0)
        moreInfo.Size = UDim2.new(0, 353, 0, 33)
        moreInfo.ZIndex = 9
        moreInfo.Font = Enum.Font.GothamSemibold
        moreInfo.Text = "  " .. tipINf
        moreInfo.RichText = true
        moreInfo.TextColor3 = themeList.TextColor
        Objects[moreInfo] = "TextColor3"
        moreInfo.TextSize = 14.000
        moreInfo.TextXAlignment = Enum.TextXAlignment.Left
        Objects[moreInfo] = "BackgroundColor3"

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = moreInfo

        touch.Name = "touch"
        touch.Parent = buttonElement
        touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        touch.BackgroundTransparency = 1.000
        touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
        touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
        touch.Size = UDim2.new(0, 21, 0, 21)
        touch.Image = "rbxassetid://3926305904"
        touch.ImageColor3 = themeList.SchemeColor
        Objects[touch] = "SchemeColor"
        touch.ImageRectOffset = Vector2.new(84, 204)
        touch.ImageRectSize = Vector2.new(36, 36)
        touch.ImageTransparency = 0

        btnInfo.Name = "btnInfo"
        btnInfo.Parent = buttonElement
        btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btnInfo.BackgroundTransparency = 1.000
        btnInfo.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        btnInfo.Size = UDim2.new(0, 314, 0, 14)
        btnInfo.Font = Enum.Font.GothamSemibold
        btnInfo.Text = bname
        btnInfo.RichText = true
        btnInfo.TextColor3 = themeList.TextColor
        Objects[btnInfo] = "TextColor3"
        btnInfo.TextSize = 14.000
        btnInfo.TextXAlignment = Enum.TextXAlignment.Left

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end

        updateSectionFrame()
        UpdateSize()

        local ms = game.Players.LocalPlayer:GetMouse()

        local btn = buttonElement
        local sample = Sample

        btn.MouseButton1Click:Connect(function()
          playClickSound()           -- Play sound on button press
          if not focusing then
            callback()
            local c = sample:Clone()
            c.Parent = btn
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.35, nil
            if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
              size = (btn.AbsoluteSize.X * 1.5)
            else
              size = (btn.AbsoluteSize.Y * 1.5)
            end
            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
              'Quad', len, true, nil)
            for i = 1, 10 do
              c.ImageTransparency = c.ImageTransparency + 0.05
              wait(len / 12)
            end
            c:Destroy()
          else
            for i, v in next, infoContainer:GetChildren() do
              Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              focusing = false
            end
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
          end
        end)
        local hovering = false
        btn.MouseEnter:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9,
                themeList.ElementColor.b * 255 + 10
            }):Play()
            hovering = true
          end
        end)
        btn.MouseLeave:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor
            }):Play()
            hovering = false
          end
        end)
        viewInfo.MouseButton1Click:Connect(function()
          if not viewDe then
            viewDe = true
            focusing = true
            for i, v in next, infoContainer:GetChildren() do
              if v ~= moreInfo then
                Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              end
            end
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 0, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 0.5 }, 0.2)
            Utility:TweenObject(btn, { BackgroundColor3 = themeList.ElementColor }, 0.2)
            wait(1.5)
            focusing = false
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
            wait(0)
            viewDe = false
          end
        end)
        coroutine.wrap(function()
          while wait() do
            if not hovering then
              buttonElement.BackgroundColor3 = themeList.ElementColor
            end
            viewInfo.ImageColor3 = themeList.SchemeColor
            Sample.ImageColor3 = themeList.SchemeColor
            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14,
              themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
            moreInfo.TextColor3 = themeList.TextColor
            touch.ImageColor3 = themeList.SchemeColor
            btnInfo.TextColor3 = themeList.TextColor
          end
        end)()

        function ButtonFunction:UpdateButton(newTitle)
          btnInfo.Text = newTitle
        end

        return ButtonFunction
      end

      function Elements:NewTextBox(tname, tTip, callback)
        tname = tname or "Textbox"
        tTip = tTip or "Gets a value of Textbox"
        callback = callback or function() end
        local textboxElement = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local viewInfo = Instance.new("ImageButton")
        local write = Instance.new("ImageLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        local togName = Instance.new("TextLabel")

        textboxElement.Name = "textboxElement"
        textboxElement.Parent = sectionInners
        textboxElement.BackgroundColor3 = themeList.ElementColor
        textboxElement.ClipsDescendants = true
        textboxElement.Size = UDim2.new(0, 352, 0, 33)
        textboxElement.AutoButtonColor = false
        textboxElement.Font = Enum.Font.SourceSans
        textboxElement.Text = ""
        textboxElement.TextColor3 = Color3.fromRGB(0, 0, 0)
        textboxElement.TextSize = 14.000

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = textboxElement

        viewInfo.Name = "viewInfo"
        viewInfo.Parent = textboxElement
        viewInfo.BackgroundTransparency = 1.000
        viewInfo.LayoutOrder = 9
        viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
        viewInfo.Size = UDim2.new(0, 23, 0, 23)
        viewInfo.ZIndex = 2
        viewInfo.Image = "rbxassetid://3926305904"
        viewInfo.ImageColor3 = themeList.SchemeColor
        viewInfo.ImageRectOffset = Vector2.new(764, 764)
        viewInfo.ImageRectSize = Vector2.new(36, 36)

        write.Name = "write"
        write.Parent = textboxElement
        write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        write.BackgroundTransparency = 1.000
        write.BorderColor3 = Color3.fromRGB(27, 42, 53)
        write.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
        write.Size = UDim2.new(0, 21, 0, 21)
        write.Image = "rbxassetid://3926305904"
        write.ImageColor3 = themeList.SchemeColor
        write.ImageRectOffset = Vector2.new(324, 604)
        write.ImageRectSize = Vector2.new(36, 36)

        TextBox.Parent = textboxElement
        TextBox.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 - 6, themeList.ElementColor.g * 255 - 6,
          themeList.ElementColor.b * 255 - 7)
        TextBox.BorderSizePixel = 0
        TextBox.ClipsDescendants = true
        TextBox.Position = UDim2.new(0.488749921, 0, 0.212121218, 0)
        TextBox.Size = UDim2.new(0, 150, 0, 18)
        TextBox.ZIndex = 99
        TextBox.ClearTextOnFocus = false
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 19, themeList.SchemeColor.g * 255 - 26,
          themeList.SchemeColor.b * 255 - 35)
        TextBox.PlaceholderText = "Type here!"
        TextBox.Text = ""
        TextBox.TextColor3 = themeList.SchemeColor
        TextBox.TextSize = 12.000

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = TextBox

        togName.Name = "togName"
        togName.Parent = textboxElement
        togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togName.BackgroundTransparency = 1.000
        togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        togName.Size = UDim2.new(0, 138, 0, 14)
        togName.Font = Enum.Font.GothamSemibold
        togName.Text = tname
        togName.RichText = true
        togName.TextColor3 = themeList.TextColor
        togName.TextSize = 14.000
        togName.TextXAlignment = Enum.TextXAlignment.Left

        local moreInfo = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")

        moreInfo.Name = "TipMore"
        moreInfo.Parent = infoContainer
        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17,
          themeList.SchemeColor.b * 255 - 13)
        moreInfo.Position = UDim2.new(0, 0, 2, 0)
        moreInfo.Size = UDim2.new(0, 353, 0, 33)
        moreInfo.ZIndex = 9
        moreInfo.Font = Enum.Font.GothamSemibold
        moreInfo.Text = "  " .. tTip
        moreInfo.RichText = true
        moreInfo.TextColor3 = themeList.TextColor
        Objects[moreInfo] = "TextColor3"
        moreInfo.TextSize = 14.000
        moreInfo.TextXAlignment = Enum.TextXAlignment.Left
        Objects[moreInfo] = "BackgroundColor3"

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = moreInfo

        btnInfo.Name = "btnInfo"
        btnInfo.Parent = buttonElement
        btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btnInfo.BackgroundTransparency = 1.000
        btnInfo.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        btnInfo.Size = UDim2.new(0, 314, 0, 14)
        btnInfo.Font = Enum.Font.GothamSemibold
        btnInfo.Text = bname
        btnInfo.RichText = true
        btnInfo.TextColor3 = themeList.TextColor
        Objects[btnInfo] = "TextColor3"
        btnInfo.TextSize = 14.000
        btnInfo.TextXAlignment = Enum.TextXAlignment.Left

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end

        updateSectionFrame()
        UpdateSize()

        local btn = buttonElement
        local sample = Sample

        btn.MouseButton1Click:Connect(function()
          playClickSound()           -- Play sound on button press
          if not focusing then
            callback()
            local c = sample:Clone()
            c.Parent = btn
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.35, nil
            if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
              size = (btn.AbsoluteSize.X * 1.5)
            else
              size = (btn.AbsoluteSize.Y * 1.5)
            end
            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
              'Quad', len, true, nil)
            for i = 1, 10 do
              c.ImageTransparency = c.ImageTransparency + 0.05
              wait(len / 12)
            end
            c:Destroy()
          else
            for i, v in next, infoContainer:GetChildren() do
              Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              focusing = false
            end
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
          end
        end)
        local hovering = false
        btn.MouseEnter:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9,
                themeList.ElementColor.b * 255 + 10
            }):Play()
            hovering = true
          end
        end)
        btn.MouseLeave:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor
            }):Play()
            hovering = false
          end
        end)
        viewInfo.MouseButton1Click:Connect(function()
          if not viewDe then
            viewDe = true
            focusing = true
            for i, v in next, infoContainer:GetChildren() do
              if v ~= moreInfo then
                Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              end
            end
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 0, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 0.5 }, 0.2)
            Utility:TweenObject(btn, { BackgroundColor3 = themeList.ElementColor }, 0.2)
            wait(1.5)
            focusing = false
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
            wait(0)
            viewDe = false
          end
        end)
        coroutine.wrap(function()
          while wait() do
            if not hovering then
              buttonElement.BackgroundColor3 = themeList.ElementColor
            end
            viewInfo.ImageColor3 = themeList.SchemeColor
            Sample.ImageColor3 = themeList.SchemeColor
            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14,
              themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
            moreInfo.TextColor3 = themeList.TextColor
            touch.ImageColor3 = themeList.SchemeColor
            btnInfo.TextColor3 = themeList.TextColor
          end
        end)()

        function ButtonFunction:UpdateButton(newTitle)
          btnInfo.Text = newTitle
        end

        return ButtonFunction
      end

      function Elements:NewTextBox(tname, tTip, callback)
        tname = tname or "Textbox"
        tTip = tTip or "Gets a value of Textbox"
        callback = callback or function() end
        local textboxElement = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local viewInfo = Instance.new("ImageButton")
        local write = Instance.new("ImageLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        local togName = Instance.new("TextLabel")

        textboxElement.Name = "textboxElement"
        textboxElement.Parent = sectionInners
        textboxElement.BackgroundColor3 = themeList.ElementColor
        textboxElement.ClipsDescendants = true
        textboxElement.Size = UDim2.new(0, 352, 0, 33)
        textboxElement.AutoButtonColor = false
        textboxElement.Font = Enum.Font.SourceSans
        textboxElement.Text = ""
        textboxElement.TextColor3 = Color3.fromRGB(0, 0, 0)
        textboxElement.TextSize = 14.000

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = textboxElement

        viewInfo.Name = "viewInfo"
        viewInfo.Parent = textboxElement
        viewInfo.BackgroundTransparency = 1.000
        viewInfo.LayoutOrder = 9
        viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
        viewInfo.Size = UDim2.new(0, 23, 0, 23)
        viewInfo.ZIndex = 2
        viewInfo.Image = "rbxassetid://3926305904"
        viewInfo.ImageColor3 = themeList.SchemeColor
        viewInfo.ImageRectOffset = Vector2.new(764, 764)
        viewInfo.ImageRectSize = Vector2.new(36, 36)

        write.Name = "write"
        write.Parent = textboxElement
        write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        write.BackgroundTransparency = 1.000
        write.BorderColor3 = Color3.fromRGB(27, 42, 53)
        write.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
        write.Size = UDim2.new(0, 21, 0, 21)
        write.Image = "rbxassetid://3926305904"
        write.ImageColor3 = themeList.SchemeColor
        write.ImageRectOffset = Vector2.new(324, 604)
        write.ImageRectSize = Vector2.new(36, 36)

        TextBox.Parent = textboxElement
        TextBox.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 - 6, themeList.ElementColor.g * 255 - 6,
          themeList.ElementColor.b * 255 - 7)
        TextBox.BorderSizePixel = 0
        TextBox.ClipsDescendants = true
        TextBox.Position = UDim2.new(0.488749921, 0, 0.212121218, 0)
        TextBox.Size = UDim2.new(0, 150, 0, 18)
        TextBox.ZIndex = 99
        TextBox.ClearTextOnFocus = false
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 19, themeList.SchemeColor.g * 255 - 26,
          themeList.SchemeColor.b * 255 - 35)
        TextBox.PlaceholderText = "Type here!"
        TextBox.Text = ""
        TextBox.TextColor3 = themeList.SchemeColor
        TextBox.TextSize = 12.000

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = TextBox

        togName.Name = "togName"
        togName.Parent = textboxElement
        togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togName.BackgroundTransparency = 1.000
        togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        togName.Size = UDim2.new(0, 138, 0, 14)
        togName.Font = Enum.Font.GothamSemibold
        togName.Text = tname
        togName.RichText = true
        togName.TextColor3 = themeList.TextColor
        togName.TextSize = 14.000
        togName.TextXAlignment = Enum.TextXAlignment.Left

        local moreInfo = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")

        moreInfo.Name = "TipMore"
        moreInfo.Parent = infoContainer
        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17,
          themeList.SchemeColor.b * 255 - 13)
        moreInfo.Position = UDim2.new(0, 0, 2, 0)
        moreInfo.Size = UDim2.new(0, 353, 0, 33)
        moreInfo.ZIndex = 9
        moreInfo.Font = Enum.Font.GothamSemibold
        moreInfo.Text = "  " .. tTip
        moreInfo.RichText = true
        moreInfo.TextColor3 = themeList.TextColor
        Objects[moreInfo] = "TextColor3"
        moreInfo.TextSize = 14.000
        moreInfo.TextXAlignment = Enum.TextXAlignment.Left
        Objects[moreInfo] = "BackgroundColor3"

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = moreInfo

        btnInfo.Name = "btnInfo"
        btnInfo.Parent = buttonElement
        btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btnInfo.BackgroundTransparency = 1.000
        btnInfo.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        btnInfo.Size = UDim2.new(0, 314, 0, 14)
        btnInfo.Font = Enum.Font.GothamSemibold
        btnInfo.Text = bname
        btnInfo.RichText = true
        btnInfo.TextColor3 = themeList.TextColor
        Objects[btnInfo] = "TextColor3"
        btnInfo.TextSize = 14.000
        btnInfo.TextXAlignment = Enum.TextXAlignment.Left

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end

        updateSectionFrame()
        UpdateSize()

        local btn = buttonElement
        local sample = Sample

        btn.MouseButton1Click:Connect(function()
          playClickSound()           -- Play sound on button press
          if not focusing then
            callback()
            local c = sample:Clone()
            c.Parent = btn
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.35, nil
            if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
              size = (btn.AbsoluteSize.X * 1.5)
            else
              size = (btn.AbsoluteSize.Y * 1.5)
            end
            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
              'Quad', len, true, nil)
            for i = 1, 10 do
              c.ImageTransparency = c.ImageTransparency + 0.05
              wait(len / 12)
            end
            c:Destroy()
          else
            for i, v in next, infoContainer:GetChildren() do
              Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              focusing = false
            end
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
          end
        end)
        local hovering = false
        btn.MouseEnter:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9,
                themeList.ElementColor.b * 255 + 10
            }):Play()
            hovering = true
          end
        end)
        btn.MouseLeave:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor
            }):Play()
            hovering = false
          end
        end)
        viewInfo.MouseButton1Click:Connect(function()
          if not viewDe then
            viewDe = true
            focusing = true
            for i, v in next, infoContainer:GetChildren() do
              if v ~= moreInfo then
                Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              end
            end
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 0, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 0.5 }, 0.2)
            Utility:TweenObject(btn, { BackgroundColor3 = themeList.ElementColor }, 0.2)
            wait(1.5)
            focusing = false
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
            wait(0)
            viewDe = false
          end
        end)
        coroutine.wrap(function()
          while wait() do
            if not hovering then
              buttonElement.BackgroundColor3 = themeList.ElementColor
            end
            viewInfo.ImageColor3 = themeList.SchemeColor
            Sample.ImageColor3 = themeList.SchemeColor
            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14,
              themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
            moreInfo.TextColor3 = themeList.TextColor
            touch.ImageColor3 = themeList.SchemeColor
            btnInfo.TextColor3 = themeList.TextColor
          end
        end)()

        function ButtonFunction:UpdateButton(newTitle)
          btnInfo.Text = newTitle
        end

        return ButtonFunction
      end

      function Elements:NewTextBox(tname, tTip, callback)
        tname = tname or "Textbox"
        tTip = tTip or "Gets a value of Textbox"
        callback = callback or function() end
        local textboxElement = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local viewInfo = Instance.new("ImageButton")
        local write = Instance.new("ImageLabel")
        local TextBox = Instance.new("TextBox")
        local UICorner_2 = Instance.new("UICorner")
        local togName = Instance.new("TextLabel")

        textboxElement.Name = "textboxElement"
        textboxElement.Parent = sectionInners
        textboxElement.BackgroundColor3 = themeList.ElementColor
        textboxElement.ClipsDescendants = true
        textboxElement.Size = UDim2.new(0, 352, 0, 33)
        textboxElement.AutoButtonColor = false
        textboxElement.Font = Enum.Font.SourceSans
        textboxElement.Text = ""
        textboxElement.TextColor3 = Color3.fromRGB(0, 0, 0)
        textboxElement.TextSize = 14.000

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = textboxElement

        viewInfo.Name = "viewInfo"
        viewInfo.Parent = textboxElement
        viewInfo.BackgroundTransparency = 1.000
        viewInfo.LayoutOrder = 9
        viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
        viewInfo.Size = UDim2.new(0, 23, 0, 23)
        viewInfo.ZIndex = 2
        viewInfo.Image = "rbxassetid://3926305904"
        viewInfo.ImageColor3 = themeList.SchemeColor
        viewInfo.ImageRectOffset = Vector2.new(764, 764)
        viewInfo.ImageRectSize = Vector2.new(36, 36)

        write.Name = "write"
        write.Parent = textboxElement
        write.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        write.BackgroundTransparency = 1.000
        write.BorderColor3 = Color3.fromRGB(27, 42, 53)
        write.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
        write.Size = UDim2.new(0, 21, 0, 21)
        write.Image = "rbxassetid://3926305904"
        write.ImageColor3 = themeList.SchemeColor
        write.ImageRectOffset = Vector2.new(324, 604)
        write.ImageRectSize = Vector2.new(36, 36)

        TextBox.Parent = textboxElement
        TextBox.BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 - 6, themeList.ElementColor.g * 255 - 6,
          themeList.ElementColor.b * 255 - 7)
        TextBox.BorderSizePixel = 0
        TextBox.ClipsDescendants = true
        TextBox.Position = UDimDim2.new(0.488749921, 0, 0.212121218, 0)
        TextBox.Size = UDim2.new(0, 150, 0, 18)
        TextBox.ZIndex = 99
        TextBox.ClearTextOnFocus = false
        TextBox.Font = Enum.Font.Gotham
        TextBox.PlaceholderColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 19, themeList.SchemeColor.g * 255 - 26,
          themeList.SchemeColor.b * 255 - 35)
        TextBox.PlaceholderText = "Type here!"
        TextBox.Text = ""
        TextBox.TextColor3 = themeList.SchemeColor
        TextBox.TextSize = 12.000

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = TextBox

        togName.Name = "togName"
        togName.Parent = textboxElement
        togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togName.BackgroundTransparency = 1.000
        togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        togName.Size = UDim2.new(0, 138, 0, 14)
        togName.Font = Enum.Font.GothamSemibold
        togName.Text = tname
        togName.RichText = true
        togName.TextColor3 = themeList.TextColor
        togName.TextSize = 14.000
        togName.TextXAlignment = Enum.TextXAlignment.Left

        local moreInfo = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")

        moreInfo.Name = "TipMore"
        moreInfo.Parent = infoContainer
        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17,
          themeList.SchemeColor.b * 255 - 13)
        moreInfo.Position = UDim2.new(0, 0, 2, 0)
        moreInfo.Size = UDim2.new(0, 353, 0, 33)
        moreInfo.ZIndex = 9
        moreInfo.Font = Enum.Font.GothamSemibold
        moreInfo.Text = "  " .. tTip
        moreInfo.RichText = true
        moreInfo.TextColor3 = themeList.TextColor
        Objects[moreInfo] = "TextColor3"
        moreInfo.TextSize = 14.000
        moreInfo.TextXAlignment = Enum.TextXAlignment.Left
        Objects[moreInfo] = "BackgroundColor3"

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = moreInfo

        btnInfo.Name = "btnInfo"
        btnInfo.Parent = buttonElement
        btnInfo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        btnInfo.BackgroundTransparency = 1.000
        btnInfo.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        btnInfo.Size = UDim2.new(0, 314, 0, 14)
        btnInfo.Font = Enum.Font.GothamSemibold
        btnInfo.Text = bname
        btnInfo.RichText = true
        btnInfo.TextColor3 = themeList.TextColor
        Objects[btnInfo] = "TextColor3"
        btnInfo.TextSize = 14.000
        btnInfo.TextXAlignment = Enum.TextXAlignment.Left

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end

        updateSectionFrame()
        UpdateSize()

        local btn = buttonElement
        local sample = Sample

        btn.MouseButton1Click:Connect(function()
          playClickSound()           -- Play sound on button press
          if not focusing then
            callback()
            local c = sample:Clone()
            c.Parent = btn
            local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
            c.Position = UDim2.new(0, x, 0, y)
            local len, size = 0.35, nil
            if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
              size = (btn.AbsoluteSize.X * 1.5)
            else
              size = (btn.AbsoluteSize.Y * 1.5)
            end
            c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
              'Quad', len, true, nil)
            for i = 1, 10 do
              c.ImageTransparency = c.ImageTransparency + 0.05
              wait(len / 12)
            end
            c:Destroy()
          else
            for i, v in next, infoContainer:GetChildren() do
              Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              focusing = false
            end
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
          end
        end)
        local hovering = false
        btn.MouseEnter:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9,
                themeList.ElementColor.b * 255 + 10
            }):Play()
            hovering = true
          end
        end)
        btn.MouseLeave:Connect(function()
          if not focusing then
            game.TweenService:Create(btn, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
              BackgroundColor3 = themeList.ElementColor
            }):Play()
            hovering = false
          end
        end)
        viewInfo.MouseButton1Click:Connect(function()
          if not viewDe then
            viewDe = true
            focusing = true
            for i, v in next, infoContainer:GetChildren() do
              if v ~= moreInfo then
                Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              end
            end
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 0, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 0.5 }, 0.2)
            Utility:TweenObject(btn, { BackgroundColor3 = themeList.ElementColor }, 0.2)
            wait(1.5)
            focusing = false
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
            wait(0)
            viewDe = false
          end
        end)
        coroutine.wrap(function()
          while wait() do
            if not hovering then
              buttonElement.BackgroundColor3 = themeList.ElementColor
            end
            viewInfo.ImageColor3 = themeList.SchemeColor
            Sample.ImageColor3 = themeList.SchemeColor
            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14,
              themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
            moreInfo.TextColor3 = themeList.TextColor
            touch.ImageColor3 = themeList.SchemeColor
            btnInfo.TextColor3 = themeList.TextColor
          end
        end)()

        function ButtonFunction:UpdateButton(newTitle)
          btnInfo.Text = newTitle
        end

        return ButtonFunction
      end

      function Elements:NewColorPicker(colText, colInf, defcolor, callback)
        colText = colText or "ColorPicker"
        callback = callback or function() end
        defcolor = defcolor or Color3.fromRGB(1, 1, 1)
        local h, s, v = Color3.toHSV(defcolor)
        local ms = game.Players.LocalPlayer:GetMouse()
        local colorOpened = false
        local colorElement = Instance.new("TextButton")
        local UICorner = Instance.new("UICorner")
        local colorHeader = Instance.new("Frame")
        local UICorner_2 = Instance.new("UICorner")
        local touch = Instance.new("ImageLabel")
        local togName = Instance.new("TextLabel")
        local viewInfo = Instance.new("ImageButton")
        local colorCurrent = Instance.new("Frame")
        local UICorner_3 = Instance.new("UICorner")
        local UIListLayout = Instance.new("UIListLayout")
        local colorInners = Instance.new("Frame")
        local UICorner_4 = Instance.new("UICorner")
        local rgb = Instance.new("ImageButton")
        local UICorner_5 = Instance.new("UICorner")
        local rbgcircle = Instance.new("ImageLabel")
        local darkness = Instance.new("ImageButton")
        local UICorner_6 = Instance.new("UICorner")
        local darkcircle = Instance.new("ImageLabel")
        local toggleDisabled = Instance.new("ImageLabel")
        local toggleEnabled = Instance.new("ImageLabel")
        local onrainbow = Instance.new("TextButton")
        local togName_2 = Instance.new("TextLabel")

        --Properties:
        local Sample = Instance.new("ImageLabel")
        Sample.Name = "Sample"
        Sample.Parent = colorHeader
        Sample.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Sample.BackgroundTransparency = 1.000
        Sample.Image = "http://www.roblox.com/asset/?id=4560909609"
        Sample.ImageColor3 = themeList.SchemeColor
        Sample.ImageTransparency = 0.600

        local btn = colorHeader
        local sample = Sample

        colorElement.Name = "colorElement"
        colorElement.Parent = sectionInners
        colorElement.BackgroundColor3 = themeList.ElementColor
        colorElement.BackgroundTransparency = 1.000
        colorElement.ClipsDescendants = true
        colorElement.Position = UDim2.new(0, 0, 0.566834569, 0)
        colorElement.Size = UDim2.new(0, 352, 0, 33)
        colorElement.AutoButtonColor = false
        colorElement.Font = Enum.Font.SourceSans
        colorElement.Text = ""
        colorElement.TextColor3 = Color3.fromRGB(0, 0, 0)
        colorElement.TextSize = 14.000
        colorElement.MouseButton1Click:Connect(function()
          if not focusing then
            if colorOpened then
              colorOpened = false
              colorElement:TweenSize(UDim2.new(0, 352, 0, 33), "InOut", "Linear", 0.08)
              wait(0.1)
              updateSectionFrame()
              UpdateSize()
              local c = sample:Clone()
              c.Parent = btn
              local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
              c.Position = UDim2.new(0, x, 0, y)
              local len, size = 0.35, nil
              if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
                size = (btn.AbsoluteSize.X * 1.5)
              else
                size = (btn.AbsoluteSize.Y * 1.5)
              end
              c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
                'Quad', len, true, nil)
              for i = 1, 10 do
                c.ImageTransparency = c.ImageTransparency + 0.05
                wait(len / 12)
              end
              c:Destroy()
            else
              colorOpened = true
              colorElement:TweenSize(UDim2.new(0, 352, 0, 141), "InOut", "Linear", 0.08, true)
              wait(0.1)
              updateSectionFrame()
              UpdateSize()
              local c = sample:Clone()
              c.Parent = btn
              local x, y = (ms.X - c.AbsolutePosition.X), (ms.Y - c.AbsolutePosition.Y)
              c.Position = UDim2.new(0, x, 0, y)
              local len, size = 0.35, nil
              if btn.AbsoluteSize.X >= btn.AbsoluteSize.Y then
                size = (btn.AbsoluteSize.X * 1.5)
              else
                size = (btn.AbsoluteSize.Y * 1.5)
              end
              c:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), 'Out',
                'Quad', len, true, nil)
              for i = 1, 10 do
                c.ImageTransparency = c.ImageTransparency + 0.05
                wait(len / 12)
              end
              c:Destroy()
            end
          else
            for i, v in next, infoContainer:GetChildren() do
              Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              focusing = false
            end
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
          end
        end)
        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = colorElement

        colorHeader.Name = "colorHeader"
        colorHeader.Parent = colorElement
        colorHeader.BackgroundColor3 = themeList.ElementColor
        colorHeader.Size = UDim2.new(0, 352, 0, 33)
        colorHeader.ClipsDescendants = true

        UICorner_2.CornerRadius = UDim.new(0, 4)
        UICorner_2.Parent = colorHeader

        touch.Name = "touch"
        touch.Parent = colorHeader
        touch.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        touch.BackgroundTransparency = 1.000
        touch.BorderColor3 = Color3.fromRGB(27, 42, 53)
        touch.Position = UDim2.new(0.0199999996, 0, 0.180000007, 0)
        touch.Size = UDim2.new(0, 21, 0, 21)
        touch.Image = "rbxassetid://3926305904"
        touch.ImageColor3 = themeList.SchemeColor
        touch.ImageRectOffset = Vector2.new(44, 964)
        touch.ImageRectSize = Vector2.new(36, 36)

        togName.Name = "togName"
        togName.Parent = colorHeader
        togName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togName.BackgroundTransparency = 1.000
        togName.Position = UDim2.new(0.096704483, 0, 0.272727281, 0)
        togName.Size = UDim2.new(0, 288, 0, 14)
        togName.Font = Enum.Font.GothamSemibold
        togName.Text = colText
        togName.TextColor3 = themeList.TextColor
        togName.TextSize = 14.000
        togName.RichText = true
        togName.TextXAlignment = Enum.TextXAlignment.Left

        local moreInfo = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")

        moreInfo.Name = "TipMore"
        moreInfo.Parent = infoContainer
        moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14, themeList.SchemeColor.g * 255 - 17,
          themeList.SchemeColor.b * 255 - 13)
        moreInfo.Position = UDim2.new(0, 0, 2, 0)
        moreInfo.Size = UDim2.new(0, 353, 0, 33)
        moreInfo.ZIndex = 9
        moreInfo.Font = Enum.Font.GothamSemibold
        moreInfo.Text = "  " .. colInf
        moreInfo.TextColor3 = themeList.TextColor
        moreInfo.TextSize = 14.000
        moreInfo.RichText = true
        moreInfo.TextXAlignment = Enum.TextXAlignment.Left

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = moreInfo

        viewInfo.Name = "viewInfo"
        viewInfo.Parent = colorHeader
        viewInfo.BackgroundTransparency = 1.000
        viewInfo.LayoutOrder = 9
        viewInfo.Position = UDim2.new(0.930000007, 0, 0.151999995, 0)
        viewInfo.Size = UDim2.new(0, 23, 0, 23)
        viewInfo.ZIndex = 2
        viewInfo.Image = "rbxassetid://3926305904"
        viewInfo.ImageColor3 = themeList.SchemeColor
        viewInfo.ImageRectOffset = Vector2.new(764, 764)
        viewInfo.ImageRectSize = Vector2.new(36, 36)
        viewInfo.MouseButton1Click:Connect(function()
          if not viewDe then
            viewDe = true
            focusing = true
            for i, v in next, infoContainer:GetChildren() do
              if v ~= moreInfo then
                Utility:TweenObject(v, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
              end
            end
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 0, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 0.5 }, 0.2)
            Utility:TweenObject(colorElement, { BackgroundColor3 = themeList.ElementColor }, 0.2)
            wait(1.5)
            focusing = false
            Utility:TweenObject(moreInfo, { Position = UDim2.new(0, 0, 2, 0) }, 0.2)
            Utility:TweenObject(blurFrame, { BackgroundTransparency = 1 }, 0.2)
            wait(0)
            viewDe = false
          end
        end)

        colorCurrent.Name = "colorCurrent"
        colorCurrent.Parent = colorHeader
        colorCurrent.BackgroundColor3 = defcolor
        colorCurrent.Position = UDim2.new(0.792613626, 0, 0.212121218, 0)
        colorCurrent.Size = UDim2.new(0, 42, 0, 18)

        UICorner_3.CornerRadius = UDim.new(0, 4)
        UICorner_3.Parent = colorCurrent

        UIListLayout.Parent = colorElement
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 3)

        colorInners.Name = "colorInners"
        colorInners.Parent = colorElement
        colorInners.BackgroundColor3 = themeList.ElementColor
        colorInners.Position = UDim2.new(0, 0, 0.255319148, 0)
        colorInners.Size = UDim2.new(0, 352, 0, 105)

        UICorner_4.CornerRadius = UDim.new(0, 4)
        UICorner_4.Parent = colorInners

        rgb.Name = "rgb"
        rgb.Parent = colorInners
        rgb.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        rgb.BackgroundTransparency = 1.000
        rgb.Position = UDim2.new(0.0198863633, 0, 0.0476190485, 0)
        rgb.Size = UDim2.new(0, 211, 0, 93)
        rgb.Image = "http://www.roblox.com/asset/?id=6523286724"

        UICorner_5.CornerRadius = UDim.new(0, 4)
        UICorner_5.Parent = rgb

        rbgcircle.Name = "rbgcircle"
        rbgcircle.Parent = rgb
        rbgcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        rbgcircle.BackgroundTransparency = 1.000
        rbgcircle.Size = UDim2.new(0, 14, 0, 14)
        rbgcircle.Image = "rbxassetid://3926309567"
        rbgcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
        rbgcircle.ImageRectOffset = Vector2.new(628, 420)
        rbgcircle.ImageRectSize = Vector2.new(48, 48)

        darkness.Name = "darkness"
        darkness.Parent = colorInners
        darkness.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        darkness.BackgroundTransparency = 1.000
        darkness.Position = UDim2.new(0.636363626, 0, 0.0476190485, 0)
        darkness.Size = UDim2.new(0, 18, 0, 93)
        darkness.Image = "http://www.roblox.com/asset/?id=6523291212"

        UICorner_6.CornerRadius = UDim.new(0, 4)
        UICorner_6.Parent = darkness

        darkcircle.Name = "darkcircle"
        darkcircle.Parent = darkness
        darkcircle.AnchorPoint = Vector2.new(0.5, 0)
        darkcircle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        darkcircle.BackgroundTransparency = 1.000
        darkcircle.Size = UDim2.new(0, 14, 0, 14)
        darkcircle.Image = "rbxassetid://3926309567"
        darkcircle.ImageColor3 = Color3.fromRGB(0, 0, 0)
        darkcircle.ImageRectOffset = Vector2.new(628, 420)
        darkcircle.ImageRectSize = Vector2.new(48, 48)

        toggleDisabled.Name = "toggleDisabled"
        toggleDisabled.Parent = colorInners
        toggleDisabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleDisabled.BackgroundTransparency = 1.000
        toggleDisabled.Position = UDim2.new(0.704659104, 0, 0.0657142699, 0)
        toggleDisabled.Size = UDim2.new(0, 21, 0, 21)
        toggleDisabled.Image = "rbxassetid://3926309567"
        toggleDisabled.ImageColor3 = themeList.SchemeColor
        toggleDisabled.ImageRectOffset = Vector2.new(628, 420)
        toggleDisabled.ImageRectSize = Vector2.new(48, 48)

        toggleEnabled.Name = "toggleEnabled"
        toggleEnabled.Parent = colorInners
        toggleEnabled.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        toggleEnabled.BackgroundTransparency = 1.000
        toggleEnabled.Position = UDim2.new(0.704999983, 0, 0.0659999996, 0)
        toggleEnabled.Size = UDim2.new(0, 21, 0, 21)
        toggleEnabled.Image = "rbxassetid://3926309567"
        toggleEnabled.ImageColor3 = themeList.SchemeColor
        toggleEnabled.ImageRectOffset = Vector2.new(784, 420)
        toggleEnabled.ImageRectSize = Vector2.new(48, 48)
        toggleEnabled.ImageTransparency = 1.000

        onrainbow.Name = "onrainbow"
        onrainbow.Parent = toggleEnabled
        onrainbow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        onrainbow.BackgroundTransparency = 1.000
        onrainbow.Position = UDim2.new(2.90643607e-06, 0, 0, 0)
        onrainbow.Size = UDim2.new(1, 0, 1, 0)
        onrainbow.Font = Enum.Font.SourceSans
        onrainbow.Text = ""
        onrainbow.TextColor3 = Color3.fromRGB(0, 0, 0)
        onrainbow.TextSize = 14

        togName_2.Name = "togName"
        togName_2.Parent = colorInners
        togName_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        togName_2.BackgroundTransparency = 1.000
        togName_2.Position = UDim2.new(0.779999971, 0, 0.100000001, 0)
        togName_2.Size = UDim2.new(0, 278, 0, 14)
        togName_2.Font = Enum.Font.GothamSemibold
        togName_2.Text = "Rainbow"
        togName_2.TextColor3 = themeList.TextColor
        togName_2.TextSize = 14.000
        togName_2.TextXAlignment = Enum.TextXAlignment.Left

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end
        local hovering = false

        colorElement.MouseEnter:Connect(function()
          if not focusing then
            game.TweenService:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
              {
                BackgroundColor3 = Color3.fromRGB(themeList.ElementColor.r * 255 + 8, themeList.ElementColor.g * 255 + 9,
                  themeList.ElementColor.b * 255 + 10)
              }):Play()
            hovering = true
          end
        end)
        colorElement.MouseLeave:Connect(function()
          if not focusing then
            game.TweenService:Create(colorElement, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
              {
                BackgroundColor3 = themeList.ElementColor
              }):Play()
            hovering = false
          end
        end)

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(moreInfo, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end
        coroutine.wrap(function()
          while wait() do
            if not hovering then
              colorElement.BackgroundColor3 = themeList.ElementColor
            end
            touch.ImageColor3 = themeList.SchemeColor
            colorHeader.BackgroundColor3 = themeList.ElementColor
            togName.TextColor3 = themeList.TextColor
            moreInfo.BackgroundColor3 = Color3.fromRGB(themeList.SchemeColor.r * 255 - 14,
              themeList.SchemeColor.g * 255 - 17, themeList.SchemeColor.b * 255 - 13)
            moreInfo.TextColor3 = themeList.TextColor
            viewInfo.ImageColor3 = themeList.SchemeColor
            colorInners.BackgroundColor3 = themeList.ElementColor
            toggleDisabled.ImageColor3 = themeList.SchemeColor
            toggleEnabled.ImageColor3 = themeList.SchemeColor
            togName_2.TextColor3 = themeList.TextColor
            Sample.ImageColor3 = themeList.SchemeColor
          end
        end)()
        updateSectionFrame()
        UpdateSize()
        local plr = game.Players.LocalPlayer
        local mouse = plr:GetMouse()
        local uis = game:GetService('UserInputService')
        local rs = game:GetService("RunService")
        local colorpicker = false
        local darknesss = false
        local dark = false
        local rgb = rgb
        local dark = darkness
        local cursor = rbgcircle
        local cursor2 = darkcircle
        local color = { 1, 1, 1 }
        local rainbow = false
        local rainbowconnection
        local counter = 0
        --
        local function zigzag(X) return math.acos(math.cos(X * math.pi)) / math.pi end
        counter = 0
        local function mouseLocation()
          return plr:GetMouse()
        end
        local function cp()
          if colorpicker then
            local ml = mouseLocation()
            local x, y = ml.X - rgb.AbsolutePosition.X, ml.Y - rgb.AbsolutePosition.Y
            local maxX, maxY = rgb.AbsoluteSize.X, rgb.AbsoluteSize.Y
            if x < 0 then x = 0 end
            if x > maxX then x = maxX end
            if y < 0 then y = 0 end
            if y > maxY then y = maxY end
            x = x / maxX
            y = y / maxY
            local cx = cursor.AbsoluteSize.X / 2
            local cy = cursor.AbsoluteSize.Y / 2
            cursor.Position = UDim2.new(x, -cx, y, -cy)
            color = { 1 - x, 1 - y, color[3] }
            local realcolor = Color3.fromHSV(color[1], color[2], color[3])
            colorCurrent.BackgroundColor3 = realcolor
            callback(realcolor)
          end
          if darknesss then
            local ml = mouseLocation()
            local y = ml.Y - dark.AbsolutePosition.Y
            local maxY = dark.AbsoluteSize.Y
            if y < 0 then y = 0 end
            if y > maxY then y = maxY end
            y = y / maxY
            local cy = cursor2.AbsoluteSize.Y / 2
            cursor2.Position = UDim2.new(0.5, 0, y, -cy)
            cursor2.ImageColor3 = Color3.fromHSV(0, 0, y)
            color = { color[1], color[2], 1 - y }
            local realcolor = Color3.fromHSV(color[1], color[2], color[3])
            colorCurrent.BackgroundColor3 = realcolor
            callback(realcolor)
          end
        end

        local function setcolor(tbl)
          local cx = cursor.AbsoluteSize.X / 2
          local cy = cursor.AbsoluteSize.Y / 2
          color = { tbl[1], tbl[2], tbl[3] }
          cursor.Position = UDim2.new(color[1], -cx, color[2] - 1, -cy)
          cursor2.Position = UDim2.new(0.5, 0, color[3] - 1, -cy)
          local realcolor = Color3.fromHSV(color[1], color[2], color[3])
          colorCurrent.BackgroundColor3 = realcolor
        end
        local function setrgbcolor(tbl)
          local cx = cursor.AbsoluteSize.X / 2
          local cy = cursor.AbsoluteSize.Y / 2
          color = { tbl[1], tbl[2], color[3] }
          cursor.Position = UDim2.new(color[1], -cx, color[2] - 1, -cy)
          local realcolor = Color3.fromHSV(color[1], color[2], color[3])
          colorCurrent.BackgroundColor3 = realcolor
          callback(realcolor)
        end
        local function togglerainbow()
          if rainbow then
            game.TweenService:Create(toggleEnabled,
              TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
              ImageTransparency = 1
            }):Play()
            rainbow = false
            rainbowconnection:Disconnect()
          else
            game.TweenService:Create(toggleEnabled,
              TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), {
              ImageTransparency = 0
            }):Play()
            rainbow = true
            rainbowconnection = rs.RenderStepped:Connect(function()
              setrgbcolor({ zigzag(counter), 1, 1 })
              counter = counter + 0.01
            end)
          end
        end

        onrainbow.MouseButton1Click:Connect(togglerainbow)
        --
        mouse.Move:connect(cp)
        rgb.MouseButton1Down:connect(function() colorpicker = true end)
        dark.MouseButton1Down:connect(function() darknesss = true end)
        uis.InputEnded:Connect(function(input)
          if input.UserInputType.Name == 'MouseButton1' then
            if darknesss then darknesss = false end
            if colorpicker then colorpicker = false end
          end
        end)
        setcolor({ h, s, v })
      end

      function Elements:NewLabel(title)
        local labelFunctions = {}
        local label = Instance.new("TextLabel")
        local UICorner = Instance.new("UICorner")
        label.Name = "label"
        label.Parent = sectionInners
        label.BackgroundColor3 = themeList.SchemeColor
        label.BorderSizePixel = 0
        label.ClipsDescendants = true
        label.Text = title
        label.Size = UDim2.new(0, 352, 0, 33)
        label.Font = Enum.Font.Gotham
        label.Text = "  " .. title
        label.RichText = true
        label.TextColor3 = themeList.TextColor
        Objects[label] = "TextColor3"
        label.TextSize = 14.000
        label.TextXAlignment = Enum.TextXAlignment.Left

        UICorner.CornerRadius = UDim.new(0, 4)
        UICorner.Parent = label

        if themeList.SchemeColor == Color3.fromRGB(255, 255, 255) then
          Utility:TweenObject(label, { TextColor3 = Color3.fromRGB(0, 0, 0) }, 0.2)
        end
        if themeList.SchemeColor == Color3.fromRGB(0, 0, 0) then
          Utility:TweenObject(label, { TextColor3 = Color3.fromRGB(255, 255, 255) }, 0.2)
        end

        coroutine.wrap(function()
          while wait() do
            label.BackgroundColor3 = themeList.SchemeColor
            label.TextColor3 = themeList.TextColor
          end
        end)()
        updateSectionFrame()
        UpdateSize()
        function labelFunctions:UpdateLabel(newText)
          if label.Text ~= "  " .. newText then
            label.Text = "  " .. newText
          end
        end

        return labelFunctions
      end

      return Elements
    end

    return Sections
  end

  return Tabs
end

return Kavo
