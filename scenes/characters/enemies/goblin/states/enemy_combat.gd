extends State

@export var enemy: Enemy
@onready var timer: Timer = $Timer

func _ready() -> void:
	set_physics_process(false)
	timer.timeout.connect(_on_timer_timeout)

func _enter() -> void:
	set_physics_process(true)
	spawn_bullet()
	timer.start()

func spawn_bullet():
	var bullet: Bullet = enemy.bullet_scene.instantiate()
	var new_direction: Vector2 = enemy.position.direction_to(enemy.player_pos)
	
	bullet.bullet_damage = enemy.bullet_damage
	bullet.position = enemy.position
	bullet.direction = new_direction
	bullet.rotation = new_direction.angle()
	bullet.speed = enemy.bullet_speed
	
	get_tree().get_root().add_child(bullet)

func _on_timer_timeout():
	state_finished.emit()
