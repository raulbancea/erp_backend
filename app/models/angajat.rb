class Angajat < ApplicationRecord
  validates :name, :position, :department, presence: true
end
