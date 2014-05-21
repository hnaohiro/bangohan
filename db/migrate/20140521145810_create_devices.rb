class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :user_id
      t.string :token
      t.string :platform_application_arn

      t.timestamps
    end
  end
end
