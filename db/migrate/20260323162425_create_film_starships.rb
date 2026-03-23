class CreateFilmStarships < ActiveRecord::Migration[7.2]
  def change
    create_table :film_starships do |t|
      t.references :film, null: false, foreign_key: true
      t.references :starship, null: false, foreign_key: true

      t.timestamps
    end
  end
end
