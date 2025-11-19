extends Enemy

@export var bullet_speed: int
@export var bullet_damage: int

@onready var bullet_scene: PackedScene = preload("res://scenes/characters/enemies/goblin/bullet/bullet.tscn")
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var hit_flash: AnimationPlayer = %HitFlash
@onready var sprite: Sprite2D = $Sprite2D

func on_hit():
	hit_flash.play("hit")

func _physics_process(_delta: float) -> void:
	velocity = knockback
	
	move_and_slide()
	
	knockback = lerp(knockback, Vector2.ZERO, 0.1)
