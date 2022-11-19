local TacticalHub = Instance.new("ScreenGui")
TacticalHub.Name = "TacticalHub"
TacticalHub.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
TacticalHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local function TTYCD_fake_script() 
	local script = Instance.new('LocalScript', TacticalHub)

	local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
	local Keyframe = OrionLib:MakeWindow({Name = "TacticalHub - Login", HidePremium = false, IntroEnabled = false, SaveConfig = true, ConfigFolder = "OrionTest"})
	
	_G.Key = "uUdCuGLvY7meEnbcShSkvCZeWfYAKxVeBBFB8MbMXGxJFUVQ"
	_G.KeyInput = "string"
	
	local function checkKey()
		if _G.KeyInput == _G.Key then
			OrionLib:Destroy()
			loadstring(game:HttpGet("https://pastebin.com/CpqRVc3E"))();
		else
			OrionLib:MakeNotification({
				Name = "TacticalHub: Error Alert",
				Content = "Incorrect Key entered. Please try again.",
				Image = "rbxassetid://4483345998",
				Time = 3
			})
		end
	end
	
	local KeyLogin = Keyframe:MakeTab({
		Name = "Key Login",
		Icon = "rbxassetid://4483345998",
		PremiumOnly = false
	})
	
	
	local MainSection = KeyLogin:AddSection({
		Name = "Login to TacticalHub"
	})
	
	MainSection:AddTextbox({
		Name = "Enter Key",
		Default = "",
		TextDisappear = true,
		Callback = function(Value)
			_G.KeyInput = Value
			checkKey()
		end	  
	})
end
coroutine.wrap(TTYCD_fake_script)()
