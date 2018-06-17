class MetadataVerif < ActiveRecord::Migration[5.2]
  def change
    create_table :metadata_verifs do |t|
      t.integer :title
      t.integer :viewport
      t.integer :description
      t.integer :charset
      t.integer :h1
      t.references :website, foreign_key: true
    end
  end
end
