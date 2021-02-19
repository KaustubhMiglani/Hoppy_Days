extends KinematicBody2D

var motion=Vector2(0,0)

const speed =2000

const gravity=300

const up=Vector2(0,-1)

const limit=3000

const jump_speed=3000

var lives=3

func _physics_process(delta):
	apply_gravity()
	jump()
	if(Input.is_action_pressed("left") and not Input.is_action_pressed("right")):
		motion.x=-speed
	elif(Input.is_action_pressed("right") and not Input.is_action_pressed("left")):
		motion.x=speed
	else:
		motion.x=0
	move_and_slide(motion,up)
	animate()
func jump():
	if(is_on_floor() and Input.is_action_pressed("jump")):
		motion.y-=jump_speed
		get_node("jump sfx").play()
func apply_gravity():
	if(position.y>limit):
		end_game()
	if(not(is_on_floor())):
		motion.y+=(gravity)
	else:
		motion.y=0
func animate():
	if(motion.x>0):
		get_node("AnimatedSprite").flip_h=false
		get_node("AnimatedSprite").play("walk")
	elif(motion.x<0):
		get_node("AnimatedSprite").flip_h=true
		get_node("AnimatedSprite").play("walk")		
	elif(motion.y>0):
		get_node("AnimatedSprite").play("jump")
	else:
		get_node("AnimatedSprite").play("idle")
func _ready():
	pass
func end_game():
	get_tree().change_scene("res://Scenes/Levels/End_game.tscn")


func hurt():
	position.y-=1
	yield(get_tree(),"idle_frame")
	get_node("pain sfx").play()
	motion.y-=(jump_speed)
	lives-=1
	if(lives<0):
		end_game()
