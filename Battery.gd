extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	sing.energy_threshold += 50
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_area_entered(area):
	if area.name == "cursor":
		$RootNode/Mesh/outline.show()
	else:
		$RootNode/Mesh/outline.hide()
	pass # Replace with function body.


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/Mesh/outline.hide()
	else:
		$RootNode/Mesh/outline.show()
