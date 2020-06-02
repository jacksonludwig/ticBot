local Board = {}
Board.__index = Board

local magicSquare = {4, 9, 2, 3, 5, 7, 8, 1, 6}

local function new()
    local self = {1, 2, 3, 4, 5, 6, 7, 8, 9}
    return setmetatable(self, Board)
end

local function isSymbolOkay(symbol) return symbol == "X" or symbol == "O" end

local function isPosOkay(position) return position > 0 and position < 10 end

local function isSpotTaken(board, position)
    return board[position] == "X" or board[position] == "O"
end

local function isWon(board, symbol)
    for i = 0, 9 do
        for j = 0, 9 do
            for k = 0, 9 do
                if i ~= j and i ~= k and j ~= k then
                    if board[i] == symbol and board[j] == symbol and board[k] ==
                        symbol then
                        if magicSquare[i] + magicSquare[j] + magicSquare[k] ==
                            15 then return true end
                    end
                end
            end
        end
    end
    return false
end

local function isTied(board)
    for _, cell in ipairs(board) do
        if type(cell) == "number" then return false end
    end
    return true
end

function Board:TakeTurn(symbol, position)
    if type(symbol) ~= "string" then return false end
    if type(tonumber(position)) ~= "number" then return false end

    position = tonumber(position)
    symbol = string.upper(symbol)
    if not isSymbolOkay(symbol) or not isPosOkay(position) or
        isSpotTaken(self, position) then return false end

    self[position] = symbol
    return true
end

function Board:CheckWinner()
    if isWon(self, "X") then return "X" end
    if isWon(self, "O") then return "O" end
    if isTied(self) then return "Tied" end
end

function Board:Prettify()
    local message = self[1] .. " | " .. self[2] .. " | " .. self[3] .. "\n" ..
                        self[4] .. " | " .. self[5] .. " | " .. self[6] .. "\n" ..
                        self[7] .. " | " .. self[8] .. " | " .. self[9]

    return "```\n" .. message .. "\n```"
end

function Board:TestPrint()
    print(self[1] .. " | " .. self[2] .. " | " .. self[3])
    print(self[4] .. " | " .. self[5] .. " | " .. self[6])
    print(self[7] .. " | " .. self[8] .. " | " .. self[9])
end

function Board.ShowError()
    return
        "```\n" .. "Only use \"X\" or \"O\" and numbers 1-9. Don't Repeat." ..
            "\n```"
end

function Board.ShowWin(symbol) return "```\n" .. symbol .. " wins" .. "\n```" end

function Board.ShowTie() return "```\n" .. "Game tied" .. "\n```" end

return {new = new, __object = Board}
