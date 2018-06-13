class CreatePageSpeed < ActiveRecord::Migration[5.2]
  def change
    create_table :page_speed do |t|
      t.integer :score
      t.references :websites
    end
  end
end