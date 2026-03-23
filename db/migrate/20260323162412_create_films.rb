class CreateFilms < ActiveRecord::Migration[7.2]
  def change
    create_table :films do |t|
      t.string :title
      t.integer :episode_id
      t.string :director
      t.string :producer
      t.string :release_date
      t.text :opening_crawl

      t.timestamps
    end
  end
end
