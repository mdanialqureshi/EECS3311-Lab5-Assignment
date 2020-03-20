note
	description: "Memento to store information to help undo/redo"
	author: "Muhammad Danial Qureshi"
	date: ""
	revision: "$Revision$"

deferred class
	MEMENTO

feature --attributes
	x_old : INTEGER
	y_old : INTEGER
	x_new : INTEGER
	y_new : INTEGER

feature -- deferred commands

	execute (board: BOARD;position : SQUARE)
		deferred
		end

	undo (board :BOARD)
		deferred
		end

	redo  (board :BOARD)
		deferred
		end

end
