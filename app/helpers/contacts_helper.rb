module ContactsHelper

	def next_row_num_contacts
		if Contact.all.count == 0
			return 1
		else
			Contact.all.order(row_num: :desc).first.row_num+1
		end
	end


end
