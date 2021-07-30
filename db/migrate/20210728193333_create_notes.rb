class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.text :planting
      t.text :growing
      t.text :harvesting
      t.belongs_to :plant
      
      t.timestamps
    end
  end
end
