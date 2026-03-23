class FilmCharacter < ApplicationRecord
  belongs_to :film
  belongs_to :person
end
