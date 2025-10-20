-- Создаем базовый GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SearchButton = Instance.new("TextButton")
local ResultsLabel = Instance.new("TextLabel")

-- Настройка GUI
ScreenGui.Name = "RichBrainrotFinder"
ScreenGui.Parent = game:GetService("CoreGui")

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0

Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0.15, 0)
Title.Text = "Rich Brainrot Server Finder"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.BackgroundTransparency = 1

SearchButton.Parent = MainFrame
SearchButton.Size = UDim2.new(1, 0, 0.2, 0)
SearchButton.Position = UDim2.new(0, 0, 0.15, 0)
SearchButton.Text = "Начать поиск богатых серверов"
SearchButton.TextColor3 = Color3.fromRGB(255, 255, 255)
SearchButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

ResultsLabel.Parent = MainFrame
ResultsLabel.Size = UDim2.new(1, 0, 0.65, 0)
ResultsLabel.Position = UDim2.new(0, 0, 0.35, 0)
ResultsLabel.Text = "Нажмите кнопку для начала поиска..."
ResultsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
ResultsLabel.BackgroundTransparency = 1
ResultsLabel.TextWrapped = true

-- Функция поиска серверов
local function findRichServers()
    local servers = game:GetService("GamePlaceService"):GetAllGameInstances()
    local foundServers = {}
    
    for _, server in pairs(servers) do
        if string.find(server.Name:lower(), "steal a") and 
           (string.find(server.Description:lower(), "rich") or 
            string.find(server.Description:lower(), "wealthy") or 
            string.find(server.Description:lower(), "high value")) then
            table.insert(foundServers, {
                Name = server.Name,
                Id = server.Id,
                Players = server.PlayerCount
            })
        end
    end
    
    local resultText = ""
    if #foundServers > 0 then
        for i, server in ipairs(foundServers) do
            resultText = resultText .. i .. ". " .. server.Name .. " (ID: " .. server.Id .. ", игроков: " .. server.Players .. ")\n"
        end
    else
        resultText = "Серверы не найдены"
    end
    
    ResultsLabel.Text = resultText
end

-- Обработчик кнопки
SearchButton.MouseButton1Click:Connect(function()
    ResultsLabel.Text = "Поиск..."
    findRichServers()
end)

-- Закрытие по Esc
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape then
        ScreenGui:Destroy()
    end
end)
