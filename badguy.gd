extends CharacterBody2D
var motion = Vector2()
var tgt: CharacterBody2D
var health: int
var speed: int = 10


# On Load
func _ready() -> void:
	tgt = get_parent().get_node("guy")


# Per Frame
func _process(delta: float) -> void:
	for axis: int in [0,1]:
		# track player axes and modify movement based on those 
		motion[axis] += (tgt.get_position()[axis] - get_position()[axis])
	
	motion = motion.normalized()
	velocity = speed * motion
	look_at(tgt.get_position()) # staring is rude :(
	move_and_collide(motion)
