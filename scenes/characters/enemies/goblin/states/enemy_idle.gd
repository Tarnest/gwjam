extends State

@export var enemy: Enemy

var up_left: Vector2 = Vector2.UP + Vector2.LEFT
var up_right: Vector2 = Vector2.UP + Vector2.RIGHT
var down_left: Vector2 = Vector2.DOWN + Vector2.LEFT
var down_right: Vector2 = Vector2.DOWN + Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	if !enemy.is_player_close():
		state_finished.emit()
	
	animate()

func animate():
	enemy.sprite.flip_h = false
	
	match enemy.last_direction.round():
		Vector2.UP:
			enemy.animation_player.play("idle_up")
		up_right:
			enemy.animation_player.play("idle_up")
		up_left:
			enemy.animation_player.play("idle_up")
		Vector2.DOWN:
			enemy.animation_player.play("idle_down")
		down_left:
			enemy.animation_player.play("idle_down")
		down_right:
			enemy.animation_player.play("idle_down")
		Vector2.LEFT:
			enemy.animation_player.play("idle_left")
		Vector2.RIGHT:
			enemy.animation_player.play("idle_right")
		Vector2.ZERO:
			enemy.animation_player.play("idle_down")
