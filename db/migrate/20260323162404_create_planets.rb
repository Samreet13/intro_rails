class CreatePlanets < ActiveRecord::Migration[7.2]
  def change
    create_table :planets do |t|
      t.string :name
      t.string :climate
      t.string :terrain
      t.string :population
      t.string :diameter
      t.string :rotation_period
      t.string :orbital_period
      t.string :gravity
      t.string :surface_water

      t.timestamps
    end
  end
end
