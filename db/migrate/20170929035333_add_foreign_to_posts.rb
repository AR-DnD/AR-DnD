class AddForeignToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :topic_id, :integer
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
  end
end
