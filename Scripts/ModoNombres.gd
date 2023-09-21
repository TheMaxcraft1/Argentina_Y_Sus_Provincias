extends Node2D

var score = 0
var multiplier = 1
var pitch = 1
var province_counter
var is_winner := true
var is_timed_mode : bool
var is_timer_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_tree().paused = false
	score = 0
	multiplier = 1
	province_counter = 0
	$HUD/MultiplierLabel.add_theme_font_size_override("font_size", 50)
	$HUD/MultiplierLabel.add_theme_color_override("font_color", Color(255,255,255))
	$HUD/GameFinish.set_visible(false)
	$Opacity.set_visible(true)

func provinceSignalProcessing(txt, provinciaNombre, provinciaLineEdit : LineEdit, provinciaLabel: Label):
	var success_color = Color.GREEN
	var miss_color = Color.RED
	if txt.to_lower() == provinciaNombre:
		updateScore(100 * multiplier)
		multiplier += 1
		comboUpSFX()
		provinciaLabel.add_theme_color_override("font_color", success_color)
	else:
		multiplier = 1
		$ComboMiss.play()
		provinciaLabel.add_theme_color_override("font_color", miss_color)
		is_winner = false
	provinciaLabel.set_visible(true)
	provinciaLineEdit.set_visible(false)
	updateMultiplier()
	provinciaLineEdit.set_editable(false)
	provinciaLineEdit.set_focus_mode(Control.FOCUS_NONE)
	province_counter += 1

func game_finish():
	if province_counter == 23 or is_timer_finished:
		await get_tree().create_timer(1).timeout
		$HUD/GameFinish.set_visible(true)
		$Opacity.set_visible(true)
		if is_timed_mode:
			$GameTimer.set_paused(true)
		if is_winner:
			$HUD/GameFinish/GanasteLabel.set_visible(true)
		else:
			$HUD/GameFinish/PerdisteLabel.set_visible(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$HUD/FPSLabel.set_text(str(Engine.get_frames_per_second()))
	game_finish()
	timer_label_update()

func comboUpSFX():
	if multiplier == 2:
		pitch = 1
		$ComboUp.set_pitch_scale(pitch)
	elif multiplier >= 3:
		$ComboUp.set_pitch_scale(pitch)
	$ComboUp.play()
	pitch += 0.05

func timer_label_update():
	if is_timed_mode:
		$HUD/TimerLabel.text = "%d:%02d" % [floor($GameTimer.time_left / 60), int($GameTimer.time_left) % 60]

func _on_buenos_aires_line_edit_text_submitted(txt):		
	provinceSignalProcessing(txt, "buenos aires", $BuenosAiresLineEdit, $BuenosAiresLabel)

func _on_entre_rios_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "entre ríos", $EntreRiosLineEdit, $EntreRiosLabel)

func _on_corrientes_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "corrientes", $CorrientesLineEdit, $CorrientesLabel)

func _on_misiones_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "misiones", $MisionesLineEdit, $MisionesLabel)

func _on_jujuy_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "jujuy", $JujuyLineEdit, $JujuyLabel)

func _on_salta_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "salta", $SaltaLineEdit, $SaltaLabel)

func _on_catamarca_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "catamarca", $CatamarcaLineEdit, $CatamarcaLabel)

func _on_la_rioja_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "la rioja", $LaRiojaLineEdit, $LaRiojaLabel)

func _on_san_juan_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "san juan", $SanJuanLineEdit, $SanJuanLabel)

func _on_mendoza_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "mendoza", $MendozaLineEdit, $MendozaLabel)

func _on_neuquen_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "neuquén", $NeuquenLineEdit, $NeuquenLabel)

func _on_rio_negro_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "río negro", $RioNegroLineEdit, $RioNegroLabel)

func _on_chubut_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "chubut", $ChubutLineEdit, $ChubutLabel)

func _on_santa_cruz_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santa cruz", $SantaCruzLineEdit, $SantaCruzLabel)

func _on_tierra_del_fuego_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "tierra del fuego", $TierraDelFuegoLineEdit, $TierraDelFuegoLabel)

func _on_formosa_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "formosa", $FormosaLineEdit, $FormosaLabel)

func _on_chaco_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "chaco", $ChacoLineEdit, $ChacoLabel)

func _on_santiago_del_estero_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santiago del estero", $SantiagoDelEsteroLineEdit, $SantiagoDelEsteroLabel)

func _on_tucuman_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "tucumán", $TucumanLineEdit, $TucumanLabel)

func _on_santa_fe_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "santa fe", $SantaFeLineEdit, $SantaFeLabel)

func _on_cordoba_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "córdoba", $CordobaLineEdit, $CordobaLabel)

func _on_la_pampa_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "la pampa", $LaPampaLineEdit, $LaPampaLabel)

func _on_san_luis_line_edit_text_submitted(txt):
	provinceSignalProcessing(txt, "san luis", $SanLuisLineEdit, $SanLuisLabel)

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
		$HUD/OptionsContainer/SFXSlider.set_visible(true)
	else:
		$HUD/OptionsContainer/SFXSlider.set_visible(false)
	$ButtonPressed.play()

func _on_sfx_button_mouse_entered():
	$ButtonHovered.play()
		

func _on_music_button_toggled(button_pressed):
	if button_pressed:
		$HUD/OptionsContainer/MusicSlider.set_visible(true)
	else:
		$HUD/OptionsContainer/MusicSlider.set_visible(false)
	$ButtonPressed.play()


func _on_music_button_mouse_entered():
	$ButtonHovered.play()


func _on_texture_button_pressed():
	$ButtonPressed.play()
	$HUD/PauseMenu.set_visible(true)
	$Opacity.set_visible(true)
	get_tree().paused = true


func _on_texture_button_mouse_entered():
	$ButtonHovered.play()


func _on_resume_button_pressed():
	$ButtonPressed.play()
	$HUD/PauseMenu.set_visible(false)
	$Opacity.set_visible(false)
	get_tree().paused = false


func _on_resume_button_mouse_entered():
	$ButtonHovered.play()


func _on_modo_sin_tiempo_button_pressed():
	is_timed_mode = false
	$ButtonPressed.play()
	$HUD/GameStart.set_visible(false)
	$Opacity.set_visible(false)


func _on_modo_sin_tiempo_button_mouse_entered():
	$ButtonHovered.play()

func _on_modo_temporizado_button_pressed():
	is_timed_mode = true
	$ButtonPressed.play()
	$HUD/GameStart.set_visible(false)
	$HUD/TimerLabel.set_visible(true)
	$GameTimer.start()
	$Opacity.set_visible(false)

func _on_modo_temporizado_button_mouse_entered():
	$ButtonHovered.play()

func _on_game_timer_timeout():
	is_winner = false
	is_timer_finished = true
