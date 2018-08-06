class AddDescriptionNameColumnToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name_in_english, :string
  end
end
