extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_buenos_aires_area_entered(area):
	if area.get_name() == "BuenosAiresProvincia":
		$BuenosAires/BuenosAiresSprite.set_visible(true)