local glasses = peripheral.wrap("bottom")
local label = glasses.addText(410,85,"Uhrzeiten:",0xFA4453)
local label2 = glasses.addText(405,95,"MC:",0x4453FA)
local label3 = glasses.addText(450,95,"RL:",0x44FA75)
local time = glasses.addText(395,105,"zeit",0x4453FA)
local time2 = glasses.addText(435,105,"zeit",0x44FA75)

function thread1()
  while true do
    time.setText(textutils.formatTime(os.time(), false))
    sleep(0.5)
  end
end

function thread2()
  while true do
    time2.setText(http.get("http://www.timeapi.org/utc/in+one+hour?format=%25l:%25M%20%25p").readAll())
    sleep(60)
  end
end

parallel.waitForAny(thread1, thread2)