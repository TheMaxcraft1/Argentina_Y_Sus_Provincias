extends Node2D

@export var province_scene: PackedScene
var is_game_finished
var score
var multiplier
var on_province
var current_province
var province_dict = {
	"BuenosAires": "Buenos Aires",
	"Catamarca": "Catamarca",
	"Chaco": "Chaco",
	"Cordoba": "Córdoba",
	"Corrientes": "Corrientes",
	"EntreRios": "Entre Ríos",
	"Formosa": "Formosa",
	"Jujuy": "Jujuy",
	"LaPampa": "La Pampa",
	"LaRioja": "La Rioja",
	"Mendoza": "Mendoza",
	"Misiones": "Misiones",
	"Neuquen": "Neuquén",
	"RioNegro": "Río Negro",
	"Salta": "Salta",
	"SanJuan": "San Juan",
	"SanLuis": "San Luis",
	"SantaCruz": "Santa Cruz",
	"SantaFe": "Santa Fe",
	"SantiagoDelEstero": "Santiago Del Estero",
	"TierraDelFuego": "Tierra Del Fuego",
	"Tucuman": "Tucumán",
	"Chubut": "Chubut"
	}
#var province_list = ["BuenosAires", "LaPampa"]
var province_list = province_dict.keys()

func _ready():
	is_game_finished = false
	score = 0
	multiplier = 1
	randomize()
	spawn_province()
	$HUD/GameFinish.set_visible(false)
	$Opacity.set_visible(false)

func _process(delta):
	#show_fps()
	province_matching_territory()
	game_finish()
	
func show_fps():
	$HUD/FPSLabel.add_theme_color_override("font_color", Color.AQUAMARINE)
	$HUD/FPSLabel.set_text(str(Engine.get_frames_per_second()))

func spawn_province():
	if province_list.size() > 0:
		var rand_int = randi_range(0, province_list.size()-1)
		var province_name = province_list[rand_int]
		province_list.pop_at(rand_int)
		var sprite = load("res://Textures/%s.png" % province_name)
		
		current_province = province_scene.instantiate()
		current_province.position = $ProvinciasSpawner.position
		current_province.set_sprite(sprite)
		current_province.set_name(province_name + "Provincia")
		
		#La variable province_name tiene el nombre de la provincia pero sin formatear
		update_current_province_label(province_dict.get(province_name)) 
		add_child(current_province)
	else:
		is_game_finished = true

func game_finish():
	if is_game_finished:
		$HUD/GameFinish.set_visible(true)
		$Opacity.set_visible(true)

func check_province_name(province, province_name):
	return province.get_name() == province_name
		
