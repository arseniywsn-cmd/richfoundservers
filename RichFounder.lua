-- Создаем базовый GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SearchButton = Instance.new("TextButton")
local AutoJoinButton = Instance.new("TextButton")
local ResultsLabel = Instance.new("TextLabel")
local ToggleButton = Instance.new("TextButton")

-- Настройка GUI
ScreenGui.Name = "RichBrainrotFinder"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.Enabled = true

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 300)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0.1, 0)
Title.Text = "Rich Brainrot Server Finder"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

SearchButton.Parent = MainFrame
SearchButton.Size = UDim2.new(1, 0, 0.15, 0)
SearchButton.Position = UDim2.new(0, 0, 0.1, 0)
SearchButton.Text = "Начать поиск"
SearchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

AutoJoinButton.Parent = MainFrame
AutoJoinButton.Size = UDim2.new(1, 0, 0.15, 0)
AutoJoinButton.Position = UDim2.new(0, 0, 0.25, 0)
AutoJoinButton.Text = "Автоподключение"
AutoJoinButton.TextColor3 = Color3.fromRGB(255, 255, 255)
AutoJoinButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

ResultsLabel.Parent = MainFrame
ResultsLabel.Size = UDim2.new(1, 0, 0.6, 0)
ResultsLabel.Position = UDim2.new(0, 0, 0.4, 0)
ResultsLabel.Text = "Нажмите кнопку для начала поиска..."
ResultsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultsLabel.BackgroundTransparency = 1
ResultsLabel.TextWrapped = true

ToggleButton.Parent = MainFrame
ToggleButton.Size = UDim2.new(0.2, 0, 0.1, 0)
ToggleButton.Position = UDim2.new(0.8, 0, 0, 0)
ToggleButton.Text = "Скрыть"
ToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)

-- Функция поиска серверов
local function findRichServers()
    local servers = game:GetService("GamePlaceService"):GetAllGameInstances()
    local foundServers = {}
    
    for _, server in pairs(servers) do
        if string.find(server.Name:lower(), "steal a") and 
           (string.find(server.Description:lower(), "rich") or 
            string.find(server.Description:lower(), "wealthy") or 
            string.find(server.Description:lower(),
