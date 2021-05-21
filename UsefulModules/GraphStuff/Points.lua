local module = {}

local GraphSettings = require(game.ServerScriptService.Modules.GraphSettings)

function module:DrawPoint(pos, setting)
	local d = setting and setting.PointDiameter or GraphSettings.PointDiameter
	local point = Instance.new("Part")
	point.Name = "Point"
	point.Material = setting and setting.PointMaterial or GraphSettings.PointMaterial
	point.Color = setting and setting.PointColor or GraphSettings.PointColor
	point.Anchored = true
	point.Shape = Enum.PartType.Ball
	point.Size = Vector3.new(d, d, d)
	point.Parent = workspace
	point.CFrame = CFrame.new(pos)
end

return module
