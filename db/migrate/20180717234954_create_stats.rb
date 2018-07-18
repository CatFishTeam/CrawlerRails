class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :scorePerf
      t.integer :scoreSpider
      t.integer :scoreW3C
      t.datetime :date
      t.references :website, foreign_key: true
    end
  end
end
