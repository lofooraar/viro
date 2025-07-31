-- Создание ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CodeVerification"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

-- Фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 180)
Frame.Position = UDim2.new(0.5, -150, 0.5, -90)
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.BorderSizePixel = 0
Frame.Parent = ScreenGui

-- Заголовок
local Title = Instance.new("TextLabel")
Title.Text = "Введите код доступа"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Parent = Frame

-- Поле ввода
local TextBox = Instance.new("TextBox")
TextBox.PlaceholderText = "Введите код..."
TextBox.Font = Enum.Font.Gotham
TextBox.TextSize = 16
TextBox.Size = UDim2.new(0.8, 0, 0, 40)
TextBox.Position = UDim2.new(0.1, 0, 0.4, 0)
TextBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
TextBox.Parent = Frame

-- Кнопка подтверждения
local Button = Instance.new("TextButton")
Button.Text = "Подтвердить"
Button.Font = Enum.Font.GothamBold
Button.TextSize = 16
Button.Size = UDim2.new(0.6, 0, 0, 35)
Button.Position = UDim2.new(0.2, 0, 0.75, 0)
Button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
Button.TextColor3 = Color3.fromRGB(255, 255, 255)
Button.Parent = Frame

-- Обработка нажатия кнопки
local VALID_CODES = {
    ["123456"] = true,
    ["ABCDEF"] = true
}

Button.MouseButton1Click:Connect(function()
    local inputCode = TextBox.Text
    if VALID_CODES[inputCode] then
        Title.Text = "Код принят!"
        wait(1)
        ScreenGui:Destroy()
        -- Продолжение скрипта можно вставить здесь
    else
        Title.Text = "Неверный код!"
    end
end)
