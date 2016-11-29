module ApplicationHelper

def current_user_admin?
	if current_user.nil?
		false
	else
		current_user.admin?
	end
end


end
