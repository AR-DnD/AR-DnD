class Forum < ApplicationRecord
  has_many :topics, :dependent => :destroy
end
