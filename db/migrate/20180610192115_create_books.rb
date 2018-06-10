class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :translator
      t.string :illustrator
      t.integer :creation_year
      t.string :publishing_house
      t.timestamps
    end
  end
end
