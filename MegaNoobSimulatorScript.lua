local library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/Squex01/MegaNoobSimulatorScript/main/MegaNoobSim.lua")))()
local w = library:CreateWindow("Mega Noob Simulator")
local b = w:CreateFolder("AutoFarm")
local d = w:CreateFolder("AutoBuy")
local e = w:CreateFolder("Mix")
local c = w:CreateFolder("Credits")
local WN = "Bacons"

b:Toggle(
"AutoKill",
function(bool)
  shared.toggle = bool
  AutoKill = bool
end
)

b:Dropdown(
"Bacons",
{
  "Bacons",
  "BetterBacons",
  "BestBacons",
  "StrongBacons",
  "HugeBacons",
  "WorkoutBacons",
  "MuscleBacons",
  "JackedBacons",
  "MassiveBacons",
  "MuscleHeadBacons",
  "SpaceBacons",
  "JetpackBacons",
  "DualWieldBacons",
  "SkeleBacons",
  "PumpkinBacons",
  "GoofyBacons",
  "GreenElfBacons",
  "BlueElfBacons",
  "Goon1s",
  "Swashbuckler1s",
  "Swashbuckler2s",
  "Goon2s",
},
true,
function(Value)
  WN = Value
end
)

b:Toggle(
"AutoCoin",
function(bool)
  shared.toggle = bool
  AutoCoin = bool
end
)

d:Toggle(
"AutoWeight",
function(bool)
  shared.toggle = bool
  AutoBuy = bool
end
)

e:Toggle(
"AntiAfk",
function(bool)
  shared.toggle = bool
  AntiAfk = bool
end
)

c:Button(
"maxgat5#8395",
function()
  setclipboard("maxgat5#8395")
end
)

c:Button(
"MaGiXx#2325",
function()
  setclipboard("MaGiXx#2325")
end
)

c:Button(
"Discord Server",
function()
  setclipboard("https://discord.gg/K4txdRSVfq")
end
)

while wait() do
  ----AutoFarm
  if AutoKill == true then
    for i, v in pairs(game:GetService("Workspace").BaconStuff[WN]:GetChildren()) do
      if v.ClassName == "Model" then
        for i,v1 in pairs(v:GetChildren()) do
          if v1.Name == "Head" then

            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v1.CFrame.Position + Vector3.new(0, 0, 0))

            local args = {v}

            game:GetService("ReplicatedStorage").Remotes.Punch:FireServer(unpack(args))
            wait()
            if workspace[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid") then
              local tool =
              game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool") or
              game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
              game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
              if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
                tool:Activate()
              end
            end
          end
        end
      end
    end
  end
  if AutoBuy == true then
    for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.ShopFrame.Menu.Upgrades:GetChildren()) do
      game:GetService("ReplicatedStorage").Remotes.Buy:FireServer(v.Name,"Damage")
    end

  end
  if AutoCoin == true then
    for i,v in pairs(game:GetService("Workspace").CoinStuff:GetDescendants()) do
      if v.Name == "CoinCollectible" then
        v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
      end
    end
  end
  if AntiAfk == true then
    local bb=game:service'VirtualUser'
    bb:CaptureController()
    bb:ClickButton2(Vector2.new())
  end
end