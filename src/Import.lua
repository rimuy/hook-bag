return function(name, org)
        local module = script.Parent.Parent:FindFirstChild(name)
        local lib

        if not module then
                local rbxts = game:GetService("ReplicatedStorage"):FindFirstChild("rbxts_include")
                if rbxts ~= nil then
                        local TS = require(
                                game:GetService("ReplicatedStorage")
                                        :WaitForChild("rbxts_include")
                                        :WaitForChild("RuntimeLib")
                        )
                        lib = TS.import(script, TS.getModule(script, "@" .. (org or "rbxts"), name:lower()).src)
                else
                        error(("Failed to find %s."):format(name))
                end
        else
                lib = require(module)
        end

        return lib
end