local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "venecolombia",
    HidePremium = true,
    SaveConfig = false,
    ConfigFolder = "VeneConfig",
    IntroEnabled = false,
    KeySystem = true,
    KeySettings = {
        Title = "venecolombia",
        Subtitle = "Key System",
        Note = "Ingresa la key para acceder",
        FileName = "VeneKey",
        SaveKey = false,
        GrabKeyFromSite = false,
        Key = {"venecolombia"}
    }
})

local TabInicio = Window:MakeTab({
    Name = "Inicio",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

TabInicio:AddLabel("Hola " .. game.Players.LocalPlayer.DisplayName .. ", Disfruta del Script.")

local AutoFarm = false

TabInicio:AddToggle({
    Name = "Auto Fast Rep (Ejercitar)",
    Default = false,
    Callback = function(Value)
        AutoFarm = Value
    end    
})

task.spawn(function()
    while task.wait(0.1) do
        if AutoFarm then
            pcall(function()
                local player = game.Players.LocalPlayer
                local weight = player.Backpack:FindFirstChild("Weight") or player.Character:FindFirstChild("Weight")
                if weight then
                    player.Character.Humanoid:EquipTool(weight)
                    weight:Activate()
                end
            end)
        end
    end
end)

OrionLib:Init()
