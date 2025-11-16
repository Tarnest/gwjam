extends StateMachine

@onready var running: State = %Running
@onready var idle: State = %Idle
@onready var combat: State = %Combat

func _ready() -> void:
	change_state(state)
	
	idle.state_finished.connect(_idle_state_finished)
	running.state_finished.connect(_running_state_finished)
	combat.state_finished.connect(_combat_state_finished)

func _idle_state_finished():
	if Input.is_action_just_pressed("swing"):
		change_state(combat)
	else:
		change_state(running)

func _running_state_finished():
	if Input.is_action_just_pressed("swing"):
		change_state(combat)
	else:
		change_state(idle)

func _combat_state_finished():
	if Input.is_action_pressed("move"):
		change_state(running)
	else:
		change_state(idle)
