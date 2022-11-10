extends KinematicBody2D


# Declare member variables here. Examples:

var motion = Vector2()
const UP = Vector2(0, -1)
const OFFSET_X = -150
const OFFSET_Y = 470
const OFFSET_X_NCHILD = 10
export var GRAVITY = 20
export var MAX_FALL_SPEED = 500
export var JUMP_FORCE = 400
var n_followers
var last_follower
var player
var jump = false
var last_jump_position = 0
var initial_position = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	initial_position = position.y
	player = get_parent().get_parent()
	n_followers = get_parent().n_followers
	last_follower = get_parent().last_follower
	if n_followers <= 0:
		position.y =  player.position.y + OFFSET_Y
		position.x =  player.position.x - OFFSET_X
	else:
		position.y = player.position.y + OFFSET_Y
		position.x = player.position.x - OFFSET_X - (OFFSET_X_NCHILD*n_followers)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y += GRAVITY
	motion.x = player.motion.x
	
	if player.motion.x <= 0 and position.x - player.position.x < 0:
		motion.x = 300
	
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED

	if not jump and player.jump and is_on_floor():
		jump = true
		last_jump_position = player.position.x
	if (position.x - last_jump_position - 150) > 0 and jump and is_on_floor():
		motion.y = -JUMP_FORCE
		jump = false
	
	motion = move_and_slide(motion, UP)
	check_fall()

func die():
	queue_free()

func check_fall():
	if position.y - initial_position > 700:
		die()
