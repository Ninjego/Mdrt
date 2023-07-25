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



return Modules