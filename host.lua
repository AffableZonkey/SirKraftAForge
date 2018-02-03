--[[ implement a server class and functions ]]--

--[[ Function list
	-- test os 
		-- need ssh or local access to the machine
		-- need lua?
		-- freebsd needs qjail, supervisord
		-- linux needs docker or ?? running
		-- need appropriate storage space
		-- need ram
		-- need routing and internet access
		-- need database?
	-- test for dependencies
		-- everything needs java, wget or fetch
		-- spigot needs git
		-- cuberite needs lua
		-- Forge needs ?
	-- test for user id
	-- test for shell
	-- what is hostname
	-- how many running servers?
	]]--
	
local Host = {} --this will be the table for the base Host class
Host.__index = Host -- if instance of a host does not exist, use the methods defined below

setmetatable(Host, {
	__call = function (cls, ...)
		return cls.new(...)
	end,
})



function Host.new(init)
	local self = setmetatable({}, Host)
	self.value = init
	return self
end

-- a class of host has a name, ostype, free disk space, total ram, ip, and a hypervisor
function Host:name(name)
	self.name = name
end
function Host:ostype(ostype)
	self.ostype = ostype
end
function Host:diskfree(diskfree)
	self.diskfree = diskfree
end
function Host:totalram(totalram)
	self.totalram = totalram
end
function Host:hyprvisor(hyprvisor)
	self.hyprvisor = hyprvisor
end
function Host:userid(userid)
	self.userid = userid
end

function Host:ipAddr(ipAddr)
	self.ipAddr = ipAddr
end

function Host:gateWay(gateWay)
	self.gateWay = gateWay
end
