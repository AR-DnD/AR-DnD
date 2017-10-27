class Map < ApplicationRecord
  belongs_to :adventure, optional: true
  validates :name, presence: true
  validates :story, presence: true
end
