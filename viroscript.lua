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

-- Градиент фона
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
CodeBox.BorderSizePixel = 0
CodeBox.Parent = MainFrame

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

-- Кнопка "Получить код" — ОТКРЫВАЕТ ССЫЛКУ
createButton("Получить код", 90, function()
    local url = "https://go.linkify.ru/27MV"
    if syn and syn.request then
        syn.request({
            Url = url,
            Method = "GET"
        })
        print("Открыта ссылка:", url)
    else
        setclipboard(url)
        print("Ваш инжектор не поддерживает открытие ссылок. Ссылка скопирована в буфер обмена.")

    -- Попробуем скопировать ссылку, если поддерживается
    local clipboardSuccess = false
    if setclipboard then
        pcall(function()
            setclipboard(url)
            clipboardSuccess = true
        end)
    end

    -- Покажем ссылку в поле (на всякий случай)
    CodeBox.Text = url

    -- Добавим уведомление снизу
    local notify = Instance.new("TextLabel")
    notify.Text = "Ссылка " .. (clipboardSuccess and "добавлена в буфер обмена" or "отображена выше") .. ", вставьте её в браузер для получения кода"
    notify.Size = UDim2.new(1, -40, 0, 35)
    notify.Position = UDim2.new(0, 20, 1, -45)
    notify.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    notify.TextColor3 = Color3.fromRGB(200, 200, 200)
    notify.Font = Enum.Font.Gotham
    notify.TextSize = 14
    notify.TextWrapped = true
    notify.TextXAlignment = Enum.TextXAlignment.Center
    notify.TextYAlignment = Enum.TextYAlignment.Center
    notify.Parent = MainFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 6)
    corner.Parent = notify
end)

-- Кнопка "Продолжить"
createButton("Продолжить", 140, function()
    print("Код введён:", CodeBox.Text)
end)

-- Кнопка-сворачивание
local ToggleButton = Instance.new("TextButton")
ToggleButton.Size = UDim2.new(0, 40, 0, 40)
ToggleButton.Position = UDim2.new(0, 10, 0, 10)
ToggleButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ToggleButton.Text = ""
ToggleButton.BorderSizePixel = 0
ToggleButton.Parent = ScreenGui

local Circle = Instance.new("UICorner")
Circle.CornerRadius = UDim.new(1, 0)
Circle.Parent = ToggleButton

-- Скрыть/показать
local toggled = true
ToggleButton.MouseButton1Click:Connect(function()
    toggled = not toggled
    MainFrame.Visible = toggled
end)
