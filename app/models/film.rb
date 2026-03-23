class Film < ApplicationRecord
  has_many :film_characters, dependent: :destroy
  has_many :people, through: :film_characters

  has_many :film_starships, dependent: :destroy
  has_many :starships, through: :film_starships

  validates :title, presence: true, uniqueness: true
  validates :episode_id, presence: true, numericality: { only_integer: true }
end