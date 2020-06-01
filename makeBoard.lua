local makeBoard = {}

function makeBoard.MakeBlankBoard()
    return {
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
end

function makeBoard.TestPrint(board)
    print(board["topLeft"] .. " | " .. board["topMiddle"] .. " | " ..
              board["topRight"])
    print(board["middleLeft"] .. " | " .. board["middleMiddle"] .. " | " ..
              board["middleRight"])
    print(board["bottomLeft"] .. " | " .. board["bottomMiddle"] .. " | " ..
              board["bottomRight"])
end

return makeBoard
