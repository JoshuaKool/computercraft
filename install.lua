local function download(url, path)
    local response = http.get(url)
    if response and response.getResponseCode() == 200 then
        local content = response.readAll()
        local file = fs.open(path, "w")
        file.write(content)
        file.close()
        print("File " .. path .. " downloaded successfully.")
    else
        print("Failed to download " .. path)
    end
end

local function install()
    download("https://github.com/JoshuaKool/computercraft/blob/main/chest_monitor.lua", "chest_monitor.lua")
    fs.delete("install.lua")
end

install()
