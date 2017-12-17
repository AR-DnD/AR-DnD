class Map < ApplicationRecord
  belongs_to :adventure, optional: true
  has_and_belongs_to_many :characters
  validates :name, presence: true
  validates :story, presence: true

  def switch_to character, new
    data = JSON.parse map.data
    data.length.times do |i|
      data[i].length.times do |j|
        entry = data[i][j]
        if !!entry
          if entry.split('-')[0]=="char"
            if entry.split('-')[3]==character.id.to_s
              data[i][j] = new
            end
          end
        end
      end
    end

    map.data = data.to_json
    map.save
  end
end
