class User < ApplicationRecord
  has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 6, message: "Please choose a more secure password."}
    validates_uniqueness_of :username
  validates_confirmation_of :password, :on => :create
  
    has_many :recipes
    has_many :ingredients, through: :recipes
   
end 