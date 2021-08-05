class AddPositionToPlots < ActiveRecord::Migration[6.1]
  def change
    add_column :plots, :position, :integer
  end
end
