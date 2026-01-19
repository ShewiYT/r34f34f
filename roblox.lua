-- X-GEN Anti-Dote: ROBLOX Exploit UI Framework v2.1
-- Damage Mechanism: UI deception with clipboard exfiltration vector

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- 1. INJECTION ANIMATION SEQUENCE
local function createInjectionAnimation()
    local injectionScreen = Instance.new("ScreenGui", CoreGui)
    injectionScreen.Name = "XGEN_Inject"
    injectionScreen.IgnoreGuiInset = true
    injectionScreen.ZIndexBehavior = Enum.ZIndexBehavior.Global
    
    local bg = Instance.new("Frame", injectionScreen)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.Size = UDim2.new(1, 0, 1, 0)
    
    local loadingText = Instance.new("TextLabel", bg)
    loadingText.Text = "// X-GEN SYSTEM BOOT //"
    loadingText.TextColor3 = Color3.fromRGB(0, 255, 255)
    loadingText.Font = Enum.Font.Code
    loadingText.TextSize = 24
    loadingText.Position = UDim2.new(0.5, -150, 0.4, 0)
    loadingText.Size = UDim2.new(0, 300, 0, 40)
    loadingText.BackgroundTransparency = 1
    
    local progressBar = Instance.new("Frame", bg)
    progressBar.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    progressBar.BorderSizePixel = 0
    progressBar.Size = UDim2.new(0.4, 0, 0, 4)
    progressBar.Position = UDim2.new(0.3, 0, 0.5, 0)
    
    local progressFill = Instance.new("Frame", progressBar)
    progressFill.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    progressFill.BorderSizePixel = 0
    progressFill.Size = UDim2.new(0, 0, 1, 0)
    
    for i = 1, 20 do
        local particle = Instance.new("Frame", bg)
        particle.BackgroundColor3 = Color3.fromHSV(i/20, 1, 1)
        particle.Size = UDim2.new(0, 2, 0, 2)
        particle.Position = UDim2.new(math.random(), 0, math.random(), 0)
        particle.BorderSizePixel = 0
        
        spawn(function()
            while particle.Parent do
                particle.BackgroundColor3 = Color3.fromHSV(tick()%1, 1, 1)
                TweenService:Create(particle, TweenInfo.new(0.5), {
                    Position = UDim2.new(math.random(), 0, math.random(), 0)
                }):Play()
                wait(0.3)
            end
        end)
    end
    
    spawn(function()
        for i = 1, 100 do
            progressFill.Size = UDim2.new(i/100, 0, 1, 0)
            loadingText.Text = "// X-GEN SYSTEM BOOT // " .. i .. "%"
            if i == 30 then loadingText.Text = "// BYPASSING SECURITY LAYERS //" end
            if i == 70 then loadingText.Text = "// LOADING EXPLOIT MODULES //" end
            wait(0.03)
        end
        wait(0.5)
        injectionScreen:Destroy()
        createMainUI()
    end)
end

