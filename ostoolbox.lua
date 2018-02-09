
--[[ Function list
	-- toolbox
		-- need ssh or local access to the machine
		-- need lua?
		-- need routing and internet access
		-- need database?
	-- test for dependencies
		-- everything needs java, wget or fetch
		-- spigot needs git
		-- cuberite needs lua
		-- Forge needs ?
	-- how many running servers?
	]]--
	
local Toolbox = {} --this will be the table for the base Host class
Toolbox.__index = Toolbox -- if instance of a host does not exist, use the methods defined below

setmetatable(Toolbox, {
	__call = function (cls, ...)
		return cls.new(...)
	end,
})

function Toolbox.new(init)
	local self = setmetatable({}, Toolbox)
	self.value = init
	return self
end	

-- Toolbox should have user access, firewall, java, wget/fetch/curl, mod server
function Toolbox:access(access)
	self.access = access
end

function Toolbox:pkgmgr(pkgmgr)
	self.pkgmgr = pkgmgr
end

function Toolbox:firewall(firewall)
	self.firewall = firewall
end

function Toolbox:javakit(javakit)
	self.javakit = javakit
end

function Toolbox:httpGet(httpGet)
	self.httpGet = httpGet
end

function Toolbox:modServer(modServer)
	self.modServer = modServer
end

function Toolbox:luaVer(luaVer)
	self.luaVer = luaVer
end

