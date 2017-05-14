class User < ApplicationRecord
  has_secure_password
  has_one :personalinfo;
  validates :name, presence: true, length: {minimum: 4}
  validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 8..20};
                   
end
