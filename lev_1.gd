extends Node2D

var peon = preload("res://badguy.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	peon.instantiate()
	pass
	#var sc_guy = load("res://guy.tscn")
	#var bad_guy = load("res://badguy.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
