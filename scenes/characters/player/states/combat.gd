extends State

@export var player: Player

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = %AnimationPlayer

var distance: int = 10
var amount_of_time: float = 0.05
var bodies: Array[PhysicsBody2D]

var up_left: Vector2 = Vector2.UP + Vector2.LEFT
var up_right: Vector2 = Vector2.UP + Vector2.RIGHT
var down_left: Vector2 = Vector2.DOWN + Vector2.LEFT
var down_right: Vector2 = Vector2.DOWN + Vector2.RIGHT

func _ready() -> void:
	set_physics_process(false)
	timer.timeout.connect(_on_timer_timeout)
	animation_player.animation_finished.connect(_on_animation_finished)

func _enter() -> void:
	set_physics_process(true)
	timer.start(amount_of_time)
	
	if player.hit_area.body_entered.get_connections().size() == 0:
		player.hit_area.body_entered.connect(_on_hit_area_body_entered)
	
	player.hit_area.process_mode = Node.PROCESS_MODE_ALWAYS
	player.hit_area.position = player.last_direction * distance
	player.hit_area.rotation = player.last_direction.angle()
	
	bodies.clear()

func _physics_process(_delta: float) -> void:	
	animate()


func _on_timer_timeout():	
	player.hit_area.process_mode = Node.PROCESS_MODE_DISABLED
	for body in bodies:
		if body is Enemy:
			body.call("hit", player.sword_damage, player.last_direction)

func animate():	
	match player.last_direction.round():
		Vector2.UP:
			player.sprite.flip_h = false
			animation_player.play("swipe_up")
		up_right:
			player.sprite.flip_h = false
			animation_player.play("swipe_up")
		up_left:
			player.sprite.flip_h = false
			animation_player.play("swipe_up")
		Vector2.DOWN:
			player.sprite.flip_h = false
			animation_player.play("swipe_down")
		down_left:
			player.sprite.flip_h = false
			animation_player.play("swipe_down")
		down_right:
			player.sprite.flip_h = false
			animation_player.play("swipe_down")
		Vector2.LEFT:
			player.sprite.flip_h = false
			animation_player.play("swipe_side")
		Vector2.RIGHT:
			player.sprite.flip_h = true
			animation_player.play("swipe_side")
		Vector2.ZERO:
			player.sprite.flip_h = false
			animation_player.play("swipe_down")

func _on_hit_area_body_entered(body: PhysicsBody2D):
	if body is Enemy:
		bodies.push_back(body)

func _on_animation_finished(anim_name: StringName):	
	var swipe_arr: Array[StringName] = ["swipe_up", "swipe_down", "swipe_side"]
	
	if anim_name in swipe_arr:
		player.hit_area.process_mode = Node.PROCESS_MODE_DISABLED
		state_finished.emit()
