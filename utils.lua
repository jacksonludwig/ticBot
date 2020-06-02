local utils = {}

function utils.SplitMessage(message)
    local data = {}
    for substring in message:gmatch("%S+") do data[#data + 1] = substring end
    return data
end

return utils
