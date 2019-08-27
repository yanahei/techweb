class RemoveDocumentFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :document, :binary
  end
end
