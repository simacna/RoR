class User < ActiveRecord::Base
  attr_accessor :remember_token 

  before_save { self.email = email.downcase }
  #where does :name get passed from to the validates below? from the html name="name" form?
  validates(:name, presence: true, length: {maximum: 50}) #same as validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates(:email, presence: true, length: {maximum: 255},
                    format: { with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false})
  has_secure_password
  validates(:password, presence: true, length: { minimum: 6 })

  #Returns the hash digest of the given string
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost

    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = ;
    update_attribute(:remember_digest, )
  end
end
