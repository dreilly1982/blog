class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :content
      t.string :slug
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end
end
