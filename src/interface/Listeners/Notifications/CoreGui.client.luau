local ReplicatedStorage = game:GetService("ReplicatedStorage")
local StarterGui = game:GetService("StarterGui")

local NotificationEnum = require(game.ReplicatedStorage.Shared.Data.Enums.NotificationEnum)
local NotificationTypes = require(game.ReplicatedStorage.Shared.Data.Types.NotificationTypes)

local NotificationEvent = ReplicatedStorage.Events.Notification
local CoreGuiEnum = NotificationEnum.Types.CORE_GUI

local Images = ReplicatedStorage.Assets.Images
local DefaultIcon: ImageLabel = Images.DefaultObject


local function onEvent(_type: string,CoreGuiData: NotificationTypes.CoreGuiData)
    if _type ~= CoreGuiEnum then return end

    StarterGui:SetCore("SendNotification",{
        Text = CoreGuiData.Text,
        Title = CoreGuiData.Title,
        Icon = CoreGuiData.Icon or DefaultIcon.Image,
        Duration = CoreGuiData.Duration,
    })

end

NotificationEvent.OnClientEvent:Connect(onEvent)

