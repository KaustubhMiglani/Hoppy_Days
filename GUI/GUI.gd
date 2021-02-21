extends CanvasLayer

var coins=0 

var limit=3

func _ready():
	get_node("Control/TextureRect/HBoxContainer/Livecount").text="3"
	
func hurt(lives):
	get_node("Control/TextureRect/HBoxContainer/Livecount").text=str(lives)

func upd_coins():
	coins+=1
	get_node("Control/TextureRect/HBoxContainer/Coincount").text=str(coins)
	if(coins%limit==0):
		get_node("../Player").inc_life()
