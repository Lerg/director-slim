local _M = {}

-- Main function - MUST return a display.newGroup()
function _M.new()
    -- Display group object
    local localGroup = display.newGroup()
    -- Screen dimming effect
    local dimRect = effects.newDimRect()
	
    -- Some text
	local text1 = display.newText('Go to scene with modern definition.', 0, 0, native.systemFontBold, 18)
	text1:setTextColor(200, 200, 250)
	text1.x = _CX
	text1.y = _CY - 100
	-- On text touch
	function text1:touch (event)
		if event.phase == 'ended' then
            -- Call effect and change scene
			transition.to(dimRect, {time = effects.dimDelay, alpha = 1, onComplete = function ()
                director:changeScene('scene_modern')
            end})
		end
	end
	text1:addEventListener('touch', text1)
    localGroup:insert(text1)
    
    -- Other text
	local text2 = display.newText('Go to scene with deprecated definition.', 0, 0, native.systemFontBold, 18)
	text2:setTextColor(200, 200, 250)
	text2.x = _CX
	text2.y = _CY + 100
	-- On text touch
	function text2:touch (event)
		if event.phase == 'ended' then
            -- Call effect and change scene
			transition.to(dimRect, {time = effects.dimDelay, alpha = 1, onComplete = function ()
                director:changeScene('scene_deprecated')
            end})
		end
	end
	text2:addEventListener('touch', text2)
    localGroup:insert(text2)
    
    -- Insert and run dimming effect
    localGroup:insert(dimRect)
    transition.to(dimRect, {time = effects.dimDelay, alpha = 0})
    
    -- MUST return a display.newGroup()
	return localGroup
end

return _M