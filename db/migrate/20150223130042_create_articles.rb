class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :name
      t.string :description
      t.string :author
      t.string :translator
      t.string :image

      t.references :article_store, index: true

      t.timestamps null: false
    end
  end
end
