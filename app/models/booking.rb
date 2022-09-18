class Booking < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
