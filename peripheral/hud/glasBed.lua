local labelBedtime

function thread3()
  while true do
    if os.time() < 6 or os.time() > 18.5 then
      parallel.waitForAny(hThread3)
    end
    sleep(1)
  end
end

function hThread3()
  labelBedtime = glasses.addText(195,190,"Time to go to bed!!",0x00FF00)
  while true do
    if os.time() > 6 and os.time() < 18.5 then
      labelBedtime.delete()
      return
    end
    labelBedtime.setColor(0xFF0000)
    sleep(1)
    labelBedtime.setColor(0x00FF00)
    sleep(1)
  end
end

parallel.waitForAny(thread3)