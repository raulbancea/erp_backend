class Inventar < ApplicationRecord
  validates :name, :description, :quantity, presence: true
end
