class RemoveRatingIdFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :rating_id, :integer
  end
end
