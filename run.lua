do
    local me = shell.getRunningProgram()
    local meDir = me:sub(1, 0 - #fs.getName(me))
    os.loadAPI(meDir .. "table-copy")
end

