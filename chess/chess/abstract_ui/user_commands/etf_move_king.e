note
	description: "Move King command"
	author: "JSO"
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_MOVE_KING
inherit
	ETF_MOVE_KING_INTERFACE

create
	make
feature -- command
	move_king(square: TUPLE[x: INTEGER_32; y: INTEGER_32])
		require else
			move_king_precond(square)
		local
			new_square: SQUARE
			old_square: SQUARE
			l_x,l_y: INTEGER
			mk: MOVE_KING
			moves: ARRAY[SQUARE]
			movement : KING_MEMENTO
    	do

			-- create move mk
			old_square := model.board.king_position
			l_x := square.x.as_integer_32
			l_y := square.y.as_integer_32
			create new_square.make (l_x, l_y)
			create mk.make
			create movement.make (old_square.x,old_square.y,l_x,l_y)
			moves := mk.moves (old_square.x, old_square.y)
			if moves.has (new_square) then
				model.history.extend_history (movement)
				model.set_message ("ok")
				movement.execute (model.board, new_square)
			else
				model.set_message ("invalid move")
			end

			-- push
			etf_cmd_container.on_change.notify ([Current])
    	end

end
