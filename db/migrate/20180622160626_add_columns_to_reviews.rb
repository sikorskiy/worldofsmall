class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :illustrator_rating, :integer, default: 0
    add_column :reviews, :content_rating, :integer, default: 0
    rename_column :reviews, :rating, :general_rating
  end
end
