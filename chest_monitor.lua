function print_inventory_on_monitor(chest, monitor)
    local inventory = chest.list()
    local y = 1
    local width, height = monitor.getSize()

    for slot, item in pairs(inventory) do

        item.name = item.name:gsub("minecraft:", "")
        local text = item.name
        local text2 = "x" .. item.count
        local x = math.floor((width - #text) / 2)
        monitor.setCursorPos(x, y)
        monitor.write(text)
        y = y + 1
        x = math.floor((width - #text2) / 2)
        monitor.setCursorPos(x, y)
        monitor.setTextColor(colors.gray)
        monitor.write(text2)
        y = y + 1

        monitor.setTextColor(colors.white)
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")
    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end
