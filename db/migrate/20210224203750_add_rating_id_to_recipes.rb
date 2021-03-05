class AddRatingIdToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :rating_id, :integer
  end
end
