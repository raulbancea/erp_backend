class AddTitleAndDescriptionToDocuments < ActiveRecord::Migration[6.0]
  def change
    add_column :documents, :title, :string
    add_column :documents, :description, :text
  end
end
