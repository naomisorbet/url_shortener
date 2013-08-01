class CreateShortUrls < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.integer :long_url_id
      t.integer :user_id
      t.string :url_code, :length => 31
      t.timestamps
    end
  end
end
