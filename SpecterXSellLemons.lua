local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RS = game:GetService("ReplicatedStorage")

-- Key System Data (GÜNCELLENDİ)
local CORRECT_KEY = "57450894362176735-beta"
local KEY_LINK = "https://loot-link.com/s?jNgcxhwz"

local AutoBuy = false
local AutoUpgrade = false
local AutoFruit = false
local AutoRebirth = false
local AutoPowerLevel = false

-- Eski GUI varsa temizle
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
for _, v in pairs(PlayerGui:GetChildren()) do
    if v.Name == "SpecterXPremium" then v:Destroy() end
end

-- Ana GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SpecterXPremium"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.Parent = PlayerGui

-- Açma/Kapama Butonu
local ToggleBtn = Instance.new("TextButton")
ToggleBtn.Size = UDim2.new(0, 60, 0, 60)
ToggleBtn.Position = UDim2.new(1, -70, 1, -80)
ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
ToggleBtn.Text = "SX"
ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold
ToggleBtn.TextSize = 16
ToggleBtn.ZIndex = 10
ToggleBtn.Parent = ScreenGui
Instance.new("UICorner", ToggleBtn).CornerRadius = UDim.new(0, 30)

-- KEY FRAME
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 380, 0, 240)
KeyFrame.Position = UDim2.new(0.5, -190, 0.5, -120)
KeyFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
KeyFrame.BorderSizePixel = 0
KeyFrame.Visible = true
KeyFrame.ZIndex = 5
KeyFrame.Parent = ScreenGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 16)

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.Position = UDim2.new(0, 0, 0, 10)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "SPECTER X - KEY SYSTEM"
KeyTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 18
KeyTitle.ZIndex = 5
KeyTitle.Parent = KeyFrame

local KeyInput = Instance.new("TextBox")
KeyInput.Size = UDim2.new(0.85, 0, 0, 45)
KeyInput.Position = UDim2.new(0.075, 0, 0, 70)
KeyInput.BackgroundColor3 = Color3.fromRGB(255, 255, 35)
KeyInput.Text = ""
KeyInput.PlaceholderText = "Enter Key Here..."
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 14
KeyInput.ZIndex = 5
KeyInput.Parent = KeyFrame
Instance.new("UICorner", KeyInput).CornerRadius = UDim.new(0, 8)

local GetKeyBtn = Instance.new("TextButton")
GetKeyBtn.Size = UDim2.new(0.4, 0, 0, 42)
GetKeyBtn.Position = UDim2.new(0.075, 0, 0, 135)
GetKeyBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 45)
GetKeyBtn.Text = "Copy Key Link"
GetKeyBtn.TextColor3 = Color3.fromRGB(200, 200, 210)
GetKeyBtn.Font = Enum.Font.GothamBold
GetKeyBtn.TextSize = 13
GetKeyBtn.ZIndex = 5
GetKeyBtn.Parent = KeyFrame
Instance.new("UICorner", GetKeyBtn).CornerRadius = UDim.new(0, 8)

GetKeyBtn.MouseButton1Click:Connect(function()
    pcall(function() setclipboard(KEY_LINK) end)
    GetKeyBtn.Text = "Copied!"
    task.wait(2)
    GetKeyBtn.Text = "Copy Key Link"
end)

local CheckKeyBtn = Instance.new("TextButton")
CheckKeyBtn.Size = UDim2.new(0.4, 0, 0, 42)
CheckKeyBtn.Position = UDim2.new(0.525, 0, 0, 135)
CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
CheckKeyBtn.Text = "Check Key"
CheckKeyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckKeyBtn.Font = Enum.Font.GothamBold
CheckKeyBtn.TextSize = 13
CheckKeyBtn.ZIndex = 5
CheckKeyBtn.Parent = KeyFrame
Instance.new("UICorner", CheckKeyBtn).CornerRadius = UDim.new(0, 8)

-- ANA MENÜ
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 340, 0, 380)
MainFrame.Position = UDim2.new(0.5, -170, 0.5, -190)
MainFrame.BackgroundColor3 = Color3.fromRGB(10, 11, 16)
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ZIndex = 5
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 16)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 50)
TopBar.BackgroundColor3 = Color3.fromRGB(20, 21, 28)
TopBar.BorderSizePixel = 0
TopBar.ZIndex = 5
TopBar.Parent = MainFrame
Instance.new("UICorner", TopBar).CornerRadius = UDim.new(0, 16)

local TitleLbl = Instance.new("TextLabel")
TitleLbl.Size = UDim2.new(0.75, 0, 1, 0)
TitleLbl.Position = UDim2.new(0, 15, 0, 0)
TitleLbl.BackgroundTransparency = 1
TitleLbl.Text = "SPECTER X"
TitleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLbl.Font = Enum.Font.GothamBold
TitleLbl.TextSize = 16
TitleLbl.TextXAlignment = Enum.TextXAlignment.Left
TitleLbl.ZIndex = 5
TitleLbl.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -45, 0, 5)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✕"
CloseBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18
CloseBtn.ZIndex = 6
CloseBtn.Parent = TopBar
CloseBtn.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
end)