func province_matching_territory():
		
	if current_province.position.x > 472: #Si la provincia no esta sobre el pais
		return
	#Esto va a quedar muy largo, capaz se puede formatear de alguna manera...
	if current_province != null and current_province.get_is_selected() == false:
		if on_province:
			if check_province_name(current_province, "BuenosAiresProvincia"):
				$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			elif check_province_name(current_province, "LaPampaProvincia"):
				$Argentina/LaPampa/LaPampaSprite.set_visible(true)
			elif check_province_name(current_province, "EntreRiosProvincia"):
				$Argentina/EntreRios/EntreRiosSprite.set_visible(true)
			elif check_province_name(current_province, "CorrientesProvincia"):
				$Argentina/Corrientes/CorrientesSprite.set_visible(true)
			elif check_province_name(current_province, "MisionesProvincia"):
				$Argentina/Misiones/MisionesSprite.set_visible(true)
			elif check_province_name(current_province, "FormosaProvincia"):
				$Argentina/Formosa/FormosaSprite.set_visible(true)
			elif check_province_name(current_province, "JujuyProvincia"):
				$Argentina/Jujuy/JujuySprite.set_visible(true)
			elif check_province_name(current_province, "SaltaProvincia"):
				$Argentina/Salta/SaltaSprite.set_visible(true)
			elif check_province_name(current_province, "CatamarcaProvincia"):
				$Argentina/Catamarca/CatamarcaSprite.set_visible(true)
			elif check_province_name(current_province, "TucumanProvincia"):
				$Argentina/Tucuman/TucumanSprite.set_visible(true)
			elif check_province_name(current_province, "SantiagoDelEsteroProvincia"):
				$Argentina/SantiagoDelEstero/SantiagoDelEsteroSprite.set_visible(true)
			elif check_province_name(current_province, "ChacoProvincia"):
				$Argentina/Chaco/ChacoSprite.set_visible(true)
			elif check_province_name(current_province, "SantaFeProvincia"):
				$Argentina/SantaFe/SantaFeSprite.set_visible(true)
			elif check_province_name(current_province, "LaRiojaProvincia"):
				$Argentina/LaRioja/LaRiojaSprite.set_visible(true)
			elif check_province_name(current_province, "SanJuanProvincia"):
				$Argentina/SanJuan/SanJuanSprite.set_visible(true)
			elif check_province_name(current_province, "CordobaProvincia"):
				$Argentina/Cordoba/CordobaSprite.set_visible(true)
			elif check_province_name(current_province, "SanLuisProvincia"):
				$Argentina/SanLuis/SanLuisSprite.set_visible(true)
			elif check_province_name(current_province, "MendozaProvincia"):
				$Argentina/Mendoza/MendozaSprite.set_visible(true)
			elif check_province_name(current_province, "NeuquenProvincia"):
				$Argentina/Neuquen/NeuquenSprite.set_visible(true)
			elif check_province_name(current_province, "RioNegroProvincia"):
				$Argentina/RioNegro/RioNegroSprite.set_visible(true)
			elif check_province_name(current_province, "ChubutProvincia"):
				$Argentina/Chubut/ChubutSprite.set_visible(true)
			elif check_province_name(current_province, "SantaCruzProvincia"):
				$Argentina/SantaCruz/SantaCruzSprite.set_visible(true)
			elif check_province_name(current_province, "TierraDelFuegoProvincia"):
				$Argentina/TierraDelFuego/TierraDelFuegoSprite.set_visible(true)
			
			
			# $Argentina/<nombre de current_province menos la parte de "Provincia"
			#$Argentina/current_province.get_name().left(-9)/(current_province.get_name().left(-9) + "Sprite").set_visible(true)
			#$Argentina/BuenosAires/BuenosAiresSprite.set_visible(true)
			print("Acierto")
			updateScore(100 * multiplier)
			multiplier += 1
			$ComboUp.play()
		else:
			print("NO ES EL TERRITORIO DE LA PROVINCIA")
			multiplier = 1
			$ComboMiss.play()
		
		updateMultiplierLabel()
		current_province.queue_free()
		spawn_province()
		on_province = false
		
func on_province_area_entered(area, province):
	if area.get_name() == province:
		on_province = true
		
func on_province_area_exited(area, province):
	if area.get_name() == province:
		on_province = false

func update_current_province_label(province_name):
	$HUD/CurrentProvinceLabel.set_text("Posicioná a " + "\n" + province_name)
		
func _on_buenos_aires_area_entered(area):
	on_province_area_entered(area, "BuenosAiresProvincia")

func _on_buenos_aires_area_exited(area):
	on_province_area_exited(area, "BuenosAiresProvincia")

func _on_la_pampa_area_entered(area):
	on_province_area_entered(area, "LaPampaProvincia")

func _on_la_pampa_area_exited(area):
	on_province_area_exited(area, "LaPampaProvincia")

func _on_entre_rios_area_entered(area):
	on_province_area_entered(area, "EntreRiosProvincia")

func _on_entre_rios_area_exited(area):
	on_province_area_exited(area, "EntreRiosProvincia")
	
func _on_corrientes_area_entered(area):
	on_province_area_entered(area, "CorrientesProvincia")

func _on_corrientes_area_exited(area):
	on_province_area_exited(area, "CorrientesProvincia")

func _on_misiones_area_entered(area):
	on_province_area_entered(area, "MisionesProvincia")

func _on_misiones_area_exited(area):
	on_province_area_exited(area, "MisionesProvincia")

func _on_formosa_area_entered(area):
	on_province_area_entered(area, "FormosaProvincia")

func _on_formosa_area_exited(area):
	on_province_area_exited(area, "FormosaProvincia")

func _on_jujuy_area_entered(area):
	on_province_area_entered(area, "JujuyProvincia")

