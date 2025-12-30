--// i have gave the script source to the creator + im making this opensource either way

local repo = 'https://raw.githubusercontent.com/violin-suzutsuki/LinoriaLib/main/'

local Library = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()

if game.PlaceId == 8122612051 then
    Library:Notify("You are currently in the lobby, Join any server and the main script will automatically load!", 7)
    queue_on_teleport("task.wait(2) loadstring(game:HttpGet(\"https://github.com/CatThatDrinksSprite/Moon-Tubbies/raw/main/Moon%20Tubbies.luau\", true))()")
    return
elseif game.PlaceId == 99532682718459 then
    Library:Notify("Loaded! Click RSHIFT to open the UI.", 7)
    queue_on_teleport("loadstring(game:HttpGet(\"https://github.com/CatThatDrinksSprite/Moon-Tubbies/raw/main/Moon%20Tubbies.luau\", true))()")
else
    Library:Notify("You are sadly not in the correct game :( You need to be in \"Slendytubbies VS Redux\"", 7)
    return
end

local Window = Library:CreateWindow({
    Title = "Moon Tubbies";
    Center = true,
    AutoShow = false,
    TabPadding = 8,
    MenuFadeTime = 0.2,
})

local Tabs = {
    Movement = Window:AddTab("Movement"),
    Visuals = Window:AddTab("Visuals"),
    Settings = Window:AddTab("Settings"),
}

local Speed = Tabs.Movement:AddLeftGroupbox("Speed")
local Noclip = Tabs.Movement:AddRightGroupbox("Noclip")
local Custards = Tabs.Movement:AddRightGroupbox("Custards")
local CustardESP = Tabs.Visuals:AddLeftGroupbox("Custard ESP")
local MonsterESP = Tabs.Visuals:AddLeftGroupbox("Monster ESP")
local PlayerESP = Tabs.Visuals:AddRightGroupbox("Player ESP")
local FOV = Tabs.Visuals:AddRightGroupbox("FOV")
local Fog = Tabs.Visuals:AddRightGroupbox("Fog")

Speed:AddToggle("SpeedToggle", {
    Text = "Enable",
    Default = false,
    Tooltip = "Enable's Speed.",
})

Speed:AddSlider("Speed", {
    Text = "Speed Amount",
    Default = 20,
    Min = 20,
    Max = 200,
    Rounding = 1,
    Compact = false,
})

Noclip:AddToggle("NoclipToggle", {
    Text = "Enable",
    Default = false,
    Tooltip = "Enable's Noclip.",
})

Custards:AddButton({
    Text = "Get Custards",
    Func = function()
        for _, v in ipairs(workspace.game.gameCustard:GetChildren()) do
            if v:IsA("Model") and v.Name == "CustardPrefab" and v:FindFirstChild("Touch") and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                firetouchinterest(v.Touch, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
                task.wait(1.3)
            end
        end
    end,
    DoubleClick = false,
    Tooltip = "Get's Every Single Custard. (WARNING: THIS IS BUGGY)",
})

CustardESP:AddToggle("CustardNametags", {
    Text = "Nametags",
    Default = false,
    Tooltip = "Show's Nametags Above Custard.",
}):AddColorPicker("CustardNametagsColor", {
    Default = Color3.fromRGB(237, 123, 216),
    Title = "Custard Nametags Color",
    Transparency = nil,
})

CustardESP:AddToggle("CustardTracers", {
    Text = "Tracers",
    Default = false,
    Tooltip = "Show's Tracers Going To The Custard.",
}):AddColorPicker("CustardTracersColor", {
    Default = Color3.fromRGB(237, 123, 216),
    Title = "Custard Tracers Color",
    Transparency = nil,
})

CustardESP:AddDropdown("CustardTracersPosition", {
    Values = { "Center", "Bottom", },
    Default = 1,
    Multi = false,

    Text = "Tracers Position",
    Tooltip = "The Position Of The Tracers Going To The Custard.",
})

MonsterESP:AddToggle("MonsterNametags", {
    Text = "Nametags",
    Default = false,
    Tooltip = "Show's Nametags Above Monsters.",
}):AddColorPicker("MonsterNametagsColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Monster Nametags Color",
    Transparency = nil,
})

