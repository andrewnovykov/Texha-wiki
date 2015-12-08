class CreateArticleItems < ActiveRecord::Migration
  def change
    create_table :article_items do |t|
      t.integer :user_id
      t.integer :article_id
      t.integer :category_id
      t.string :title
      t.string :titleEn
      t.string :titleFr
      t.string :titleCn
      t.string :titleEs
      t.string :titleUa
      t.text :content
      t.text :contentEn
      t.text :contentFr
      t.text :contentCn
      t.text :contentEs
      t.text :contentUa

      t.timestamps null: false
    end
  end
end
