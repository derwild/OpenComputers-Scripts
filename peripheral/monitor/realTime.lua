local monitor = peripheral.wrap("right")
monitor.setTextScale(4.5)

function newLine()
  local _,cY = monitor.getCursorPos()
  monitor.setCursorPos(1,cY+1)
end

while true do
  time = (http.get("http://www.timeapi.org/utc/in+one+hour?format=%25l:%25M%20%25p").readAll())
  monitor.setCursorPos(1,2)
  monitor.clear()
  monitor.write(" Echte Uhrzeit:")
  newLine()
  newLine()
  monitor.write(time)
  sleep(60)
end