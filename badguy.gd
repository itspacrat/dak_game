extends CharacterBody2D
var motion = Vector2()
var tgt: CharacterBody2D
var health: int
var speed: int = 40

# On Load
func _ready() -> void:
	tgt = get_parent().get_node("guy")


# Per Frame
func _process(delta: float) -> void:
	look_at(tgt.position)
	if tgt.position
	# position += (tgt.position - position)/70
	motion = motion.normalized()
	velocity = speed * motion
	# motion = move_and_slide()
	move_and_collide(motion)
