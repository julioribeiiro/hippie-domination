extends Node


# Declare member variables here. Examples:
# var a = 2
var last_follower
var n_followers 
var jump

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	jump = get_parent().jump
	n_followers = get_child_count()
	if get_child_count() > 0:
		last_follower = get_child(get_child_count() - 1)
