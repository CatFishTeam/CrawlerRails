class CreateStats < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.references :websites, foreign_key: true
      t.integer :scorePerf
      t.integer :scoreSpider
      t.integer :scoreW3C
      t.datetime :date
    end
  end
end
