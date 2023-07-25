
local Modules = {

    ModuleMethods = {"name"};

    Commands = {};
}

function Modules:registerModule(class)
    if typeof(class) == "Instance" then
        class = require(class)
    end

    table.insert(self.Commands, class)
end

function Modules:registerModuleFolder(folder)

    for i in pairs(folder:GetChildren()) do

        if not folder:GetChildren()[i]:IsA("ModuleScript") then
            continue
        end

        local class = folder:GetChildren()[i]
        self:registerModule(class)
    end

end

function Modules:getModule(name)
    for i in pairs(self.Commands) do
        if(self.Commands[i]["name"]:lower() == name:lower()) then
            return self.Commands[i]
        end
    end
    return nil
end

function Modules:convertArguments(moduleArgs, rawArg)
    local util = require(script.Parent.Util)
    local typedArgs = {}
    local rawArgs = util:splitString(rawArg)
    for i, arg in ipairs(moduleArgs) do
        local typeModule = arg.type
        local argName = arg.name
        local isValid = typeModule.validate(rawArgs[i])

        if not isValid then
            error("Invalid argument type for '" .. argName .. "'.")
        end

        local typedArgValue = typeModule.convert(rawArgs[i])
        table.insert(typedArgs, typedArgValue)
    end

    return typedArgs
end



return Modules