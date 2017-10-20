class AddAdventureRefToMaps < ActiveRecord::Migration[5.1]
  def change
    add_reference :maps, :adventure, foreign_key: true
  end
end
