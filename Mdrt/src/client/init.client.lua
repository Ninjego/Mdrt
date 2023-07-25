local RunService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local modules = require(replicatedStorage.Shared.Modules)
local request = require(replicatedStorage.Shared.Request)

local Mdrt do
    Mdrt = setmetatable({
    }, {})

end

if not RunService:IsServer() then
    modules:registerModuleFolder(script.Modules)
end

return Mdrt
