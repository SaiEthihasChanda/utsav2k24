extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_area_entered(area):
	#print(area)
	if area.name == "cursor":
		$RootNode/building_sample_house_c/outline.show()
	else:
		$RootNode/building_sample_house_c/outline.hide()
	pass # Replace with function body.


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/building_sample_house_c/outline.show()
	else:
		$RootNode/building_sample_house_c/outline.hide()
	pass # Replace with function body.
