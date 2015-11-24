class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  #where does :name get passed from to the validates below? from the html name="name" form?
  validates(:name, presence: true, length: {maximum: 50}) #same as validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false})
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end
