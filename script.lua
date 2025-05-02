local a = false
local b = game:GetService("ReplicatedStorage")

game:GetService("UserInputService").InputEnded:connect(function(i)
    if i.KeyCode == Enum.KeyCode.NumLock then
        a = not a

    end
end)

