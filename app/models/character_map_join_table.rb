class CharacterMapJoinTable < ApplicationRecord
  belongs_to :character
  belongs_to :map
end
