extends KinematicBody2D

# Declare member variables here. Examples:
const UP = Vector2(0, -1)
export var GRAVITY = 20
export var MAX_FALL_SPEED = 200
export var MAX_SPEED = 80
export var JUMP_FORCE = 300
onready var follower = preload("res://personagens/follower.tscn")

var motion = Vector2()

func _ready():
	$Sprite/AnimationPlayer.play("andar")

func _physics_process(delta):
	# movements
	motion.x = MAX_SPEED
	motion.y += GRAVITY
	
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	
	if is_on_floor():
		$Sprite/AnimationPlayer.play("andar")
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -JUMP_FORCE
	else:
		$Sprite/AnimationPlayer.stop()
		$Sprite.frame = 1
	
	motion = move_and_slide(motion, UP)


func _on_convertArea_body_entered(body):
	body.converted()
	$convert_anim.play("convert")
	
func add_new_follower():
	var inst = follower.instance()
	add_child(inst)
