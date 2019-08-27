class AddDocumentToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :document, :binary
  end
end
