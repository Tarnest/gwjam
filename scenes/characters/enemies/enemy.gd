class_name Enemy
extends CharacterBody2D

@export var health: int:
	set(value):
		health = value
		if health <= 0:
			die()
@export var speed: int = 25
@export var distance_to_stop: int = 2000
@export var knockback_distance: int = 200

var direction: Vector2 = Vector2.ZERO
var player_pos: Vector2
var knockback: Vector2 = Vector2.ZERO

func move_to_player() -> void:
	player_pos = Globals.current_player_pos
	direction = position.direction_to(player_pos)
	
	if position.distance_squared_to(player_pos) < distance_to_stop:
		direction = Vector2.ZERO
	
	velocity = speed * direction + knockback
	
	move_and_slide()
	
	knockback = lerp(knockback, Vector2.ZERO, 0.1)

func hit(damage: int = 5, direction_hit_from: Vector2 = Vector2.ZERO) -> void:
	health -= damage
	knockback = direction_hit_from * knockback_distance

func die() -> void:
	queue_free()
