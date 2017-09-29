class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.string :name
      t.string :last_poster_id
      t.string :integer
      t.string :last_past_at
      t.string :datetime

      t.timestamps
    end
  end
end
