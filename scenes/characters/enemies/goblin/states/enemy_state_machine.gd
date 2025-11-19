extends StateMachine

@export var enemy: Enemy

@onready var running: State = %Running
@onready var idle: State = %Idle
@onready var combat: State = %Combat
@onready var combat_timer: Timer = %CombatTimer

func _ready() -> void:
	change_state(state)
	
	idle.state_finished.connect(_idle_state_finished)
	running.state_finished.connect(_running_state_finished)
	combat.state_finished.connect(_combat_state_finished)
	combat_timer.timeout.connect(_on_combat_timer_timeout)

func _idle_state_finished():
	change_state(running)

func _running_state_finished():
	change_state(idle)

func _combat_state_finished():
	if enemy.is_player_close():
		change_state(idle)
	else:
		change_state(running)

func _on_combat_timer_timeout():
	change_state(combat)
