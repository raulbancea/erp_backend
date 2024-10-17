class CreateInventar < ActiveRecord::Migration[6.1]
  def change
    create_table :inventars do |t|
      t.string :name
      t.string :description
      t.integer :quantity

      t.timestamps
    end
  end
end
