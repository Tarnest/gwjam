extends State

@export var enemy: Enemy

var up_left: Vector2 = Vector2.UP + Vector2.LEFT
var up_right: Vector2 = Vector2.UP + Vector2.RIGHT
var down_left: Vector2 = Vector2.DOWN + Vector2.LEFT
var down_right: Vector2 = Vector2.DOWN + Vector2.RIGHT

func _physics_process(_delta: float) -> void:
	enemy.move_to_player()
	
	if enemy.is_player_close():
		state_finished.emit()
	
	animate()

func animate():
	match enemy.last_direction.round():
		Vector2.UP:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_up")
		up_right:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_up")
		up_left:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_up")
		Vector2.DOWN:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_down")
		down_left:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_down")
		down_right:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_down")
		Vector2.LEFT:
			enemy.sprite.flip_h = false
			enemy.animation_player.play("run_side")
		Vector2.RIGHT:
			enemy.sprite.flip_h = true
			enemy.animation_player.play("run_side")
