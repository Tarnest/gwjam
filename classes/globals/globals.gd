extends Node2D

signal get_player_pos

var current_player_pos: Vector2:
	get:
		get_player_pos.emit()
		return current_player_pos
