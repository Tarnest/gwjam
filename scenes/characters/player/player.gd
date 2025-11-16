class_name Player
extends CharacterBody2D

var speed: int = 200
var last_direction: Vector2 = Vector2.ZERO
var direction: Vector2:
	set(value):
		last_direction = direction if direction != Vector2.ZERO else last_direction
		direction = value

func _ready() -> void:
	direction = Vector2.ZERO
