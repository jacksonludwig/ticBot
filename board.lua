local Board = {}
Board.__index = Board

local function new()
    local self = {1, 2, 3, 4, 5, 6, 7, 8, 9}
    return setmetatable(self, Board)
end

local function isSymbolOkay(symbol) return symbol == "X" or symbol == "O" end

local function isPosOkay(position) return position > 0 and position < 10 end

local function isSpotTaken(board, position)
    return board[position] == "X" or board[position] == "O"
end

function Board:TakeTurn(symbol, position)
    assert(type(symbol) == "string", "symbol must be X or O")
    assert(type(tonumber(position)) == "number", "pos must be a number 1-9")

    position = tonumber(position)
    if not isSymbolOkay(symbol) or not isPosOkay(position) or
        isSpotTaken(self, position) then return false end

    self[position] = symbol
    return true
end

function Board:TestPrint()
    print(self[1] .. " | " .. self[2] .. " | " .. self[3])
    print(self[4] .. " | " .. self[5] .. " | " .. self[6])
    print(self[7] .. " | " .. self[8] .. " | " .. self[9])
end

return {new = new, __object = Board}
