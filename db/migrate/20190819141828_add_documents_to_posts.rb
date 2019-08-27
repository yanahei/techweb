class AddDocumentsToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :documents, :binary, :limit => 5.megabyte
  end
end
