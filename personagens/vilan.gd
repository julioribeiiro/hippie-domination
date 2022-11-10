extends Area2D

var player

var type = [
	'woman',
	'man'
]

func _ready():
	randomize()
	$Sprite.play(type[randi() % len(type)])


func converted():
	$AnimationPlayer.play("coverting")

func disapear():
	$".".queue_free()

func _process(delta):
	pass
#	print('vilan: '+String(position))


func _on_vilan_body_entered(body):
	if(body.name == "Main"):
		converted()
		body.add_follower()
