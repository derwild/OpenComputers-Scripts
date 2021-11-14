os.loadAPI("/rom/apis/sensor")
monitor = peripheral.wrap("right")
sens = peripheral.wrap("top")

monitor.clear()

sensorName = "Sensor"
sensorData = sensor.getSensorinfo("top", sensorName)
data = sensor.getProbes("top", sensorName)

function getDistance(sensorData, targetData)
	distanceData = {}
	distanceData["xDist"] = math.abs(sensorData["xCoord"] - targetData["xCoord"])
	distanceData["yDist"] = math.abs((sensorData["yCoord"] + 2)- targetData["yCoord"])
	distanceData["zDist"] = math.abs(sensorData["zCoord"] - targetData["zCoord"])
	
	distanceData["dist"] = distanceData["xDist"]
	if distanceData["yDist"] > distanceData["dist"] then
		distanceData["dist"] = distanceData["yDist"]
	elseif distanceData["zDist"] > distanceData["zDist"] then
		distanceData["dist"] = distanceData["zDist"]
	end

	return distanceData
end

function isPlayerClose()
	targets  = sensor.getAvailableTargetsForProbe("top", sensorName, probeName)
	
	for i=1, #targets do
		targetData = sensor.getSensorReadingAsDict("top", sensorName, probeName)
		
		if targetData["name"] == "vd" then
			distanceData = getDistance(sensorData, targetData)
			
			if targetData["distance"] < 4 then
				return true
			end
		end
	end
	return false
end

monitor.wrie(isPlayerClose())
