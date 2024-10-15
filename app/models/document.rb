class Document < ApplicationRecord
  has_one_attached :file
  validates :title, presence: true
  validates :description, presence: true
end
