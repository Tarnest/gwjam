class_name Bullet
extends Area2D

@onready var timer: Timer = $Timer

var bullet_damage: int
var speed: int = 100
var direction: Vector2 = Vector2.RIGHT
var velocity: Vector2

func _ready() -> void:
	timer.timeout.connect(_on_timeout)
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	velocity = speed * direction.normalized()
	
	position += velocity * delta

func _on_timeout():
	queue_free()

func _on_body_entered(body: PhysicsBody2D):
	if body is Player:
		body.call("hit", 10)
