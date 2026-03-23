class FilmStarship < ApplicationRecord
  belongs_to :film
  belongs_to :starship
end
