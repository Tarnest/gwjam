class_name Player
extends CharacterBody2D

@onready var hit_area: Area2D = $HitArea

var speed: int = 200
var last_direction: Vector2 = Vector2.ZERO
var direction: Vector2:
	set(value):
		direction = value
		last_direction = direction if direction != Vector2.ZERO else last_direction
		last_direction = last_direction.normalized()

func _ready() -> void:
	direction = Vector2.ZERO
