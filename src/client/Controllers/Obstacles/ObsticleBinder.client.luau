
local BinderModel = require(game.ReplicatedStorage.Libraries.Binder)
local HurtPart = require(script.Parent.HurtPart)

local HURT_PART_TAG = "HurtPart"

local HurtPartBinder = BinderModel.new(HURT_PART_TAG,HurtPart)
HurtPartBinder:Bind()


