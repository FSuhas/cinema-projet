class Book < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  validates :titre, presence: true
  validates :photos, presence: true
end
