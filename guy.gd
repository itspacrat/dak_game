extends CharacterBody2D

var client_id
var movespeed = 300
var proj_speed = 1000

var bullet_factory: PackedScene 

# ON LOAD
func _ready():
	bullet_factory = preload("res://starter_bullet.tscn")
	# character and enemy preloads
	#player = preload("res://example_node.tscn").instantiate()
	#blt = preload("res://starter_bullet.tscn")

# EVERY FRAME
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
	var bullet: RigidBody2D = bullet_factory.instantiate()
	# use the player position and rotation
	bullet.position = get_position() + Vector2(20,20)
	bullet.rotation = rotation
	get_tree().get_root().call_deferred("add_child",bullet)
