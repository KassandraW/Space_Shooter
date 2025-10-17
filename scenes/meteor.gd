extends Area2D
var speed: int 
var rotation_speed: int
var direction_x:float

signal collision 

func _ready():
	var rng := RandomNumberGenerator.new()
	
	#texture 
	var path:  String = "res://graphics/meteors/" + str(rng.randi_range(1,2)) + ".png"
	$Sprite2D.texture = load(path)
	
	#set start position
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-180,-50)
	position = Vector2(random_x,random_y)
	
	# Direction / Speed / Rotation
	direction_x = rng.randf_range(-0.5,0.5)
	speed = rng.randi_range(300,700)
	rotation_speed = rng.randi_range(40,100)
	
	
func _process(delta):
	position += Vector2(direction_x, 1.0) * delta * speed
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	collision.emit()
