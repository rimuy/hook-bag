return function(name, org)
        name = name:lower()

        local rbxts = game:GetService("ReplicatedStorage"):WaitForChild("rbxts_include")
        local source = require(rbxts:WaitForChild("RuntimeLib")).getModule(script, "@" .. (org or "rbxts"), name) or {}

        return source.src or source.lib
end