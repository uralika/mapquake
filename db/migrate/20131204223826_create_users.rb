class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :salt
      t.string :hashed_password
      t.string :street
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
