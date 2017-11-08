class User < ApplicationRecord
  has_secure_password
  has_one :personalinfo;
  validates_format_of :name, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => '$Email Id is invalid$'
  
   def self.from_omniauth(auth)
    where(name: auth.info.name).first_or_initialize.tap do |user|
      user.name = auth.info.email
      o = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
      string = (0...10).map { o[rand(o.length)] }.join
      user.password = string
      if User.exists?(name: user.name)
      else 
		    user.save!
      end
    end
  end
end
