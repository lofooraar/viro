-- Удалить, если уже открыт
pcall(function() game.CoreGui.SimpleGui:Destroy() end)

-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SimpleGui"
ScreenGui.Parent = game.CoreGui

-- Основной фрейм
local Frame = Instance.new("Frame")
Frame.Size = UDim2.new(0, 300, 0, 150)
Frame.Position = UDim2.new(0.5, -150, 0.5, -75)
Frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Frame.BorderSizePixel = 0
Frame.Visible = true
Frame.Parent = ScreenGui

-- Поле для ввода
local TextBox = Instance.new("TextBox")
TextBox.PlaceholderText = "Введите текст..."
TextBox.Size = UDim2.new(0, 280, 0, 40)
TextBox.Position = UDim2.new(0, 10, 0, 10)
TextBox.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
TextBox.TextColor3 = Color3.new(1, 1, 1)
TextBox.ClearTextOnFocus = false
TextBox.Parent = Frame

-- Кнопка отправить
local SubmitButton = Instance.new("TextButton")
SubmitButton.Text = "Отправить"
SubmitButton.Size = UDim2.new(0, 130, 0, 35)
SubmitButton.Position = UDim2.new(0, 10, 0, 60)
SubmitButton.BackgroundColor3 = Color3.fromRGB(50, 150, 50)
SubmitButton.TextColor3 = Color3.new(1, 1, 1)
SubmitButton.Parent = Frame

-- Кнопка со ссылкой
local LinkButton = Instance.new("TextButton")
LinkButton.Text = "Перейти в Telegram"
LinkButton.Size = UDim2.new(0, 130, 0, 35)
LinkButton.Position = UDim2.new(0, 160, 0, 60)
LinkButton.BackgroundColor3 = Color3.fromRGB(50, 100, 200)
LinkButton.TextColor3 = Color3.new(1, 1, 1)
LinkButton.Parent = Frame

-- Обработчик "Отправить"
SubmitButton.MouseButton1Click:Connect(function()
    print("Вы ввели: " .. TextBox.Text)
end)

-- Обработчик перехода по ссылке
LinkButton.MouseButton1Click:Connect(function()
    setclipboard("https://t.me/yourchannel") -- ← Ваша ссылка
    print("Ссылка скопирована!")
end)

-- // Кнопка-сворачивающая аватарка (в стиле Берсерка)

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "BerserkIcon"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.BackgroundTransparency = 0
ToggleButton.BorderSizePixel = 0
ToggleButton.Image = "rbxassetid://15468381138" -- <- ID символа жертвы из Берсерка (белый на чёрном)
ToggleButton.ScaleType = Enum.ScaleType.Fit
ToggleButton.Parent = ScreenGui

-- Округление аватарки
local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(1, 0) -- круг
UICorner.Parent = ToggleButton

-- Переключение видимости фрейма
local toggled = true
ToggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    Frame.Visible = toggled
end)
