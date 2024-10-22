extends CharacterBody2D
var motion = Vector2()
func _ready():
	pass

func _physics_process(delta: float) -> void:
	
	var tgt = get_parent().get_node("guy")
	position += (tgt.position - position)/50
	look_at(tgt.position)
	move_and_collide(motion)
