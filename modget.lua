--[[
	The simplest thing I think is to let the user browse plugins on curseforge
	I might want to mirror that site locally
	]]--
	
	requests = require "requests"
	
	function getMods(modtype)
		curseF = "https://www.curseforge.com/minecraft/"
		local modgetUrl = curseF..modtype
		result = requests.get(modgetUrl)
		print(result.text)
	end
	
	getMods("bukkit-plugins")
	
	--[[ TODO :
		-- parse html
		-- use tail call or recursion to switch between mods and other areas
		-- sanitize stuff to print in screen for selection
		--]]