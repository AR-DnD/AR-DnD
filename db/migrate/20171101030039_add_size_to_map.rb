class AddSizeToMap < ActiveRecord::Migration[5.1]
  def change
    add_column :maps, :size, :integer
  end
end
