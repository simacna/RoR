class User < ActiveRecord::Base
  validates(:name, presence: true) #same as validates :name, presence: true
end