func _on_jujuy_area_exited(area):
	on_province_area_exited(area, "JujuyProvincia")

func _on_salta_area_entered(area):
	on_province_area_entered(area, "SaltaProvincia")

func _on_salta_area_exited(area):
	on_province_area_exited(area, "SaltaProvincia")

func _on_catamarca_area_entered(area):
	on_province_area_entered(area, "CatamarcaProvincia")

func _on_catamarca_area_exited(area):
	on_province_area_exited(area, "CatamarcaProvincia")

func _on_tucuman_area_entered(area):
	on_province_area_entered(area, "TucumanProvincia")

func _on_tucuman_area_exited(area):
	on_province_area_exited(area, "TucumanProvincia")

func _on_santiago_del_estero_area_entered(area):
	on_province_area_entered(area, "SantiagoDelEsteroProvincia")

func _on_santiago_del_estero_area_exited(area):
	on_province_area_exited(area, "SantiagoDelEsteroProvincia")

func _on_chaco_area_entered(area):
	on_province_area_entered(area, "ChacoProvincia")

func _on_chaco_area_exited(area):
	on_province_area_exited(area, "ChacoProvincia")

func _on_santa_fe_area_entered(area):
	on_province_area_entered(area, "SantaFeProvincia")

func _on_santa_fe_area_exited(area):
	on_province_area_exited(area, "SantaFeProvincia")

func _on_la_rioja_area_entered(area):
	on_province_area_entered(area, "LaRiojaProvincia")

func _on_la_rioja_area_exited(area):
	on_province_area_exited(area, "LaRiojaProvincia")

func _on_san_juan_area_entered(area):
	on_province_area_entered(area, "SanJuanProvincia")

func _on_san_juan_area_exited(area):
	on_province_area_exited(area, "SanJuanProvincia")

func _on_cordoba_area_entered(area):
	on_province_area_entered(area, "CordobaProvincia")

func _on_cordoba_area_exited(area):
	on_province_area_exited(area, "CordobaProvincia")

func _on_san_luis_area_entered(area):
	on_province_area_entered(area, "SanLuisProvincia")

func _on_san_luis_area_exited(area):
	on_province_area_exited(area, "SanLuisProvincia")

func _on_mendoza_area_entered(area):
	on_province_area_entered(area, "MendozaProvincia")

func _on_mendoza_area_exited(area):
	on_province_area_exited(area, "MendozaProvincia")

func _on_neuquen_area_entered(area):
	on_province_area_entered(area, "NeuquenProvincia")

func _on_neuquen_area_exited(area):
	on_province_area_exited(area, "NeuquenProvincia")

func _on_rio_negro_area_entered(area):
	on_province_area_entered(area, "RioNegroProvincia")

func _on_rio_negro_area_exited(area):
	on_province_area_exited(area, "RioNegroProvincia")

func _on_chubut_area_entered(area):
	on_province_area_entered(area, "ChubutProvincia")

func _on_chubut_area_exited(area):
	on_province_area_exited(area, "ChubutProvincia")

func _on_santa_cruz_area_entered(area):
	on_province_area_entered(area, "SantaCruzProvincia")

func _on_santa_cruz_area_exited(area):
	on_province_area_exited(area, "SantaCruzProvincia")

func _on_tierra_del_fuego_area_entered(area):
	on_province_area_entered(area, "TierraDelFuegoProvincia")

func _on_tierra_del_fuego_area_exited(area):
	on_province_area_exited(area, "TierraDelFuegoProvincia")

	
func updateMultiplierLabel():
	var mLabel = $HUD/MultiplierLabel 
	if multiplier > 3:
		multiplier = 3
	mLabel.set_text(str(multiplier) + "X")
	if multiplier == 1:
		mLabel.add_theme_font_size_override("font_size", 50)
		mLabel.add_theme_color_override("font_color", Color(255,255,255))
	elif multiplier == 2:
		mLabel.add_theme_font_size_override("font_size", 60)
		mLabel.add_theme_color_override("font_color", Color(251,255,0))
		
	elif multiplier == 3:
		mLabel.add_theme_font_size_override("font_size", 75)
		mLabel.add_theme_color_override("font_color", Color(255,0,0))
	
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
