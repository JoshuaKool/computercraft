local http_base = "https://github.com/JoshuaKool/computercraft/blob/main/"

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

downloadFile(http_base .. "chest_monitor.lua", "chest_monitor.lua")

local startup_content = [[
shell.run("chest_monitor.lua")
]]
local startup_file = fs.open("startup.lua", "w")
startup_file.write(startup_content)
startup_file.close()
print("Startup script created.")

print("Restarting computer...")
os.reboot()
