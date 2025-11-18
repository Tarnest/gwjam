extends Control

@onready var start_game: Button = %StartGame
@onready var options: Button = %Options
@onready var quit: Button = %Quit

func _ready() -> void:
	start_game.pressed.connect(_on_start_game_pressed)
	options.pressed.connect(_on_options_pressed)
	quit.pressed.connect(_on_quit_pressed)

func _on_start_game_pressed():
	Globals.start_game.emit()

func _on_options_pressed():
	pass
	
func _on_quit_pressed():
	get_tree().quit()
