class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :titre
      t.string :role
      t.integer :age
      t.string :genre
      t.string :ville
      t.string :departement
      t.string :lieux
      t.date :date
      t.text :descriptif
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
