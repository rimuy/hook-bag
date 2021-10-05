local createSource = require(script.createSource)

local roactSource = script.Parent.Roact
local roactRoduxSource = script.Parent.RoactRodux

return createSource(roactSource, roactRoduxSource)