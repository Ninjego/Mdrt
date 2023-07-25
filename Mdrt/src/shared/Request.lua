local runService = game:GetService("RunService")
local modules = require(script.Parent.Modules)

local Request = {}

function Request.new(settings) 
    local self = {
        name = settings.name;
        executor = settings.executor;
        used = settings.used;
        args = settings.args or {};
        response = nil;
    }

    setmetatable(self, Request)

    return self
end

function Request:run(request)
    if not self:validRequest(request) then
        error("This is not a module!")
    end

    if(runService:IsClient()) then
        local module = modules:getModule(request.name)
        if module and type(module.runClient) == "function" then
            local typedArgs = modules:convertArguments(module.args, request.args)
            module:runClient(table.unpack(typedArgs))
            return true
        else
            error("Invalid module or missing runClient function.")
            return false
        end
    end
end

function Request:validRequest(request)
    for i in pairs(modules["Commands"]) do
        local command = modules["Commands"][i]
        if(command["name"] == request["name"]) then
            return true
        end
    end
    return false
end


return Request