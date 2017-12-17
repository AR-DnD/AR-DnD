class Adventure < ApplicationRecord
  belongs_to :user, optional: true
  has_many :maps
  has_and_belongs_to_many :characters

  def make_copy new_user
    self.times_copied += 1
    self.save
    copy = self.dup
    copy.user_id = new_user.id
    copy.times_copied = 0
    copy.save
    return copy
  end

  def copy_maps old_adventure
    #Need to copy characters as well
    old_adventure.maps.each do |map|
      copy_map = map.dup
      copy_map.adventure_id = self.id
      copy_map.save
      self.maps << copy_map
    end
  end

  def remove_character character
    self.maps.each do |map|
      data = JSON.parse map.data
      data.length.times do |i|
        data[i].length.times do |j|
          entry = data[i][j]
          if !!entry
            if entry.split('-')[0]=="char"
              if entry.split('-')[2]==character.name
                data[i][j] = nil
              end
            end
          end
        end
      end

      map.data = data.to_json
      p "Here", map.data
      map.save
    end
  end

end
