class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
  	if self.role == "Admin"
  		true
  	else 
  		if self.email == "senin.flava@gmail.com"
  			true
  		else 
  			false
  		end
  	end
  end

end
