# With gdscript_formatter_lambda_force_wrap_arguments = false, a lambda ending
# an argument list stays on the call line when its header fits.
func test_hug():
	button.pressed.connect(func():
		print("a")
		print("b")
	)
	foo(1, 2, func(x):
		return x,
	)
	timer.timeout.connect(
		func():
			print("timeout"),
	)


# Godot can't parse a trailing comma after a match branch, so a lambda ending
# with a match statement keeps the wrapped layout.
func test_match():
	[0, 2, 3].filter(func(value: int):
		match value:
			0:
				return false
			_:
				return true
	)



# A hugged lambda inside another multiline call needs the trailing comma after
# its body, or Godot fails to parse the closing parenthesis.
func test_nested_in_wrapped_call():
	debug_menu.add_items("Cheats", [
		create_button(func():
			hero.health = hero.max_health
			hero.global_position = spawn_point.global_position
		),
	])


# Nested lambdas both stay on their call lines.
func test_nested():
	a.b(func():
		c.d(func():
			print(1)
		)
	)


# Falls back to wrapping arguments when the call line would be too long.
func test_too_long():
	some_really_long_function_name_here(argument_number_one, argument_number_two, argument_number_three, func(value_name):
		print(value_name)
	)


# The lambda is not the last argument, so arguments still wrap.
func test_not_last():
	foo(func():
		print(1)
	, 2)


# Comments in the argument list keep the wrapped layout.
func test_comment():
	foo(
		1, # comment
		func():
			print(1),
	)
