note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_UNDO
inherit
	ETF_UNDO_INTERFACE
create
	make
feature -- command

	undo
    	do

			if model.history.after then
				model.history.back
			end

			if model.history.on_item then
				model.history.item.undo (model.board)
				model.history.back
				model.set_message ("ok")
			else
				model.set_message ("no more to undo")
			end

			etf_cmd_container.on_change.notify ([Current])
    	end

end
