local monitor = peripheral.find("monitor")
local chest = peripheral.find("minecraft:chest")

print("Setting up missing peripherals...\n")

if monitor == nil then
    print("- No monitor found: Attaching monitor to the right side of the computer.")
    periphemu.create('right', 'monitor')
end

if chest == nil then
    print("- No chest found: Attaching chest to the left side of the computer.")
    periphemu.create('left', 'minecraft:chest', false)

    print("- Adding some items to the chest...")
    local box = peripheral.find("minecraft:chest")

    if box == nil then
        monitor.write("chest is empty")
        return
    end
end

print("\nSetup complete. You should now have a chest on the left side and a monitor on the right side of your computer.\n")
print("- The chest contains some items for testing purposes.\n")
print("You can now proceed with the exercise!")

shell.run("peripherals")

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
        monitor.write(text2)
        y = y + 1
    end
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("minecraft:chest")
    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end
