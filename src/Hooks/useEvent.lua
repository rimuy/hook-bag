local CONNECT_METHODS = { "Connect", "connect", "on" }
local DISCONNECT_METHODS = { "Destroy", "destroy", "Disconnect", "disconnect" }

local function connect(obj, callback)
        if typeof(obj) == "RBXScriptSignal" then
                return obj:Connect(callback)
        elseif type(obj) == "table" then
                for _, method in CONNECT_METHODS do
			if type(obj[method]) ~= "function" then
				continue
			end

			return obj[method](obj, callback)
		end
        end

        error("Invalid signal object.", 3)
end

local function createDisconnect(connection)
        return function()
                if connection == nil then
                        return
                end

                for _, method in DISCONNECT_METHODS do
                        if type(connection[method]) ~= "function" then
                                continue
                        end

                        connection[method](connection)
                        return
                end

                error("Invalid connection object.", 4)
        end
end

--[=[
        Memoizes and connects a signal object to a callback listener.

        ```lua
        local function HookedComponent(props, hooks)
                local counter, setCount = useState(0)

                useEvent(mySignal, function(n)
                        -- Assuming that the signal has a number parameter,
                        -- the counter is incremented by `n` every time the signal fires.
                        setCount(function(current)
                                return current + n
                        end)
                end, { counter })(hooks)

                return Roact.createElement("TextLabel", {
                        -- ...
                        Text = "Count: " .. counter,
                })
        end
        ```

        @function useEvent
        @within Hooks
        @param signal RBXScriptSignal
        @param onEvent ((...any) -> ())
        @param dependencies {any} | nil
        @return HookCreator<R>
]=]
local function useEvent(signal, onEvent, deps)
        return function(hooks)
                hooks.useEffect(function()
                        return createDisconnect(connect(signal, onEvent))
                end, deps)
        end
end

return useEvent