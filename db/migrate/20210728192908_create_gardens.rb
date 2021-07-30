class CreateGardens < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens do |t|
      t.string :name
      t.integer :height
      t.integer :width
      t.integer :depth
      t.string :hardiness_zone

      t.timestamps
    end
  end
end
