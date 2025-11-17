class_name Player
extends CharacterBody2D

@export var speed: int = 150
@export var health: int:
	set(value):
		health = value
		if health <= 0:
			die()

@onready var hit_area: Area2D = $HitArea
@onready var sprite: Sprite2D = $Sprite2D

var last_direction: Vector2 = Vector2.ZERO
var direction: Vector2:
	set(value):
		direction = value
		last_direction = direction if direction != Vector2.ZERO else last_direction
		last_direction = last_direction.normalized()

func _ready() -> void:
	direction = Vector2.ZERO
	Globals.get_player_pos.connect(_get_player_pos)

func _get_player_pos():
	Globals.current_player_pos = position

func hit(damage: int = 5):
	health -= damage
	print("Player health: " + str(health))

func die():
	print("Player died")
