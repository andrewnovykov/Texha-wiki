class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
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
