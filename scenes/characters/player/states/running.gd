extends State

@export var player: Player
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var up_left: Vector2 = Vector2.UP + Vector2.LEFT
var up_right: Vector2 = Vector2.UP + Vector2.RIGHT
var down_left: Vector2 = Vector2.DOWN + Vector2.LEFT
var down_right: Vector2 = Vector2.DOWN + Vector2.RIGHT

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
	
	if !Input.is_action_pressed("move") || Input.is_action_just_pressed("swing"):
		state_finished.emit()
	
	animate()

func animate():
	match player.last_direction.round():
		Vector2.UP:
			player.sprite.flip_h = false
			animation_player.play("run_up")
		up_right:
			player.sprite.flip_h = false
			animation_player.play("run_up")
		up_left:
			player.sprite.flip_h = false
			animation_player.play("run_up")
		Vector2.DOWN:
			player.sprite.flip_h = false
			animation_player.play("run_down")
		down_left:
			player.sprite.flip_h = false
			animation_player.play("run_down")
		down_right:
			player.sprite.flip_h = false
			animation_player.play("run_down")
		Vector2.LEFT:
			player.sprite.flip_h = false
			animation_player.play("run_side")
		Vector2.RIGHT:
			player.sprite.flip_h = true
			animation_player.play("run_side")
		
		
