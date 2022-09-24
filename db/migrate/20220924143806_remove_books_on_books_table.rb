class RemoveBooksOnBooksTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :books
    add_column :bookings, :status, :boolean, default: false
  end
end
