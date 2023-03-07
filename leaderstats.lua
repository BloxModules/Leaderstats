local Display = true //display the leaderboard

local allcash = {"Cash"} //all names of cash/points/etc

local leaderstatsname = "" //set a leaderstats name (does not work do not use)
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
