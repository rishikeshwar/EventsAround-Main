class User < ApplicationRecord
  has_secure_password
  has_one :personalinfo;
  validates_format_of :name, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, :message => '$Email Id is invalid$'
  validates :password, :presence => true,
                   :confirmation => true,
                   :length => {:within => 5..20, :message => '$Password length is very small$'};
                   
end
