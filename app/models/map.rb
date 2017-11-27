class Map < ApplicationRecord
  belongs_to :adventure, optional: true
  has_and_belongs_to_many :characters
  validates :name, presence: true
  validates :story, presence: true
end
