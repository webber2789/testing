local a = false;
local b = settings();

game:GetService("UserInputService").InputEnded:connect(function(i)
if i.KeyCode == Enum.KeyCode.F3 then
a = not a;
b.Network.IncomingReplicationLag = a and 1000 or 0;
end
end)
