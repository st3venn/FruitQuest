extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent().has_node("ninjacat"):
		$health_ProgressBar.value = get_parent().get_node("ninjacat").health
		$FruitPointLabel.text = "Frutas:" + str(get_parent().get_node("ninjacat").fruitCount)
func _process(delta):
	$health_ProgressBar.value = get_parent().get_node("ninjacat").health
	$FruitPointLabel.text = "Frutas:" + str(get_parent().get_node("ninjacat").fruitCount)
