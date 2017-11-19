class Adventure < ApplicationRecord
  belongs_to :user, optional: true
  has_many :maps

  def make_copy new_user
    copy = self.dup
    copy.user_id = new_user.id
    copy.save
    return copy
  end

  def copy_adventures old_adventure
    old_adventure.maps.each do |map|
      copy_map = map.dup
      copy_map.adventure_id = self.id
      copy_map.save
      self.maps << copy_map
    end
  end
end
