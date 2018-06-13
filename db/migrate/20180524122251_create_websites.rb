class CreateWebsites < ActiveRecord::Migration[5.2]
  def change
    create_table :websites do |t|
      t.string :url, :null => false
      t.references :users
    end
  end
end
