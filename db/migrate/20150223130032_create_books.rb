class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :description
      t.string :author
      t.string :translator
      t.string :image
      t.string :content

      t.references :book_store, index: true

      t.timestamps null: false
    end
  end
end
