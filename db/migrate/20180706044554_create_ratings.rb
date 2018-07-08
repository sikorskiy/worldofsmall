class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rating_type_id
      t.float :rating
      t.integer :review_id
      t.timestamps
    end
  end
end
