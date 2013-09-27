class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.text :content
      t.belongs_to :website, index: true

      t.timestamps
    end
  end
end
