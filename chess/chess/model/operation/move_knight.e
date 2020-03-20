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

	make
		do

		end

feature -- queries

	directions: ARRAY[TUPLE[x: INTEGER; y: INTEGER]]
		do
			Result := <<[2, 1], [1,2], [ -1, 2], [ -2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]>>
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
