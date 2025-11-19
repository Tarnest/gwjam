extends Area2D

@export var scene: PackedScene

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(_body: PhysicsBody2D):
	print("body")
		
	if scene == null:
		push_error("Change room scene is NULL")
		return
	
	Globals.change_scene.emit(scene)
