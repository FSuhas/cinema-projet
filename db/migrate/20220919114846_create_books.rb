class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :titre
      t.string :photos
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
