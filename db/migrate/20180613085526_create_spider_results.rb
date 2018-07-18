class CreateSpiderResults < ActiveRecord::Migration[5.2]
  def change
    create_table :spider_results do |t|
      t.string :urlFrom
      t.string :urlTo
      t.integer :response
      t.references :website, foreign_key: true
      t.timestamps
    end
  end
end
