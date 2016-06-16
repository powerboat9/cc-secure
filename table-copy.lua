local allIter(t)
    local one = ipairs(t)
    local two = pairs(t)
    local first = true
    return function()
        local ret
        if first then
            ret = one()
            if not ret then
                ret = two()
                first = false
            end
        else
            ret = two()
        end
        return ret
    end
end

local function sCopy(t1, t2, found)
    local textCopy = {}
    for k, v in allIter(t) do
        if type(v) == "table" then
            if found[v] then
                t2[k] = v
            else
                local t2K = {}
                t2[k] = t2K
                textCopy[#textCopy + 1] = {v, t2K}
                found[v] = t2K
            end
        else
            t2[k] = v
        end
    end
    return textCopy
end

local function copy(t1, t2)
    local gTextCopy = {}
    while true do
        if not gTextCopy[1] then break end
        local new = sCopy(gTextCopy[1][1], geTextCopy[1][2])
        table.remove(gTextCopy, 1)
        for k, v in ipairs(new) do
            gTextCopy[#gTextCopy + 1] = v
        end
    end
end
