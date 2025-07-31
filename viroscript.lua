-- Удаляем старый GUI
pcall(function() game.CoreGui.ViroGui:Destroy() end)

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ViroGui"
ScreenGui.Parent = game.CoreGui

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Градиент
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 70)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 0, 90))
}
UIGradient.Rotation = 45
UIGradient.Parent = MainFrame

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Text = "Viro script"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextColor3 = Color3.new(1, 1, 1)
Title.BackgroundTransparency = 1
Title.Size = UDim2.new(1, 0, 0, 20)
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Parent = MainFrame

-- Текстбокс
local CodeBox = Instance.new("TextBox")
CodeBox.PlaceholderText = "Введите код..."
CodeBox.Size = UDim2.new(0, 360, 0, 35)
CodeBox.Position = UDim2.new(0, 20, 0, 40)
CodeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
CodeBox.TextColor3 = Color3.new(1, 1, 1)
CodeBox.TextSize = 16
CodeBox.Font = Enum.Font.SourceSans
CodeBox.ClearTextOnFocus = false
CodeBox.BorderSizePixel = 0
CodeBox.Parent = MainFrame

-- Скругление поля ввода
local CodeCorner = Instance.new("UICorner")
CodeCorner.CornerRadius = UDim.new(0, 6)
CodeCorner.Parent = CodeBox

-- Универсальная кнопка
local function createButton(text, posY, callback)
    local btn = Instance.new("TextButton")
    btn.Text = text
    btn.Size = UDim2.new(0, 360, 0, 35)
    btn.Position = UDim2.new(0, 20, 0, posY)
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    btn.TextColor3 = Color3.new(1, 1, 1)
    btn.TextSize = 15
    btn.Font = Enum.Font.GothamMedium
    btn.BorderSizePixel = 0
    btn.AutoButtonColor = true

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
    btn.Parent = MainFrame
end

-- Кнопки
createButton("Панель ввода кода", 90, function()
    print("Открыта панель ввода кода")
end)

createButton("Получить код", 135, function()
    setclipboard("https://go.linkify.ru/27MV")
    print("Ссылка скопирована в буфер обмена!")
end)

createButton("Продолжить", 180, function()
    print("Продолжить с кодом:", CodeBox.Text)
end)

-- // КНОПКА-АВАТАРКА (для сворачивания интерфейса)

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "BerserkIcon"
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BackgroundTransparency = 0
ToggleButton.BorderSizePixel = 0
ToggleButton.Image = "rbxassetid://15468381138" -- Символ "Берсерка"
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0) -- Круглая
UICorner.Parent = ToggleButton

-- Сворачивание
local toggled = true
ToggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    MainFrame.Visible = toggled
end)

