class ChangeNotesTable < ActiveRecord::Migration[6.1]
  def change
    change_table :notes do |t|
      t.remove :planting, :growing, :harvesting
      t.text :content
      t.string :category     
      
    end
  end
end
