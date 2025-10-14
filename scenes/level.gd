extends Node2D

#1. Load the scene

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

func _on_meteor_timer_timeout() -> void:
	#2. create instance of meteor
	var meteor = meteor_scene.instantiate()
	#3. attach node to the scene tree
	$meteors.add_child(meteor)

# spawn lasers
func _on_player_laser(pos1, pos2) -> void:
	var laser1 = laser_scene.instantiate()
	var laser2 = laser_scene.instantiate()
	$lasers.add_child(laser1)
	$lasers.add_child(laser2)
	laser1.position = pos1
	laser2.position = pos2
