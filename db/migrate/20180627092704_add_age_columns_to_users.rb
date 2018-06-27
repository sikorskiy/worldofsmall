class AddAgeColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :start_age, :float, default: 0
    add_column :users, :finish_age, :float, default: 6
  end
end
