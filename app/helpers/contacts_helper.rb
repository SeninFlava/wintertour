module ContactsHelper

	def next_row_num_contacts(contact)
		if contact.id.nil?
			if Contact.all.count == 0
				return 1
			else
				Contact.all.order(row_num: :desc).first.row_num+1
			end
		else 
			contact.row_num
		end
	end


end
