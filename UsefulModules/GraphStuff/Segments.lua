local module = {}

local GraphSettings = require(game.ServerScriptService.Modules.GraphSettings)

function module:DrawSegment(p0, p1, setting)
	local v = p1 - p0
	local pos = p0 + v/2
	local seg = Instance.new("Part")
	seg.Name = "Segment"
	seg.Material = setting and setting.LineMaterial or GraphSettings.LineMaterial
	seg.Color = setting and setting.LineColor or GraphSettings.LineColor
	seg.Anchored = true
	seg.Size = Vector3.new(setting and setting.LineThickness or GraphSettings.LineThickness, 
		setting and setting.LineThickness or GraphSettings.LineThickness, v.magnitude)
	seg.Parent = workspace
	seg.CFrame = CFrame.new(pos, p1)
end

return module
