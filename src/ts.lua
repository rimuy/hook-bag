local createSource = require(script.Parent.createSource)
local getSource = require(script.Parent.getRbxtsSource)

local roactSource = getSource("roact")
local roactRoduxSource = getSource("roact-rodux")
local flipperSource = getSource("flipper")
local roselectSource = getSource("roselect")

return createSource({
        roact = roactSource,
        roactRodux = roactRoduxSource,
        flipper = flipperSource,
        roselect = roselectSource,
})