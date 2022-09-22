class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :posts
  has_many :books
  has_one_attached :photo

  SEXE = (["Homme", "Femme", "Autre"])
  validates :sexe, inclusion: { in: SEXE }
end
