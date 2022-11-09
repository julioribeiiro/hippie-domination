extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StaticBody2D_body_entered(body):
	print(body.name)
	if body.name == 'follower_die_area':
		body.get_parent().die()
	if body.name == 'player_die_area':
		get_parent().get_parent().get_parent().lose()
