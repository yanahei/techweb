class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string   :filename
      t.binary  :data
      t.timestamps null:true
    end
  end
end
