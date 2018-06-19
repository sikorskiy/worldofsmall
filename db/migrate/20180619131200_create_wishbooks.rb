class CreateWishbooks < ActiveRecord::Migration[5.2]
  def change
    create_table :wishbooks do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :quantity

      t.timestamps
    end
  end
end
