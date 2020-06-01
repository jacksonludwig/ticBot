local discordia = require("discordia")
local jsonReader = require("./jsonReader")
local boardMaker = require("./makeBoard.lua")

local client = discordia.Client()
local TOKEN = jsonReader.ReadToken()

local board

client:on("ready", function()
    print("Logged in as " .. client.user.username)
    board = boardMaker.MakeBlankBoard()
end)

client:on("messageCreate", function(message)
    if message.content == "%ping" then message.channel:send("Pong!") end

    if message.content == "%reset" then boardMaker.TestPrint(board) end
end)

client:run("Bot " .. TOKEN)
