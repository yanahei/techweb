class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.string  :name
      t.binary  :file_data
      t.timestamps
    end
  end
end
