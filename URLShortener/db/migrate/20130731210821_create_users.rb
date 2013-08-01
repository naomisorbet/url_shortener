class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :length => 255
      t.string :username, :length => 31
      t.timestamps
    end
  end
end
