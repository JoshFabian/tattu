class AddColumnsToShots < ActiveRecord::Migration
  def change
    add_column :shots, :title, :string
    add_column :shots, :description, :string  
  end
end
