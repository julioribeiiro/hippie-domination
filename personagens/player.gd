extends KinematicBody2D

# Declare member variables here. Examples:
export var speed = 120
var direction: Vector2

func _ready():
	$Sprite/AnimationPlayer.play("andar")
	direction.x = 1
	pass # Replace with function body.


func _process(delta):
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	var movement = speed * direction * delta
	move_and_collide(movement)
	direction.x
	pass
