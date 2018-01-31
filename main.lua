--[[Sir Forge-A-Kraft sets up minecraft servers as FreeBSD jails]]--

-- start with gui toolkit

abstk = require "abstk"
abstk.set_mode(...)

-- abstk works by creating screens and adding them to a wizard
--[[ wizard consists of these screens
    Welcome -> { Init Screen, Create Screen, Manage Screen }
    Init Screen { Installs qjail if not running } -> Confirm ok
    Create Screen { Forge, Spigot, Cuberite } -> Select -> FWD
    Create -> Create.$SRVR -> Confirm { Print out Data, show confirm/OK ? }
    Create Confirm = YES -> Customize Screen 1 { Add Name, Seed, Mods }-> Mod Perms Screen } ->
    Customize Screen 2 { Add mods, review mod perms, confirm } ->
    Create Final Confirm Screen { Create and Start, Create and Do Not Start }
    Manage Screen { Select Server -> Manage selected server } 
    Manage Screen.Selected { Show Details, Start/Stop Server, BackUp Server, Delete Server, Configure Mods, Restore Backupj } -> Manage Screen.Selected.Confirm?
    ]]--
    
function welcomeScreen()
  local scr = abstk.new_screen("Sir Forge-A-Lot")
  scr:add_image('logo', 'anvil-ol-512.png')
  scr:add_label('about', "A simple tool to provision thy servers and manage thine mods.")
  scr:add_label('instructions', "Click Next to begin.")
  --scr:create_button_box('nav', {"Next", "Quit"})
  welcomeData = scr:run()
  return welcomeData
end

--[[ let's put this in a seperate file]]--
--[[
function config()
  local posix = require "lua-posix"
  local config_file = "kraftalot.txt"
  --add a section here to walk a directory looking for config file
end
]]--

--[[This is the second screen the user sees 
    If there are servers set up, they see the status
    If there are no servers set up, the init screen is offered]]--

function serverStatusScreen()
  local stscrn = abstk.new_screen("Server Status")
  --add something here to check for a config file
  --test for server up and accessible
  --test for running servers
end

--[[User sees this screen if there are no jails/vms/containers listed in config]]--
--[[needs to test to make sure platform is not set up already]]--
function initScreen()
  local scr = abstk.new_screen("Initialize Host")
  scr:add_label("It doesn't look like you have a host set up yet. What platform will you deploy on? Please make a selection.")
  scr:create_combobox('initHost', 'Platform Choice', {'Jail', 'VM', 'Container'}, 1, hostInit(initHost, ofType, typeIndex))
  scr:create_button_box('nav', {'Back', 'Quit'})
  runHost = scr:run()
  return runHost
end

--[[Create a server]]--
--[[needs functionality to check if a type is already created]]--
function createSrvr()
  local scr = abstk.new_screen("Create Server")
  scr:add_label("It doesn't look like you have a server set up yet. What kind of server do you want to run? Please make a selection.")
  scr:create_combobox('initSrvr', 'Server Type', {'Forge', 'Spigot', 'Cuberite'}, 1, srvrInit(initSrvr, ofType, typeIndex))
  scr:create_combobox('srvrVer', 'Release Version', {'1.12.2', '1.11', '1.7.10'}, 1, mcRelease(srvrVer, relnum, relIndex))
  scr:create_button_box('nav', {'Create', 'Back', 'Quit'})
  runCreate = scr:run()
  return runCreate
end

--[[Customize your server - runs after createSrvr]]--
--[[needs test that server was passed and is not nil or running]]--
function customIze(server)
  local scr = abstk.new_screen("Customize Server")
  scr:add_label("You can customize your server now. All fields and selections are optional.")
  scr:add_text_input('seed', 'Enter a seed for world creation','','Max length is 20 characters')
  scr:create_combobox('worldtype', 'Select gameplay mode', {'Creative','Survival'})
  scr:add_text_input('modId',"Please enter username for moderator priviledge")
  scr:add_label("On the next screen, you can add mods to the server.")
  scr:create_button_box('nav', {'Continue', 'Back', 'Quit'})
  runCstmIze = scr:run()
  return runCstmIze
end

--[[customize mods
--  Not sure how I want to do this. Mods can be wonky and fight each other.
--  Mods can have viruses and other bad things, do we test for this?
--  Cuberite Mods go with cuberite, Forge with Forge, Spigot with Spigot, etc
--  Do we download and update these locally in a database? Do we get new ones every time?
--  Do we link mods into server mod directories and if we do, where do their permissions
--  get set?
--  Do we categorize mods and give dropdowns for each?
--  ]]--
--
function modcustomIze(server)
  local scr = abstk.new_screen("Customize Mods")
  scr:add_label("You can add mods to your server now. All fields and selections are optional. When finished, click Next to continue.")
  selmodtable = {}
  for setname, modset in modsetquery() do
  -- need to create modsetquery function here --
    modSelectText = 'Select '..setname..' mods:'
    selmodSet = scr:create_combobox(setname, modSelectText, unpack(modset))
    for mod in selmodSet do
      table.insert(selmodtable, mod)
    end
  end
  scr:create_button_box('nav', {'Confirm', 'Back', 'Quit'})
  runModCstmIze = scr:run()
  return runModCstmIze
end


--[[I think this is where it makes sense to have a class set up for server.
--  Class attributes would be name, server type, server version, moderators, gameplay, world see, and mods
  ]]--

function finalConfirm(server)
  local scr = abstk.new_screen("Confirm Settings")
  scr:add_label("When you are happy with all of your settings, click Confirm to continue. To remove a mod or setting, uncheck the item")
  scr:add_label(server:name)
  scr:add_label(server:srvtype)
  scr:add_label(server:version)
  scr:add_label(server:seed)
  scr:add_label(server:gameplay)
  scr:add_label("Moderators")
  for gamename in server:moderators do
    scr:add_label(gamename)
  end
  for modtypes in server:modset do
    for modid in unpack(modtypes) do
      scr:create_checkbox(confMod, modtypes, modid, modsConfdtbl(modid,modindx, )
      --not sure what this will return? or how to call really

  
  

test1 = welcomeScreen()
