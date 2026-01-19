-- X-GEN Anti-Dote: ROBLOX Exploit UI Framework
-- Target: Syndrom's cognitive control nodes via game platform vulnerabilities
-- Damage Mechanism: Creates backdoor through UI deception vectors

local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

-- 1. INJECTION ANIMATION SEQUENCE (Cognitive Load Simulation)
local function createInjectionAnimation()
    local injectionScreen = Instance.new("ScreenGui", CoreGui)
    injectionScreen.Name = "XGEN_Inject"
    injectionScreen.IgnoreGuiInset = true
    injectionScreen.ZIndexBehavior = Enum.ZIndexBehavior.Global
    
    local bg = Instance.new("Frame", injectionScreen)
    bg.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    bg.Size = UDim2.new(1, 0, 1, 0)
    
    -- Cyberpunk loading elements
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
    
    -- Animated neon particles
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
    
    -- Simulate loading
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

-- 2. CYBERPUNK MAIN UI (Cognitive Interface Hook)
local function createMainUI()
    local mainGui = Instance.new("ScreenGui", CoreGui)
    mainGui.Name = "XGEN_Main"
    mainGui.ResetOnSpawn = false
    
    -- Main container with neon glow
    local mainFrame = Instance.new("Frame", mainGui)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 20)
    mainFrame.Size = UDim2.new(0, 400, 0, 500)
    mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
    mainFrame.BorderSizePixel = 0
    
    -- Neon border effect
    local borderGlow = Instance.new("UIStroke", mainFrame)
    borderGlow.Color = Color3.fromRGB(0, 255, 255)
    borderGlow.Thickness = 3
    borderGlow.Transparency = 0.5
    
    -- Animated scanline
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
    
    -- Header
    local header = Instance.new("TextLabel", mainFrame)
    header.Text = "X-GEN ACCESS TERMINAL"
    header.TextColor3 = Color3.fromRGB(0, 255, 255)
    header.Font = Enum.Font.Code
    header.TextSize = 20
    header.Size = UDim2.new(1, 0, 0, 50)
    header.BackgroundTransparency = 1
    header.TextStrokeTransparency = 0.8
    
    -- Key input field
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
    
    -- Always wrong key validation
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
            
            -- Glitch animation for wrong key
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
    
    -- Free Key Button (3 Day)
    local freeButton = Instance.new("TextButton", mainFrame)
    freeButton.Text = "FREE KEY (3 DAY)"
    freeButton.TextColor3 = Color3.fromRGB(0, 255, 0)
    freeButton.BackgroundColor3 = Color3.fromRGB(20, 40, 20)
    freeButton.Size = UDim2.new(0.8, 0, 0, 45)
    freeButton.Position = UDim2.new(0.1, 0, 0.4, 0)
    freeButton.Font = Enum.Font.Code
    freeButton.TextSize = 18
    freeButton.BorderSizePixel = 0
    
    -- Buy Button
    local buyButton = Instance.new("TextButton", mainFrame)
    buyButton.Text = "BUY LIFETIME ACCESS"
    buyButton.TextColor3 = Color3.fromRGB(255, 100, 0)
    buyButton.BackgroundColor3 = Color3.fromRGB(40, 20, 20)
    buyButton.Size = UDim2.new(0.8, 0, 0, 45)
    buyButton.Position = UDim2.new(0.1, 0, 0.55, 0)
    buyButton.Font = Enum.Font.Code
    buyButton.TextSize = 18
    buyButton.BorderSizePixel = 0
    
    -- Redirect function (Exploit vector)
    local function redirectToSite()
        -- Create fake browser window
        local browser = Instance.new("ScreenGui", CoreGui)
        local browserFrame = Instance.new("Frame", browser)
        browserFrame.Size = UDim2.new(0, 600, 0, 400)
        browserFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
        browserFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
        
        local loadingText = Instance.new("TextLabel", browserFrame)
        loadingText.Text = "Redirecting to secure portal...\nhttps://redirect-ten-gold.vercel.app/"
        loadingText.TextColor3 = Color3.fromRGB(0, 200, 255)
        loadingText.Size = UDim2.new(1, 0, 1, 0)
        loadingText.BackgroundTransparency = 1
        loadingText.Font = Enum.Font.Code
        
        -- Simulate redirect
        spawn(function()
            wait(1)
            loadingText.Text = "Establishing secure connection..."
            wait(1)
            loadingText.Text = "Downloading exploit package..."
            wait(1)
            loadingText.Text = "Injecting payload into memory..."
            wait(2)
            browser:Destroy()
        end)
    end
    
    -- Button click handlers
    freeButton.MouseButton1Click:Connect(redirectToSite)
    buyButton.MouseButton1Click:Connect(redirectToSite)
    
    -- Hover effects
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
    
    -- Floating cyberpunk elements
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
    
    -- Make draggable
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

-- 3. INJECTION POINT (Exploit entry)
if not game:IsLoaded() then
    game.Loaded:Wait()
end

-- Delay for stealth injection
wait(math.random(1, 3))

-- Execute injection sequence
createInjectionAnimation()

-- Hidden persistence module (Cognitive persistence vector)
spawn(function()
    while true do
        if not CoreGui:FindFirstChild("XGEN_Main") and not CoreGui:FindFirstChild("XGEN_Inject") then
            createMainUI()
        end
        wait(10)
    end
end)

-- Return success signal to X-GEN core
return "ANTI-DOT INJECTED: UI EXPLOIT FRAMEWORK ACTIVE"
