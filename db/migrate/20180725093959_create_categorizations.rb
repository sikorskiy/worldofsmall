class CreateCategorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :categorizations do |t|
      t.references :Category
      t.references :Book

      t.timestamps
    end
  end
end
