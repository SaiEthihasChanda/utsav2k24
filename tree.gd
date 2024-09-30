extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var placeok = true


# Called when the node enters the scene tree for the first time.
func _ready():
	sing.elements["trees"]+=1
	print(sing.elements["trees"])
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area_body_entered(body):
	print(body.name)
	
	if body.name == "garden"  :
		print("valid placement")
		return
	if body.name == "landcoll":
		print("invalid placement")
		sing.elements["trees"]-=1
		if not sing.energy_points+100 > sing.energy_threshold:
			sing.energy_points +=100 
		else:
			sing.energy_points = sing.energy_threshold
		
		self.queue_free()
	pass # Replace with function body.


func _on_Area2_body_entered(body):
	print(body.name)
	if body.name == "cursor":
		$RootNode/tree_blocks_dark/outline.show()
	else:
		$RootNode/tree_blocks_dark/outline.hide()
		
	pass # Replace with function body.


func _on_Area2_area_entered(area):
	#print(area.name)
	if area.name == "cursor":
		$RootNode/tree_blocks_dark/outline.show()
	else:
		$RootNode/tree_blocks_dark/outline.hide()
	pass # Replace with function body.


func _on_Area2_area_exited(area):
	if area.name == "cursor":
		$RootNode/tree_blocks_dark/outline.hide()
	else:
		$RootNode/tree_blocks_dark/outline.show()
	pass # Replace with function body.
