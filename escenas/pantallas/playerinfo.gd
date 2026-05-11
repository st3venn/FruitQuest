extends CanvasLayer

@onready var menuPopUp : Node2D = $MenuPopUp
# Called when the node enters the scene tree for the first time.
func _ready():
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

func _on_sonido_pressed():
	pass # Replace with function body.


func _on_musica_pressed():
	pass # Replace with function body.
