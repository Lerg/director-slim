local _M = {}

-- Dimming transition time
_M.dimDelay = 1000

-- Special Effect, screen dimming
function _M.newDimRect ()
    local dimRect = display.newRect(0, 0, _W, _H)
    dimRect:setFillColor(20, 60, 60)
    dimRect:setReferencePoint(display.TopLeftReferencePoint)
    dimRect.x, dimRect.y = 0, 0
    dimRect:addEventListener('touch', function () return true end)
    dimRect:addEventListener('tap', function () return true end)
    return dimRect
end

return _M