class AddRecipeIdToUserRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_recipes, :recipe_id, :integer
  end
end
