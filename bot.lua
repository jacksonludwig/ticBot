local discordia = require("discordia")
local jsonReader = require("./jsonReader")

local Board = require("./board.lua")

local client = discordia.Client()
local TOKEN = jsonReader.ReadToken()

local gameBoard = Board.new()

client:on("ready", function() print("Logged in as " .. client.user.username) end)

client:on("messageCreate", function(message)
    if message.content == "%ping" then message.channel:send("Pong!") end

    if message.content == "%reset" then gameBoard:TestPrint() end
end)

client:run("Bot " .. TOKEN)
