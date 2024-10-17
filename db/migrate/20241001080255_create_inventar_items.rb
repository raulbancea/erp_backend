class CreateInventarItems < ActiveRecord::Migration[6.1]
  def change
    create_table :inventar_items do |t|
      t.string :name
      t.integer :quantity
      t.text :description

      t.timestamps
    end
  end
end
