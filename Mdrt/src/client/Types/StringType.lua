local StringArgument = {
    validate = function(value)
        return type(value) == "string"
    end,
    convert = function(value)
        return value
    end
}

return StringArgument