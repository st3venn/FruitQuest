extends Control

func _ready():
	get_tree().paused = false
	$audiovictoria.play()

func _on_reiniciar_3_pressed():
	get_tree().change_scene_to_file("res://escenas/pantallas/pantalla1.tscn")


func _on_salir_pressed():
	get_tree().quit()
