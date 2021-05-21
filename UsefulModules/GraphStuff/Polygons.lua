local module = {}

local GraphSettings = require(game.ServerScriptService.Modules.GraphSettings)

function module:DrawTriangle(p0, p1, p2, setting)
	local a, b, c = p0, p1, p2
	local ab = b - a
	local ac = c - a
	local pMag = ab:Dot(ac)/(ac.magnitude)
	
	while (pMag > ac.magnitude) do
		local aTemp = a
		a = b
		b = c
		c = aTemp
		ab = b - a
		ac = c - a
		pMag = ab:Dot(ac)/(ac.magnitude)
	end
	
	local bc = c - b
	local p = pMag*(ac.unit)
	local m = b - (a + p)
	local pos = a + ab/2
	local rightVector = (ab:Cross(ac).unit)
	
	local wedge0 = Instance.new("WedgePart") 
	wedge0.Material = setting and setting.PlaneMaterial or GraphSettings.PlaneMaterial
	wedge0.Color = setting and setting.PlaneColor or GraphSettings.PlaneColor
	wedge0.Anchored = true
	wedge0.Parent = workspace
	wedge0.Size = Vector3.new(setting and setting.PlaneThickness or GraphSettings.PlaneThickness, m.magnitude, pMag)
	wedge0.CFrame = CFrame.fromMatrix(pos, rightVector, m)
	---[[
	if (pMag ~= ac.magnitude) then
		pos = b + bc/2
		local wedge1 = Instance.new("WedgePart")
		wedge1.Material = setting and setting.PlaneMaterial or GraphSettings.PlaneMaterial
		wedge1.Color = setting and setting.PlaneColor or GraphSettings.PlaneColor
		wedge1.Anchored = true
		wedge1.Parent = workspace
		wedge1.Size = Vector3.new(0.2, m.magnitude, ac.magnitude - pMag)
		wedge1.CFrame = CFrame.fromMatrix(pos, -rightVector, m)
	end
	--]]
end

return module
