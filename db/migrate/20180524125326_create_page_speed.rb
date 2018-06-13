class CreatePageSpeed < ActiveRecord::Migration[5.2]
  def change
    create_table :page_speed do |t|
      t.integer :score
      t.references :websites
    end

    change_table :websites do |t|
      t.boolean :validate_page_speed
    end
  end
end