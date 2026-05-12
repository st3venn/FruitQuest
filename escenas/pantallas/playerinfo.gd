extends CanvasLayer

@onready var menuPopUp : Node2D = $MenuPopUp
# Called when the node enters the scene tree for the first time.
func _ready():
	inicia_sliders()
	menuPopUp.visible = false
	if get_parent().has_node("ninjacat"):
		$health_ProgressBar.value = get_parent().get_node("ninjacat").health
		$FruitPointLabel.text = "Frutas:" + str(get_parent().get_node("ninjacat").fruitCount)
func _process(delta):
	$health_ProgressBar.value = get_parent().get_node("ninjacat").health
	$FruitPointLabel.text = "Frutas:" + str(get_parent().get_node("ninjacat").fruitCount)


func _on_menu_button_pressed():
	get_tree().paused = true
	menuPopUp.visible = get_tree().paused

func _on_reanudar_pressed():
	get_tree().paused = false
	menuPopUp.visible = get_tree().paused

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1, value - 100)

func _on_sonido_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2, value - 100)
	
func inicia_sliders():
	for slider in menuPopUp.get_children():
		if slider is HSlider:
			slider.value = 100
