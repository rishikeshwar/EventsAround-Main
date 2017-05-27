class Personalinfo < ApplicationRecord
	validates :name, presence: true, length: {minimum: 4, :message => '$Name should have minimum length of 4$'}
	validates :phoneno, numericality: true, length: {minimum: 10, maximum:15, :message => '$Phone number should have 10 to 15 digits$'}
	
end
