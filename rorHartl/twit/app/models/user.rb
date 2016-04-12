class User < ActiveRecord::Base
  #attr_accessor is the reader/writer for assigning/retrieving :remeber_token that can be used
  #in different parts of the code
  
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

  def User.new_token #what would be difference between self.new_token?
    SecureRandom.urlsafe_base64
  end

  #Remembers a user in the database for use in persistent sessions
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  #Retruns true if the given token matches the digest
  def authenticated?(remember_token)
    #return keyword to return immediately if the remember digest
    #is nil, which is a common way to emphasize that the rest 
    #of the method gets ignored. Equivalent to:
    # if remember_digest.nil?
      #false
    # else
      BCrypt..
    # return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
