function one()
  os.run({}, "/glasMFE")
  print(1)
end

function two()
  os.run({}, "/glasTime")
  print(2)
end

function three()
  os.run({}, "/glasChests")
  print(3)
end

print("Starting glasses Program for \"Wild\"")
parallel.waitForAny(one, two, three)