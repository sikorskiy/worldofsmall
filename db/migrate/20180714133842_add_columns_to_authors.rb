class AddColumnsToAuthors < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :date_of_birth, :date
    add_column :authors, :date_of_death, :date
    add_column :authors, :country_id, :integer
    add_column :authors, :description, :text
  end
end
