class Post < ApplicationRecord

  GENRE = %w[Homme Femme Autre]
  ROLE = %w[Figuration Doublure Silhouette Silouette-parlante Rôle]
  has_many_attached :photos
  belongs_to :user
  validates :titre, :descriptif, :date, presence: true
  validates :genre, presence: true, inclusion: { in: GENRE }
  validates :role, presence: true, inclusion: { in: ROLE }
end
