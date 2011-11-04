-- Director Slim
director = require('director')

-- Scene change effects
effects = require('effects')

-- Global constants
_W = display.contentWidth
_H = display.contentHeight
_CX = _W / 2
_CY = _H / 2

-- Main function
local function main()
    director:changeScene('scene_select')
end
main()
