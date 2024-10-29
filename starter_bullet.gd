extends RigidBody2D
var motion: Vector2

func _ready():
	set_gravity_scale(0)

func _physics_process(delta: float) -> void:
	move_and_collide(motion)
