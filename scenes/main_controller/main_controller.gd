extends Node2D

@export var debug: bool = false
@onready var main_room: PackedScene = preload("res://scenes/areas/main_room/main_room.tscn")
@onready var player: PackedScene = preload("res://scenes/characters/player/player.tscn")
@onready var start_screen: Control = %StartScreen
@onready var phantom_camera: PhantomCamera2D = %PhantomCamera2D
@onready var camera2d: Camera2D = %Camera2D
@onready var current_room: Node2D = $CurrentRoom

var player_load: Player

func _ready() -> void:
	Globals.start_game.connect(_on_start_game)
	Globals.change_scene.connect(_on_change_scene)
	
	if debug:
		start_game()

func _on_start_game() -> void:
	start_game()

func start_game() -> void:
	start_screen.visible = false
	phantom_camera.visible = true
	camera2d.visible = true
	
	player_load = player.instantiate() as Player 
	var main_room_load: Room = main_room.instantiate() as Room
	phantom_camera.follow_target = player_load
	
	current_room.add_child(main_room_load)
	
	player_load.position = main_room_load.player_spawn.position
	add_child(player_load)
	
	phantom_camera.limit_target = main_room_load.tile_map_layer.get_path()

func _on_change_scene(scene: PackedScene):
	for room in current_room.get_children():
		room.queue_free()
	
	var new_scene: Room = scene.instantiate() as Room
	
	(func():
		current_room.add_child(new_scene)
		player_load.position = new_scene.player_spawn.position
		phantom_camera.limit_target = new_scene.tile_map_layer.get_path()
	).call_deferred()
