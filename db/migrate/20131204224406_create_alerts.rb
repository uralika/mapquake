class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.string :name
      t.string :street
      t.string :state
      t.integer :zip
      t.references :user, index: true

      t.timestamps
    end
  end
end
