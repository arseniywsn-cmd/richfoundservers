-- Создаем базовый GUI
local ScreenGui = Instance.new("ScreenGui")
local MainButton = Instance.new("TextButton")
local ResultsFrame = Instance.new("Frame")
local ResultsLabel = Instance.new("TextLabel")
local isVisible = false

-- Настройка GUI
ScreenGui.Name = "RichPetFinder"
ScreenGui.Parent = game:GetService("CoreGui")

MainButton.Parent = ScreenGui
MainButton.Size = UDim2.new(0, 150, 0, 50)
MainButton.Position = UDim2.new(0.5, -75, 0.9, 0)
MainButton.Text = "Поиск богатых серверов"
MainButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MainButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

ResultsFrame.Parent = ScreenGui
ResultsFrame.Size = UDim2.new(0, 300, 0, 250)
ResultsFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
ResultsFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
ResultsFrame.Visible = false

ResultsLabel.Parent = ResultsFrame
ResultsLabel.Size = UDim2.new(1, 0, 1, 0)
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
            string.find(server.Description:lower(), "high value")) and
           server.PlayerCount < 20 then
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
MainButton.MouseButton1Click:Connect(function()
    if isVisible then
        ResultsFrame.Visible = false
        MainButton.Text = "Поиск богатых серверов"
        isVisible = false
    else
        findRichServers()
        ResultsFrame.Visible = true
        MainButton.Text = "Скрыть меню"
        isVisible = true
    end
end)

-- Закрытие по Esc
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.Escape then
        if isVisible then
            ResultsFrame.Visible = false
            MainButton.Text = "Поиск богатых серверов"
            isVisible = false
        end
    end
end)
