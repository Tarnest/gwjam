class_name Player
extends CharacterBody2D

@export var sword_damage: int = 5
@export var knockback_distance: int = 200
@export var speed: int = 150
@export var health: int:
	set(value):
		health = value
		if health <= 0:
			die()

@onready var hit_area: Area2D = $HitArea
@onready var sprite: Sprite2D = $Sprite2D

var knockback: Vector2 = Vector2.ZERO
var last_direction: Vector2 = Vector2.ZERO
var direction: Vector2:
	set(value):
		direction = value
		last_direction = direction if direction != Vector2.ZERO else last_direction
		last_direction = last_direction.normalized()

func _ready() -> void:
	direction = Vector2.ZERO
	Globals.get_player_pos.connect(_get_player_pos)

func _physics_process(_delta: float) -> void:
	velocity = knockback
	
	move_and_slide()
	
	knockback = lerp(knockback, Vector2.ZERO, 0.1)

func _get_player_pos():
	Globals.current_player_pos = position

func hit(damage: int = 5, direction_hit_from: Vector2 = Vector2.ZERO):
	health -= damage
	print("Player health: " + str(health))
	knockback = direction_hit_from * knockback_distance

func die():
	print("Player died")
