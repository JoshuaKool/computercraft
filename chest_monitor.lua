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
local box = peripheral.find("minecraft:chest")
if box == nil then
    print("- No chest found: Attaching chest to the left side of the computer.")
    periphemu.create('left', 'minecraft:chest', false)

    print("- Adding some items to the chest...")
    local chest = peripheral.find("minecraft:chest")
    chest.setItem(1, {name="minecraft:diamond", count=42})
    chest.setItem(2, {name="minecraft:iron_ingot", count=24})
    chest.setItem(3, {name="minecraft:gold_ingot", count=12})
end

while true do
    local monitor = peripheral.find("monitor")
    local chest = peripheral.find("chest")
    print_inventory_on_monitor(chest, monitor)

    sleep(10)
end
