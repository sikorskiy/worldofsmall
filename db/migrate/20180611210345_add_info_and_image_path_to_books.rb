class AddInfoAndImagePathToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :info, :text
    add_column :books, :image_path, :string
  end
end
