window.Unrem = (init_val) -> {
	stack_main: [Imuta.clone(init_val)]
	stack_second: []
	purge: () -> 
		@stack_second = []
		@stack_main = [@stack_main[0]]
		@get()
	push: (value) -> 
		if not(Imuta.equal(@get(), value))
			if Imuta.equal(@stack_second[@stack_second.length-1], value) and (@stack_second.length != 0)
				@redo()
			else
				@stack_second = []
				@stack_main.push(Imuta.clone(value))
		value
	undo: () ->
		if (@stack_main.length != 1) then @stack_second.push(@stack_main.pop())
		@get()
	redo: () ->
		if (@stack_second.length != 0) then @stack_main.push(@stack_second.pop())
		@get()
	get: () -> 
		@stack_main[@stack_main.length-1]
}
#module.exports = Unrem