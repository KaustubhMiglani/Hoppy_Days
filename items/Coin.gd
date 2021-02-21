extends Node2D


func _ready():
	pass

var taken =false
func _on_Area2D_body_entered(body):
	if(not taken):
		taken=true
		$AnimationPlayer.play("die")
		get_node("AudioStreamPlayer2D").play()
		get_tree().call_group("GUI","upd_coins")
func die():
	queue_free()
