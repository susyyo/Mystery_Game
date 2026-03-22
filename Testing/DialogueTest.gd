extends Panel

@onready var name_label = $NameLabel
@onready var dialogue_label = $DialogueLabel
var player = null

func _ready():
	visible = false
	player = get_tree().get_first_node_in_group("player")

func show_dialogue(speaker_name: String, text: String):
	name_label.text = speaker_name
	dialogue_label.text = text
	visible = true
	if player:
		player.can_move = false

func hide_dialogue():
	visible = false
	if player:
		player.can_move = true

func _process(_delta):
	if visible and Input.is_action_just_pressed("interact"):
		hide_dialogue()
