extends Node2D

#1. Load the scene

var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var health: int = 4

func _ready():
	#set up health ui
	get_tree().call_group('ui', 'set_health', health)
	
	
	# Star stuff
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $stars.get_children():
		#position
		var random_x = rng.randi_range(0,int(size.x))
		var random_y = rng.randi_range(0,int(size.y))
		star.position = Vector2(random_x, random_y)
		
		#scale
		var random_scale = rng.randf_range(0.1,1.5)
		star.scale = Vector2(random_scale, random_scale)
		
		#animation speed
		star.speed_scale = rng.randf_range(0.2,1)
	


func _on_meteor_timer_timeout() -> void:
	#2. create instance of meteor
	var meteor = meteor_scene.instantiate()
	#3. attach node to the scene tree
	$meteors.add_child(meteor)
	#connect the signal?
	meteor.connect('collision',_on_meteor_collision)


func _on_meteor_collision():
	health -= 1 
	get_tree().call_group('ui', 'set_health', health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	$Player/PlayerImage.texture = load("res://graphics/ship/"+ str(health) + ".png")
	$Player.play_collision_sound()

# spawn lasers
func _on_player_laser(pos1, pos2) -> void:
	var laser1 = laser_scene.instantiate()
	var laser2 = laser_scene.instantiate()
	$lasers.add_child(laser1)
	$lasers.add_child(laser2)
	laser1.position = pos1
	laser2.position = pos2
