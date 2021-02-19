extends Control


func _ready():
	pass


func _on_Restart_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
