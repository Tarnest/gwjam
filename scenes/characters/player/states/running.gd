# Consider making PlayerState class

extends State

@export var player: Player
@onready var animation_player: AnimationPlayer = %AnimationPlayer

func _physics_process(_delta: float) -> void:
	player.direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		player.direction += Vector2.UP
	if Input.is_action_pressed("move_down"):
		player.direction += Vector2.DOWN
	if Input.is_action_pressed("move_left"):
		player.direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		player.direction += Vector2.RIGHT
	
	player.velocity = player.speed * player.direction.normalized()
	
	player.move_and_slide()
