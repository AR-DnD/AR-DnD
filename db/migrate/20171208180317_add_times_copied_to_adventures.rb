class AddTimesCopiedToAdventures < ActiveRecord::Migration[5.1]
  def change
    add_column :adventures, :times_copied, :integer
  end
end
