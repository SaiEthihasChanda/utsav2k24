extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$buy_tree/price.text = str(sing.tree_cost)
	$buy_solar_panels/price.text = str(sing.solar_cost)
	$buy_WindTurbine/price.text = str(sing.turbine_cost)
	$buy_battery/price.text = str(sing.battery_cost)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
