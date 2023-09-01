extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_modo_territorio_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ModoTerritorio.tscn")


func _on_modo_nombre_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/ModoNombres.tscn")


func _on_creditos_button_pressed():
	$HUD/ModoTerritorioButton.set_visible(false)
	$HUD/ModoNombreButton.set_visible(false)
	$HUD/CreditosButton.set_visible(false)
	$HUD/CreditosLabel.set_visible(true)
	$HUD/BackCreditosButton.set_visible(true)

func _on_back_creditos_button_pressed():
	$HUD/ModoTerritorioButton.set_visible(true)
	$HUD/ModoNombreButton.set_visible(true)
	$HUD/CreditosButton.set_visible(true)
	$HUD/CreditosLabel.set_visible(false)
	$HUD/BackCreditosButton.set_visible(false)


func _on_modo_territorio_button_mouse_entered():
	$ButtonFocus.play()


func _on_modo_nombre_button_mouse_entered():
	$ButtonFocus.play()


func _on_creditos_button_mouse_entered():
	$ButtonFocus.play()


func _on_back_creditos_button_mouse_entered():
	$ButtonFocus.play()
