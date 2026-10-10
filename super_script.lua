-- =======================================================
-- ⚡ PATRICIO SELECTOR HUB (5 BOTONES + HOVERBOARD FIX)
-- =======================================================

local CoreGui = game:GetService("CoreGui")
local Players = game:GetService("Players")
local localPlayer = Players.LocalPlayer

local TargetParent = pcall(function() return CoreGui.Name end) and CoreGui or localPlayer:WaitForChild("PlayerGui")

-- Limpieza previa
pcall(function()
    if TargetParent:FindFirstChild("PatricioHubGui") then TargetParent.PatricioHubGui:Destroy() end
    if CoreGui:FindFirstChild("PatricioHubGui") then CoreGui.PatricioHubGui:Destroy() end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "PatricioHubGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = TargetParent

-- Ventana Principal
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Size = UDim2.new(0, 330, 0, 420)
MainFrame.Position = UDim2.new(0.5, -165, 0.5, -210)
MainFrame.BackgroundColor3 = Color3.fromRGB(12, 12, 18)
MainFrame.ClipsDescendants = true
MainFrame.Active = true
MainFrame.Draggable = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 80, 180)
MainStroke.Thickness = 2.5

-- Fondo Neón Degradado
local GradientBg = Instance.new("UIGradient", MainFrame)
GradientBg.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 15, 35)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(15, 12, 22)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 25, 40))
})
GradientBg.Rotation = 45

-- Barra Superior
local TitleBar = Instance.new("Frame", MainFrame)
TitleBar.Size = UDim2.new(1, 0, 0, 40)
TitleBar.BackgroundColor3 = Color3.fromRGB(20, 10, 30)
TitleBar.BackgroundTransparency = 0.2

local TitleLabel = Instance.new("TextLabel", TitleBar)
TitleLabel.Size = UDim2.new(1, -40, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, 0, 0)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text = "⚡ PATRICIO SELECTOR HUB"
TitleLabel.TextColor3 = Color3.fromRGB(255, 140, 220)
TitleLabel.TextSize = 13
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TitleBar)
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -35, 0.5, -15)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "❌"
CloseBtn.TextSize = 13
CloseBtn.MouseButton1Click:Connect(function() ScreenGui:Destroy() end)

-- Botón Flotante ⭐
local ToggleBtn = Instance.new("TextButton", ScreenGui)
ToggleBtn.Size = UDim2.new(0, 50, 0, 50)
ToggleBtn.Position = UDim2.new(0.04, 0, 0.25, 0)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(20, 15, 25)
ToggleBtn.Text = "⭐"
ToggleBtn.TextSize = 22
ToggleBtn.Active = true
ToggleBtn.Draggable = true
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(1, 0)
local ToggleStroke = Instance.new("UIStroke", ToggleBtn)
ToggleStroke.Color = Color3.fromRGB(255, 80, 180)
ToggleStroke.Thickness = 2

ToggleBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

-- Contenedor de Botones
local ButtonContainer = Instance.new("Frame", MainFrame)
ButtonContainer.Size = UDim2.new(1, -30, 1, -55)
ButtonContainer.Position = UDim2.new(0, 15, 0, 48)
ButtonContainer.BackgroundTransparency = 1

local Layout = Instance.new("UIListLayout", ButtonContainer)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Padding = UDim.new(0, 8)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center

local function createMenuOption(title, color, orderIndex, callback)
    local btn = Instance.new("TextButton", ButtonContainer)
    btn.Size = UDim2.new(1, 0, 0, 48)
    btn.BackgroundColor3 = color
    btn.BackgroundTransparency = 0.2
    btn.Text = title
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.LayoutOrder = orderIndex
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 10)
    
    local stroke = Instance.new("UIStroke", btn)
    stroke.Color = Color3.fromRGB(255, 255, 255)
    stroke.Thickness = 1.2

    btn.MouseButton1Click:Connect(function()
        pcall(function()
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "⚡ Master Hub",
                Text = "Cargando " .. title .. "...",
                Duration = 2
            })
        end)
        callback()
    end)
end

