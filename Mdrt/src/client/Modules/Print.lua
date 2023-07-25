return {
    name = "print";

    args = {
        {
            type = require(script.Parent.Parent.Types.PlayerType);
            name="player";
        },
        {
            type =require(script.Parent.Parent.Types.StringType);
            name="string";
        }
    };

    runClient = function(self, player, text)   
        print(player.Name .. " | " .. text)
    end
}