# With gdscript_formatter_lambda_inline = preserve, single statement lambdas
# written on one line stay inline when they fit.
var f = func(x): return x
var g = (func(x): return x)


func test_inline():
	var doubled = arr.map(func(x): return x * 2)
	foo(func(x): return x, 1)
	foo(func(): pass)
	var mapped = some_long_array_name.map(
		func(element_value_long_name): return element_value_long_name * 22222,
	)


# Lambdas written on multiple lines stay multiline.
func test_multiline():
	var doubled = arr.map(
		func(x):
			return x * 2,
	)


# Blocks and multiple statements are always multiline.
func test_not_simple():
	foo(
		func():
			if a:
				b(),
	)
	foo(
		func():
			a()
			b(),
	)
