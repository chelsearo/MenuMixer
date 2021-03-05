class Recipe < ApplicationRecord
    has_many :descriptions, through: :recipes_ingredient
    has_many :recipes_ingredient
    has_many :ingredients, through: :recipes_ingredient
    has_many :ratings
    has_many :users, through: :ratings
    
    scope :recent, -> { order(:created_at, :desc) }
end 