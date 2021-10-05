local createSource = require(script.Parent.createSource)
local nodeModules = script.Parent:FindFirstAncestor("node_modules")

local roactSource = nodeModules:WaitForChild("roact").src
local roactRoduxSource = nodeModules:FindFirstChild("roact-rodux")

return createSource(roactSource, (roactRoduxSource or {}).src)