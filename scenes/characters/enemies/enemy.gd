class_name Enemy
extends CharacterBody2D

@export var health: int:
	set(value):
		health = value
		if health <= 0:
			die()

func hit(damage: int = 5) -> void:
	health -= damage

func die():
	print("Enemy Died")
