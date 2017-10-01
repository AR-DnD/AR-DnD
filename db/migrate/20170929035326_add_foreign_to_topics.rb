class AddForeignToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :forum_id, :integer
    add_column :topics, :created_at, :datetime
    add_column :topics, :updated_at, :datetime
  end
end
