extends Node2D

var floorDetected = false
var safeTimeOut = false
var rayCastInitValue = 36 
var offset = 20  # altura extra para que no toque el suelo

func _ready():
	$raycast_floor_detection.target_position.y = rayCastInitValue
	$safeTime.start()

func _process(delta):
	if not floorDetected && safeTimeOut:
		$raycast_floor_detection.target_position.y += 6
		
		if $raycast_floor_detection.is_colliding():
			floorDetected = true
			$raycast_floor_detection.target_position.y -= offset  # 👈 CLAVE
			init_spikeball()

func init_spikeball():
	var numberOfChains = ($raycast_floor_detection.target_position.y - rayCastInitValue) / 6
	$SpikedBall.position.y += (numberOfChains * 6)
	
	for i in range(numberOfChains):
		var newRing = preload("res://escenas/enemigos/One_chain.tscn").instantiate()
		newRing.position = Vector2(0,(6*(i+1)))
		self.add_child(newRing)

	$animation_rotation.play("regular_move")

func _on_safe_time_timeout():
	safeTimeOut = true

func _on_area_colision_with_map_body_entered(body):
	print(body)
	$animation_rotation.speed_scale *= -1
