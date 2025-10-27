local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BinderModule = require(game.ReplicatedStorage.Libraries.Binder)
local ObjectEnum = require(game.ReplicatedStorage.Shared.Data.Objects.ObjectEnum)
local Object = require(script.Parent.Object)

local TAG = ObjectEnum.TAG

local ObjectBinder = BinderModule.new(TAG,Object)
ObjectBinder:Bind()


