
--[[ Function list
	-- hypervisor
		-- need type
		-- need installstatus
		-- need state (running or stopped)
		-- need create, start, stop, destroy, archive vm command
		-- need instance details which would be a subset of Host class
	]]--
	
local hVisor = {} --this will be the table for the base Host class
Toolbox.__index = hVisor -- if instance of a host does not exist, use the methods defined below

setmetatable(hVisor, {
	__call = function (cls, ...)
		return cls.new(...)
	end,
})

function hVisor.new(init)
	local self = setmetatable({}, hVisor)
	self.value = init
	return self
end	