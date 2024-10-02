extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var username = ""
var tree_cost = 100
var solar_cost = 150
var turbine_cost = 300
var battery_cost = 700
var cost_to_evade_infest = 100
var bucket = 100
var energy_points = 500
var energy_threshold = 500
var rate_of_energy = 6 #lower for fast energy gains, do not reduce below 4
var time_for_infest = 40 #20 sec
var time_allowed_for_infest = 30 #30 sec
var battery_cap = 50
var rate_of_water_drain = 5 #lower for fast draining,do not reduce below 1
var bucket_pour = 10
var elements = {
	"solar":1,
	"turbine":1,
	"battery":1,
	"trees": 0
}
var levels ={
	
}
var trees = []
var cost = {
	"solar":150,
	"turbine":300
}

# Called when the node enters the scene tree for the first time.
func _ready():
	print("global ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _physics_process(delta):
	#print(energy_points)
