class_name Enemy
extends CharacterBody2D

@export var health: int:
	set(value):
		health = value
		if health <= 0:
			die()
@export var speed: int = 25
@export var distance_to_stop: int = 2000

var direction: Vector2 = Vector2.ZERO
var player_pos: Vector2

func move_to_player() -> void:
	player_pos = Globals.current_player_pos
	direction = position.direction_to(player_pos)
	
	if position.distance_squared_to(player_pos) < distance_to_stop:
		direction = Vector2.ZERO
	
	velocity = speed * direction
	
	move_and_slide()

func hit(damage: int = 5) -> void:
	health -= damage

func die() -> void:
	print("Enemy Died")
