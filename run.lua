local env = {}

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

local function copy(t1, t2)
    local textCopy = {}
    for k, v in allIter(t) do
        local t1K = {}
        t1[k] = t1K
        local t2K = {}
        textCopy[#
