window.Unrem = (init_val) -> {
		iterator: 0
		stack: [Imuta.clone(init_val)]
		purge: () -> 
			@iterator = 0
			@stack = @stack.slice(0,1)
		push: (value) ->
			if not(Imuta.equal(@stack[@iterator], value))
				if (@iterator+1) != @stack.length then @stack = @stack.slice(0,@iterator+1)
				@iterator++
				@stack.push(Imuta.clone(value))
			value
		undo: () ->
			if @iterator != 0 then @iterator--
			@stack[@iterator]
		redo: () ->
			if (@iterator+1) != @stack.length then @iterator++
			@stack[@iterator]
		get: () -> 
			@stack[@iterator]
	}