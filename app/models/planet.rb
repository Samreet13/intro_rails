class Planet < ApplicationRecord
  has_many :people, dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :climate, presence: true
end