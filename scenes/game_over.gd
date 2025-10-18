extends Control

var level_scene: PackedScene = load("res://scenes/level.tscn")

func _ready() -> void:
	$MarginContainer/VBoxContainer/HBoxContainer/score.text = str(Global.score) 

func _input(event):
	if event.is_action_pressed("shoot") : 
		get_tree().change_scene_to_packed(level_scene)

func _on_timer_timeout() -> void:
	$MarginContainer2/Label.visible = !$MarginContainer2/Label.visible
