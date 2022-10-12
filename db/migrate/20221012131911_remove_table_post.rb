class RemoveTablePost < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :ville
    remove_column :posts, :lieux
  end
end
