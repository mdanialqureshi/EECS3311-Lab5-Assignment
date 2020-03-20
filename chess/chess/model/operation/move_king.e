note
	description: "Move operation with undo/redo"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	MOVE_KING

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
			Result := <<[1, 0], [-1,  0], [ 0, 1], [ 0, -1], [1, 1], [1, -1], [-1, 1], [-1, -1]>>
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
