class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.text :content
      t.belongs_to :url_id, index: true

      t.timestamps
    end
  end
end
