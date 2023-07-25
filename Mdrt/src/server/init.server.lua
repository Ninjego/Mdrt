local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local modules = require(replicatedStorage.Shared.Modules)

if not runService:IsServer() then
    error("Client not server")
end

local Mdrt do
    
end

return Mdrt