extends CharacterBody2D

var client_id
var movespeed = 300
var proj_speed = 2000

var player_sc = preload("res://example_node.tscn")
var blt_sc = preload("res://starter_bullet.tscn")
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
	
	if Input.is_action_just_pressed("pl_fire1"):
		fire()

func fire():
	var blt_inst = blt_sc.instantiate()
	var blt_pos = blt_inst.get_global_position()
	blt_inst.rotation = rotation
	blt_inst.apply_central_impulse(Vector2(),Vector2(proj_speed,0)).rotated(rotation)
	get_tree().get_root().call_deferred("add_child",blt_inst)
