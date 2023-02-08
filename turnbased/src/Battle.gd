extends Control


signal textbox_closed

func _ready():
	$TextBox.hide()
	$ActionsPanel.hide()

	display_text("A wild enemy appears!")
	yield(self, "textbox_closed")
	$ActionsPanel.show()

func _input(_event):
	if (Input.is_action_just_pressed("ui_accept") or Input.is_mouse_button_pressed(BUTTON_LEFT)) and $TextBox.visible:
		$TextBox.hide()
		emit_signal("textbox_closed")

func display_text(text):
	$TextBox.show()
	$TextBox/Label.text = text

func _on_Run_pressed():
	display_text("Got away safely!")
	yield(self, "textbox_closed")
	yield(get_tree().create_timer(0.5), 'timeout')
	get_tree().quit()
