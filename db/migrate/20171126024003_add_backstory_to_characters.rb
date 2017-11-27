class AddBackstoryToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :backstory, :text
  end
end
