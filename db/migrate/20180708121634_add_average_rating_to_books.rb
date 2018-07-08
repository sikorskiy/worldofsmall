class AddAverageRatingToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :rating, :float
  end
end
