local function download(url, path)
    local response = http.get(url)
    if response then
        local content = response.readAll()
        response.close()
        local file = fs.open(path, "w")
        file.write(content)
        file.close()

        local startupFile = fs.open("startup.lua", "w")
        startupFile.write("shell.run('chest_monitor.lua')")
        startupFile.close()

        shell.run("reboot")
    else
        print("Failed to download " , path)
    end
end

local function install()
    download("https://raw.githubusercontent.com/JoshuaKool/computercraft/main/chest_monitor.lua", "chest_monitor.lua")
end

install()
