extends Area2D

@export var sprite: Texture2D
var mouse_pos
var is_mouse_over_sprite

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
		if is_mouse_over_sprite:
			position = mouse_pos



func _on_mouse_entered():
	is_mouse_over_sprite = true


func _on_mouse_exited():
	is_mouse_over_sprite = false
