
local function flip()
	local hrp = game.Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
	local cutCF = hrp.CFrame
	local gyro = Instance.new("BodyGyro")
	gyro.CFrame = cutCF * CFrame.Angles(math.rad(180),0,0)
	gyro.D = 1000
	gyro.P = 100000
	gyro.MaxTorque = Vector3.new(math.huge,math.huge,math.huge)
	gyro.Parent = hrp
	task.defer(function()
	while true do
		task.wait()
		local look = workspace.CurrentCamera.CFrame.LookVector
		local flipLook = Vector3.new(look.X,0,look.Z)
		local newCF = CFrame.new(hrp.Position,hrp.Position + flipLook) * CFrame.Angles(math.rad(180),0,0)
		gyro.CFrame = newCF
	end
	end)
end

flip()
