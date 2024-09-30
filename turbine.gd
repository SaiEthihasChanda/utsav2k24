extends Spatial

# Declare member variables here
var time_passed: float = 0.0  # Variable to track time

# Called when the node enters the scene tree for the first time
func _ready():
	print(sing.energy_points)
	sing.levels[self.get_node("RootNode/Stamm001/Turbine")] = 1
	print(sing.levels)

# Called every frame
func _process(delta):
	time_passed += delta  # Accumulate time passed
	if time_passed >= (6.0-(sing.levels[self.get_node("RootNode/Stamm001/Turbine")])) and  sing.energy_points <=sing.energy_threshold:  # Check if 5 seconds have passed
		sing.energy_points += 1  # Increment energy points
		print(sing.energy_points)
		time_passed = 0.0  # Reset the timer


func _on_Area_area_entered(area):
	#print(area.name)
	if area.name == "cursor":
		$RootNode/Stamm001/outline.show()
	else:
		$RootNode/Stamm001/outline.hide()
	pass # Replace with function body.


func _on_Area_area_exited(area):
	if area.name == "cursor":
		$RootNode/Stamm001/outline.hide()
	else:
		$RootNode/Stamm001/outline.show()
	pass # Replace with function body.
