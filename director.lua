-- Director Slim - Stripped down Director Class
-- Author: Lerg
-- Release date: 2011-10-30
-- Version: 1.0
-- License: MIT
-- Web: http://developer.anscamobile.com/code/director-slim-stripped-down-director-class
local director = {scene = 'main'}
function director:changeScene (moduleName)
    if type(moduleName) == 'nil' or self.scene == moduleName then return end
    local loadedModule = package.loaded[self.scene]
    if type(loadedModule) == 'table' and type(loadedModule.clean) == 'function' then
        loadedModule.clean()
    end
    if self.view then self.view:removeSelf() end
    if self.scene ~= 'main' and type(loadedModule) == 'table' then
        package.loaded[self.scene], self.view, loadedModule = nil
        collectgarbage('collect')
    end
    self.view, self.scene = require(moduleName).new(), moduleName
end
return director