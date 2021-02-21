extends Node2D

func _process(delta):
	if(get_node("Sprite/RayCast2D").is_colliding()):
		fire()
var timeout=false

func fire():
	if(not timeout):
		get_node("Sprite/RayCast2D").add_child(load("res://NPC/Lightning.tscn").instance())
		get_node("Sprite/Timer").start()
		timeout=true
func _ready():
	pass


func _on_Timer_timeout():
	timeout=false
