class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, through: :posts
  has_many :posts
  has_many :books
  has_one_attached :photo

  # validates :nom, presence: true
  # validates :prenom, presence: true
  # SEXE = ['Homme', 'Femme', 'Autre']
  # validates :sexe, inclusion: { in: SEXE }

  include PgSearch::Model

  pg_search_scope :search_by_query, against: [:sexe], using: { tsearch: { prefix: true } }
end
