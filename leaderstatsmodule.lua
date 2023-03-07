local module = {}

local datastore = game:GetService("DataStoreService")
local datatstorew = datastore:GetDataStore("Lead")

function module.loadLeadersats(cashStrings, plr, leaderstatsname)
	for i, Saves in pairs(cashStrings) do
		local data
		
		local succes, errormessage = pcall(function()
			data = datatstorew:GetAsync(plr.UserId.. "-".. Saves)
		end)
		
		if succes then
			plr[leaderstatsname][Saves].Value = data
		else
			warn(errormessage)
		end
	end
end

function module.makeLeaderstats(cashStrings, plr, leaderstatsname)
	local lead = Instance.new("Folder", plr)
	lead.Name = leaderstatsname
	
	for i, c in pairs(cashStrings) do
		local new = Instance.new("IntValue", lead)
		new.Name = c
	end
	
	module.loadLeadersats(cashStrings, plr, leaderstatsname)
end

function module.saveLeaderstats(cashStrings, plr, leaderstatsname)
	for i, Saves in pairs(cashStrings) do
		local succes, errormessage = pcall(function()
			datatstorew:SetAsync(plr.UserId.. "-".. Saves, plr[leaderstatsname][Saves].Value)
		end)
		
		if succes then
			print("Saved Succesfully !")
		else
			warn(errormessage)
		end
	end
end

return module
