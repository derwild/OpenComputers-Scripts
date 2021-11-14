local net = peripheral.wrap("top")
local glasses = peripheral.wrap("bottom")

local stor =
{
  {
    ["id"] = "diamond_chest_0",
    ["message"] = "Holz Truhe voll!!!"
  },
  {
    ["id"] = "crystal_chest_0",
    ["message"] = "Dropbox voll!!!"
  }
}

local offset = 100

function foo(item)
  count = 0
  for i=0,net.callRemote(item["id"], "getSizeInventory")-1,1 do
    if net.callRemote(item["id"], "getStackInSlot", i) == nil then
      count = count +1
    end
  end
  
  if item["text"] == nil then
    if count == 0 then
      item["text"] = glasses.addText(10,offset,item["message"],0xFF0000)
      offset = offset + 10
    end
  else
    if count == 0 then else
      item["text"].delete()
      item["text"] = nil
      offset = offset - 10
    end
  end
end

while true do
  for i=#stor,1,-1 do
    foo(stor[i])
  end
  sleep(0.5)
end