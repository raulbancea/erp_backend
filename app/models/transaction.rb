class Transaction < ApplicationRecord
  validates :product_name, presence: true
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
  validates :transaction_type, presence: true
end
