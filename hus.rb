# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection

mod.start_operation "Operation"

def createPoint (x0,y0,z0,r,rz, theta)
   x = x0 + r * (Math.cos(theta))
   y = y0 + r * Math.sin(theta)
   z = z0 - rz*(1-Math.cos(theta))
   return Geom::Point3d.new(x,y,z)
end


group = ent.add_group
group.name = "gelender"

x0=640.cm
y0=720.cm
z0=113.cm

r=15.0.cm
rz=50.cm
roffset = 5.0.cm

nTheta = 10.0

dTheta = Math::PI / 2.0 / nTheta

points = Array.new

for i in 0..nTheta
    theta=(i.to_f*dTheta) 
	
	p1=createPoint(x0,y0,z0,r,rz,theta)
	p2=createPoint(x0,y0,z0,r+roffset,rz,theta)
	points.push p1
    points.push p2
    
end

nFaces = (points.length-2) / 2

for i in 0..0 #nFaces-1
  if i == 0
    p1=points[0] 
    p2=points[1]
    p3=points[3]
    p4=points[2]
    group.entities.add_face p1, p2, p3, p4
  else
    p1=points[2*i] 
    p2=points[2*i+1]
    p3=points[2*(i+1)+1]
    p4=points[2*(i+1)]
    group.entities.add_face p1, p2, p3, p4
  end

end

mod.commit_operation
