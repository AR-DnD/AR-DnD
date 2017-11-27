class Character < ApplicationRecord
  belongs_to :user, optional: true
  has_and_belongs_to_many :maps
  has_and_belongs_to_many :adventures
end
