class AddDescriptionToRecipesIngredients < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes_ingredients, :description, :string
  end
end
