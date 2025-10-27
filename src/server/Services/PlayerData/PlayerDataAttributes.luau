
local PlayerProfiles = require(script.Parent.PlayerProfiles)
local AttributeEnum = require(game.ReplicatedStorage.Shared.Data.Enums.AttributeEnum)

export type Attribues = {
	Loaded: boolean,
	RunEnabled: boolean,
}

local loadedEnum = AttributeEnum.LOADED
local runEnabledEnum = AttributeEnum.RUN_ENABLED


local function CreateAttributes(player: Player)
	local Data = PlayerProfiles[player].Data
	player:SetAttribute(loadedEnum,true)
	player:SetAttribute(runEnabledEnum,false)
end

local function GetAttribues(player: Player): Attribues
	return player:GetAttributes()
end

return {
	Create = CreateAttributes,
	Update = CreateAttributes,
	Get = GetAttribues,
}