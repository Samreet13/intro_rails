class Species < ApplicationRecord
  has_many :people, dependent: :nullify

  validates :name, presence: true, uniqueness: true
  validates :classification, presence: true
end