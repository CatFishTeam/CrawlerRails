class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :url, :null => false
      t.integer :score_page_speed
      t.integer :score_spider
      t.integer :score_w3c
      t.references :user, foreign_key: true
    end
  end
end
