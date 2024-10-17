class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :firm
      t.decimal :amount
      t.string :transaction_type

      t.timestamps
    end
  end
end
