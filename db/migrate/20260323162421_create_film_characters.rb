class CreateFilmCharacters < ActiveRecord::Migration[7.2]
  def change
    create_table :film_characters do |t|
      t.references :film, null: false, foreign_key: true
      t.references :person, null: false, foreign_key: true

      t.timestamps
    end
  end
end
