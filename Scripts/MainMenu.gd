extends Node2D

var main_menu
var credits
var SCREEN_WIDTH = 800
var button_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready():
	main_menu = $MainMarginContainer
	credits = $CreditosVBoxContainer
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if button_pressed:
		main_menu.position = lerp(main_menu.position, Vector2(-SCREEN_WIDTH,0), 0.1)
		credits.position = lerp(credits.position, Vector2(0,0), 0.1)
		



func _on_modo_territorio_button_pressed():
	$ButtonPressed.play()


func _on_modo_territorio_button_mouse_entered():
	$ButtonHovered.play()


func _on_modo_nombres_button_pressed():
	$ButtonPressed.play()


func _on_modo_nombres_button_mouse_entered():
	$ButtonHovered.play()


func _on_creditos_button_pressed():
	$ButtonPressed.play()
	button_pressed = true
	


func _on_creditos_button_mouse_entered():
	$ButtonHovered.play()
