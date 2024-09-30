extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	if randi() % 2 ==0 
		$TextureRect.texture = load("res://windmill.jpg")
	else:
		$TextureRect.texture = load("res://tree.png")
