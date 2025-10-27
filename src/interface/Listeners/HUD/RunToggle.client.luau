local Players = game:GetService("Players")

local Observers = require(game.ReplicatedStorage.Libraries.Observers)
local AttributeEnum = require(game.ReplicatedStorage.Shared.Data.Enums.AttributeEnum)

local player = Players.LocalPlayer
local runEnabledEnum = AttributeEnum.RUN_ENABLED

local playerGui = script.Parent.Parent.Parent.Parent
local screen = playerGui.Screen
local RunBtn = screen.RunBtn

local redBg = Color3.new(0.972549, 0, 0)
local greenBg = Color3.new(0, 1, 0.666666)

RunBtn.Activated:Connect(function()
    local runValue = player:GetAttribute(runEnabledEnum)
    player:SetAttribute(runEnabledEnum,not runValue)
end)

local function onRunEnabled(value: boolean)
    RunBtn.BackgroundColor3 = value and redBg or greenBg
end

Observers.observeAttribute(player,runEnabledEnum,onRunEnabled)



