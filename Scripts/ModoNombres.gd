extends Node2D

var score = 0
var multiplier = 1
var pitch = 1
var province_counter

# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	multiplier = 1
	province_counter = 0
	$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 50)
	$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(255,255,255))
	$HUD/GameFinish.set_visible(false)
	$Opacity.set_visible(false)

func provinceSignalProcessing(txt, provinciaNombre, provinciaLineEdit : LineEdit):
	if txt.to_lower() == provinciaNombre:
		updateScore(100 * multiplier)
		multiplier += 1
		comboUpSFX()
	else:
		multiplier = 1
		$ComboMiss.play()
	updateMultiplier()
	provinciaLineEdit.set_editable(false)
	provinciaLineEdit.set_focus_mode(Control.FOCUS_NONE)
	province_counter += 1

func game_finish():
	if province_counter == 23:
		await get_tree().create_timer(1).timeout
		$HUD/GameFinish.set_visible(true)
		$Opacity.set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$HUD/FPSLabel.set_text(str(Engine.get_frames_per_second()))
	game_finish()

func comboUpSFX():
	if multiplier == 2:
		pitch = 1
		$ComboUp.set_pitch_scale(pitch)
	elif multiplier >= 3:
		$ComboUp.set_pitch_scale(pitch)
	$ComboUp.play()
	pitch += 0.05

func _on_buenos_aires_line_edit_text_submitted(txt):		
	provinceSignalProcessing(txt, "buenos aires", $BuenosAiresLineEdit)
#	if txt.to_lower() == "buenos aires":
#		updateScore(100 * multiplier)
#		multiplier += 1
#		comboUpSFX()
#	else:
#		multiplier = 1
#		$ComboMiss.play()
#		$BuenosAiresLineEdit.set_visible(false)
#		$BuenosAiresLabel.set_visible(true)
#	updateMultiplier()
#	$BuenosAiresLineEdit.set_editable(false)
#	$BuenosAiresLineEdit.set_focus_mode(Control.FOCUS_NONE)

func _on_entre_rios_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "entre ríos", $EntreRiosLineEdit)

func _on_corrientes_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "corrientes", $CorrientesLineEdit)

func _on_misiones_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "misiones", $MisionesLineEdit)

func _on_jujuy_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "jujuy", $JujuyLineEdit)

func _on_salta_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "salta", $SaltaLineEdit)

func _on_catamarca_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "catamarca", $CatamarcaLineEdit)

func _on_la_rioja_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "la rioja", $LaRiojaLineEdit)

func _on_san_juan_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "san juan", $SanJuanLineEdit)

func _on_mendoza_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "mendoza", $MendozaLineEdit)

func _on_neuquen_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "neuquén", $NeuquenLineEdit)

func _on_rio_negro_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "río negro", $RioNegroLineEdit)

func _on_chubut_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "chubut", $ChubutLineEdit)

func _on_santa_cruz_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santa cruz", $SantaCruzLineEdit)

func _on_tierra_del_fuego_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "tierra del fuego", $TierraDelFuegoLineEdit)

func _on_formosa_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "formosa", $FormosaLineEdit)

func _on_chaco_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "chaco", $ChacoLineEdit)

func _on_santiago_del_estero_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santiago del estero", $SantiagoDelEsteroLineEdit)

func _on_tucuman_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "tucumán", $TucumanLineEdit)

func _on_santa_fe_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santa fe", $SantaFeLineEdit)

func _on_cordoba_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "córdoba", $CordobaLineEdit)

func _on_la_pampa_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "la pampa", $LaPampaLineEdit)

func _on_san_luis_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "san luis", $SanLuisLineEdit)

func updateMultiplier():
	var mLabel = $HUD/MultiplierLabel 
	if multiplier > 3:
		multiplier = 3
	mLabel.set_text(str(multiplier) + "X")
	if multiplier == 1:
		mLabel.add_theme_font_size_override("font_size", 50)
		mLabel.add_theme_color_override("font_color", Color(255,255,255))
		#mLabel.set_rotation(0)
	elif multiplier == 2:
		mLabel.add_theme_font_size_override("font_size", 55)
		mLabel.add_theme_color_override("font_color", Color(251,255,0))
		#mLabel.set_rotation(deg_to_rad(15))
		
	elif multiplier == 3:
		mLabel.add_theme_font_size_override("font_size", 65)
		mLabel.add_theme_color_override("font_color", Color(255,0,0))
		#mLabel.set_rotation(deg_to_rad(30))
	

	
func updateScore(points):
	score += points
	$HUD/ScoreLabel.set_text(str(score))

func _on_replay_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	get_tree().reload_current_scene()

func _on_replay_button_mouse_entered():
	$ButtonHovered.play()

func _on_home_button_pressed():
	$ButtonPressed.play()
	await $ButtonPressed.finished
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _on_home_button_mouse_entered():
	$ButtonHovered.play()

func _on_sfx_button_toggled(button_pressed):
	if button_pressed:
		$OptionsContainer/SFXSlider.set_visible(true)
	else:
		$OptionsContainer/SFXSlider.set_visible(false)
	$ButtonPressed.play()

func _on_sfx_button_mouse_entered():
	$ButtonHovered.play()
		

func _on_music_button_toggled(button_pressed):
	if button_pressed:
		$OptionsContainer/MusicSlider.set_visible(true)
	else:
		$OptionsContainer/MusicSlider.set_visible(false)
	$ButtonPressed.play()


func _on_music_button_mouse_entered():
	$ButtonHovered.play()
