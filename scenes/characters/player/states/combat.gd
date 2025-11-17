extends State

@export var player: Player
@onready var timer: Timer = $Timer
var distance: int = 10
var amount_of_time: float = 0.25

func _ready() -> void:
	set_physics_process(false)
	timer.timeout.connect(_on_timer_timeout)

func _enter() -> void:
	set_physics_process(true)
	timer.start(amount_of_time)
	
	if player.hit_area.body_entered.get_connections().size() == 0:
		player.hit_area.body_entered.connect(_on_hit_area_body_entered)
	
	player.hit_area.process_mode = Node.PROCESS_MODE_ALWAYS
	player.hit_area.position = player.last_direction * distance
	player.hit_area.rotation = player.last_direction.angle()

func _on_timer_timeout():	
	player.hit_area.process_mode = Node.PROCESS_MODE_DISABLED
	state_finished.emit()

func animate():
	pass

func _on_hit_area_body_entered(body: PhysicsBody2D):
	if body is Enemy:
		body.call("hit", player.sword_damage, player.last_direction)
