class AdventureCharacterJoinTable < ApplicationRecord
  belongs_to :adventure
  belongs_to :character
end
