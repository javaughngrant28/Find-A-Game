
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MaidModule = require(ReplicatedStorage.Libraries.Maid)
local TouchConnector = require(script.Parent.Parent.Parent.Components.TouchConnector)

local Player = Players.LocalPlayer

local TOCUH_DELAY = 0.4
local TOUCH_INDEX = 'HurtPart'
local VALUE_ATTRIBUTE_NAME = 'Value'
local DEFAULT_DAMEG_VALUE = 100


local HurtPart = {}
HurtPart.__index = HurtPart

export type Interface = typeof(setmetatable({} :: {
    _MAID: MaidModule.Maid,
    PART: BasePart,
    DAMAGE_VALUE: number,
}, HurtPart))

function HurtPart.new(part: BasePart): Interface
    local self = setmetatable({
        _MAID = MaidModule.new(),
        PART = part,
        DAMAGE_VALUE = part:GetAttribute(VALUE_ATTRIBUTE_NAME) or DEFAULT_DAMEG_VALUE
    }, HurtPart)

    self:Spawn()
    
    return self
end

function HurtPart.Touched(self: Interface)
    local character = Player.Character :: Model

    local humanoid = character:FindFirstChildWhichIsA('Humanoid',true) :: Humanoid
    assert(humanoid,`{character} Has No Humanoid`)

    humanoid:TakeDamage(self.DAMAGE_VALUE)
end

function HurtPart.Spawn(self: Interface)
    self._MAID['Touch'] = TouchConnector.Fire(self.PART,TOUCH_INDEX,TOCUH_DELAY,function()
        self:Touched()
    end)
end

function HurtPart.Destroy(self: Interface)
    self._MAID:Destroy()
    for index, _ in pairs(self) do
        self[index] = nil
    end
end

return HurtPart

