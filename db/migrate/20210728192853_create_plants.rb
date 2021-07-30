class CreatePlants < ActiveRecord::Migration[6.1]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :per_sq_ft
      t.string :days_to_harvest
      t.string :planting_dates
      t.text :icon
      t.string :category
      t.belongs_to :garden

      t.timestamps
    end
  end
end
