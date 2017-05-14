class User < ApplicationRecord
  has_secure_password
  has_one :personalinfo;
  validates :name, presence: true, length: {minimum: 4, :message => '$Name should have minimum 4 characters$'}
  validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 5..20, :message => '$Password length is very small$'};
                   
end
