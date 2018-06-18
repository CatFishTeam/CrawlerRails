class W3cVerif < ActiveRecord::Migration[5.2]
  def change
    create_table :w3cs do |t|
      t.integer :fault
      t.references :website, foreign_key: true
    end
  end
end
