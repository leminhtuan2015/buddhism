class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.string :url
      t.string :description

      t.references :photo_store, index: true
      t.timestamps null: false
    end
  end
end
