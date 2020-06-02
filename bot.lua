local discordia = require("discordia")
local jsonReader = require("./jsonReader")

local Board = require("./board.lua")
local utils = require("./utils.lua")

local client = discordia.Client()
local TOKEN = jsonReader.ReadToken()

local gameBoard = Board.new()

client:on("ready", function() print("Logged in as " .. client.user.username) end)

client:on("messageCreate", function(message)
    local content = utils.SplitMessage(message.content)

    if content[1] == "%test" then gameBoard:TestPrint() end

    if content[1] == "%play" then
        if not gameBoard:TakeTurn(content[2], content[3]) then
            --TODO show error message
        else
            --TODO show new board state
        end
    end
end)

client:run("Bot " .. TOKEN)
