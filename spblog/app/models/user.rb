class User < ActiveRecord::Base
	has_many :articles
	#want to require psw as well as email
	validates :password, presence: true,
			  length: {minimum: 8}
	validates :email, presence: true
end
