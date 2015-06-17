
Unrem
=====

Very simple undo-redo manager based on stack.

Install
-------

```
bower install unrem --save
```

Usage
-----

```
state = new Unrem(1)
state.get() 	# 1
state.push(2) 	# 2
state.get		# 2
state.push(3)	# 3
state.undo()	# 2
state.undo()	# 1
state.redo()	# 2
state.push(4)	# 4
state.redo()	# 4
state.purge() 	# 1
state.undo() 	# 1
```

Note
----

You can use nested-structure objects for undo-redo, unrem will recursively clone them before push to stack. Avoid cyclic references.