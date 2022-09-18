class Post < ApplicationRecord
  belongs_to :user

  validates :titre, :role, :descriptif, :date, presence: true
end