local ScrollFrame = Instance.new("ScrollingFrame")
ScrollFrame.Size = UDim2.new(1, -20, 1, -60)
ScrollFrame.Position = UDim2.new(0, 10, 0, 55)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.BorderSizePixel = 0
ScrollFrame.ScrollBarThickness = 3
ScrollFrame.ZIndex = 5
ScrollFrame.Parent = MainFrame

local ListLayout = Instance.new("UIListLayout")
ListLayout.Padding = UDim.new(0, 8)
ListLayout.Parent = ScrollFrame

local function CreateToggle(labelText, getVal, setVal)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, 0, 0, 48)
    Btn.BackgroundColor3 = Color3.fromRGB(20, 21, 28)
    Btn.Text = ""
    Btn.ZIndex = 5
    Btn.Parent = ScrollFrame
    Instance.new("UICorner", Btn).CornerRadius = UDim.new(0, 10)

    local Lbl = Instance.new("TextLabel")
    Lbl.Size = UDim2.new(0.7, 0, 1, 0)
    Lbl.Position = UDim2.new(0, 12, 0, 0)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = labelText
    Lbl.TextColor3 = Color3.fromRGB(200, 200, 210)
    Lbl.Font = Enum.Font.GothamMedium
    Lbl.TextSize = 13
    Lbl.TextXAlignment = Enum.TextXAlignment.Left
    Lbl.ZIndex = 5
    Lbl.Parent = Btn

    local Dot = Instance.new("Frame")
    Dot.Size = UDim2.new(0, 14, 0, 14)
    Dot.Position = UDim2.new(1, -26, 0.5, -7)
    Dot.BackgroundColor3 = Color3.fromRGB(60, 61, 70)
    Dot.ZIndex = 5
    Dot.Parent = Btn
    Instance.new("UICorner", Dot).CornerRadius = UDim.new(0, 14)

    local function refresh()
        local on = getVal()
        Dot.BackgroundColor3 = on and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(60, 61, 70)
        Btn.BackgroundColor3 = on and Color3.fromRGB(15, 40, 30) or Color3.fromRGB(20, 21, 28)
        Lbl.TextColor3 = on and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(200, 200, 210)
    end

    Btn.MouseButton1Click:Connect(function()
        setVal(not getVal())
        refresh()
    end)
    refresh()
end

CreateToggle("Auto Buy Lemons",       function() return AutoBuy end,        function(v) AutoBuy = v end)
CreateToggle("Auto Upgrade Machines", function() return AutoUpgrade end,    function(v) AutoUpgrade = v end)
CreateToggle("Auto Teleport Fruit",   function() return AutoFruit end,      function(v) AutoFruit = v end)
CreateToggle("Auto Rebirth",          function() return AutoRebirth end,    function(v) AutoRebirth = v end)
CreateToggle("Auto Power Level",      function() return AutoPowerLevel end, function(v) AutoPowerLevel = v end)

-- TOGGLE BUTON DRAGGABLE
local tbDragging, tbDragStart, tbStartPos, tbMoved
ToggleBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        tbDragging = true
        tbMoved = false
        tbDragStart = input.Position
        tbStartPos = ToggleBtn.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then tbDragging = false end
        end)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if tbDragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - tbDragStart
        if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then tbMoved = true end
        ToggleBtn.Position = UDim2.new(tbStartPos.X.Scale, tbStartPos.X.Offset + delta.X, tbStartPos.Y.Scale, tbStartPos.Y.Offset + delta.Y)
    end
end)
ToggleBtn.MouseButton1Click:Connect(function()
    if tbMoved then tbMoved = false return end
    if KeyFrame.Visible then return end
    MainFrame.Visible = not MainFrame.Visible
    ToggleBtn.BackgroundColor3 = MainFrame.Visible and Color3.fromRGB(0, 255, 150) or Color3.fromRGB(255, 0, 100)
end)

-- KEY KONTROL
CheckKeyBtn.MouseButton1Click:Connect(function()
    if KeyInput.Text == CORRECT_KEY then
        CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        CheckKeyBtn.Text = "Access Granted!"
        task.wait(1)
        KeyFrame.Visible = false
        MainFrame.Visible = true
        ToggleBtn.BackgroundColor3 = Color3.fromRGB(0, 255, 150)
    else
        CheckKeyBtn.Text = "Invalid Key!"
        CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
        task.wait(2)
        CheckKeyBtn.Text = "Check Key"
        CheckKeyBtn.BackgroundColor3 = Color3.fromRGB(255, 0, 100)
    end
end)

-- OYUN FONKSİYONLARI
local function findTycoon()
    for _, v in pairs(workspace:GetChildren()) do
        if v:IsA("Folder") and string.match(v.Name, "Tycoon%d") then
            local owner = v:FindFirstChild("Owner")
            if owner and owner.Value == LocalPlayer then return v end
        end
    end
    return nil
