class AddColumnToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nom, :string
    add_column :users, :prenom, :string
    add_column :users, :adresse, :string
    add_column :users, :telephone, :string
    add_column :users, :date_de_naissance, :date
    add_column :users, :sexe, :string
    add_column :users, :infos, :string
    add_column :users, :role, :string
  end
end
