class User < ActiveRecord::Base
	#want to require psw as well as email
	validates :password, presence: true,
			  length: {minimum: 8}
	validates :email, presence: true
end
