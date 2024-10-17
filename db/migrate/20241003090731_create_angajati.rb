class CreateAngajati < ActiveRecord::Migration[6.1]
  def change
    create_table :angajatis do |t|
      t.string :name
      t.string :position
      t.string :department

      t.timestamps
    end
  end
end
