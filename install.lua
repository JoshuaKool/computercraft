local http = "https://github.com/JoshuaKool/computercraft/blob/main/chest_monitor.lua"

local function download(url, path)
    local request = http.get(url)
    if request then
        local file = fs.open(path, "w")
        file.write(request.readAll())
        file.close()
        request.close()
    else
        print("Failed to download file")
    end
end

download(http, "chest_monitor.lua")
