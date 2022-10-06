class ChangeUserColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :nom
    add_column :users, :nom, :string, null: false, default: ""
    remove_column :users, :prenom
    add_column :users, :prenom, :string, null: false, default: ""
  end
end
