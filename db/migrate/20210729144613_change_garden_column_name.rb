class ChangeGardenColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :gardens, :height, :length
  end
end
