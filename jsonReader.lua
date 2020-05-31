local lunajson = require("lunajson")

local jsonReader = {}

local function read_file(path)
    local file = io.open(path, "r")
    if not file then return nil end
    local content = file:read("*a")
    file:close()
    return content
end

function jsonReader.ReadToken()
    local rawjson = read_file("token.json")
    local parsedjson = lunajson.decode(rawjson)
    return parsedjson.token
end

return jsonReader
