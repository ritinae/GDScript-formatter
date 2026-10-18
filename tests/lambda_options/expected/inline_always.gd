# With gdscript_formatter_lambda_inline = always, every single statement lambda
# that fits collapses to one line.
var f = func(x): return x
var g = (func(x): return x)


func test_collapse():
	var doubled = arr.map(func(x): return x * 2)
	foo(func(x): return x, 1)
	foo(func(): pass)
	var list = arr.map(func(x): return [x, x * 2])


# Lambdas that don't fit stay multiline.
func test_too_long():
	var mapped = some_long_array_name.map(
		func(element_value_long_name):
			return element_value_long_name * 22222222222222222222222222222222,
	)


# Blocks, multiple statements, and nested lambdas are always multiline.
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
	foo(
		func():
			return func(): pass,
	)
