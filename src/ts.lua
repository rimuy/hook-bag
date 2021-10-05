local createSource = require(script.Parent.createSource)
local nodeModules = script.Parent:FindFirstAncestor("node_modules")

local roactSource = nodeModules:FindFirstChild("roact") or {}
local roactRoduxSource = nodeModules:FindFirstChild("roact-rodux") or {}

return createSource(roactSource.src, roactRoduxSource.src)