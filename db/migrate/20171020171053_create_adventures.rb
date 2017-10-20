class CreateAdventures < ActiveRecord::Migration[5.1]
  def change
    create_table :adventures do |t|
      t.string :title
      t.string :story
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
