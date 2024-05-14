local function download(url, path)
    local response = http.get(url)
    if response and response.getResponseCode() == 200 then
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
