class RemoveRatingsFromRecipes < ActiveRecord::Migration[6.1]
  def change
    remove_column :recipes, :rating, :integer
  end
end
