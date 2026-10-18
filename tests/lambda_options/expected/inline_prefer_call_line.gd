# With gdscript_formatter_lambda_inline_prefer_call_line = true, an inline lambda
# that doesn't fit stays on the call line with its body on the next line,
# instead of wrapping the arguments.
func test_fits_inline():
	var doubled = scores.map(func(score): return score * 2)
	foo(func(x): return x, 1)


func test_prefer_call_line():
	var damaged_enemies = spawned_enemies.filter(func(enemy: Enemy) -> bool:
		return enemy.health < enemy.max_health,
	)
	var alive_count := enemies.filter(func(enemy: Enemy) -> bool:
		return enemy.is_alive() and enemy.visible,
	).size()


# The arguments still wrap when the line up to the lambda header is too long.
func test_header_too_long():
	some_really_long_function_name_here(
		argument_number_one,
		argument_number_two,
		argument_number_three,
		argument_number_four,
		func(value): return value,
	)


# Outer containers only stay on one line if the whole inline lambda fits.
func test_nested():
	debug_menu.add_items("Cheats", [create_button(func(): hero.health = hero.max_health)])
	debug_menu.add_items(
		"Cheats",
		[create_button(func(): hero.global_position = spawn_point.global_position)],
	)
	debug_menu.add_items(
		"Cheats",
		[
			create_button(func():
				hero.global_position = level_spawn_points[current_level].global_position,
			)
		],
	)


# The option doesn't change lambdas that are always multiline.
func test_multiline():
	button.pressed.connect(func():
		print("a")
		print("b"),
	)
