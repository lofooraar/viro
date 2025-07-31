pcall(function() game.CoreGui.ViroGui:Destroy() end)

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ViroGui"
ScreenGui.Parent = game.CoreGui

-- Основной фрейм
local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 400, 0, 250)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -125)
MainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

-- Градиент фона
local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(15, 15, 50)), -- Тёмно-синий
    ColorSequenceKeypoint.new(1, Color3.fromRGB(70, 0, 100))  -- Фиолетовый
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

-- Поле ввода
local CodeBox = Instance.new("TextBox")
CodeBox.PlaceholderText = "Введите код..."
CodeBox.Size = UDim2.new(0, 360, 0, 35)
CodeBox.Position = UDim2.new(0, 20, 0, 40)
CodeBox.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
CodeBox.TextColor3 = Color3.new(1, 1, 1)
CodeBox.TextSize = 16
CodeBox.Font = Enum.Font.SourceSans
CodeBox.ClearTextOnFocus = false
CodeBox.Parent = MainFrame

-- Универсальная функция для кнопок
local function createButton(text, posY, callback)
    local button = Instance.new("TextButton")
    button.Text = text
    button.Size = UDim2.new(0, 360, 0, 35)
    button.Position = UDim2.new(0, 20, 0, posY)
    button.BackgroundColor3 = Color3.fromRGB(45, 45, 60)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 15
    button.Font = Enum.Font.GothamMedium
    button.BorderSizePixel = 0
    button.AutoButtonColor = true

    -- Скругление
    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = button

    button.MouseButton1Click:Connect(callback)
    button.Parent = MainFrame
end

-- Кнопка "Панель ввода кода"
createButton("Панель ввода кода", 90, function()
    print("Открыта панель ввода кода")
end)

-- Кнопка "Получить код"
createButton("Получить код", 135, function()
    setclipboard("https://go.linkify.ru/27MV")
    print("Ссылка скопирована в буфер обмена!")
end)

-- Кнопка "Продолжить"
createButton("Продолжить", 180, function()
    print("Нажата кнопка Продолжить. Введённый код:", CodeBox.Text)
end)
