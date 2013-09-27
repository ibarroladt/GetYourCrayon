class CreateWebsites < ActiveRecord::Migration
  def change
    create_table :websites do |t|
      t.string :url, index: true

      t.timestamps
    end
  end
end
