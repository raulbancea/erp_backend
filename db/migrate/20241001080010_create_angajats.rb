class CreateAngajats < ActiveRecord::Migration[6.1]
  def change
    create_table :angajats do |t|
      t.string :name
      t.string :position
      t.string :department
      t.decimal :salary

      t.timestamps
    end
  end
end
