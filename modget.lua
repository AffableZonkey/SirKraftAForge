--[[
	The simplest thing I think is to let the user browse plugins on curseforge
	I might want to mirror that site locally
	]]--
	
	requests = require "requests"
	
	-- This function should get get 1 or 2 arguements
	-- The mandatory arg is the modtype which is tacked on to the end of the url
	-- optional arguement is the url itself
	-- #TODO implement as tail call
	function getMods(modtype)
		curseF = "https://www.curseforge.com/minecraft/"
		local modgetUrl = curseF..modtype
		result = requests.get(modgetUrl)
		return result.text
	end
	
	--[[ TODO :
		-- parse html
		-- sanitize stuff to print in screen for selection
		-- interactions with main to list out mods
		--]]
		
	function parseModhtml(modhtmltxt)
		local parser = require "htmlparser"
		parsedmodtxt = parser.parse(modhtmltxt)
		local mhtelements = root(".class:[attribute*='pd-x-1']")
		for _, elemnt in ipairs(mhtelements) do
			print(elemnt.name)
		end
	end
		
	mods = getMods("bukkit-plugins")
	parseModhtml(mods)
