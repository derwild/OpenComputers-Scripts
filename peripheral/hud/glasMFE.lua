local glasses = peripheral.wrap("back")
local net = peripheral.wrap("top")

local storage =
{
  {
    ["id"] = "batbox_0",
    ["name"] = "MFE",
	   ["fixedMax"] = false,
	   ["max"] = 0
  },
  {
    ["id"] = "LogisticsPowerJunction_0",
	   ["name"] = "Logistics",
	   ["fixedMax"] = true,
	   ["max"] = 2000000
  }
}

local offset = 0
for key, storUnit in pairs(storage) do
  tOffset = offset *10
  storUnit["label"] = glasses.addText(300,4+tOffset,storUnit["name"],0xFFFFFF)
  storUnit["perc"] = glasses.addText(370,4+tOffset,"",0x000000)
  storUnit["offset"] = tOffset
  storUnit["active"] = true
  offset = offset + 1
end

while true do
  for i=#storage,1,-1 do
    storUnit = storage[i]
    if net.isPresentRemote(storUnit["id"]) then
      
      if storUnit["active"] == false then
      storUnit["label"] = glasses.addText(300,4+storUnit["offset"],storUnit["name"],0xFFFFFF)
      storUnit["perc"] = glasses.addText(370,4+storUnit["offset"],"",0x000000)
      storUnit["active"] = true
      end

	     if storUnit["fixedMax"] then
	       stor = net.callRemote(storUnit["id"], "getPowerLevel")
		      cap = storUnit["max"]
      else
        cap = net.callRemote(storUnit["id"], "getCapacity")
        stor = net.callRemote(storUnit["id"], "getStored")
	     end
	  
      percent = math.floor(10000*(stor/cap))/100
      if percent > 99.7 then percent = 100 end
      if percent < 0.3  then percent = 0 end
      storUnit["perc"].setText(tostring(percent.." %"))

      if percent < 10 then storUnit["perc"].setColor(0xCC0000)
      elseif percent < 50 then storUnit["perc"].setColor(0xFFAF00)
      else storUnit["perc"].setColor(0x00FF00) end
    else
      storUnit["label"].delete()
      storUnit["perc"].delete()
      storUnit["active"] = false
    end
  end
  sleep(0.5)
end
