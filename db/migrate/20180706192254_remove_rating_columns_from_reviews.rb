class RemoveRatingColumnsFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_column :reviews, :general_rating
    remove_column :reviews, :illustrator_rating
    remove_column :reviews, :content_rating
  end
end
