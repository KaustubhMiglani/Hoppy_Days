extends Area2D

func _ready():
	$AnimationPlayer.play("Spikeman")
	pass

func _on_Area2D_body_entered(body):
	body.hurt()