-- =======================================================
-- 🛹 LÓGICA MODULAR DEL HOVERBOARD (SIN ARCHIVOS EXTERNOS)
-- =======================================================
local function loadNeonHoverboard()
    local RunService = game:GetService("RunService")
    local TweenService = game:GetService("TweenService")
    local SoundService = game:GetService("SoundService")
    local Debris = game:GetService("Debris")
    local Camera = workspace.CurrentCamera

    if localPlayer.Backpack:FindFirstChild("Tabla Magica Pura") or (localPlayer.Character and localPlayer.Character:FindFirstChild("Tabla Magica Pura")) then
        return
    end

    local BoardTool = Instance.new("Tool")
    BoardTool.Name = "Tabla Magica Pura"
    BoardTool.RequiresHandle = true

    local Handle = Instance.new("Part")
    Handle.Name = "Handle"
    Handle.Size = Vector3.new(0.1, 0.1, 0.1)
    Handle.Transparency = 1
    Handle.Parent = BoardTool

    local boostGui, boostBtn
    local isEquipped, isBoosting = false, false
    local currentSpeed, NORMAL_SPEED, BOOST_SPEED = 50, 50, 110
    local bv, bg, fakeBoard, ambientSound
    local originalSoundVolumes = {}

    local function silenceFootsteps(enable)
        pcall(function()
            local char = localPlayer.Character
            if not char then return end
            for _, obj in pairs(char:GetDescendants()) do
                if obj:IsA("Sound") then
                    local name = obj.Name:lower()
                    if name:find("step") or name:find("foot") or name:find("running") or name:find("walk") then
                        if enable then
                            if not originalSoundVolumes[obj] then originalSoundVolumes[obj] = obj.Volume end
                            obj.Volume = 0
                        else
                            if originalSoundVolumes[obj] then obj.Volume = originalSoundVolumes[obj] end
                        end
                    end
                end
            end
        end)
    end

    local function createBoostGUI()
        if boostGui then boostGui:Destroy() end
        boostGui = Instance.new("ScreenGui")
        boostGui.Name = "AxelHoverboardPura"
        boostGui.ResetOnSpawn = false
        boostGui.Parent = TargetParent
        
        boostBtn = Instance.new("TextButton")
        boostBtn.Name = "BoostButton"
        boostBtn.Size = UDim2.new(0, 140, 0, 50)
        boostBtn.Position = UDim2.new(0.80, -70, 0.72, -25)
        boostBtn.BackgroundColor3 = Color3.fromRGB(0, 180, 255)
        boostBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        boostBtn.TextSize = 18
        boostBtn.Font = Enum.Font.GothamBold
        boostBtn.Text = "🚀 IMPULSO"
        boostBtn.Visible = true
        Instance.new("UICorner", boostBtn).CornerRadius = UDim.new(0, 12)
        
        boostBtn.MouseButton1Click:Connect(function()
            if not isBoosting then
                isBoosting = true
                currentSpeed = BOOST_SPEED
                pcall(function()
                    local boostSfx = Instance.new("Sound")
                    boostSfx.SoundId = "rbxassetid://12221967"
                    boostSfx.Volume = 0.8
                    boostSfx.Parent = SoundService
                    boostSfx:Play()
                    Debris:AddItem(boostSfx, 2)
                end)
                TweenService:Create(boostBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(255, 120, 0)}):Play()
                boostBtn.Text = "✨ ¡GO!"
                task.delay(1.5, function()
                    currentSpeed = NORMAL_SPEED
                    isBoosting = false
                    if boostBtn and boostBtn.Parent then
                        TweenService:Create(boostBtn, TweenInfo.new(0.1), {BackgroundColor3 = Color3.fromRGB(0, 180, 255)}):Play()
                        boostBtn.Text = "🚀 IMPULSO"
                    end
                end)
            end
        end)
        boostBtn.Parent = boostGui
    end

    BoardTool.Equipped:Connect(function()
        isEquipped = true
        createBoostGUI()

        pcall(function()
            ambientSound = Instance.new("Sound")
            ambientSound.SoundId = "rbxassetid://6023426915"
            ambientSound.Volume = 0.35
            ambientSound.Looped = true
            ambientSound.Parent = SoundService
            ambientSound:Play()
        end)

        pcall(function()
            local char = localPlayer.Character
            if not char or not char:FindFirstChild("HumanoidRootPart") then return end
            local hrp = char.HumanoidRootPart
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then 
                hum.PlatformStand = true 
                hum:ChangeState(Enum.HumanoidStateType.Freefall)
            end

            fakeBoard = Instance.new("Model")
            fakeBoard.Name = "CustomBoardModel"
            local boardBase = Instance.new("Part")
            boardBase.Name = "BoardBase"
            boardBase.Size = Vector3.new(3.2, 0.4, 5.8)
            boardBase.Color = Color3.fromRGB(0, 255, 255)
            boardBase.Material = Enum.Material.Neon
            boardBase.Anchored = false
            boardBase.CFrame = hrp.CFrame * CFrame.new(0, -3.0, 0)
            boardBase.Parent = fakeBoard
            
            local bodyWeld = Instance.new("WeldConstraint")
            bodyWeld.Part0 = hrp; bodyWeld.Part1 = boardBase; bodyWeld.Parent = hrp
            fakeBoard.Parent = char

            local att1 = Instance.new("Attachment", boardBase)
            att1.Position = Vector3.new(-1.2, 0, 2.7)
            local att2 = Instance.new("Attachment", boardBase)
            att2.Position = Vector3.new(1.2, 0, 2.7)

            local trail = Instance.new("Trail")
            trail.Attachment0 = att1; trail.Attachment1 = att2
            trail.Color = ColorSequence.new(Color3.fromRGB(0, 255, 255))
            trail.Lifetime = 0.8; trail.Parent = boardBase

            bv = Instance.new("BodyVelocity")
            bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
            bv.Velocity = Vector3.new(0, 0, 0); bv.Parent = hrp

            bg = Instance.new("BodyGyro")
            bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
            bg.P = 35000; bg.CFrame = hrp.CFrame * CFrame.Angles(math.rad(-15), 0, 0); bg.Parent = hrp
        end)
    end)

    BoardTool.Unequipped:Connect(function()
        isEquipped = false
        if boostGui then boostGui:Destroy() end
        isBoosting = false
        currentSpeed = NORMAL_SPEED
        pcall(function()
            if ambientSound then ambientSound:Stop() ambientSound:Destroy() end
            silenceFootsteps(false)
            if bv then bv:Destroy() end
            if bg then bg:Destroy() end
            if fakeBoard then fakeBoard:Destroy() end
            local char = localPlayer.Character
            if char then
                local hum = char:FindFirstChildOfClass("Humanoid")
                if hum then 
                    hum.PlatformStand = false
                    hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                end
            end
        end)
    end)

    RunService.RenderStepped:Connect(function()
        pcall(function()
            if isEquipped and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                silenceFootsteps(true)
                local char = localPlayer.Character
                local hum = char:FindFirstChildOfClass("Humanoid")
                local hrp = char.HumanoidRootPart
                if bv and bg then
                    local camCF = Camera.CFrame
                    local moveDir = hum.MoveDirection
                    bg.CFrame = CFrame.new(hrp.Position, hrp.Position + camCF.LookVector) * CFrame.Angles(math.rad(-15), 0, 0)
                    if moveDir.Magnitude > 0 or isBoosting then
                        bv.Velocity = camCF.LookVector * currentSpeed
                    else
                        bv.Velocity = Vector3.new(0, 0, 0)
                    end
                end
            end
        end)
    end)

    BoardTool.Parent = localPlayer.Backpack
