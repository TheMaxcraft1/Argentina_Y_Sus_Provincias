extends Area2D

@export var sprite: Texture2D
var mouse_pos
var is_selected

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.texture = sprite
	var my_shape = RectangleShape2D.new()
	my_shape.size = sprite.get_size()
	
	$CollisionShape2D.shape = my_shape

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mouse_pos = get_viewport().get_mouse_position()
		
	if is_selected:
		position = position.lerp(mouse_pos, delta * 20)
		#position = mouse_pos
		

func get_is_selected():
	return is_selected

func set_sprite(sprite):
	self.sprite = sprite

func _on_input_event(_viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_selected = true
		else:
			is_selected = false
			
