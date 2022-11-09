extends KinematicBody2D

# Declare member variables here. Examples:
const UP = Vector2(0, -1)
export var GRAVITY = 20
export var MAX_FALL_SPEED = 500
export var ACELERATION = 5
export var CAMERA_ACELERATION = 5
export var MIN_SPEED = 100
export var MAX_SPEED = 300
export var JUMP_FORCE = 300
onready var follower = preload("res://personagens/follower.tscn")
var n_followers = 0
var last_follower
var jump = false
var camera_position = 0
var camera_speed = 0
var camera
var initial_position = 0
var max_speed_increased = 0

var motion = Vector2()
var pause = true ;
var time = 0;

func _ready():
	$Sprite/AnimationPlayer.play("andar")
	camera = get_parent().get_children()[1]
	initial_position = position.y

func _physics_process(delta):
	time += 1
	check_fall()
	get_parent().get_children()[2].position.x += camera_speed*delta
	camera.position.x += camera_speed*delta
	# movements
	camera_speed += CAMERA_ACELERATION
	motion.x += ACELERATION
	motion.y += GRAVITY

	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	if motion.x > MAX_SPEED + max_speed_increased:
		motion.x = MAX_SPEED + max_speed_increased
	
	if motion.x <= MIN_SPEED:
		motion.x = MIN_SPEED
		camera_speed = MIN_SPEED
	
	if camera_speed > MAX_SPEED + max_speed_increased:
		camera_speed = MAX_SPEED + max_speed_increased
	
	if position.x - camera.position.x > 300:
		ACELERATION = 5
	else:
		ACELERATION = 15
	
	if is_on_floor():
		jump = false
		$Sprite/AnimationPlayer.play("andar")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
			jump = true
	else:
		$Sprite/AnimationPlayer.stop()
		$Sprite.frame = 1
	motion = move_and_slide(motion, UP)
	
	if time % 150 == 0:
		max_speed_increased += 5

func _on_convertArea_body_entered(body):
	if body.name == 'vilan':
		$hitbox.disabled = true
		body.converted()
		$convert_anim.play("convert")

func add_new_follower():
	var inst = follower.instance()
	n_followers += 1
	$followers.add_child(inst)
	
func get_position():
	return global_position

func check_fall():
	if position.y - initial_position  > 100:
		get_parent().get_parent().lose()