end

-- =======================================================
-- 🚀 OPCIONES DEL MENÚ (5 BOTONES)
-- =======================================================

-- 1. Script Universal (JMods)
createMenuOption("🌐 SCRIPT UNIVERSAL", Color3.fromRGB(120, 40, 180), 1, function()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Jmods-universal-224778"))()
        end)
    end)
end)

-- 2. Script Axel (Tu Hub v36)
createMenuOption("⚡ SCRIPT AXEL", Color3.fromRGB(200, 30, 60), 2, function()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/axelacosta504x-cmyk/MisScripts/main/mi_script.lua"))()
        end)
    end)
end)

-- 3. Script Neon (Hoverboard Pro)
createMenuOption("🛹 SCRIPT NEON", Color3.fromRGB(0, 140, 220), 3, function()
    task.spawn(function()
        pcall(loadNeonHoverboard)
    end)
end)

-- 4. Script DANCE EMOTES
createMenuOption("💃 DANCE EMOTES", Color3.fromRGB(0, 160, 100), 4, function()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/7yd7/Hub/refs/heads/Branch/GUIS/Emotes.lua"))()
        end)
    end)
end)

-- 5. Script CATALOG AVATAR
createMenuOption("👕 CATALOG AVATAR", Color3.fromRGB(240, 120, 20), 5, function()
    task.spawn(function()
        pcall(function()
            loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Rob-Catalog-Avatar-Creator-245343"))()
        end)
    end)
end)
