local Display = true

local allcash = {"Cash"}

local leaderstatsname = ""
local module = require(script.Parent.leaderstatsmodule)

if Display == false then
	leaderstatsname = "Leaderstats"
else
	leaderstatsname = "leaderstats"
end

game.Players.PlayerAdded:Connect(function(plr)
	module.makeLeaderstats(allcash,plr,leaderstatsname)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	module.saveLeaderstats(allcash, plr, leaderstatsname)
end)
