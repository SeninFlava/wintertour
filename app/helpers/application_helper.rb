module ApplicationHelper

	def current_user_admin?
		if current_user.nil?
			false
		else
			current_user.admin?
		end
	end

    def current_user_lang
		if current_user.nil?
			"en"
		else
			current_user.lang
		end
	end

	def next_row_num(object, all_objects)
		if object.id.nil?
			if all_objects.count == 0
				return 1
			else
				all_objects.order(row_num: :desc).first.row_num+1
			end
		else 
			object.row_num
		end
	end

end
