class AddLatitudeToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :latitude, :float
  end
end
