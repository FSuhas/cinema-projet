class ChangeAdresseOnDepartement < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :adresse, :departement
  end
end
