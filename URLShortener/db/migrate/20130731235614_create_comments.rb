class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :short_url_id
      t.integer :author_id
      t.string :body
      t.integer :parent_id
      t.timestamps
    end
  end
end
