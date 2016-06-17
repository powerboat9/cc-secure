env = {}

do
    local me = shell.getRunningProgram()
    local meDir = me:sub(1, 0 - #fs.getName(me))
    os.loadAPI(meDir .. "table-copy")
    if not table-copy then error("API not found", 0) end
    table.copy(_G, env)
    os.unloadAPI(meDir .. "table-copy")
end

local function prompt()

function env.elevate(
