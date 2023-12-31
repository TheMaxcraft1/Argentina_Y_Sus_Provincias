extends Node2D

var main_menu
var credits
var SCREEN_WIDTH = 800
# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	main_menu = $MainMenu
	credits = $Creditos
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_modo_territorio_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	get_tree().change_scene_to_file("res://Scenes/ModoTerritorio.tscn")


func _on_modo_territorio_button_mouse_entered():
	$ButtonHovered.play()


func _on_modo_nombres_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	get_tree().change_scene_to_file("res://Scenes/ModoNombres.tscn")


func _on_modo_nombres_button_mouse_entered():
	$ButtonHovered.play()


func _on_creditos_button_pressed():
	$ButtonPressed.play()	
	var tween = create_tween().set_parallel(true)
	tween.tween_property(main_menu, "position", Vector2(-SCREEN_WIDTH, 0),  0.5).set_trans(Tween.TRANS_BACK)
	tween.tween_property(credits, "position", Vector2.ZERO, 0.5).set_trans(Tween.TRANS_BACK)
	


func _on_creditos_button_mouse_entered():
	$ButtonHovered.play()


func _on_atras_creditos_button_pressed():
	$ButtonPressed.play()
	var tween = create_tween().set_parallel(true)
	tween.tween_property(credits, "position", Vector2(SCREEN_WIDTH,0), 0.5).set_trans(Tween.TRANS_BACK)
	tween.tween_property(main_menu, "position", Vector2.ZERO,  0.5).set_trans(Tween.TRANS_BACK)

func _on_atras_creditos_button_mouse_entered():
	$ButtonHovered.play()

func _on_sfx_button_toggled(button_pressed):
	if button_pressed:
		$MainMenu/OptionsContainer/SFXSlider.set_visible(true)
	else:
		$MainMenu/OptionsContainer/SFXSlider.set_visible(false)
	$ButtonPressed.play()

func _on_sfx_button_mouse_entered():
	$ButtonHovered.play()
		

func _on_music_button_toggled(button_pressed):
	if button_pressed:
		$MainMenu/OptionsContainer/MusicSlider.set_visible(true)
	else:
		$MainMenu/OptionsContainer/MusicSlider.set_visible(false)
	$ButtonPressed.play()


func _on_music_button_mouse_entered():
	$ButtonHovered.play()
