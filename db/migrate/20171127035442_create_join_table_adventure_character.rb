class CreateJoinTableAdventureCharacter < ActiveRecord::Migration[5.1]
  def change
    create_join_table :adventures, :characters do |t|
      t.index [:adventure_id, :character_id]
      t.index [:character_id, :adventure_id]
    end
  end
end
