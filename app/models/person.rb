class Person < ApplicationRecord
  belongs_to :planet, optional: true
  belongs_to :species, optional: true

  has_many :film_characters, dependent: :destroy
  has_many :films, through: :film_characters

  has_many :film_starships, through: :films
  has_many :starships, through: :film_starships

  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
end