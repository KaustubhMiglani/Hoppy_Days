extends Area2D


func _ready():
	pass


func _on_JumpPad_body_entered(body):
	get_node("AnimationPlayer").play("Boost")
	body.boost()
