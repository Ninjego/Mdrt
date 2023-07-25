local replicatedStorage = game:GetService("ReplicatedStorage")
local util = require(replicatedStorage.Shared.Util)

return {
    validate = function(value)
        local player = util:FindPlayer(value)
        return type(value) == "string" and player
    end,
    convert = function(value)
        return util:FindPlayer(value)
    end
}