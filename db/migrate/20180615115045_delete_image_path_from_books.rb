class DeleteImagePathFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :image_path
  end
end