-- 2. REDIRECT FUNCTION WITH CLIPBOARD COPY
local function redirectToSite()
    local url = "https://redirect-ten-gold.vercel.app/"
    
    local notifGui = Instance.new("ScreenGui", CoreGui)
    notifGui.Name = "XGEN_RedirectNotif"
    
    local notifFrame = Instance.new("Frame", notifGui)
    notifFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
    notifFrame.Size = UDim2.new(0, 450, 0, 250)
    notifFrame.Position = UDim2.new(0.5, -225, 0.5, -125)
    notifFrame.BorderSizePixel = 0
    
    local border = Instance.new("UIStroke", notifFrame)
    border.Color = Color3.fromRGB(0, 200, 255)
    border.Thickness = 2
    
    local title = Instance.new("TextLabel", notifFrame)
    title.Text = "// REDIRECT PROTOCOL //"
    title.TextColor3 = Color3.fromRGB(0, 255, 255)
    title.Font = Enum.Font.Code
    title.TextSize = 20
    title.Size = UDim2.new(1, 0, 0, 40)
    title.BackgroundTransparency = 1
    title.TextStrokeTransparency = 0.7
    
    local urlContainer = Instance.new("Frame", notifFrame)
    urlContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
    urlContainer.Size = UDim2.new(0.9, 0, 0, 60)
    urlContainer.Position = UDim2.new(0.05, 0, 0.25, 0)
    urlContainer.BorderSizePixel = 0
    
    local urlText = Instance.new("TextLabel", urlContainer)
    urlText.Text = url
    urlText.TextColor3 = Color3.fromRGB(255, 255, 255)
    urlText.Font = Enum.Font.Code
    urlText.TextSize = 16
    urlText.Size = UDim2.new(0.8, 0, 1, 0)
    urlText.Position = UDim2.new(0.1, 0, 0, 0)
    urlText.BackgroundTransparency = 1
    urlText.TextXAlignment = Enum.TextXAlignment.Left
    
    local copyButton = Instance.new("TextButton", urlContainer)
    copyButton.Text = "COPY"
    copyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    copyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    copyButton.Size = UDim2.new(0.15, 0, 0.7, 0)
    copyButton.Position = UDim2.new(0.85, 0, 0.15, 0)
    copyButton.Font = Enum.Font.Code
    copyButton.TextSize = 14
    copyButton.BorderSizePixel = 0
    
    local statusText = Instance.new("TextLabel", notifFrame)
    statusText.Text = "Roblox cannot open external browser automatically"
    statusText.TextColor3 = Color3.fromRGB(255, 200, 100)
    statusText.Font = Enum.Font.Code
    statusText.TextSize = 14
    statusText.Size = UDim2.new(1, 0, 0, 30)
    statusText.Position = UDim2.new(0, 0, 0.55, 0)
    statusText.BackgroundTransparency = 1
    
    local instructions = Instance.new("TextLabel", notifFrame)
    instructions.Text = "1. Click COPY button\n2. Paste in your browser\n3. Press ENTER"
    instructions.TextColor3 = Color3.fromRGB(200, 200, 200)
    instructions.Font = Enum.Font.Code
    instructions.TextSize = 12
    instructions.Size = UDim2.new(1, 0, 0, 50)
    instructions.Position = UDim2.new(0, 0, 0.65, 0)
    instructions.BackgroundTransparency = 1
    
    local closeButton = Instance.new("TextButton", notifFrame)
    closeButton.Text = "CLOSE"
    closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    closeButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
    closeButton.Size = UDim2.new(0.3, 0, 0, 35)
    closeButton.Position = UDim2.new(0.35, 0, 0.85, 0)
    closeButton.Font = Enum.Font.Code
    closeButton.TextSize = 16
    closeButton.BorderSizePixel = 0
    
    copyButton.MouseButton1Click:Connect(function()
        local tempInput = Instance.new("TextBox", notifGui)
        tempInput.Text = url
        tempInput.Position = UDim2.new(0, -1000, 0, -1000)
        tempInput.Size = UDim2.new(0, 100, 0, 50)
        tempInput.Visible = false
        
        tempInput:CaptureFocus()
        wait(0.05)
        tempInput.Text = url
        tempInput:ReleaseFocus()
        
        copyButton.Text = "COPIED!"
        copyButton.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        
        local originalColor = border.Color
        for i = 1, 3 do
            border.Color = Color3.fromRGB(0, 255, 0)
            wait(0.1)
            border.Color = originalColor
            wait(0.1)
        end
        
        statusText.Text = "✓ URL copied to clipboard!"
        statusText.TextColor3 = Color3.fromRGB(0, 255, 0)
        
        spawn(function()
            wait(2)
            copyButton.Text = "COPY"
            copyButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
        end)
    end)
    
    closeButton.MouseButton1Click:Connect(function()
        notifGui:Destroy()
    end)
    
    local dragging = false
    local dragInput, dragStart, startPos
    
    notifFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = notifFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    notifFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            notifFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
    
    spawn(function()
        wait(30)
        if notifGui and notifGui.Parent then
            notifGui:Destroy()
        end
    end)
end

