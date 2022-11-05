extends KinematicBody2D


# Declare member variables here. Examples:

var motion = Vector2()
const UP = Vector2(0, -1)
export var GRAVITY = 20
export var MAX_FALL_SPEED = 200
onready var follower = preload("res://personagens/follower.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	position.y = get_parent().position.y - 50
	position.x = get_parent().position.x - 360
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += GRAVITY
	
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED

	motion = move_and_slide(motion, UP)


func add_new_follower():
	var inst = follower.instance()
	add_child(inst)
