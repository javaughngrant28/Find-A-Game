
local Players = game:GetService("Players")

local Observers = require(game.ReplicatedStorage.Libraries.Observers)
local CharacterConfig = require(game.ReplicatedStorage.Shared.Data.Config.CharacterConfig)

local JUMP_HIGHT = CharacterConfig.JUMP_HIGHT

local function onCharacterAdded(_, character: Model)
    local humanoid = character:FindFirstChildWhichIsA('Humanoid') :: Humanoid
    humanoid.JumpHeight = JUMP_HIGHT
end

Observers.observeCharacter(onCharacterAdded)

