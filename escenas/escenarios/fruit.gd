@tool
extends Node2D

var collected = false

@export_enum("apple", "banana", "cherry") var fruitType:String = "apple" :
	set(value):
		fruitType = value
		$animations.animation = fruitType

func _ready():
	if not Engine.is_editor_hint():
		print("Frutas totales: ", Global.total_fruits)
		$animations.play(fruitType)

@warning_ignore("unused_parameter")
func _process(delta):
	pass

func _on_area_collect_body_entered(body):

	if collected:
		return

	if not body.is_in_group("player"):
		return

	collected = true

	Global.collected_fruits += 1
	print("Frutas recogidas: ", Global.collected_fruits)

	if body.has_method("collectFruit"):
		body.collectFruit(fruitType)

	# guardar datos del jugador (ahora seguro)
	Global.puntuacion = body.fruitCount
	Global.frutas_recogidas = Global.collected_fruits
	Global.current_scene = get_tree().current_scene.scene_file_path

	$animations.play("collected")


func _on_animations_animation_finished():
	queue_free()
