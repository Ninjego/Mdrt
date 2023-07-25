local module = {
    name = "error";

    runClient = function(...)
        error(...)
    end 
}

return module