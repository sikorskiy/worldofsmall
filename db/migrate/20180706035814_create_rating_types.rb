class CreateRatingTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :rating_types do |t|
      t.string :rating_type
      t.string :description
      t.timestamps
    end
  end
end
