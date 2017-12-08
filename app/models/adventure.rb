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
    old_adventure.maps.each do |map|
      copy_map = map.dup
      copy_map.adventure_id = self.id
      copy_map.save
      self.maps << copy_map
    end
  end
end
