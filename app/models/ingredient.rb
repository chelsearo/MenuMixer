class Ingredient < ApplicationRecord
    has_many :recipes_ingredient
    has_many :recipes, through: :recipes_ingredient
  
  
end 