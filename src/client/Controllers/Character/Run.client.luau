local Players = game:GetService("Players")

local Observers = require(game.ReplicatedStorage.Libraries.Observers)
local AttributeEnum = require(game.ReplicatedStorage.Shared.Data.Enums.AttributeEnum)
local CharacterConfig = require(game.ReplicatedStorage.Shared.Data.Config.CharacterConfig)

local player = Players.LocalPlayer
local runEnabledEnum = AttributeEnum.RUN_ENABLED

local WALK_SPEED = CharacterConfig.WALK_SPEED
local RUN_SPEED = CharacterConfig.RUN_SPEED

local currentCharacter = player.Character
local currentSpeed = WALK_SPEED

local function updateMovementSpeed()
    if not currentCharacter then return end
    local humanoid = currentCharacter:FindFirstChildWhichIsA('Humanoid',true) :: Humanoid
    humanoid.WalkSpeed = currentSpeed
end

local function onRunEnabled(value: boolean)
    currentSpeed = value and RUN_SPEED or WALK_SPEED
    updateMovementSpeed()
end

local function onCharacterAdded(_, character: Model)
    currentCharacter = character
    updateMovementSpeed()
    return function ()
        currentCharacter = nil
    end
end

Observers.observeAttribute(player,runEnabledEnum,onRunEnabled)
Observers.observeCharacter(onCharacterAdded)
