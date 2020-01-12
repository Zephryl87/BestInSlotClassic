-- Basic Command Handlers.
local function ShowManager(args)
    print("Main function called");
end

local function ShowHelp(args)
    print("You requested for help !");
end

-- "Elegant" way to handle switch case in LUA.
handlers = {
    [""] = ShowManager,
    ["help"] = ShowHelp    
}

-- Parser of all commands provided which should start by /bis or /bestinslot.
-- Displays help if the command is unknown.
local function HandleCommands(msg, editBox)
    if type(handlers[msg]) == "function" then
        handlers[msg](msg);
    else
        print("Unknown command: "..msg);
        handlers["help"](msg);
    end    
end

-- Slash Commands
SLASH_BIS1, SLASH_BIS2 = "/bis", "/bestinslot";
SlashCmdList["BIS"] = HandleCommands;