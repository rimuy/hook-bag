return function(name, org)
        local module
        local lib

        name = name:lower()

        for _, c in ipairs(script.Parent.Parent:GetChildren()) do
                if c:IsA("ModuleScript") and name == c.Name:lower() then
                        module = c
                        break
                end
        end

        if not module then
                local rbxts = game:GetService("ReplicatedStorage"):FindFirstChild("rbxts_include")
                if rbxts ~= nil then
                        local TS = require(
                                game:GetService("ReplicatedStorage")
                                        :WaitForChild("rbxts_include")
                                        :WaitForChild("RuntimeLib")
                        )
                        lib = TS.import(script, TS.getModule(script, "@" .. (org or "rbxts"), name).src)
                else
                        error(("Failed to find %s."):format(name))
                end
        else
                lib = require(module)
        end

        return lib
end