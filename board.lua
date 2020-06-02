local Board = {}
Board.__index = Board

local function new()
    local self = {
        topLeft = 1,
        topMiddle = 2,
        topRight = 3,
        middleLeft = 4,
        middleMiddle = 5,
        middleRight = 6,
        bottomLeft = 7,
        bottomMiddle = 8,
        bottomRight = 9
    }
    return setmetatable(self, Board)
end

function Board:TestPrint()
    print(self["topLeft"] .. " | " .. self["topMiddle"] .. " | " ..
              self["topRight"])
    print(self["middleLeft"] .. " | " .. self["middleMiddle"] .. " | " ..
              self["middleRight"])
    print(self["bottomLeft"] .. " | " .. self["bottomMiddle"] .. " | " ..
              self["bottomRight"])
end

return {new = new, __object = Board}
