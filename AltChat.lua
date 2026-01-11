local TextChatService = game:GetService("TextChatService")
local remote = game.ReplicatedStorage.GrabEvents.ExtendGrabLine
local generalChannel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")

TextChatService.OnIncomingMessage = function(message: TextChatMessage)
	if message.TextSource and message.TextSource.UserId == game.Players.LocalPlayer.UserId then
		if message.Status ~= Enum.TextChatMessageStatus.Success then
			return
		end
		print("[DEBUG] Message hooked: "..message.Text)
		remote:FireServer(message.Text)
	end
end

local function ChatMessage(arg1,text) 
	local FormattedText = "<font color='#27F5EE'><b>["..arg1.."]: </b></font>"..text
	generalChannel:DisplaySystemMessage(FormattedText)
end
local Last 
remote.OnClientEvent:Connect(function(arg1,arg2)
	if typeof(arg2) == "string" then 
		if string.len(arg2) <= 150 then 
			print("Received by "..arg1.Name.." Message: "..arg2)
			if arg1 ~= game.Players.LocalPlayer and arg2 ~= Last then 
				Last = arg2
				ChatMessage(arg1.Name,arg2)
			end
		end
	end
end)
