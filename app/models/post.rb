class Post < ApplicationRecord

  GENRE = %w[Homme Femme Autre]
  ROLE = (["Figurant", "Doublure", "Silhouette", "Rôle"])
  AGE = (["18-90", "18-25", "25-35","35-45", "45-55", "55-65","65-75","75-90" ])

  has_many_attached :photos
  belongs_to :user

  validates :titre, :descriptif, :date, presence: true
  validates :genre, presence: true, inclusion: { in: GENRE }
  validates :role, presence: true, inclusion: { in: ROLE }


  include PgSearch::Model

  pg_search_scope :search_by_query,
  against: [ :titre, :role, :ville, :departement, :lieux, :descriptif, :age ],
    using: {
    tsearch: { prefix: true }
  }
end
