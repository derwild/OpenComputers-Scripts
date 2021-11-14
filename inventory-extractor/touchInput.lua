monitor = peripheral.wrap("left")

monitor.clear()
monitor.setCursorPos(1,1)

users = {}
local db = fs.open("users", "r")
local line = ""
i = 1
while line ~= nil do
 line = db.readLine()
 users[i] = line
 i = i+1
end
db.close()

for j=1, #users do
monitor.setCursorPos(1,j)
monitor.write(users[j])
end

event, side, x, y = os.pullEvent("monitor_touch")

os.queueEvent("user_selected", y)

monitor.clear()
monitor.setCursorPos(1,1)
monitor.write("Selected user: ")
monitor.setCursorPos(1,2)
monitor.write(users[y])