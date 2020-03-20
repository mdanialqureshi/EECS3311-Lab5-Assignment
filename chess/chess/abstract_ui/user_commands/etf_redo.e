note
	description: ""
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	ETF_REDO
inherit
	ETF_REDO_INTERFACE
create
	make
feature -- command
	redo
    	do
			-- forth
			if
				model.history.before
				or not model.history.after
			then
				model.history.forth
			end

			-- redo
			if model.history.on_item then
				model.history.item.redo (model.board)
				model.set_message ("ok")
			else
				model.set_message ("nothing to redo")
			end

			-- push
			etf_cmd_container.on_change.notify ([Current])
    	end

end
