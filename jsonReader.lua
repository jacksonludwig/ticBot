local luvitfs = require("fs")
local luvitjson = require("json")

local jsonReader = {}

function jsonReader.ReadToken()
    local rawjson = luvitfs.readFileSync("token.json")
    local parsedjson = luvitjson.parse(rawjson)
    return parsedjson.token
end

return jsonReader