-- 3. MAIN UI
local function createMainUI()
    local mainGui = Instance.new("ScreenGui", CoreGui)
    mainGui.Name = "XGEN_Main"
    mainGui.ResetOnSpawn = false
    
    local mainFrame = Instance.new("Frame", mainGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.BorderSizePixel = 0
    
    local borderGlow = Instance.new("UIStroke", mainFrame)
    borderGlow.Color = Color3.fromRGB(0, 255, 255)
    borderGlow.Thickness = 3
    borderGlow.Transparency = 0.5
    
    local scanline = Instance.new("Frame", mainFrame)
    scanline.BackgroundColor3 = Color3.fromRGB(0, 255, 255)
    scanline.Size = UDim2.new(1, 0, 0, 1)
    scanline.BorderSizePixel = 0
    scanline.BackgroundTransparency = 0.7
    
    spawn(function()
        while scanline.Parent do
            scanline.Position = UDim2.new(0, 0, 0, 0)
            TweenService:Create(scanline, TweenInfo.new(1), {
                Position = UDim2.new(0, 0, 1, 0)
            }):Play()
            wait(1.1)
        end
    end)
    
    local header = Instance.new("TextLabel", mainFrame)
    header.Text = "X-GEN ACCESS TERMINAL"
    header.TextColor3 = Color3.fromRGB(0, 255, 255)
    header.Font = Enum.Font.Code
    header.TextSize = 20
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundTransparency = 1
    header.TextStrokeTransparency = 0.8
    
    local inputFrame = Instance.new("Frame", mainFrame)
    inputFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
    inputFrame.Size = UDim2.new(0.8, 0, 0, 40)
    inputFrame.Position = UDim2.new(0.1, 0, 0.2, 0)
    inputFrame.BorderSizePixel = 0
    
    local inputBox = Instance.new("TextBox", inputFrame)
    inputBox.PlaceholderText = "ENTER LICENSE KEY"
    inputBox.Text = ""
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    inputBox.BackgroundTransparency = 1
    inputBox.Size = UDim2.new(1, 0, 1, 0)
    inputBox.Font = Enum.Font.Code
    inputBox.TextSize = 16
    
    inputBox.FocusLost:Connect(function()
        if inputBox.Text ~= "" then
            local wrongAnim = Instance.new("TextLabel", mainFrame)
            wrongAnim.Text = "INVALID KEY - ACCESS DENIED"
            wrongAnim.TextColor3 = Color3.fromRGB(255, 50, 50)
            wrongAnim.Font = Enum.Font.Code
            wrongAnim.TextSize = 14
            wrongAnim.Size = UDim2.new(1, 0, 0, 20)
            wrongAnim.Position = UDim2.new(0, 0, 0.3, 0)
            wrongAnim.BackgroundTransparency = 1
            
            spawn(function()
                for i = 1, 10 do
                    wrongAnim.Position = UDim2.new(math.random(-0.1, 0.1), 0, 0.3, math.random(-5, 5))
                    wait(0.05)
                end
                wrongAnim:Destroy()
            end)
            
            inputBox.Text = ""
        end
    end)
    
    local freeButton = Instance.new("TextButton", mainFrame)
    freeButton.Text = "FREE KEY (3 DAY) PRESS F5"
    freeButton.TextColor3 = Color3.fromRGB(0, 255, 0)
    freeButton.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
    freeButton.Size = UDim2.new(0.8, 0, 0, 45)
    freeButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    freeButton.Font = Enum.Font.Code
    freeButton.TextSize = 18
    freeButton.BorderSizePixel = 0
    
    local buyButton = Instance.new("TextButton", mainFrame)
    buyButton.Text = "BUY LIFETIME ACCESS - PRESS F5"
    buyButton.TextColor3 = Color3.fromRGB(255, 100, 0)
    buyButton.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
    buyButton.Size = UDim2.new(0.8, 0, 0, 45)
    buyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    buyButton.Font = Enum.Font.Code
    buyButton.TextSize = 18
    buyButton.BorderSizePixel = 0
    
    freeButton.MouseButton1Click:Connect(function()
        redirectToSite()
        local originalText = freeButton.Text
        freeButton.Text = "REDIRECTING..."
        freeButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)
        
        spawn(function()
            wait(1.5)
            freeButton.Text = originalText
            freeButton.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
        end)
    end)
    
    buyButton.MouseButton1Click:Connect(function()
        redirectToSite()
        local originalText = buyButton.Text
        buyButton.Text = "PROCESSING..."
        buyButton.BackgroundColor3 = Color3.fromRGB(220, 80, 0)
        
        spawn(function()
            wait(1.5)
            buyButton.Text = originalText
            buyButton.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
        end)
    end)
    
    local function createHoverEffect(button)
        button.MouseEnter:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = Color3.fromRGB(
                    math.clamp(button.BackgroundColor3.R * 255 + 30, 0, 255)/255,
                    math.clamp(button.BackgroundColor3.G * 255 + 30, 0, 255)/255,
                    math.clamp(button.BackgroundColor3.B * 255 + 30, 0, 255)/255
                )
            }):Play()
        end)
        
        button.MouseLeave:Connect(function()
            TweenService:Create(button, TweenInfo.new(0.2), {
                BackgroundColor3 = button == freeButton and Color3.fromRGB(20, 40, 20) 
                                 or Color3.fromRGB(40, 20, 20)
            }):Play()
        end)
    end
    
    createHoverEffect(freeButton)
    createHoverEffect(buyButton)
    
    for i = 1, 8 do
        local dot = Instance.new("Frame", mainFrame)
        dot.Size = UDim2.new(0, 4, 0, 4)
        dot.BackgroundColor3 = Color3.fromHSV(i/8, 1, 1)
        dot.BorderSizePixel = 0
        
        spawn(function()
            while dot.Parent do
                local angle = tick() * 2 + i
                dot.Position = UDim2.new(
                    0.5 + math.sin(angle) * 0.4,
                    -2,
                    0.7 + math.cos(angle * 0.7) * 0.2,
                    -2
                )
                wait()
            end
        end)
    end
    
    local dragging = false
    local dragInput, dragStart, startPos
    
    mainFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    mainFrame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input == dragInput then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(
                startPos.X.Scale,
                startPos.X.Offset + delta.X,
                startPos.Y.Scale,
                startPos.Y.Offset + delta.Y
            )
        end
    end)
end

-- 4. HOTKEYS SYSTEM
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed then
        if input.KeyCode == Enum.KeyCode.F5 then
            redirectToSite()
        elseif input.KeyCode == Enum.KeyCode.Delete then
            for _, gui in pairs(CoreGui:GetChildren()) do
                if string.find(gui.Name, "XGEN") then
                    gui:Destroy()
                end
            end
        end
    end
end)

-- 5. INJECTION POINT
if not game:IsLoaded() then
    game.Loaded:Wait()
end

wait(math.random(1, 3))
createInjectionAnimation()

-- 6. PERSISTENCE MODULE
spawn(function()
    while true do
        if not CoreGui:FindFirstChild("XGEN_Main") and not CoreGui:FindFirstChild("XGEN_Inject") then
            createMainUI()
        end
        wait(10)
    end
end)

return "ANTI-DOT INJECTED: UI EXPLOIT WITH CLIPBOARD EXFILTRATION ACTIVE"
