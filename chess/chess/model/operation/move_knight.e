note
	description: "Move operation with undo/redo"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_KNIGHT

inherit

	MOVE
		redefine
			out
		end

	DEBUG_OUTPUT
		redefine
			out
		end

create
	make

feature {NONE} -- constructor

	make(a_new_position: SQUARE)
		do
			position := a_new_position
		end

feature -- queries
		position: SQUARE

	directions: ARRAY[TUPLE[x: INTEGER; y: INTEGER]]
		do
			Result := <<[2, 1], [1,2], [ -1, 2], [ -2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]>>
		end

feature -- commands

	execute
		do
			board.move_knight	 (position)
		end

feature

	out: STRING
		do
			Result := ""
		end

	debug_output: STRING
		do
			Result := out
		end

end
