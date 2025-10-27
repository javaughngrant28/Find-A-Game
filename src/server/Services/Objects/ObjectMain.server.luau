local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ObjectEvents = ReplicatedStorage.Events.Objects
local CollectEvent = ObjectEvents.Collect
local NotificationEvent = ReplicatedStorage.Events.Notification

local NotificationTypes = require(game.ReplicatedStorage.Shared.Data.Types.NotificationTypes)
local NotificationEnum = require(game.ReplicatedStorage.Shared.Data.Enums.NotificationEnum)


-- Notification Types
local CORE_GUI = NotificationEnum.Types.CORE_GUI
local ERORR = NotificationEnum.Types.ERROR


local function CollectRequest(player: Player, part: BasePart)
    local model = part:FindFirstAncestorWhichIsA('Model')
    local modelName = model.Name

    local CoreGuiData : NotificationTypes.CoreGuiData = {
        Title = modelName,
        Text = 'You Collected A New Sticker!',
        Icon = nil
    }

    NotificationEvent:FireClient(player,CORE_GUI,CoreGuiData)
end


CollectEvent.OnServerEvent:Connect(CollectRequest)
