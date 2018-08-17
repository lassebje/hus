# Default code, use or delete...
mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
mod.start_operation "Operation"

p1=Geom::Point3d.new(0,0,0)
p2=Geom::Point3d.new(10,10,0)
ent.add_line p1,p2

mod.commit_operation
