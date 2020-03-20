note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE_KNIGHT
inherit
	ETF_MOVE_KNIGHT_INTERFACE
create
	make
feature -- command
	move_knight(square: TUPLE[x: INTEGER_32; y: INTEGER_32])
		require else
			move_knight_precond(square)
		local
			new_square: SQUARE
			old_square: SQUARE
			l_x,l_y: INTEGER
			mn: MOVE_KNIGHT
			moves: ARRAY[SQUARE]
			movement : KNIGHT_MEMENTO
    	do
    		-- create move mn
			old_square := model.board.knight_position
			l_x := square.x.as_integer_32
			l_y := square.y.as_integer_32
			create new_square.make (l_x, l_y)
			create mn.make
			create movement.make (old_square.x,old_square.y,l_x,l_y) --create memento object for undo redo
			moves := mn.moves (old_square.x, old_square.y)
			if moves.has (new_square) then
				model.history.extend_history (movement)
				model.set_message ("ok")
				movement.execute (model.board, new_square)
			else
				model.set_message ("invalid move")
			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
