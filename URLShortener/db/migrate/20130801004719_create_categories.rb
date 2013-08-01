class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :subject, :length => 31
      t.timestamps
    end
  end
end
