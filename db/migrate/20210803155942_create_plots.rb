class CreatePlots < ActiveRecord::Migration[6.1]
  def change
    create_table :plots do |t|
      t.belongs_to :plant
      t.belongs_to :garden
      
      t.timestamps
    end
  end
end
