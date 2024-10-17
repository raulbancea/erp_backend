class AddProductNameToTransactions < ActiveRecord::Migration[6.1]
  def change
    add_column :transactions, :product_name, :string
  end
end
