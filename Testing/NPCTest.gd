extends Area2D

@export var speaker_name := "Suspicious Person"
@export_multiline var interaction_text := "I didn't do anything suspicious. Probably."

var player_in_range := false
var dialogue_box = null

func _ready():
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)
	dialogue_box = get_tree().get_first_node_in_group("dialogue_box")

func _process(_delta):
	if player_in_range and Input.is_action_just_pressed("interact"):
		interact()

func _on_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func interact():
	if dialogue_box:
		dialogue_box.show_dialogue(speaker_name, interaction_text)
