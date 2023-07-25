local modules = require(script.Parent.Modules)

local Util = {

}

function Util:FindPlayer(input)
    for i,player in pairs(game.Players:GetPlayers()) do
        if string.lower(tostring(player.Name)) == string.lower(tostring(input)) then
            return player
        end
    end
end

function Util:splitString(input)
    local text = input
    local array = {}
    local e = 0
    while true do
        local b = e+1
        b = text:find("%S",b)
        if b==nil then break end
        if text:sub(b,b)=="'" then
            e = text:find("'",b+1)
            b = b+1
        elseif text:sub(b,b)=='"' then
            e = text:find('"',b+1)
            b = b+1
        else
            e = text:find("%s",b+1)
        end
        if e==nil then e=#text+1 end
        table.insert(array, text:sub(b,e-1))
    end

    return array
end

return Util
