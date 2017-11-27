class CreateJoinTableMapCharacter < ActiveRecord::Migration[5.1]
  def change
    create_join_table :maps, :characters do |t|
      t.index [:map_id, :character_id]
      t.index [:character_id, :map_id]
    end
  end
end
