class AddColumnAgesToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :start_age, :float, default: 0
    add_column :books, :finish_age, :float, default: 6
  end
end
