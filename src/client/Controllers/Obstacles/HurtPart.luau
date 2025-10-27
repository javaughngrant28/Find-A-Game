
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local MaidModule = require(ReplicatedStorage.Libraries.Maid)
local TouchConnector = require(script.Parent.Parent.Parent.Components.TouchConnector)

local TOCUH_DELAY = 0.4
local TOUCH_INDEX = 'HurtPart'

local HurtPart = {}
HurtPart.__index = HurtPart

export type Interface = typeof(setmetatable({} :: {
    _MAID: MaidModule.Maid,
    PART: BasePart,
}, HurtPart))

function HurtPart.new(part: BasePart): Interface
    local self = setmetatable({
        _MAID = MaidModule.new(),
        PART = part,
    }, HurtPart)

    self:Spawn()
    
    return self
end

function HurtPart.Touched(self: Interface)
    print('Tocuhed')
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

