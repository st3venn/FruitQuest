extends Node2D


var floorDetected = false
var safeTimeOut = false
var rayCastInitValue = 36 



func _ready():
	$raycast_floor_detection.target_position.y = rayCastInitValue
	$safeTime.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not floorDetected && safeTimeOut:
		$raycast_floor_detection.target_position.y += 6
		if $raycast_floor_detection.is_colliding():
			floorDetected = true
			$raycast_floor_detection.target_position.y -= 6
			init_spikeball()


func init_spikeball():
	var numberOfChains = ($raycast_floor_detection.target_position.y - rayCastInitValue) / 6
	$SpikedBall.position.y += (numberOfChains * 6)
	for i in range(numberOfChains):
		var newRing = preload("res://escenas/enemigos/One_chain.tscn").instantiate()
		newRing.position = Vector2(0,(6*i))

	print(numberOfChains)


func _on_safe_time_timeout():
	safeTimeOut = true
