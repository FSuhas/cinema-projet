class Post < ApplicationRecord

  GENRE = %w[Homme Femme Autre]
  ROLE = (["Figurant", "Doublure", "Silhouette", "Rôle"])

  has_many_attached :photos
  belongs_to :user

  validates :titre, :descriptif, :date, presence: true
  validates :genre, presence: true, inclusion: { in: GENRE }
  validates :role, presence: true, inclusion: { in: ROLE }
end
