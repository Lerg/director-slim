local _M = {}

-- Main function - MUST return a display.newGroup()
function _M.new()
    -- Display group object
    local localGroup = display.newGroup()
    -- Dim
    local dimRect = effects.newDimRect()

	-- Some text
	local text1 = display.newText('Modern scene definition. Touch to go back.', 0, 0, native.systemFontBold, 18)
	text1:setTextColor(150, 255, 150)
	text1.x = _CX
	text1.y = _CY
    -- On text touch
	function text1:touch (event)
		if event.phase == 'ended' then
            -- Call effect and change scene
			transition.to(dimRect, {time = effects.dimDelay, alpha = 1, onComplete = function ()
                director:changeScene('scene_select')
            end})
		end
	end
	text1:addEventListener('touch', text1)
    localGroup:insert(text1)
    
    -- Insert and run effect
    localGroup:insert(dimRect)
    transition.to(dimRect, {time = effects.dimDelay, alpha = 0})
    
    -- Clean function
	function _M.clean ()
        print ('Clean function called from scene with local _M = {} !')
    end
    
    -- MUST return a display.newGroup()
	return localGroup
end

return _M