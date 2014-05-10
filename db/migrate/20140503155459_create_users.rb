class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.integer :hour
      t.integer :min
      t.boolean :defined
      t.boolean :need
      t.integer :order

      t.timestamps
    end
  end
end
