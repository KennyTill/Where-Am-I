WhereAmI = LibStub("AceAddon-3.0"):NewAddon("Where Am I", "AceConsole-3.0", "AceEvent-3.0");
serverName = "";


function WhereAmI:HandleChatCommandFunc(input)
    self:Print("You are currently on " .. serverName);
end


function WhereAmI:OnInitialize()
    self:RegisterChatCommand("where", "HandleChatCommandFunc", true);
    self:RegisterChatCommand("whereami", "HandleChatCommandFunc", true);
    self:RegisterChatCommand("WhereAmI", "HandleChatCommandFunc", true);
    self:RegisterEvent("GROUP_ROSTER_UPDATE", "HandleChanges");
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "HandleChanges");
    self:RegisterEvent("ZONE_CHANGED", "HandleChanges")
end


function WhereAmI:HandleChanges()


    --updates just based on previous server name
    local inInstance, instanceType = IsInInstance();
    if inInstance then
        --do nothing, we are in an instance
        return
    end
    -- this may only return the user's realm, I think some other addons are faking current server by parsing party leader's name
    if serverName ~= GetRealmName() then
        serverName = GetRealmName();
        self:Print("You are now on " .. serverName);
    end
end
