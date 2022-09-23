class AddBooksOnBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :books, :string
  end
end
