class AddUserIdToUserRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :user_recipes, :user_id, :integer
  end
end
