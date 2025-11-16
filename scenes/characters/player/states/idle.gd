extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("move") || Input.is_action_just_pressed("swing"):
		state_finished.emit()

func animate():
	pass
