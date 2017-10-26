class AddStoryToMaps < ActiveRecord::Migration[5.1]
  def change
    add_column :maps, :story, :string
  end
end
