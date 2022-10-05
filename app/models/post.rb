class Post < ApplicationRecord
  # AGE = (['18-90', '18-25', '25-35','35-45', '45-55', '55-65','65-75','75-90'])

  has_many_attached :photos
  belongs_to :user

  validates :titre, :descriptif, presence: true

  include PgSearch::Model

  pg_search_scope :search_by_query, against: %i[genre descriptif], using: { tsearch: { prefix: true } }
end
