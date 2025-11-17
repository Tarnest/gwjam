extends Enemy

@onready var bullet_scene: PackedScene = preload("res://scenes/characters/enemies/monster_temp/bullet/bullet.tscn")
@onready var timer: Timer = $Timer

@export var bullet_speed: int

func _ready() -> void:
	timer.timeout.connect(_on_timeout)

func _physics_process(_delta: float) -> void:
	move_to_player()

func spawn_bullet():
	var bullet: Bullet = bullet_scene.instantiate()
	var new_direction: Vector2 = position.direction_to(player_pos)
	
	bullet.direction = new_direction
	bullet.rotation = new_direction.angle()
	bullet.speed = bullet_speed
	add_child(bullet)

func _on_timeout():
	spawn_bullet()
