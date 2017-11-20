class Character < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :adventure, optional: true
  belongs_to :map, optional: true
end
