local glasses = peripheral.wrap("bottom")
local net = peripheral.wrap("top")
local id = "crystal_chest_2"
local text = nil

while true do
  count = 0
  for i=0,net.callRemote(id,"getSizeInventory")-1,1 do
    if net.callRemote(id, "getStackInSlot", i) == nill then
      count = count +1
    end
  end
  
  if text == nil then
    if count < net.callRemote(id,"getSizeInventory") then
      text = glasses.addText(195, 50, "You've got Mail",0xFF0000)
    end
  else
    if count == net.callRemote(id,"getSizeInventory") then
      text.delete()
      text = nil
    end
  end
  sleep(1)
end