MonsterESP:AddToggle("MonsterTracers", {
    Text = "Tracers",
    Default = false,
    Tooltip = "Show's Tracers Going To The Monsters.",
}):AddColorPicker("MonsterTracersColor", {
    Default = Color3.fromRGB(255, 0, 0),
    Title = "Monster Tracers Color",
    Transparency = nil,
})

MonsterESP:AddDropdown("MonsterTracersPosition", {
    Values = { "Center", "Bottom", },
    Default = 1,
    Multi = false,

    Text = "Tracers Position",
    Tooltip = "The Position Of The Tracers Going To The Monsters.",
})

PlayerESP:AddToggle("PlayerNametags", {
    Text = "Nametags",
    Default = false,
    Tooltip = "Show's Nametags Above Players.",
}):AddColorPicker("PlayerNametagsColor", {
    Default = Color3.fromRGB(0, 128, 255),
    Title = "Player Nametags Color",
    Transparency = nil,
})

PlayerESP:AddToggle("PlayerTracers", {
    Text = "Tracers",
    Default = false,
    Tooltip = "Show's Tracers Going To The Players.",
}):AddColorPicker("PlayerTracersColor", {
    Default = Color3.fromRGB(0, 128, 255),
    Title = "Player Tracers Color",
    Transparency = nil,
})

PlayerESP:AddDropdown("PlayerTracersPosition", {
    Values = { "Center", "Bottom", },
    Default = 1,
    Multi = false,

    Text = "Tracers Position",
    Tooltip = "The Position Of The Tracers Going To The Players.",
})

FOV:AddToggle("ForceFOVToggle", {
    Text = "Force FOV",
    Default = false,
    Tooltip = "Force's The FOV."
})

FOV:AddSlider("ForceFOV", {
    Text = "Force FOV Amount",
    Default = 110,
    Min = 60,
    Max = 110,
    Rounding = 1,
    Compact = false,
})

Fog:AddToggle("RemoveFogToggle", {
    Text = "Remove Fog",
    Default = false,
    Tooltip = "Remove's Fog."
})

Fog:AddToggle("FogColorToggle", {
    Text = "Fog Color",
    Default = false,
    Tooltip = "Change's The Color Of The Fog.",
}):AddColorPicker("FogColor", {
    Default = game.Lighting:GetAttribute("fogcolor"),
    Title = "Fog Color",
    Transparency = nil,
})

game:GetService("RunService").RenderStepped:Connect(function()
    if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("cylinderCollider") and game.Players.LocalPlayer.Character:FindFirstChild("hboxExtend") then
        if Toggles.SpeedToggle.Value == true then
            if game.Players.LocalPlayer.Character.Humanoid.MoveDirection.Magnitude > 0 then
                game.Players.LocalPlayer.Character:TranslateBy(game.Players.LocalPlayer.Character.Humanoid.MoveDirection * Options.Speed.Value * game:GetService("RunService").Heartbeat:Wait())
            end
        end
        if Toggles.NoclipToggle.Value == true then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
            game.Players.LocalPlayer.Character.cylinderCollider.CanCollide = false
            game.Players.LocalPlayer.Character.hboxExtend.CanCollide = false
        else
            game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = true
            game.Players.LocalPlayer.Character.cylinderCollider.CanCollide = true
            game.Players.LocalPlayer.Character.hboxExtend.CanCollide = true
        end
        if Toggles.ForceFOVToggle.Value == true then
            workspace.CurrentCamera.FieldOfView = Options.ForceFOV.Value
        end
        if Toggles.RemoveFogToggle.Value == true then
            game.Lighting.FogEnd = 100000
        else
            game.Lighting.FogEnd = game.Lighting:GetAttribute("fogend")
        end
        if Toggles.FogColorToggle.Value == true then
            game.Lighting.FogColor = Options.FogColor.Value
        else
            game.Lighting.FogColor = game.Lighting:GetAttribute("fogcolor")
        end
    end
end)

local function custardnametag(model)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Size = 13
    text.Text = "Custard"
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("Touch") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.Touch.Position + Vector3.new(0, 1, 0))
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                text.Position = Vector2.new(pos.X, pos.Y)
                text.Visible = Toggles.CustardNametags.Value
            else
                text.Visible = false
            end
            text.Color = Options.CustardNametagsColor.Value
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            text:Destroy()
            text = nil
            render:Disconnect()
        end
    end)
end

