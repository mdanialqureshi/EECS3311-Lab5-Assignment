note
	description: "Summary description for {KING_MEMENTO}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	KING_MEMENTO

inherit
	MEMENTO

create
	make

feature -- constructor
	make (x_o : INTEGER; y_o : INTEGER; x_n : INTEGER; y_n : INTEGER)
		do
			x_old := x_o
			y_old := y_o
			x_new := x_n
			y_new := y_n
		end

feature -- commands

	execute (board: BOARD;position : SQUARE)
		do
			board.move_king (position)
		end

	undo (board :BOARD)
		do
			execute(board,create {SQUARE}.make (x_old,y_old))
		end


	redo  (board :BOARD)
		do
			execute(board,create {SQUARE}.make (x_new,y_new))
		end


end
