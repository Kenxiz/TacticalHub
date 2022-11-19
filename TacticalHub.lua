
local TacticalHub = Instance.new("ScreenGui")
TacticalHub.Name = "TacticalHub"
TacticalHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TacticalHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function VZJCJJ_fake_script()
	local script = Instance.new('LocalScript', TacticalHub)

	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
	local Window = OrionLib:MakeWindow({Name = "TacticalHub", HidePremium = false, IntroText = "TacticalHub loaded! RBLXExploitTech©️", SaveConfig = true, ConfigFolder = "TacticalHub_Config"})
	
	OrionLib:MakeNotification({
		Name = "TacticalHub: Alert",
		Content = "Successfully logged in! Enjoy using TacticalHub!",
		Image = "rbxassetid://4483345998",
		Time = 5
	})
	
	local Aimbot = Window:MakeTab({
		Name = "Aimbot",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	local MainSection = Aimbot:AddSection({
		Name = "Aimbot Configuration"
	})
	
	MainSection:AddToggle({
		Name = "TacticalHub Aimbot",
		Default = false,
		Callback = function(State)
			local localPlayer = game:GetService("Players").LocalPlayer
			
			local function player()
				local target = nil
				local dist = math.huge
				
				for i,v in pairs(game:GetService("Players"):GetPlayers()) do
					if v.Name ~= localPlayer.Name then
						if v.Character and v.Character:FindFirstChild("Head") and v.Character.Humanoid.Health > 0 and v.TeamColor ~= localPlayer.TeamColor then
							local magnitude = (v.Character.HumanoidRootPart.Position - localPlayer.Character.HumanoidRootPart.Position).magnitude
							
							if magnitude < dist then
								target = v
								dist = magnitude
							end
						end
					end
					return target
				end
				
				local camera = game.Workspace.CurrentCamera
				local UIS = game:GetService("UserInputService")
				local aim = false
				
				game:GetService("RunService").RenderStepped:Connect(function()
					if aim then
						camera.CFrame = CFrame.new(camera.CFrame.Position,player().Character.Head.Position)
					end
				end)
				
				UIS.InputBegan:Connect(function(inp)
					if inp.UserInputType == Enum.UserInputType.MouseButton2 then
						aim = true
					end
				end)
				
				UIS.InputEnded:Connect(function(inp)
					if inp.UserInputType == Enum.UserInputType.MouseButton2 then
						aim = false
					end
				end)
			end
		end    
	})
	
	local ConfigSection = Aimbot:AddSection({
		Name = "Aimbot Settings"
	})
	
	ConfigSection:AddLabel("Coming Soon!")
end
coroutine.wrap(VZJCJJ_fake_script)()
