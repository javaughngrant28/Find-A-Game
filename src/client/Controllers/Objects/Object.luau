

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MaidModule = require(ReplicatedStorage.Libraries.Maid)
local Throttle = require(game.ReplicatedStorage.Libraries.Throttle)

local Player = Players.LocalPlayer
local ObjectEvents = ReplicatedStorage.Events.Objects
local CollectEvent = ObjectEvents.Collect

local TOCUH_DELAY = 2


local Object = {}
Object.__index = Object

export type Interface = typeof(setmetatable({} :: {
    _MAID: MaidModule.Maid,
    PART: BasePart,
}, Object))

function Object.new(part: BasePart): Interface
    local self = setmetatable({
        _MAID = MaidModule.new(),
        PART = part,
    }, Object)

    self:Spawn()
    
    return self
end

function Object.Touched(self: Interface)
    CollectEvent:FireServer(self.PART)
end

function Object.Spawn(self: Interface)
    self.PART.Touched:Connect(function(otherPart: BasePart)
        if otherPart.Parent ~= Player.Character then return end
        Throttle('ObjectTouched',TOCUH_DELAY,function()
            self:Touched()
        end)
    end)
end

function Object.Destroy(self: Interface)
    self._MAID:Destroy()
    for index, _ in pairs(self) do
        self[index] = nil
    end
end

return Object

