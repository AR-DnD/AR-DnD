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

  def copy_characters old_adventure

    old_adventure.characters.each do |character|
      if self.user == old_adventure.user
        character.adventures << self
        self.characters << character
      else
        #Copy character
        p "HEEEEE", self.user_id
        copy_character = character.dup
        copy_character.user = self.user
        copy_character.save
        self.user.characters << copy_character
        self.characters << copy_character
        copy_character.adventures << self

        #Go through map by map and change the id's
        character_string = "char-"+ character.race + "-"+ character.name + "-"+ copy_character.id.to_s
        self.maps.each do |map|
          map.switch_to character, character_string
        end

      end

    end

  end

  def remove_character character
    self.maps.each do |map|
      map.switch_to character, nil
    end
  end

end
