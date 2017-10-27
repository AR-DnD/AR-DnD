class Map < ApplicationRecord
  belongs_to :adventure, optional: true
end
