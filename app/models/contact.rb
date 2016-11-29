class Contact < ActiveRecord::Base

    #attr_accessible :avatar
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  	def exists_avatar?
  		if self.avatar.nil?
  			false
  		else
  			true
  		end
  	end

  	def avatar_medium_url
        avatar.url(:medium)
    end
    
  	def avatar_thumb_url
        avatar.url(:thumb)
    end


end

