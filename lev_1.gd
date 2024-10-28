extends Node2D

# instance later 
var peon_factory: PackedScene = preload("res://badguy.tscn") # bad guys spawner
var player_factory: PackedScene = preload("res://example_node.tscn") # player spawner
var player: CharacterBody2D
var enemy: CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = player_factory.instantiate()
	player.position = Vector2(500,200)
	enemy = peon_factory.instantiate()
	get_tree().get_root().call_deferred("add_child",player)
	get_tree().get_root().call_deferred("add_child",enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
