class Adventure < ApplicationRecord
  belongs_to :user, optional: true
  has_many :maps
end