end

local userTycoon = findTycoon()
task.spawn(function()
    while not userTycoon do task.wait(1) userTycoon = findTycoon() end
end)

local Tycoon, CompClass
pcall(function()
    Tycoon = require(RS.Modules.Tycoon.Tycoon)
    CompClass = {
        Balances = require(RS.Modules.Tycoon.Component.Client.ClientTycoonBalances),
        Rebirth  = require(RS.Modules.Tycoon.Component.Client.ClientTycoonRebirth),
    }
end)

local function comp(class)
    if not (Tycoon and class) then return nil end
    local ok, c = pcall(function() return Tycoon.getLocal():GetComponent(class) end)
    return ok and c or nil
end

local function buyAllAffordable()
    if not userTycoon then return end
    local purchases = userTycoon:FindFirstChild("Purchases")
    if not purchases then return end
    for _, obj in ipairs(purchases:GetDescendants()) do
        if obj:IsA("Model") then
            local shown = obj:GetAttribute("Shown")
            local purchased = obj:GetAttribute("Purchased")
            if shown == true and purchased ~= true then
                local purchase = obj:FindFirstChild("Purchase")
                if purchase and purchase:IsA("RemoteFunction") then
                    pcall(function() purchase:InvokeServer() end)
                end
            end
        end
    end
end

task.spawn(function() while true do task.wait(0.05) if AutoBuy then pcall(buyAllAffordable) end end end)

local upgradeRemotes = {}
local upgradeLevel = {}
local lastUpgradeScan = 0

local function refreshUpgradeRemotes()
    if not userTycoon then return end
    upgradeRemotes = {} upgradeLevel = {}
    local purchases = userTycoon:FindFirstChild("Purchases")
    if not purchases then return end
    for _, obj in ipairs(purchases:GetDescendants()) do
        if obj:IsA("RemoteFunction") and obj.Name == "Upgrade" then
            table.insert(upgradeRemotes, obj)
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.25)
        if AutoUpgrade and userTycoon then
            if tick() - lastUpgradeScan > 3 then pcall(refreshUpgradeRemotes) lastUpgradeScan = tick() end
            for _, remote in ipairs(upgradeRemotes) do
                if remote and remote.Parent then
                    local lvl = (upgradeLevel[remote] or 0) + 1
                    while lvl <= 100 do
                        local ok, res = pcall(function() return remote:InvokeServer(lvl) end)
                        if (not ok) or res == false then break end
                        upgradeLevel[remote] = lvl lvl = lvl + 1
                    end
                end
            end
        end
    end
end)

task.spawn(function()
    while true do
        task.wait(0.25)
        if AutoPowerLevel and userTycoon then
            local remotes = userTycoon:FindFirstChild("Remotes")
            local remote = remotes and remotes:FindFirstChild("UpgradePowerLevel")
            if remote then pcall(function() remote:InvokeServer() end) end
        end
    end
end)

local rebirthBusy = false
task.spawn(function()
    while true do
        task.wait(0.5)
        if AutoRebirth and not rebirthBusy and userTycoon then
            local remotes = userTycoon:FindFirstChild("Remotes")
            local remote = remotes and remotes:FindFirstChild("Rebirth")
            if remote then
                rebirthBusy = true
                pcall(function() remote:InvokeServer() end)
                task.wait(2)
                rebirthBusy = false
            end
        end
    end
end)

local Trees = {}
local function addTree(obj) if obj:IsA("Model") and obj.Name == "LemonTree" and not table.find(Trees, obj) then table.insert(Trees, obj) end end
local function removeTree(obj) local idx = table.find(Trees, obj) if idx then table.remove(Trees, idx) end end
for _, v in ipairs(workspace:GetDescendants()) do addTree(v) end
workspace.DescendantAdded:Connect(addTree)
workspace.DescendantRemoving:Connect(removeTree)

local function collectFruit(tree)
    local character = LocalPlayer.Character
    local hrp = character and character:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = tree:GetPivot() + Vector3.new(0, 5, 0)
    for _, obj in ipairs(tree:GetDescendants()) do
        if obj:IsA("BasePart") and obj.Name == "Fruit" then
            local cp = obj:FindFirstChild("ClickPart")
            local det = cp and cp:FindFirstChildOfClass("ClickDetector")
            if det then task.wait(0.45) pcall(function() fireclickdetector(det) end) end
        end
    end
end

task.spawn(function()
    while true do
        task.wait(0.1)
        if AutoFruit then
            for _, tree in ipairs(Trees) do
                if not AutoFruit then break end
                if tree and tree.Parent then pcall(function() collectFruit(tree) end) end
            end
        end
    end
end)

LocalPlayer.Idled:Connect(function()
    pcall(function()
        local vu = game:GetService("VirtualUser")
        vu:CaptureController()
        vu:ClickButton2(Vector2.new())
    end)
end)
