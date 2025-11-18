extends Node2D

@export var debug: bool = false
@onready var main_room: PackedScene = preload("res://scenes/areas/main_room/main_room.tscn")
@onready var player: PackedScene = preload("res://scenes/characters/player/player.tscn")
@onready var start_screen: Control = %StartScreen
@onready var phantom_camera: PhantomCamera2D = %PhantomCamera2D
@onready var camera2d: Camera2D = %Camera2D

func _ready() -> void:
	Globals.start_game.connect(_on_start_game)
	
	if debug:
		start_game()

func _on_start_game() -> void:
	start_game()

func start_game() -> void:
	start_screen.visible = false
	phantom_camera.visible = true
	camera2d.visible = true
	
	var player_load: Player = player.instantiate() as Player 
	var main_room_load: MainRoom = main_room.instantiate() as MainRoom
	phantom_camera.follow_target = player_load
	
	add_child(main_room_load)
	add_child(player_load)
	
	phantom_camera.limit_target = main_room_load.tile_map_layer.get_path()
