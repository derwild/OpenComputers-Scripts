local arg = {...}

if #arg == 1 then
  local monitor = peripheral.wrap(arg[1])
  term.redirect(monitor)
  monitor.setTextScale(1.99999)
end

while true do
  shell.run('clear')
  print("Uhrzeit:\n"..textutils.formatTime(os.time(), false))
  sleep(1)
end