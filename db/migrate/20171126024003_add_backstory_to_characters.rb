class AddBackstoryToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :backstory, :text
    add_column :characters, :user_id, :integer
    add_reference :characters, :user, foreign_key: true

  end
end
