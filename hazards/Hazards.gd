extends Area2D

func _ready():
	
	pass
func _on_Spike_body_entered(body):
	body.hurt()
