extends Area2D


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	print("Something entered the death gap: ", body.name)

	if body is CharacterBody2D:
		get_tree().reload_current_scene()
