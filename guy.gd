extends CharacterBody2D

var movespeed = 300

func _ready():
	pass

# main uopdate loop 
func _physics_process(delta):
	# Mouse thing, always point at mouse
	look_at(get_global_mouse_position())
	var motion = Vector2()
	
	# assign inputs for wasd + gamepad
	# and then change movement vector
	if Input.is_action_pressed("pl_up"):
		motion.y -= 1
	if Input.is_action_pressed("pl_down"):
		motion.y += 1
	if Input.is_action_pressed("pl_left"):
		motion.x -= 1
	if Input.is_action_pressed("pl_right"):
		motion.x += 1
	
	# apply movement vector on update
	motion = motion.normalized()
	velocity = movespeed * motion
	motion = move_and_slide()
