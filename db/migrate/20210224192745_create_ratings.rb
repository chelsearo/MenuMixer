class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :recipe_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
