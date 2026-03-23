class Starship < ApplicationRecord
  has_many :film_starships, dependent: :destroy
  has_many :films, through: :film_starships

  validates :name, presence: true, uniqueness: true
  validates :starship_class, presence: true
end