local function custardtracer(model)
    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = 1
    line.Transparency = 1
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("Touch") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.Touch.Position + Vector3.new(0, -1.5, 0))
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                line.To = Vector2.new(pos.X, pos.Y)
                line.Visible = Toggles.CustardTracers.Value
            else
                line.Visible = false
            end
            line.Color = Options.CustardTracersColor.Value
            if Options.CustardTracersPosition.Value == "Center" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y /2)
            elseif Options.CustardTracersPosition.Value == "Bottom" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            end
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            line:Destroy()
            line = nil
            render:Disconnect()
        end
    end)
end

local function monsternametag(model)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Size = 13
    text.Text = model.Name
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("HumanoidRootPart") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.HumanoidRootPart.Position + Vector3.new(0, 4, 0))
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                text.Position = Vector2.new(pos.X, pos.Y)
                text.Visible = Toggles.MonsterNametags.Value
            else
                text.Visible = false
            end
            text.Color = Options.MonsterNametagsColor.Value
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            text:Destroy()
            text = nil
            render:Disconnect()
        end
    end)
end

local function monstertracer(model)
    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = 1
    line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("HumanoidRootPart") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.HumanoidRootPart.Position)
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                line.To = Vector2.new(pos.X, pos.Y)
                line.Visible = Toggles.MonsterTracers.Value
            else
                line.Visible = false
            end
            line.Color = Options.MonsterTracersColor.Value
            if Options.MonsterTracersPosition.Value == "Center" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y /2)
            elseif Options.MonsterTracersPosition.Value == "Bottom" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            end
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            line:Destroy()
            line = nil
            render:Disconnect()
        end
    end)
end

local function playernametag(model)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Font = 2
    text.Size = 13
    text.Text = model.Name
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("HumanoidRootPart") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.HumanoidRootPart.Position + Vector3.new(0, 4, 0))
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                text.Position = Vector2.new(pos.X, pos.Y)
                text.Visible = Toggles.PlayerNametags.Value
            else
                text.Visible = false
            end
            text.Color = Options.PlayerNametagsColor.Value
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            text:Destroy()
            text = nil
            render:Disconnect()
        end
    end)
end

local function playertracer(model)
    local line = Drawing.new("Line")
    line.Visible = false
    line.Thickness = 1
    line.Transparency = 1
    line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
    local render = game:GetService("RunService").RenderStepped:Connect(function()
        if model:FindFirstChild("HumanoidRootPart") then
            local pos,onscreen = workspace.CurrentCamera:worldToViewportPoint(model.HumanoidRootPart.Position)
            if onscreen and model ~= game.Players.LocalPlayer.Character then
                line.To = Vector2.new(pos.X, pos.Y)
                line.Visible = Toggles.PlayerTracers.Value
            else
                line.Visible = false
            end
            line.Color = Options.PlayerTracersColor.Value
            if Options.PlayerTracersPosition.Value == "Center" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y /2)
            elseif Options.PlayerTracersPosition.Value == "Bottom" then
                line.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y)
            end
        end
    end)
    model.AncestryChanged:Connect(function(_, parent)
        if not parent then
            line:Destroy()
            line = nil
            render:Disconnect()
        end
    end)
end

for _, v in ipairs(workspace.game.gameCustard:GetChildren()) do
    custardnametag(v)
    custardtracer(v)
end

for _, v in ipairs(workspace.game.Monsters:GetChildren()) do
    monsternametag(v)
    monstertracer(v)
end

for _, v in ipairs(workspace.game.Players:GetChildren()) do
    playernametag(v)
    playertracer(v)
end

workspace.game.gameCustard.ChildAdded:Connect(function(child)
    custardnametag(child)
    custardtracer(child)
end)

workspace.game.Monsters.ChildAdded:Connect(function(child)
    monsternametag(child)
    monstertracer(child)
end)

workspace.game.Players.ChildAdded:Connect(function(child)
    playernametag(child)
    playertracer(child)
end)

ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

SaveManager:IgnoreThemeSettings()

ThemeManager:SetFolder("MoonTubbies")
SaveManager:SetFolder("MoonTubbies")

SaveManager:BuildConfigSection(Tabs.Settings)

ThemeManager:ApplyToTab(Tabs.Settings)

SaveManager:LoadAutoloadConfig()

Library:SetWatermarkVisibility(true)

Library:SetWatermark("Moon Tubbies 12/24/2025 Build")
