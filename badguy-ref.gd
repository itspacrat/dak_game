extends CharacterBody2D
var motion = Vector2()
var tgt: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tgt = get_parent().get_node("guy")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	look_at(tgt.position)
	position += (tgt.position - position)/50
	move_and_collide(motion)
