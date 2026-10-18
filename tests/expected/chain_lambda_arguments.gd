extends Node


func connect_overlay() -> void:
	_view_overlay.gui_input.connect(
		func(event: InputEvent) -> void:
			_panel_gui_input(event)
			_view_overlay.mouse_default_cursor_shape = _bubble_container.mouse_default_cursor_shape,
	)


static var _erase_arg_name_transformer := func(f: Dictionary) -> Dictionary:
	f.args.map(
		func(arg: Dictionary) -> Dictionary:
			arg.erase("name")
			return arg,
	)
	return f


# A lambda argument in the middle of a chain must not break the chain at every
# dot with line continuations.
func update_enemy_counter() -> void:
	await refresh_label(
		func():
			var n := enemies.filter(
				func(enemy: Enemy) -> bool:
					return enemy.is_alive() and enemy.visible and not enemy.is_stunned,
			).size()
			return "" if n == count else "%d enemies left" % n,
	)
