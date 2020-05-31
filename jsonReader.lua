local lunajson = require("lunajson")

local jsonReader = {}

local function read_file(path)
    local file = io.open(path, "r") -- r read mode and b binary mode
    if not file then return nil end
    local content = file:read("*a") -- *a or *all reads the whole file
    file:close()
    return content
end

function jsonReader.ReadToken()
    local rawjson = read_file("token.json")
    local parsedjson = lunajson.decode(rawjson)
    return parsedjson.token
end

return jsonReader
