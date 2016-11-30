class Contact < ActiveRecord::Base

    #attr_accessible :avatar
    has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
    validates_attachment :avatar, size: { less_than: 1.megabytes }


  	def exists_avatar?
  		if self.avatar.nil?
  			false
  		else
  			true
  		end
  	end

    def avatar_url
      if self.avatar.file?
        avatar.url
      else
        ""
      end
      #Rails.application.config.current_host + avatar.url
      #avatar.url
    end


  	def avatar_medium_url
        avatar.url(:medium)
    end
    
  	def avatar_thumb_url
        avatar.url(:thumb)
    end


end

