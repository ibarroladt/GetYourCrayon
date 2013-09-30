class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.text :content
      t.text :unique_url
      t.integer :impressions_count, default: 0
      t.belongs_to :website, index: true

      t.timestamps
    end
  end
end
