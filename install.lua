local http = "https://github.com/JoshuaKool/computercraft/blob/main/"

local function downloadFile(url, path)
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

downloadFile(http, "chest_monitor.lua")

if not fs.exists("/computercraft") then
    fs.makeDir("/computercraft")
end

if not fs.exists("/computercraft/packages") then
    fs.makeDir("/computercraft/packages")
end

-- Download filelist.lua
downloadFile(http .. "list.lua", "/computercraft/list.lua")

print("computercraft has been successfully installed.")