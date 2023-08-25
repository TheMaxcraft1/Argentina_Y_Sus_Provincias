extends Area2D

@export var sprite: Texture2D
var mouse_pos
var is_mouse_over_sprite
var is_left_mouse_pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = sprite
	var my_shape = RectangleShape2D.new()
	my_shape.size = sprite.get_size()
	
	$CollisionShape2D.shape = my_shape

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()

	if Input.is_action_pressed("left_mouse"):
		is_left_mouse_pressed = true
	elif Input.is_action_just_released("left_mouse"):
		is_left_mouse_pressed = false
		
	if is_mouse_over_sprite and is_left_mouse_pressed:
		position = position.lerp(mouse_pos, delta * 20)
		#position = mouse_pos
		
#	if Input.is_action_pressed("left_mouse"):
#		if is_mouse_over_sprite:
#			position = position.lerp(mouse_pos, delta * 20)

func get_is_left_mouse_pressed():
	return is_left_mouse_pressed

func _on_mouse_entered():
	is_mouse_over_sprite = true


func _on_mouse_exited():
	is_mouse_over_sprite = false
