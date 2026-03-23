class MakePersonReferencesOptional < ActiveRecord::Migration[7.1]
  def change
    change_column_null :people, :planet_id, true
    change_column_null :people, :species_id, true
  end
end