-- 加载 WindUI 库
local WindUI = loadstring(game:HttpGet("https://github.com/greatjakson-lgtm/-2/blob/main/%E7%9B%AE%E6%A0%87.lua"))()

-- 创建主窗口
local Window = WindUI:CreateWindow({
    Title = "戊脚本",
    Icon = "zap",
    Author = "作者qq3848974452",
    Folder = "KeScript",
    Size = UDim2.fromOffset(100, 150), -- 调整了合适的窗口大小
    Theme = "Dark"
})

---

-- 使用 Section 来创建主要的功能分区
local MainSection = Window:Section({ Title = "主功能" })
local SettingsSection = Window:Section({ Title = "设置" })

-- 在分区内创建具体的标签页
local MainTab = MainSection:Tab({ Title = "功能", Icon = "zap" })
local SettingsTab = SettingsSection:Tab({ Title = "界面", Icon = "settings" })

---


-- 通用脚本按钮
MainTab:Button({
    Title = "通用脚本",
    Desc = "点击运行通用脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/Ke/refs/heads/main/%E9%80%9A%E7%94%A8.lua"))()
            WindUI:Notify({ Title = "通用脚本", Content = "加载成功!", Icon = "check", Duration = 3 })
        end)
    end
})

-- 99夜脚本按钮
MainTab:Button({
    Title = "99夜脚本",
    Desc = "点击运行99夜专用脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/Ke/refs/heads/main/99%E5%A4%9C.lua"))()
            WindUI:Notify({ Title = "99夜脚本", Content = "加载成功!", Icon = "check", Duration = 3 })
        end)
    end
})

-- 鬼畜专用脚本按钮
MainTab:Button({
    Title = "恐鬼症脚本",
    Desc = "点击运行脚本",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/yun5555555555/Ke/refs/heads/main/%E9%AC%BC.lua"))()
            WindUI:Notify({ Title = "鬼畜专用脚本", Content = "加载成功!", Icon = "check", Duration = 3 })
        end)
    end
})

-- doors脚本按钮
MainTab:Button({
    Title = "doors",
    Desc = "即将推出",
    Callback = function()
        WindUI:Notify({ Title = "doors", Content = "暂无脚本", Icon = "alert-triangle", Duration = 3 })
    end
})

---

-- 获取所有可用主题
local themes = {}
for themeName, _ in pairs(WindUI:GetThemes()) do
    table.insert(themes, themeName)
end
table.sort(themes)

-- 主题选择下拉菜单
SettingsTab:Dropdown({
    Title = "更换UI主题",
    Values = themes,
    Value = WindUI:GetCurrentTheme(), -- 默认值为当前主题
    Callback = function(theme)
        WindUI:SetTheme(theme)
        WindUI:Notify({ Title = "主题已切换", Content = "当前主题: " .. theme, Duration = 2 })
    end
})

-- 卸载脚本按钮
SettingsTab:Button({
    Title = "关闭脚本",
    Desc = "點擊將腳本從您屏幕上刪除",
    Callback = function()
        WindUI:Notify({ Title = "脚本", Content = "已卸载 (窗口已销毁)", Duration = 3 })
        Window:Destroy() -- 销毁UI
    end
})

--

-- F5 键开关UI
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessedEvent)
    if gameProcessedEvent then return end
    if input.KeyCode == Enum.KeyCode.F5 then
        Window:Toggle() -- WindUI的窗口开关方法
    end
end)

-- 窗口关闭时的回调
Window:OnClose(function()
    print("窗口已关闭")
end)
