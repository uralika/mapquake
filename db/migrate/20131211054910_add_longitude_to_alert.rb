class AddLongitudeToAlert < ActiveRecord::Migration
  def change
    add_column :alerts, :longitude, :float
  end
end
