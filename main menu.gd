extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_pressed():
	if $TextEdit.text == "":
		$TextEdit.text = "Please Enter Your Name"
	else:
		sing.username = $TextEdit.text
		get_tree().change_scene("res://world.tscn")

	pass # Replace with function body.


func _on_help2_pressed():
	$help.show()
	pass # Replace with function body.


func _on_VideoPlayer_finished():
	$VideoPlayer.play()
	pass # Replace with function body.
