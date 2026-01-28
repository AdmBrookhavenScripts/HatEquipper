if game.PlaceId == 4924922222 then
local function ClearHats()
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local WearRemote = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Wear")
local Desc = Humanoid:GetAppliedDescription()
for _, accessory in ipairs(Desc:GetAccessories(true)) do
	if accessory.AssetId then
		local args = { tonumber(accessory.AssetId) }
		WearRemote:InvokeServer(unpack(args))
	end
end
end

local function EquipComplexyRig(ids)
if getgenv().ENABLEDRiG then
    return
end

getgenv().ENABLEDRiG = true

	if typeof(ids) ~= "table" then
		return
	end

	local RunService = game:GetService("RunService")
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	
	local LMG2L = {}

	LMG2L["ScreenGui_1"] = Instance.new("ScreenGui")
	LMG2L["ScreenGui_1"].ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	LMG2L["ScreenGui_1"].Parent = LocalPlayer:WaitForChild("PlayerGui")

	LMG2L["Frame_2"] = Instance.new("Frame", LMG2L["ScreenGui_1"])
	LMG2L["Frame_2"].Active = true
	LMG2L["Frame_2"].ZIndex = 5
	LMG2L["Frame_2"].BorderSizePixel = 0
	LMG2L["Frame_2"].BackgroundColor3 = Color3.fromRGB(60, 60, 60)
	LMG2L["Frame_2"].Size = UDim2.new(0, 310, 0, 214)
	LMG2L["Frame_2"].Position = UDim2.new(0, 256, 0, 28)

	LMG2L["UICorner_3"] = Instance.new("UICorner", LMG2L["Frame_2"])
	LMG2L["UICorner_3"].CornerRadius = UDim.new(0, 2)

	LMG2L["UIStroke_4"] = Instance.new("UIStroke", LMG2L["Frame_2"])
	LMG2L["UIStroke_4"].ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	LMG2L["UIStroke_4"].Color = Color3.fromRGB(105, 105, 105)

	LMG2L["TextLabel_5"] = Instance.new("TextLabel", LMG2L["Frame_2"])
	LMG2L["TextLabel_5"].BackgroundTransparency = 1
	LMG2L["TextLabel_5"].BorderSizePixel = 0
	LMG2L["TextLabel_5"].TextSize = 14
	LMG2L["TextLabel_5"].TextColor3 = Color3.new(1,1,1)
	LMG2L["TextLabel_5"].Size = UDim2.new(0, 244, 0, 44)
	LMG2L["TextLabel_5"].Position = UDim2.new(0, 30, 0, 6)
	LMG2L["TextLabel_5"].Text = "applying rig, please wait."

	LMG2L["TextLabel_6"] = Instance.new("TextLabel", LMG2L["Frame_2"])
	LMG2L["TextLabel_6"].BackgroundTransparency = 1
	LMG2L["TextLabel_6"].BorderSizePixel = 0
	LMG2L["TextLabel_6"].TextSize = 12
	LMG2L["TextLabel_6"].TextColor3 = Color3.new(1,1,1)
	LMG2L["TextLabel_6"].Size = UDim2.new(0, 224, 0, 64)
	LMG2L["TextLabel_6"].Position = UDim2.new(0, 36, 0, 28)
	LMG2L["TextLabel_6"].Text = "status:"

	LMG2L["TextLabel_7"] = Instance.new("TextLabel", LMG2L["Frame_2"]);
    LMG2L["TextLabel_7"]["BorderSizePixel"] = 0;
    LMG2L["TextLabel_7"]["TextSize"] = 12;
    LMG2L["TextLabel_7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
    LMG2L["TextLabel_7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
    LMG2L["TextLabel_7"]["BackgroundTransparency"] = 1;
    LMG2L["TextLabel_7"]["Size"] = UDim2.new(0, 100, 0, 26);
    LMG2L["TextLabel_7"]["Text"] = [[duping hats...]];
    LMG2L["TextLabel_7"]["Position"] = UDim2.new(0, 102, 0, 70);
    task.wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("ResetCharacterAppearance"):FireServer()
    task.wait(1)
    ClearHats()
    task.wait(1)
	local Loop
	Loop = RunService.RenderStepped:Connect(function()
		local char = LocalPlayer.Character
		if not char or not char:FindFirstChild("HumanoidRootPart") then
			return
		end

		char.HumanoidRootPart.CFrame = CFrame.new(1e8, 1e8, 1e8)

		for _, id in ipairs(ids) do
			pcall(function()
				ReplicatedStorage.Remotes.Wear:InvokeServer(id)
			end)
		end
	end)
	
	task.wait(30)
	LMG2L["TextLabel_7"].Text = "bypassing hat limit..."
	task.wait(30)
	LMG2L["TextLabel_7"].Text = "finishing..."
	
	Loop:Disconnect()
	Loop = nil

	if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
		LocalPlayer.Character.Humanoid.Health = 0
	end

	game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "notification",
		Text = "rig successfully applied",
		Duration = 5
	})
    getgenv().ENABLEDRiG = false
	return LMG2L["ScreenGui_1"]
end

if typeof(getgenv().Hats_IDS) == "table" then
    EquipComplexyRig(getgenv().Hats_IDS)
else
end
else
return
end