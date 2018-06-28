class RemoveStartAgeAndFinishAgeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :start_age
    remove_column :users, :finish_age
  end
end
