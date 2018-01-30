--[[Sir Forge-A-Kraft sets up minecraft servers as FreeBSD jails]]--

-- start with gui toolkit

abstk = require "abstk"
abstk.set_mode(gtk)

-- abstk works by creating screens and adding them to a wizard
--[[ wizard consists of these screens
    Welcome -> { Init Screen, Create Screen, Manage Screen }
    Init Screen { Installs qjail if not running } -> Confirm ok
    Create Screen { Forge, Spigot, Cuberite } -> Select -> FWD
    Create Screen.Forge { Install Forge Base, Copy Forge Base for New ModSet }
    Create Screen.Spigot { Install Spigot, Copy Spigot Base for New ModSet }
    Create Screen.Cuberite { Install Cuberite, copy Cuberite Base for New ModSet }
    Create -> Create.$SRVR -> Confirm { Print out Data, show confirm/OK ? }
    Create Confirm = YES -> Customize Screen { Add Name, Seed, Mods -> Mod Perms Screen } ->
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
  return scr
end
  
test1 = welcomeScreen()
test1:run()