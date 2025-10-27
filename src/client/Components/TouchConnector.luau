local Players = game:GetService("Players")

local Throttle = require(game.ReplicatedStorage.Libraries.Throttle)
local Player = Players.LocalPlayer


local function Fire(part: BasePart, index: string, tocuhDelay: number,callback: ()-> ()): RBXScriptConnection
    return part.Touched:Connect(function(otherPart: BasePart)
        if otherPart.Parent ~= Player.Character then return end
        Throttle(index,tocuhDelay,function()
            callback()
        end)
    end)
end

return {
    Fire = Fire,
}
