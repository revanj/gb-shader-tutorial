extends ColorRect

var max_radius = 2000
var current_radius setget set_shader_radius, get_shader_radius
onready var tween = $Tween
var is_open = false


func _process(delta):
	material.set_shader_param("width", get_viewport().size.x)
	material.set_shader_param("height", get_viewport().size.y)
	
	var mouse_pos = get_global_mouse_position()
	material.set_shader_param("center", mouse_pos)
	
	if (Input.is_action_just_pressed("ui_accept")):
		if (!is_open):
			tween.interpolate_property(self, "current_radius", 0, max_radius, 3, Tween.TRANS_LINEAR)
		else:
			tween.interpolate_property(self, "current_radius", max_radius, 0, 3, Tween.TRANS_LINEAR)
		tween.start()
		is_open = !is_open
func set_shader_radius(radius):
	material.set_shader_param("radius", radius)
	
func get_shader_radius():
	return material.get_shader_param("radius")


