class CreateAuthorships < ActiveRecord::Migration[5.2]
  def change
    create_table :authorships do |t|
      t.references :book
      t.references :author
      t.timestamps
    end
  end
end
