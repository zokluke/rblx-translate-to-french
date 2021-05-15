local language = "fr" -- works with 'en' (english), 'es' (spanish), and 'fr' (french)
game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(messsage)
        local xd = messsage:lower()
        if xd:find(">translate") then
            local message = xd:sub(12, 1000)
            local message = message:gsub(" ", "+") 
            print(message)  
            local xd = game:HttpGet('https://normal-api.ml/translate?text='..message..'&to='..language..'')
	        local data = game.HttpService:JSONDecode(xd)
	        local res = data.translated
	        print(res)
	        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(res,"All")
        end
    end)
end)
for i, player in pairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(messsage)
        local xd = messsage:lower()
        if xd:find(">translate") then
            local message = xd:sub(12, 1000)
            local message = message:gsub(" ", "+") 
            print(message)  
            local xd = game:HttpGet('https://normal-api.ml/translate?text='..message..'&to='..language..'')
	        local data = game.HttpService:JSONDecode(xd)
	        local res = data.translated
	        print(res)
	        game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(res,"All")
        end
    end)
end
